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

namespace SwfBootstrapTheme\Services;

use Doctrine\DBAL\Connection;

/**
 * extended shop selector
 * shows all subshops with additional images and can override the shop names
 * if the selected shop has language shops, they will be displayed as well
 */
class ShopSelector
{
    protected $pluginName;
    protected $connection;
    protected $configBuilder;
    protected $subShops;
    protected $languageShops;
    protected $activeShop;


    public function __construct($pluginName, Connection $connection)
    {
        $this->pluginName = $pluginName;
        $this->connection = $connection;
    }


    /**
     * returns all subshops
     *
     * @return array
     */
    public function getSubShops()
    {
        if ($this->subShops === null) {
            $subShops = $this->getShops();
            $subShops = $this->getConfigsForShops($subShops);
            $this->subShops = $this->removeNotSelectableShops($subShops);
        }

        return $this->subShops;
    }


    /**
     * returns all language shops of the active shop
     *
     * @return array
     */
    public function getLanguageShops()
    {
        if ($this->languageShops === null) {
            $languageShops = $this->getShops($this->getActiveMainShop()->getId());
            $languageShops = $this->getConfigsForShops($languageShops);
            $this->languageShops = $this->removeNotSelectableShops($languageShops);
        }

        return $this->languageShops;
    }


    /**
     * gets the active shop
     *
     * @return \Shopware\Models\Shop\DetachedShop
     */
    public function getActiveShop()
    {
        if ($this->activeShop === null) {
            $this->activeShop = Shopware()->Shop();
        }

        return $this->activeShop;
    }


    /**
     * gets the main shop of the active shop. Could also be the active shop if it is a main shop
     *
     * @return \Shopware\Models\Shop\Shop
     */
    protected function getActiveMainShop()
    {
        return $this->getActiveShop()->getMain() ?: $this->getActiveShop();
    }


    /**
     * gets (sub/language) shops
     *
     * @param null $shopID
     *
     * @return array
     */
    protected function getShops($shopID = null)
    {
        $builder = $this->connection->createQueryBuilder()
            ->select('scs.*')
            ->addSelect('scl.locale, scl.language, scl.territory')// don't select id, it would override the shopID and the selector won't work
            ->from('s_core_shops', 'scs')
            ->innerJoin('scs', 's_core_locales', 'scl', 'scl.id = scs.locale_id')
            ->where('scs.active = 1')
            ->orderBy('scs.position', 'ASC');

        if ($shopID === null) { // subshop
            $builder->andWhere('scs.main_id IS NULL');
        } else { // language shop
            $builder->andWhere('(scs.main_id = :subShopID OR scs.id = :shopID)')
                ->setParameter('subShopID', $shopID)
                ->setParameter('shopID', $shopID);
        }

        $shops = $builder->execute()->fetchAll();

        $shops = count($shops) === 1 ? array() : $this->getConfigsForShops($shops);

        return $shops;
    }


    /**
     * gets the options of the plugin config for the given shops
     *
     * @param array $shops
     *
     * @return array
     */
    protected function getConfigsForShops(array $shops)
    {
        $configBuilder = $this->getConfigBuilder();

        foreach ($shops as &$shop) {
            $configBuilder->setParameter('shopID', $shop['id']);
            $configs = $configBuilder->execute()->fetchAll();

            foreach ($configs as $config) {
                if ($config['name'] == $this->pluginName . '_image') {
                    $shop['image'] = unserialize($config['value']);
                } elseif ($config['name'] == $this->pluginName . '_name') {
                    $shop['customTitle'] = unserialize($config['value']);
                } elseif ($config['name'] == $this->pluginName . '_selectable' && $config['value'] == 'b:0;') {
                    $shop['selectable'] = false;
                }
            }

            if ($shop['selectable'] === null) {
                $shop['selectable'] = true;
            }
        }

        return $shops;
    }


    /**
     * @return \Doctrine\DBAL\Query\QueryBuilder
     */
    protected function getConfigBuilder()
    {
        if (!$this->configBuilder) {
            $this->configBuilder = $this->connection->createQueryBuilder()
                ->select('sccv.shop_id, sccv.value, scce.name')
                ->from('s_core_config_values', 'sccv')
                ->innerJoin('sccv', 's_core_config_elements', 'scce', 'scce.id = sccv.element_id')
                ->innerJoin('scce', 's_core_config_forms', 'sccf', 'sccf.id = scce.form_id')
                ->where('sccv.shop_id = :shopID')
                ->andWhere('sccf.name = :pluginName')
                ->setParameter('pluginName', $this->pluginName);
        }

        return $this->configBuilder;
    }


    /**
     * remove shops which are deactivated in the plugin config
     *
     * @param array $shops
     *
     * @return array
     */
    protected function removeNotSelectableShops($shops)
    {
        foreach ($shops as &$shop) {
            if (!$shop['selectable']) {
                $shop = null;
            }
        }

        return array_filter($shops);
    }
}