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

use Shopware\Components\Theme\Inheritance;
use Shopware\Models\Shop\Shop;
use Symfony\Component\DependencyInjection\ContainerInterface;

class ThemeConfigReader
{
    private $inheritance;
    private $container;
    private $themeConfig;


    public function __construct(Inheritance $inheritance, ContainerInterface $container)
    {
        $this->inheritance = $inheritance;
        $this->container = $container;
    }


    /**
     * gets the theme config
     *
     * @return array
     */
    public function getThemeConfig()
    {
        if (!$this->themeConfig) {
            /** @var Shop $shop */
            $shop = $this->container->get('shop');

            $this->themeConfig = $this->inheritance->buildConfig($shop->getTemplate(), $shop, false);
        }

        return $this->themeConfig;
    }
}