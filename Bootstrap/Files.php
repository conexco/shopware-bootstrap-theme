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

namespace SwfBootstrapTheme\Bootstrap;

use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;
use Shopware\Components\Plugin\Context\UpdateContext;
use SplFileInfo;
use function version_compare;

class Files extends SetupBase
{
    /**
     * files which are no longer needed after an update of the plugin
     *
     * filenames have to be specified from the plugin root
     * example: Views/frontend/index/index.tpl
     *
     * @var array
     */
    private $filesToDelete = array();
    private $pluginDir;


    public function __construct($pluginDir)
    {
        $this->pluginDir = $pluginDir;
    }


    /**
     * deletes old files of the plugin
     */
    private function deleteOldFiles()
    {
        foreach ($this->filesToDelete as $file) {
            unlink($this->pluginDir . $file);
        }
    }

    private function v1_0_1_removeShopwareJsFiles()
    {
        $shopwareJsFilePath = $this->pluginDir . '/Resources/Themes/Frontend/BootstrapBare/frontend/_public/vendors/js/shopware/';

        $files = new RecursiveIteratorIterator(
            new RecursiveDirectoryIterator($shopwareJsFilePath, RecursiveDirectoryIterator::SKIP_DOTS),
            RecursiveIteratorIterator::CHILD_FIRST
        );

        /** @var SplFileInfo $file */
        foreach ($files as $file) {
            if ($file->isDir()) {
                rmdir($file->getRealPath());
            } else {
                unlink($file->getRealPath());
            }
        }

        rmdir($shopwareJsFilePath);
    }


    public function update(UpdateContext $context)
    {
        $this->deleteOldFiles();

        if (version_compare($context->getCurrentVersion(), '1.0.2', '<=')) {
            $this->v1_0_1_removeShopwareJsFiles();
        }
    }
}