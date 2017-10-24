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

namespace SwfBootstrapTheme;

use Shopware\Components\Plugin;
use Shopware\Components\Plugin\Context\ActivateContext;
use Shopware\Components\Plugin\Context\DeactivateContext;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;
use Shopware\Components\Plugin\Context\UpdateContext;
use SwfBootstrapTheme\Bootstrap\Files;
use SwfBootstrapTheme\Bootstrap\SetupBase;

class SwfBootstrapTheme extends Plugin
{
    protected $setupClasses;


    /**
     * @return SetupBase[]
     */
    private function getSetupClasses()
    {
        if (!$this->setupClasses) {
            $this->setupClasses = array(
                new Files($this->getPath())
            );
        }

        return $this->setupClasses;
    }


    public function install(InstallContext $context)
    {
        $this->setupPlugin(__FUNCTION__, $context);
    }


    public function update(UpdateContext $context)
    {
        $this->setupPlugin(__FUNCTION__, $context);
    }


    public function uninstall(UninstallContext $context)
    {
        $this->setupPlugin(__FUNCTION__, $context);
    }


    public function activate(ActivateContext $context)
    {
        $this->setupPlugin(__FUNCTION__, $context);
    }


    public function deactivate(DeactivateContext $context)
    {
        $this->setupPlugin(__FUNCTION__, $context);
    }


    /**
     * @param                $operation
     * @param InstallContext $context
     */
    private function setupPlugin($operation, InstallContext $context)
    {
        foreach ($this->getSetupClasses() as $setupInstance) {
            call_user_func_array(array($setupInstance, $operation),array($context));
        }
    }
}