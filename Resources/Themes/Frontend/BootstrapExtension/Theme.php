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

namespace Shopware\Themes\BootstrapExtension;

class Theme extends \Shopware\Components\Theme
{   
    /** @var string Defines the human readable name */
    protected $extend = 'BootstrapBare';

    /** @var string Defines the human readable name */
    protected $name = 'Bootstrap with Extensions';

    /** @var string Description of the theme */
    protected $description = 'Shopware Bootstrap Theme mit Plugins';

    /** @var string The author of the theme */
    protected $author = 'conexco - the e-commerce experts';

    /** @var string License of the theme */
    protected $license = 'GNU GPLv3';

    /** @var array Defines the files which should be compiled by the javascript compressor */
    protected $javascript = array(
        "src/js/plugins/bonus_system/jquery.bonus-system.js",
        "src/js/plugins/bonus_system/jquery.basket-slider.js",

        "src/js/plugins/live_shopping/jquery.swag_live_shopping.js",

        "src/js/plugins/bundle/jquery.swag_bundle.js",

        "src/js/plugins/emotion_advanced/jquery.event.move.js",
        "src/js/plugins/emotion_advanced/jquery.quickview.js",
        "src/js/plugins/emotion_advanced/jquery.sideview.js",
        "src/js/plugins/emotion_advanced/jquery.storytelling.js",

        "src/js/plugins/ticketsystem/jquery.ticket.js",

        "src/js/plugins/abo_commerce/swag_abo_commerce.js",

        "src/js/plugins/custom_products/jquery.swag-custom-products-validation-extend.js",
        "src/js/plugins/custom_products/jquery.swag-custom-products-upload-extend.js",
        "src/js/plugins/custom_products/jquery.swag-custom-products-wizard-extend.js",
        "src/js/plugins/custom_products/jquery.swag_custom_product_add_article.js",
        "src/js/plugins/custom_products/jquery.swag-custom-products-option-change.js",

        "src/js/plugins/advanced_promotions/jquery.promotions.js",

        "src/js/plugins/product_advisor/jquery.product-advisor.sidebar.js",
        "src/js/plugins/product_advisor/jquery.product-advisor.wizard.js",
        "src/js/plugins/product_advisor/jquery.product-advisor-result.js",

        "src/js/plugins/advanced_cart/jquery.swag_advanced_cart.js"
    );
}
