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

/**
 * extended shop selector
 * shows all subshops with additional images and can override the shop names
 * if the selected shop has language shops, they will be displayed as well
 */
class Shopware_Controllers_Widgets_ShopSelector extends Enlight_Controller_Action
{
    protected $shopSelector;


    public function indexAction()
    {
        $shopSelector = $this->get('swf_bootstrap_theme.services.shop_selector');

        $this->View()->assign('subShops', $shopSelector->getSubShops());
        $this->View()->assign('shop', $shopSelector->getActiveShop());
        $this->View()->assign('languageShops', $shopSelector->getLanguageShops());
        $this->View()->assign('position', $this->Request()->getParam('position'));
    }
}