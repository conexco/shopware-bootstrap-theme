<?php

/**
 *   Shopware Bootstrap Theme - helps you build fast, robust, and adaptable responsive shopware themes
 *   Copyright (C) 2017, conexco UG (haftungsbeschränkt) & Co. KG
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

namespace SwfBootstrapTheme\Subscribers;

use Doctrine\DBAL\Connection;
use Enlight\Event\SubscriberInterface;
use Shopware\Bundle\StoreFrontBundle\Service\CategoryServiceInterface;
use Shopware\Bundle\StoreFrontBundle\Service\ContextServiceInterface;
use Shopware\Bundle\StoreFrontBundle\Struct\Category;
use Shopware\Components\Compatibility\LegacyStructConverter;
use Shopware\Components\Plugin\CachedConfigReader;
use SwfBootstrapTheme\Services\ThemeConfigReader;

class Frontend implements SubscriberInterface
{
    /**
     * @var CachedConfigReader
     */
    private $cachedConfigReader;
    /**
     * @var ThemeConfigReader
     */
    private $themeConfigReader;
    /**
     * @var string
     */
    private $pluginName;
    /**
     * @var Connection
     */
    private $connection;
    /**
     * @var ContextServiceInterface
     */
    private $contextService;
    /**
     * @var LegacyStructConverter
     */
    private $legacyStructConverter;
    /**
     * @var \Zend_Cache_Core
     */
    private $cache;
    /**
     * @var CategoryServiceInterface
     */
    private $categoryService;


    public function __construct(
        CachedConfigReader $cachedConfigReader,
        ThemeConfigReader $themeConfigReader,
        $pluginName,
        Connection $connection,
        ContextServiceInterface $contextService,
        LegacyStructConverter $legacyStructConverter,
        \Zend_Cache_Core $cache,
        CategoryServiceInterface $categoryService
    ) {
        $this->cachedConfigReader = $cachedConfigReader;
        $this->themeConfigReader = $themeConfigReader;
        $this->pluginName = $pluginName;
        $this->connection = $connection;
        $this->contextService = $contextService;
        $this->legacyStructConverter = $legacyStructConverter;
        $this->cache = $cache;
        $this->categoryService = $categoryService;
    }


    public static function getSubscribedEvents()
    {
        return array(
            'Enlight_Controller_Action_PostDispatchSecure_Frontend' => 'onPostDispatchSecureFrontendMegaMenu',
        );
    }


    /**
     * includes the advanced-menu functionality into this plugin
     *
     * @param \Enlight_Controller_ActionEventArgs $args
     *
     * @throws \Exception
     */
    public function onPostDispatchSecureFrontendMegaMenu(\Enlight_Controller_ActionEventArgs $args)
    {
        $templateDirs = Shopware()->Template()->getTemplateDir();
        /* Matches either Template-dir of the BootstrapBare or BootstrapExtension-Theme */
        $bootstrapRegex = '/^\/?([^\/]*?\/)*custom\/plugins\/SwfBootstrapTheme\/Resources\/Themes\/Frontend\/Bootstrap(Bare|Extension)\/$/';
        $themeActive = preg_grep($bootstrapRegex, $templateDirs);

        if (empty($themeActive)) {
            return;
        }

        $parent = Shopware()->Shop()->get('parentID');
        $categoryId = $args->getRequest()->getParam('sCategory', $parent);

        $menu = $this->getMegaMenu($parent, $categoryId);

        $args->getSubject()->View()->assign('swfMegaMenu', $menu);
    }


    /**
     * Returns the complete mega-menu with category path.
     *
     * @param int $category
     * @param int $activeCategoryId
     *
     * @return array|array[]|false|mixed
     * @throws \Exception
     */
    private function getMegaMenu($category, $activeCategoryId)
    {
        $shopContext = $this->contextService->getShopContext();
        $shop = $shopContext->getShop();

        $cacheKey = $this->pluginName . '_MegaMenu_Tree_' . $shop->getId() . '_' . $category . '_' . $shop->getCustomerGroup()->getKey();

        $themeConfig = $this->themeConfigReader->getThemeConfig();

        if ($this->cache->test($cacheKey)) {
            $menu = $this->cache->load($cacheKey);
        } else {
            $depth = $themeConfig['mega-menu-depth'] ?: 3;
            $ids = $this->getCategoryIdsOfDepth($category, $depth);
            $categories = $this->categoryService->getList($ids, $shopContext);
            $categoriesArray = $this->convertCategories($categories);
            $menu = $this->getCategoriesOfParent($category, $categoriesArray);

            $config = $this->cachedConfigReader->getByPluginName($this->pluginName);

            $this->cache->save($menu, $cacheKey, array('Shopware_Plugin'), (int) $config['menu_cache_time']);
        }

        $categoryPath = $this->getCategoryPath($activeCategoryId);
        $menu = $this->setActiveFlags($menu, $categoryPath);

        return $menu;
    }


    /**
     * Helper function for mega-menu. Sets current and parent-ctegory as active
     *
     * @param array[] $categories
     * @param int[]   $actives
     *
     * @return array[]
     */
    private function setActiveFlags($categories, $actives)
    {
        foreach ($categories as &$category) {
            $category['flag'] = \in_array($category['id'], $actives, false);
            if (!empty($category['sub'])) {
                $category['sub'] = $this->setActiveFlags($category['sub'], $actives);
            }
        }

        return $categories;
    }


    /**
     * Helper function for mega-menu. Retreives the category-path as array from database
     *
     * @param int $categoryId
     *
     * @return int[]
     * @throws \Exception
     */
    private function getCategoryPath($categoryId)
    {
        $query = $this->connection->createQueryBuilder()
            ->select('category.path')
            ->from('s_categories', 'category')
            ->where('category.id = :id')
            ->setParameter(':id', $categoryId);
        $path = $query->execute()->fetch(\PDO::FETCH_COLUMN);
        $path = explode('|', $path);
        $path = array_filter($path);
        $path[] = $categoryId;

        return $path;
    }


    /**
     * Helper function for mega-menu. Retreives subcategories of a given category.
     *
     * @param int   $parentId
     * @param array $categories
     *
     * @return array
     */
    private function getCategoriesOfParent($parentId, $categories)
    {
        $result = [];
        foreach ($categories as $index => $category) {
            if ($category['parentId'] != $parentId) {
                continue;
            }
            $children = $this->getCategoriesOfParent($category['id'], $categories);
            $category['sub'] = $children;
            $category['activeCategories'] = \count($children);
            $result[] = $category;
        }

        return $result;
    }


    /**
     * Helper function for mega-menu. Converts Category-Object to arrays.
     *
     * @param $categories
     *
     * @return array
     * @throws \Exception
     */
    private function convertCategories($categories)
    {
        return array_map(function (Category $category) {
            $data = $this->legacyStructConverter->convertCategoryStruct($category);

            $data['flag'] = false;
            if ($category->getMedia()) {
                $data['media']['path'] = $category->getMedia()->getFile();
            }
            if (!empty($category->getExternalLink())) {
                $data['link'] = $category->getExternalLink();
            }

            return $data;
        }, $categories);
    }


    /**
     * Helper function for mega-menu. Retreives all child-categories form a given parent until a given depth.
     *
     * @param int $parentId
     * @param int $depth
     *
     * @return int[]
     * @throws \Exception
     */
    private function getCategoryIdsOfDepth($parentId, $depth)
    {
        $query = $this->connection->createQueryBuilder()
            ->select('DISTINCT category.id')
            ->from('s_categories', 'category')
            ->where('category.path LIKE :path')
            ->andWhere('category.active = 1')
            ->andWhere('ROUND(LENGTH(path) - LENGTH(REPLACE (path, "|", "")) - 1) <= :depth')
            ->orderBy('category.position')
            ->setParameter(':depth', $depth)
            ->setParameter(':path', '%|' . $parentId . '|%');

        return $query->execute()->fetchAll(\PDO::FETCH_COLUMN);
    }
}