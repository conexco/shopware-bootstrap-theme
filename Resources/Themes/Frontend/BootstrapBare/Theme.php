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

namespace Shopware\Themes\BootstrapBare;

class Theme extends \Shopware\Components\Theme
{
    /** @var string Defines the human readable name */
    protected $name = 'BootstrapBare';

    /** @var string Description of the theme */
    protected $description = 'Shopware Bootstrap Theme';

    /** @var string The author of the theme */
    protected $author = 'conexco - the e-commerce experts';

    /** @var string License of the theme */
    protected $license = 'GNU GPLv3';

    /** @var bool Parent theme injected before plugins */
    protected $injectBeforePlugins = true;

    /** @var array Defines the files which should be compiled by the javascript compressor */
    protected $javascript = array(
        "vendors/js/modernizr/modernizr.custom.35977.js",
        "vendors/js/jquery.js",
        "vendors/js/bootstrap.js",
        "vendors/js/jquery.ui.widget-factory.js",
        "vendors/js/jquery.selectBoxIt.js",
        "vendors/js/picturefill.js",
        "vendors/js/slick.js",
        "vendors/js/imagesloaded.js",
        "vendors/js/jquery.elevatezoom.js",
        "vendors/js/jquery.clingify.js",
        "vendors/js/jscrollpane/jquery.mousewheel.js",
        "vendors/js/jscrollpane/mwheelIntent.js",
        "vendors/js/jscrollpane/jquery.jscrollpane.js",
        "vendors/js/jquery.bootstrap-strength.js",
        "vendors/js/shopware/jquery.plugin-base.js",
        "vendors/js/shopware/jquery.state-manager.js",
        "vendors/js/shopware/jquery.storage-manager.js",
        "vendors/js/shopware/jquery.register.js",
        "vendors/js/shopware/jquery.infinite-scrolling.js",
        "vendors/js/shopware/jquery.emotion.js",
        "vendors/js/shopware/jquery.filter-component.js",
        "vendors/js/shopware/jquery.last-seen-products.js",
        "vendors/js/shopware/jquery.product-compare-add.js",
        "vendors/js/shopware/jquery.product-compare-menu.js",
        "vendors/js/shopware/jquery.auto-submit.js",
        "vendors/js/shopware/jquery.listing-actions.js",
        "vendors/js/shopware/jquery.ajax-wishlist.js",
        "vendors/js/shopware/jquery.captcha.js",
        "vendors/js/shopware/jquery.cookie-permission.js",
        "vendors/js/shopware/jquery.storage-field.js",
        "vendors/js/shopware/jquery.range-slider.js",
        "vendors/js/shopware/jquery.off-canvas-menu.js",
        "vendors/js/shopware/jquery.ajax-product-navigation.js",
        "vendors/js/shopware/jquery.shipping-payment.js",
        "vendors/js/shopware/jquery.ajax-variant.js",
        "vendors/js/shopware/jquery.csrf-protection.js",
        "vendors/js/shopware/jquery.address-selection.js",
        "vendors/js/shopware/jquery.address-editor.js",
        "vendors/js/shopware/jquery.form-polyfill.js",
        "vendors/js/shopware/jquery.pseudo-text.js",
        "vendors/js/shopware/jquery.preloader-button.js",

        "src/js/jquery.ui.datepicker.js",
        "src/js/swbt.helper.js",
        "src/js/swbt.overlay.js",
        "src/js/swbt.loader.js",
        "src/js/swbt.modal.js",
        "src/js/swbt.scroll-up.js",
        "src/js/swbt.popover-wrapper.js",
        "src/js/jquery.product-compare-add-extend.js",
        "src/js/jquery.product-compare-menu-extend.js",
        "src/js/swbt.search-popover.js",
        "src/js/jquery.add-article-extend.js",
        "src/js/swbt.slick-wrapper.js",
        "src/js/jquery.last-seen-products-extend.js",
        "src/js/swbt.newsletter-form.js",
        "src/js/swbt.image-zoom.js",
        "src/js/swbt.detail-tabs.js",
        "src/js/swbt.ajax-cart.js",
        "src/js/swbt.password-input-viewer.js",
        "src/js/swbt.password-strength-wrapper.js",
        "src/js/jquery.register-extend.js",
        "src/js/jquery.infinite-scrolling-extend.js",
        "src/js/jquery.emotion-extend.js",
        "src/js/jquery.auto-submit-extend.js",
        "src/js/jquery.listing-actions-extend.js",
        "src/js/jquery.range-slider-extend.js",
        "src/js/jquery.ajax-wishlist-extend.js",
        "src/js/jquery.off-canvas-menu-extend.js",
        "src/js/jquery.ajax-product-navigation-extend.js",
        "src/js/jquery.shipping-payment-extend.js",
        "src/js/jquery.ajax-variant-extend.js",
        "src/js/swbt.menu.js",
        "src/js/jquery.address-selection-extend.js",
        "src/js/jquery.address-editor-extend.js",
        "src/js/jquery.preloader-button-extend.js",

        "src/js/swbt._init.js"
    );
}
