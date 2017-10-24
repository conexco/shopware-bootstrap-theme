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
use Doctrine\DBAL\Driver\PDOStatement;
use Enlight\Event\SubscriberInterface;
use Shopware\Bundle\StoreFrontBundle\Struct\Category;
use Shopware\Components\Plugin\CachedConfigReader;
use SwfBootstrapTheme\Services\ThemeConfigReader;

class Frontend implements SubscriberInterface
{
    private $cachedConfigReader;
    private $themeConfigReader;
    private $activePlugins;
    private $pluginName;


    public function __construct(
        CachedConfigReader $cachedConfigReader,
        ThemeConfigReader $themeConfigReader,
        array $activePlugins,
        $pluginName
    )
    {
        $this->cachedConfigReader = $cachedConfigReader;
        $this->themeConfigReader = $themeConfigReader;
        $this->activePlugins = $activePlugins;
        $this->pluginName = $pluginName;
    }


    public static function getSubscribedEvents()
    {
        return array(
            'Enlight_Controller_Action_PostDispatchSecure_Frontend' => array(
                array('onPostDispatchSecureFrontend'),
                array('onPostDispatchSecureFrontendMegaMenu')
            ),
        );
    }


    /**
     * adds theme and shopware version to the view
     *
     * @param \Enlight_Controller_ActionEventArgs $args
     */
    public function onPostDispatchSecureFrontend(\Enlight_Controller_ActionEventArgs $args)
    {
        $view = $args->getSubject()->View();
        $view->assign('swVersion', Shopware()->Config()->get('version'));
        $view->assign('swrtVersion', $this->activePlugins[$this->pluginName]);
    }


    /**
     * includes the advanced-menu functionality into this plugin
     *
     * @param \Enlight_Controller_ActionEventArgs $args
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
     * @param $category
     * @param $activeCategoryId
     *
     * @return array|array[]|false|mixed
     * @throws \Exception
     */
    private function getMegaMenu($category, $activeCategoryId)
    {
        /** @var \Shopware\Bundle\StoreFrontBundle\Struct\ShopContext $context */
        $context = Shopware()->Container()->get('shopware_storefront.context_service')->getShopContext();
        /** @var \Zend_Cache_Core $cache */
        $cache = Shopware()->Container()->get('cache');

        $config = $this->themeConfigReader->getThemeConfig();

        $cacheKey = $this->pluginName.'_MegaMenu_Tree_' . $context->getShop()->getId() . '_' . $category . '_' . Shopware()->Shop()->getCustomerGroup()->getKey();

        if ($cache->test($cacheKey)) {
            $menu = $cache->load($cacheKey);
        } else {
            $depth = $config['mega-menu-depth'] ? $config['mega-menu-depth'] : 3;
            $ids = $this->getCategoryIdsOfDepth($category, $depth);
            $categories = Shopware()->Container()->get('shopware_storefront.category_service')->getList($ids, $context);
            $categoriesArray = $this->convertCategories($categories);
            $categoryTree = $this->getCategoriesOfParent($category, $categoriesArray);

            $config=$this->cachedConfigReader->getByPluginName($this->pluginName);

            $cache->save($categoryTree, $cacheKey, array('Shopware_Plugin'), (int)$config['menu_cache_time']);
            $menu = $categoryTree;
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
            $category['flag'] = in_array($category['id'], $actives);
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
        /** @var Connection $connection */
        $connection = Shopware()->Container()->get('dbal_connection');

        $query = $connection->createQueryBuilder()
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
        $result = array();
        foreach ($categories as $index => $category) {
            if ($category['parentId'] != $parentId) {
                continue;
            }
            $children = $this->getCategoriesOfParent($category['id'], $categories);
            $category['sub'] = $children;
            $category['activeCategories'] = count($children);
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
        $converter = Shopware()->Container()->get('legacy_struct_converter');

        return array_map(function (Category $category) use ($converter) {
            $data = array(
                'id' => $category->getId(),
                'name' => $category->getName(),
                'parentId' => $category->getParentId(),
                'hidetop' => !$category->displayInNavigation(), // @deprecated
                'hideTop' => !$category->displayInNavigation(),
                'active' => 1,
                'cmsHeadline' => $category->getCmsHeadline(),
                'cmsText' => $category->getCmsText(),
                'position' => $category->getPosition(),
                'link' => 'shopware.php?sViewport=cat&sCategory=' . $category->getId(),
                'media' => null,
                'flag' => false
            );

            $attributes = $category->getAttributes();
            $attributes = $attributes['core'];
            if (!empty($attributes)) {
                $data['attribute'] = $attributes->toArray();
            }
            if ($category->isBlog()) {
                $data['link'] = 'shopware.php?sViewport=blog&sCategory=' . $category->getId();
            }
            if ($category->getMedia()) {
                $data['media'] = $converter->convertMediaStruct($category->getMedia());
                $data['media']['path'] = $category->getMedia()->getFile();
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
        /** @var Connection $connection */
        $connection = Shopware()->Container()->get('dbal_connection');
        $query = $connection->createQueryBuilder()
            ->select('DISTINCT category.id')
            ->from('s_categories', 'category')
            ->where('category.path LIKE :path')
            ->andWhere('category.active = 1')
            ->andWhere('ROUND(LENGTH(path) - LENGTH(REPLACE (path, "|", "")) - 1) <= :depth')
            ->orderBy('category.position')
            ->setParameter(':depth', $depth)
            ->setParameter(':path', '%|' . $parentId . '|%');
        /** @var $statement PDOStatement */
        $statement = $query->execute();

        return $statement->fetchAll(\PDO::FETCH_COLUMN);
    }
}