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

use Enlight\Event\SubscriberInterface;
use SwfBootstrapTheme\Services\SmartyExtensions;
use SwfBootstrapTheme\Services\ThemeConfigReader;

class Smarty implements SubscriberInterface
{
    private $themeConfigReader;
    private $smartyExtensions;
    private $modifierRegistered = false;


    public function __construct(ThemeConfigReader $themeConfigReader, SmartyExtensions $smartyExtensions)
    {
        $this->themeConfigReader = $themeConfigReader;
        $this->smartyExtensions = $smartyExtensions;
    }


    public static function getSubscribedEvents()
    {
        return array(
            'Enlight_Controller_Action_PostDispatchSecure' => 'registerSmartyExtensions',
        );
    }


    /**
     * registers new smarty modifiers
     *
     * @param \Enlight_Controller_ActionEventArgs $args
     */
    public function registerSmartyExtensions(\Enlight_Controller_ActionEventArgs $args)
    {
        if (in_array($args->getRequest()->getModuleName(), array('frontend', 'widgets'))) {
            $template_Manager = $args->getSubject()->View()->Engine();

            if (!$this->modifierRegistered) {
                $this->modifierRegistered = true;
                $template_Manager->registerPlugin('modifier', 'sliderDefault', array($this, 'sliderDefault'));
            }
        }
    }


    /**
     * used as helper for preparing slider config values
     *
     * @param      $input
     * @param bool $mobile
     *
     * @return bool|int
     */
    public function sliderDefault($input, $mobile = true)
    {
        return $this->smartyExtensions->sliderDefault($input, $mobile);
    }
}