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

use Doctrine\Common\Collections\ArrayCollection;
use Shopware\Components\Form as Form;
use Shopware\Components\Theme\ConfigSet;

class Theme extends \Shopware\Components\Theme
{   
    /** @var string Defines the human readable name */
    protected $extend = 'BootstrapBare';

    /** @var string Defines the human readable name */
    protected $name = 'BootstrapExtension';

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

    private $fieldSetDefaults = array(
        'defaults' => array(
            'labelWidth' => 200,
            'margin' => '5 15 5 0',
        ),
    );

    private $fieldSetColumnDefaults = array(
        'layout' => 'column',
        'height' => 170,
        'flex' => 0,
        'defaults' => ['columnWidth' => 0.5, 'labelWidth' => 180, 'margin' => '3 16 3 0'],
    );

    private $hiddenField = array(
        'attributes' => array(
            'xtype' => 'hiddenfield',
        ),
    );

    public function createConfig(Form\Container\TabContainer $container)
    {
        $container->addTab($this->createImageTab());
        $container->addTab($this->createGeneralTab());
        $container->addTab($this->createPluginTab());
    }


    private function createImageTab()
    {
        $tab = $this->createTab(
            'images',
            'Bilder',
            array(
                'attributes' => array(
                    'layout' => 'anchor',
                    'autoScroll' => true,
                ),
            )
        );

        $tab->addElement($this->createShopLogoFieldset());
        $tab->addElement($this->createShopIconFieldset());

        return $tab;
    }


    private function createShopLogoFieldset()
    {
        $fieldset = $this->createFieldSet(
            'shopLogos',
            'Shop Logos',
            array(
                'attributes' => $this->fieldSetColumnDefaults,
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'desktopLogo',
                'Standard Logo',
                'frontend/_public/src/img/logos/logo.png',
                array(
                    'attributes' => array(
                        'lessCompatible' => false,
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'mobileLogo',
                'Smartphone Logo',
                'frontend/_public/src/img/logos/logo-mobile.png',
                array(
                    'attributes' => array(
                        'lessCompatible' => false,
                    ),
                )
            )
        );

        return $fieldset;
    }


    private function createShopIconFieldset()
    {
        $fieldset = $this->createFieldSet(
            'shopIcons',
            'Shop Icons',
            array(
                'attributes' => array_merge($this->fieldSetColumnDefaults, array(
                    'height' => 290)
                ),
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'favicon',
                'Favicon',
                'frontend/_public/src/img/favicon.png',
                array(
                    'attributes' => array(
                        'lessCompatible' => false,
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'appleTouchIcon',
                'Apple Touch Icon',
                'frontend/_public/src/img/icons/apple-touch-icon.png',
                array(
                    'attributes' => array(
                        'lessCompatible' => false,
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'androidLogo',
                'Android Logo',
                'frontend/_public/src/img/icons/android-chrome.png',
                array(
                    'attributes' => array(
                        'lessCompatible' => false,
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'body-bg-img',
                'Hintergrundbild (Body)',
                '',
                $this->hiddenField +
                array(
                    'attributes' => array(
                        'lessCompatible' => false,
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'body-bg-img-repeat',
                'Hintergrundbild (Body) Anzeige',
                'repeat',
                array(
                    array(
                        'text' => 'nicht anzeigen',
                        'value' => 'hide',
                    ),
                    array(
                        'text' => 'Vollbild (gestreckt)',
                        'value' => 'no-repeat center center/cover fixed',
                    ),
                    array(
                        'text' => 'vertikal und horizontal wiederholend',
                        'value' => 'repeat',
                    ),
                    array(
                        'text' => 'horizontal wiederholend',
                        'value' => 'repeat-x',
                    ),
                    array(
                        'text' => 'vertikal wiederholend',
                        'value' => 'repeat-y',
                    ),
                    array(
                        'text' => 'Originalgröße',
                        'value' => 'no-repeat',
                    ),
                ),
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'body-bg-img-hide',
                'Hintergrundbild (Body) ausblenden ab',
                'sm',
                array(
                    array(
                        'text' => 'Smartphone',
                        'value' => 'sm',
                    ),
                    array(
                        'text' => 'Smartphone Landscape',
                        'value' => 'hd',
                    ),
                    array(
                        'text' => 'Tablet',
                        'value' => 'md',
                    ),
                    array(
                        'text' => ' Tablet Landscape / Kleiner Desktop',
                        'value' => 'lg',
                    ),
                    array(
                        'text' => 'nie',
                        'value' => 'all',
                    ),
                ),
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createGeneralTab()
    {
        $tab = $this->createTab(
            'general',
            'Allgemein',
            array(
                'attributes' => array(
                    'layout' => 'anchor',
                    'autoScroll' => true,
                ),
            )
        );

        $tab->addElement($this->createDefaultColorFieldset());
        $tab->addElement($this->createFontsFieldset());

        // hidden fieldsets
        $fieldset = $this->createFieldSet(
            'extendedThemeConfigs',
            'Weitere Theme Einstellungen können in einem Custom Theme über eine Theme.php Datei angepasst werden.'
        );

        $fieldset = $this->createSpacingAndOthersFieldset($fieldset);
        $fieldset = $this->createColorSettingsFieldset($fieldset);
        $fieldset = $this->createBreakpointsFieldset($fieldset);
        $fieldset = $this->createDivisionFieldset($fieldset);
        $fieldset = $this->createGridFieldset($fieldset);
        $fieldset = $this->createTopNavigationFieldset($fieldset);
        $fieldset = $this->createTopNavigationOffCanvasFieldset($fieldset);
        $fieldset = $this->createOtherNavigationElementsFieldset($fieldset);
        $fieldset = $this->createPagingFieldset($fieldset);
        $fieldset = $this->createLeftMenuAndFilterFieldset($fieldset);
        $fieldset = $this->createNavigationOthersFieldset($fieldset);
        $fieldset = $this->createMessagesFieldset($fieldset);
        $fieldset = $this->createPopoverFieldset($fieldset);
        $fieldset = $this->createDropdownsFieldset($fieldset);
        $fieldset = $this->createModalsFieldset($fieldset);
        $fieldset = $this->createPanelsFieldset($fieldset);
        $fieldset = $this->createPricesFieldset($fieldset);
        $fieldset = $this->createCommentsFieldset($fieldset);
        $fieldset = $this->createLabelsFieldset($fieldset);
        $fieldset = $this->createArticleboxesFieldset($fieldset);
        $fieldset = $this->createButtonsFieldset($fieldset);
        $fieldset = $this->createFormsMessagesFieldset($fieldset);
        $fieldset = $this->createInputFieldsFieldset($fieldset);
        $fieldset = $this->createSpacingFieldset($fieldset);
        $fieldset = $this->createSliderGeneralFieldset($fieldset);

        $tab->addElement($fieldset);

        return $tab;
    }


    private function createDefaultColorFieldset()
    {
        $fieldset = $this->createFieldSet(
            'defautColors',
            'Standard-Farben',
            array(
                'attributes' => array_merge($this->fieldSetColumnDefaults, array(
                    'height' => 220)
                ),
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-primary',
                'Farbe Primär',
                '#337ab7'
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-success',
                'Farbe Erfolg',
                '#5cb85c'
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-warning',
                'Farbe Warnung',
                '#f0ad4e'
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-danger',
                'Farbe Fehler',
                '#d9534f'
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-info',
                'Farbe Info',
                '#5bc0de'
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-base',
                'Basis Grau',
                '#000',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-darker',
                'sehr dunkles Grau',
                'lighten(@gray-base, 13.5%)'
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-dark',
                'dunkles Grau',
                'lighten(@gray-base, 20%)'
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray',
                'Grau',
                'lighten(@gray-base, 33.5%)'
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-light',
                'helles Grau',
                'lighten(@gray-base, 46.7%)'
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-lighter',
                'sehr helles Grau',
                'lighten(@gray-base, 93.5%)'
            )
        );

        return $fieldset;
    }


    private function createFontsFieldset()
    {
        $fieldset = $this->createFieldSet(
            'fonts',
            'Schriften',
            array(
                'attributes' => array_merge($this->fieldSetColumnDefaults, array(
                    'height' => 290)
                ),
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-family-base',
                'Standardschriftart',
                '@swf-font-family-sans-serif'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-family-serif',
                'Standardschriftart (serif)',
                'Georgia, "Times New Roman", Times, serif'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-family-sans-serif',
                'Standardschriftart (sans-serif)',
                '"Helvetica Neue", Helvetica, Arial, sans-serif'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-family-monospace',
                'Standardschriftart (monospace)',
                'Menlo, Monaco, Consolas, "Courier New", monospace'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-headings-font-family',
                'Schriftart Überschriften',
                'inherit'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-base',
                'Standardschriftgröße',
                '14px'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-small',
                'Kleine Schriftgröße',
                'ceil(@swf-font-size-base * 0.85)'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-large',
                'Große Schriftgröße',
                'ceil((@swf-font-size-base * 1.25))'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-line-height-base',
                'Standard Zeilenhöhe',
                '1.428571429',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-line-height-large',
                'Große Zeilenhöhe',
                '1.33',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-line-height-small',
                'Kleine Zeilenhöhe',
                '1.5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-line-height-computed',
                'Berechnete Zeilenhöhe',
                'floor((@swf-font-size-base * @swf-line-height-base))',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createNumberField(
                'swf-headings-font-weight',
                'Schriftschnitt Überschrift',
                '500',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-headings-line-height',
                'Zeilenhöhe Überschrift',
                '1.1',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h1',
                'Schriftgröße Überschrift 1',
                'floor(@swf-font-size-base * 2.60)'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h2',
                'Schriftgröße Überschrift 2',
                'floor(@swf-font-size-base * 2.15)'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h3',
                'Schriftgröße Überschrift 3',
                'ceil(@swf-font-size-base * 1.70)'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h4',
                'Schriftgröße Überschrift 4',
                'ceil(@swf-font-size-base * 1.25)'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h5',
                'Schriftgröße Überschrift 5',
                '@swf-font-size-base'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h6',
                'Schriftgröße Überschrift 6',
                'ceil(@swf-font-size-base * 0.85)'
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-blockquote-font-size',
                'Schriftgröße Zitatblock',
                '(@swf-font-size-base * 1.25)',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createSpacingAndOthersFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-content-min-height',
                'Mindesthöhe Contentbereich',
                '720px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-border-radius-base',
                'Eckenradius',
                '0px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-border-radius-large',
                'großer Eckenradius',
                '0px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-border-radius-small',
                'kleiner Eckenradius',
                '0px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-table-cell-padding',
                'Innenabstand Tabellenzeile',
                '8px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-table-condensed-cell-padding',
                'Innenabstand Tabellenzeile (condensed)',
                '5px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'swf-link-hover-decoration',
                'Textdekoration Link',
                'underline',
                array(
                    array(
                        'text' => 'Keine Hervorhebung',
                        'value' => 'none',
                    ),
                    array(
                        'text' => 'Unterstrichen',
                        'value' => 'underline',
                    ),
                    array(
                        'text' => 'Überstrichen',
                        'value' => 'overline',
                    ),
                    array(
                        'text' => 'Durchgestrichen',
                        'value' => 'line-through',
                    ),
                ),
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-component-offset-horizontal',
                'Einrückung aktive Elemente',
                '180px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-dl-horizontal-offset',
                'Einrückung Definitionsliste',
                '@swf-component-offset-horizontal',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createColorSettingsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-body-bg',
                'Hintergrundfarbe (Body)',
                '#f0f2f4',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-shop-bg',
                'Hintergrundfarbe (Shop)',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-text-color',
                'Schriftfarbe',
                '@swf-gray-dark',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-headings-color',
                'Schriftfarbe Überschrift',
                'inherit',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-headings-small-color',
                'Schriftfarbe kleine Überschrift',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-page-header-border-color',
                'Rahmenfarbe Seitenüberschrift',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-link-color',
                'Linkfarbe',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-link-hover-color',
                'Linkfarbe (Hover)',
                'darken(@link-color, 15%);',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-bg',
                'Hintergrundfarbe (Footer)',
                '#000',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-border',
                'Rahmenfarbe (Footer)',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-color',
                'Schriftfarbe (Footer)',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-link-color',
                'Schriftfarbe Link (Footer)',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-link-hover-color',
                'Schriftfarbe Link Hover (Footer)',
                'darken(@swf-footer-link-color, 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-bg',
                'Hintergrundfarbe Tabellen',
                'transparent',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-bg-hover',
                'Hintergrundfarbe Tabellen (Hover)',
                '#f9f9f9',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-bg-active',
                'Hintergrundfarbe Tabellen (Aktiv)',
                '@swf-table-bg-hover',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-bg-accent',
                'Hintergrundfarbe 2 Tabellen',
                '#f9f9f9',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-border-color',
                'Rahmenfarbe Tabellen',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-well-bg',
                'Hintergrundfarbe Hervorhebung',
                '#f5f5f5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-well-border',
                'Rahmenfarbe Hervorhebung',
                'darken(@swf-well-bg, 7%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-component-active-bg',
                'Hintergrundfarbe aktive Elemente',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-component-active-color',
                'Textfarbe aktive Elemente',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-hr-border',
                'Farbe Trennlinie',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-text-muted',
                'Farbe ausgegrauter Text',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-abbr-border-color',
                'Rahmenfarbe Abkürzungen',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createBreakpointsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-screen-lg-min',
                'Breakpoint großer Desktop',
                '1260px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-screen-md-min',
                'Breakpoint Tablet Landscape / Kleiner Desktop',
                '1024px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-screen-hd-min',
                'Breakpoint Tablet',
                '768px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-screen-sm-min',
                'Breakpoint Smartphone Landscape',
                '480px',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createDivisionFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createSelectField(
                'articles-col-width-lg',
                'Großer Desktop',
                '4',
                array(
                    array(
                        'text' => '4',
                        'value' => '3',
                    ),
                    array(
                        'text' => '3',
                        'value' => '4',
                    ),
                    array(
                        'text' => '2',
                        'value' => '6',
                    ),
                    array(
                        'text' => '1',
                        'value' => '12',
                    ),
                ),
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'articles-col-width-md',
                'Tablet Landscape / Kleiner Desktop',
                '4',
                array(
                    array(
                        'text' => '4',
                        'value' => '3',
                    ),
                    array(
                        'text' => '3',
                        'value' => '4',
                    ),
                    array(
                        'text' => '2',
                        'value' => '6',
                    ),
                    array(
                        'text' => '1',
                        'value' => '12',
                    ),
                ),
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'articles-col-width-hd',
                'Tablet',
                '4',
                array(
                    array(
                        'text' => '4',
                        'value' => '3',
                    ),
                    array(
                        'text' => '3',
                        'value' => '4',
                    ),
                    array(
                        'text' => '2',
                        'value' => '6',
                    ),
                    array(
                        'text' => '1',
                        'value' => '12',
                    ),
                ),
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'articles-col-width-sm',
                'Smartphone Landscape',
                '6',
                array(
                    array(
                        'text' => '4',
                        'value' => '3',
                    ),
                    array(
                        'text' => '3',
                        'value' => '4',
                    ),
                    array(
                        'text' => '2',
                        'value' => '6',
                    ),
                    array(
                        'text' => '1',
                        'value' => '12',
                    ),
                ),
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'articles-col-width-xs',
                'Smartphone',
                '12',
                array(
                    array(
                        'text' => '4',
                        'value' => '3',
                    ),
                    array(
                        'text' => '3',
                        'value' => '4',
                    ),
                    array(
                        'text' => '2',
                        'value' => '6',
                    ),
                    array(
                        'text' => '1',
                        'value' => '12',
                    ),
                ),
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createGridFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createNumberField(
                'amount-left-columns',
                'Breite Seitenbereich (Anzahl Spalten)',
                '3',
                $this->hiddenField +
                array(
                    'attributes' =>
                        array(
                            'minValue' => 1,
                            'maxValue' => 11,
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-grid-gutter-width',
                'Außenabstand Spalten',
                '30px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-container-hd',
                'Breite Spalten-Container (Tablet)',
                '(720px + @swf-grid-gutter-width)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-container-md',
                'Breite Spalten-Container (Tablet Landscape, kleiner Desktop)',
                '(940px + @swf-grid-gutter-width)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-container-lg',
                'Breite Spalten-Container (großer Desktop)',
                '(1160px + @swf-grid-gutter-width)',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createTopNavigationFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-bg',
                'Hintergrundfarbe Top-Navigation',
                '#f8f8f8',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-color',
                'Linkfarbe Top-Navigation',
                '#777',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-border',
                'Rahmenfarbe Top-Navigation',
                'darken(@swf-navbar-default-bg, 6.5%);',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-hover-color',
                'Linkfarbe (Hover) Top-Navigation',
                '#333',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-active-color',
                'Linkfarbe (Aktiv) Top-Navigation',
                '#555',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-disabled-color',
                'Linkfarbe (Disabled) Top-Navigation',
                '#ccc',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-hover-bg',
                'Hintergrundfarbe (Hover) Top-Navigation',
                'transparent',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-active-bg',
                'Hintergrundfarbe (Aktiv) Top-Navigation',
                'darken(@swf-navbar-default-bg, 6.5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-disabled-bg',
                'Hintergrundfarbe (Disabled) Top-Navigation',
                'transparent',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-toggle-icon-bar-bg',
                'Smartphone-Button Iconfarbe Top-Navigation',
                '#888',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-toggle-hover-bg',
                'Smartphone-Button Iconfarbe (Hover) Top-Navigation',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-link-separator-color',
                'Link Trennlinien Farbe Top-Navigation',
                '@swf-navbar-default-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-submenu-bg-color',
                'Hintergrundfarbe Untermenüs Top-Navigation',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-submenu-border-color',
                'Rahmenfarbe Untermenüs Top-Navigation',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-navbar-height',
                'Höhe Top-Navigation',
                '50px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-navbar-border-radius',
                'Eckradius Top-Navigation',
                '@swf-border-radius-base',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createTopNavigationOffCanvasFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-navbar-off-canvas-width',
                'Breite Off-Canvas',
                '300px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-navbar-off-canvas-indent',
                'Einrückung Untermenüpunkte Off-Canvas',
                '25px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-bg-color',
                'Hintergrundfarbe Off-Canvas',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-submenu-bg-color',
                'Hintergrundfarbe Untermenüs Off-Canvas',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-arrow-color',
                'Navigations-Pfeil Farbe Off-Canvas',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-close-icon-color',
                'Schließen-Icon Farbe Off-Canvas',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-close-icon-color-hover',
                'Schließen-Icon Farbe (Hover) Off-Canvas',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createOtherNavigationElementsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-nav-link-padding',
                'Innenabstand Navs',
                '10px 15px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-link-hover-bg',
                'Hintergrundfarbe Navs (Hover)',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-disabled-link-color',
                'Textfarbe Tabs (Inaktiv)',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-active-link-hover-color',
                'Textfarbe Tab-Navigation (Aktiv & Hover)',
                '@swf-gray',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-active-link-hover-bg',
                'Hintergrundfarbe Tabs',
                '@swf-shop-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-border-color',
                'Rahmenfarbe Tabs',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-link-hover-border-color',
                'Rahmenfarbe Tab-Navigation (Hover)',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-active-link-hover-border-color',
                'Rahmenfarbe aktive Tab-Navigation (Hover)',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-justified-link-border-color',
                'Rahmenfarbe (Justified) Tab-Navigation',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-justified-active-link-border-color',
                'Rahmenfarbe (Justified) Tab-Navigation (Aktiv)',
                '@swf-body-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-nav-pills-border-radius',
                'Eckradius Button-Navigation',
                '@swf-border-radius-base',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-pills-active-link-hover-bg',
                'Hintergrundfarbe Button-Navigation (Aktiv & Hover)',
                '@swf-component-active-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-pills-active-link-hover-color',
                'Textfarbe Button-Navigation (Aktiv & Hover)',
                '@swf-component-active-color',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-scroll-up-bottom-position',
                'Scroll-Up Position vom unteren Seitenrand',
                '120px',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createPagingFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-color',
                'Textfarbe Seiten-Nummerierung',
                '@swf-link-color',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-border',
                'Rahmenfarbe Seiten-Nummerierung',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-hover-border',
                'Rahmenfarbe Seiten-Nummerierung (Hover)',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-bg',
                'Hintergrundfarbe Seiten-Nummerierung',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-disabled-bg',
                'Hintergrundfarbe Seiten-Nummerierung (Disabled)',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-disabled-border',
                'Rahmenfarbe Seiten-Nummerierung (Disabled)',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-hover-color',
                'Linkfarbe Seiten-Nummerierung (Hover)',
                '@swf-link-hover-color',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-active-color',
                'Linkfarbe Seiten-Nummerierung (Aktiv)',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-disabled-color',
                'Linkfarbe Seiten-Nummerierung (Disabled)',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-active-bg',
                'Hintergrundfarbe Seiten-Nummerierung (Aktiv)',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-active-border',
                'Rahmenfarbe Seiten-Nummerierung (Aktiv)',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-hover-bg',
                'Hintergrundfarbe Seiten-Nummerierung (Hover)',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createLeftMenuAndFilterFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-list-group-border-radius',
                'Eckradius Menü/Filter',
                '@swf-border-radius-base',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-border',
                'Rahmenfarbe Menü/Filter',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-bg',
                'Hintergrundfarbe Menü/Filter',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-link-color',
                'Linkfarbe Menü/Filter',
                '#555',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-hover-bg',
                'Hintergrundfarbe Menü/Filter (Hover)',
                '#f5f5f5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-link-hover-color',
                'Linkfarbe Menü/Filter (Hover)',
                '@swf-list-group-link-color',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-active-text-color',
                'Textfarbe Menü/Filter (Aktiv)',
                'lighten(@swf-list-group-active-bg, 40%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-active-border',
                'Rahmenfarbe Menü/Filter (Aktiv)',
                '@swf-component-active-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-active-bg',
                'Hintergrundfarbe Menü/Filter (Aktiv)',
                '@swf-component-active-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-active-color',
                'Linkfarbe Menü/Filter (Aktiv)',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-disabled-text',
                'Textfarbe Menü/Filter (Disabled)',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-disabled-bg',
                'Hintergrundfarbe Menü/Filter (Disabled)',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-disabled-color',
                'Linkfarbe Menü/Filter (Disabled)',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createNavigationOthersFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-bg',
                'Hintergrundfarbe Zähler',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-color',
                'Textfarbe Zähler',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-link-hover-color',
                'Textfarbe Zähler mit Link (Hover)',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-active-bg',
                'Hintergrundfarbe Zähler (Aktiv)',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-active-color',
                'Textfarbe Zähler (Aktiv)',
                '@swf-link-color',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-badge-line-height',
                'Zeilenhöhe Zähler',
                '1',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'swf-badge-font-weight',
                'Schriftgewicht Zähler',
                'bold',
                array(
                    array(
                        'text' => 'bold',
                        'value' => 'bold',
                    ),
                    array(
                        'text' => 'normal',
                        'value' => 'normal',
                    ),
                ),
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-badge-border-radius',
                'Eckradius Zähler',
                '10px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-breadcrumb-bg',
                'Hintergrundfarbe Breadcrumbs',
                '#f5f5f5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-breadcrumb-color',
                'Farbe Trennzeichen Breadcrumbs',
                '#ccc',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-breadcrumb-active-color',
                'Textfarbe Breadcrumb (Aktiv)',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-breadcrumb-padding-vertical',
                'Innenabstand vertikal Breadcrumbs',
                '8px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-breadcrumb-padding-horizontal',
                'Innenabstand horizontal Breadcrumbs',
                '15px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-breadcrumb-separator',
                'Trennzeichen Breadcrumbs',
                '"/"',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createMessagesFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-alert-padding',
                'Innenabstand Meldung',
                '15px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-alert-border-radius',
                'Eckradius Meldung',
                '@swf-border-radius-base',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'swf-alert-link-font-weight',
                'Schriftgewicht Meldung',
                'bold',
                array(
                    array(
                        'text' => 'bold',
                        'value' => 'bold',
                    ),
                    array(
                        'text' => 'normal',
                        'value' => 'normal',
                    ),
                ),
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-success-bg',
                'Hintergrundfarbe Erfolgsmeldung',
                '@swf-state-success-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-success-text',
                'Textfarbe Erfolgsmeldung',
                '@swf-state-success-text',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-success-border',
                'Rahmenfarbe Erfolgsmeldung',
                '@swf-state-success-border',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-info-bg',
                'Hintergrundfarbe Infomeldung',
                '@swf-state-info-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-info-text',
                'Textfarbe Infomeldung',
                '@swf-state-info-text',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-info-border',
                'Rahmenfarbe Infomeldung',
                '@swf-state-info-border',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-warning-bg',
                'Hintergrundfarbe Warnmeldung',
                '@swf-state-warning-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-warning-text',
                'Textfarbe Warnmeldung',
                '@swf-state-warning-text',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-warning-border',
                'Rahmenfarbe Warnmeldung',
                '@swf-state-warning-border',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-danger-bg',
                'Hintergrundfarbe Fehlermeldung',
                '@swf-state-danger-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-danger-text',
                'Textfarbe Fehlermeldung',
                '@swf-state-danger-text',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-danger-border',
                'Rahmenfarbe Fehlermeldung',
                '@swf-state-danger-border',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createPopoverFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-popover-max-width',
                'Maximale Breite Popover',
                '276px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-bg',
                'Hintergrundfarbe Popover',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-title-bg',
                'Hintergrundfarbe Kopfzeile Popover',
                'darken(@swf-popover-bg, 3%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-border-color',
                'Rahmenfarbe Popover',
                'rgba(0,0,0,.2)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-fallback-border-color',
                'Rahmenfarbe Popover (InternetExplorer8 Fallback)',
                '#ccc',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-popover-arrow-width',
                'Breite Popover-Pfeil',
                '10px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-arrow-color',
                'Farbe Popover-Pfeil',
                '@swf-popover-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-popover-arrow-outer-width',
                'Äußere Breite Popover-Pfeil',
                '(@swf-popover-arrow-width + 1)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-arrow-outer-color',
                'Äußere Farbe Popover-Pfeil',
                'fadein(@swf-popover-border-color, 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-arrow-outer-fallback-color',
                'Äußere Farbe Popover-Pfeil (InternetExplorer8 Fallback)',
                'darken(@swf-popover-fallback-border-color, 20%)',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createDropdownsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-bg',
                'Hintergrundfarbe Dropdown',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-caret-color',
                'Pfeilfarbe Dropdown',
                '#000',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-border',
                'Rahmenfarbe Dropdown',
                'rgba(0,0,0,.15)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-fallback-border',
                'Rahmenfarbe Dropdown (InternetExplorer8 Fallback)',
                '#ccc',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-divider-bg',
                'Trennlinie Farbe Dropdown',
                '#e5e5e5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-header-color',
                'Textfarbe Überschrift Dropdown',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-color',
                'Textfarbe Link Dropdown',
                '@swf-gray-dark',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-hover-color',
                'Textfarbe Link (Hover) Dropdown',
                'darken(@swf-gray-dark, 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-hover-bg',
                'Hintergrundfarbe Link (Hover) Dropdown',
                '#f5f5f5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-active-color',
                'Textfarbe Link (Aktiv) Dropdown',
                '@swf-component-active-color',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-active-bg',
                'Hintergrundfarbe Link (Aktiv) Dropdown',
                '@swf-component-active-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-disabled-color',
                'Textfarbe Link (Disabled) Dropdown',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-caret-width-base',
                'Breite Pfeil Dropdown-Button',
                '4px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-caret-width-large',
                'Breite großer Pfeil Dropdown-Button',
                '5px',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createModalsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-content-bg',
                'Hintergrundfarbe Modal',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-content-border-color',
                'Rahmenfarbe Modal',
                'rgba(0,0,0,.2)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-content-fallback-border-color',
                'Rahmenfarbe Modal (InternetExplorer8 Fallback)',
                '#999',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-backdrop-bg',
                'Hintergrundfarbe Modal-Layer',
                '#000',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-backdrop-opacity',
                'Deckkraft Modal-Layer',
                '.5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-header-border-color',
                'Rahmenfarbe Kopfzeile Modal',
                '#e5e5e5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-footer-border-color',
                'Rahmenfarbe Fußzeile Modal',
                '@swf-modal-header-border-color',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-inner-padding',
                'Innenabstand Modal',
                '15px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-title-padding',
                'Innenabstand Kopfzeile Modal',
                '15px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-lg',
                'Großer Desktop Modal Breite',
                '900px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-md',
                'Kleiner Desktop Modal Breite',
                '600px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-sm',
                'Tablet Modal Breite',
                '300px',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createPanelsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-panel-body-padding',
                'Innenabstand Panel',
                '15px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-panel-heading-padding',
                'Innenabstand Kopfzeile',
                '10px 15px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-panel-footer-padding',
                'Innenabstand Fußzeile',
                '@swf-panel-heading-padding',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-panel-border-radius',
                'Eckradius Panel',
                '@swf-border-radius-base',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-bg',
                'Hintergrundfarbe',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-default-border',
                'Rahmenfarbe',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-default-heading-bg',
                'Hintergrundfarbe Kopfzeile',
                '#f5f5f5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-footer-bg',
                'Hintergrundfarbe Fußzeile',
                '#f5f5f5',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-default-text',
                'Textfarbe Kopfzeile/Fußzeile',
                '@swf-gray-dark',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-primary-border',
                'Rahmenfarbe Aktionspanel',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-primary-heading-bg',
                'Hintergrundfarbe Kopfzeile Aktionspanel',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-primary-text',
                'Textfarbe Kopfzeile Aktionspanel',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-success-border',
                'Rahmenfarbe Erfolgspanel',
                '@swf-state-success-border',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-success-heading-bg',
                'Hintergrundfarbe Kopfzeile Erfolgspanel',
                '@swf-state-success-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-success-heading-text',
                'Textfarbe Kopfzeile Erfolgspanel',
                '@swf-state-success-text',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-info-border',
                'Rahmenfarbe Infopanel',
                '@swf-state-info-border',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-info-heading-bg',
                'Hintergrundfarbe Kopfzeile Infopanel',
                '@swf-state-info-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-info-heading-text',
                'Textfarbe Kopfzeile Infopanel',
                '@swf-state-info-text',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-warning-border',
                'Rahmenfarbe Warnungspanel',
                '@swf-state-warning-border',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-warning-heading-bg',
                'Hintergrundfarbe Kopfzeile Warnungspanel',
                '@swf-state-warning-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-warning-heading-text',
                'Textfarbe Kopfzeile Warnungspanel',
                '@swf-state-warning-text',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-danger-border',
                'Rahmenfarbe Fehlerpanel',
                '@swf-state-danger-border',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-danger-heading-bg',
                'Hintergrundfarbe Kopfzeile Fehlerpanel',
                '@swf-state-danger-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-danger-heading-text',
                'Textfarbe Kopfzeile Fehlerpanel',
                '@swf-state-danger-text',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createPricesFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-price-default-color',
                'Textfarbe Preise',
                '@swf-gray',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-price-pseudo-color',
                'Textfarbe Pseudopreise',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-price-discount-color',
                'Textfarbe Rabattpreise',
                '@swf-brand-danger',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-rating-color',
                'Farbe Bewertungssterne',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createCommentsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-blockquote-border-color',
                'Rahmenfarbe Kommentar',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-blockquote-small-color',
                'Textfarbe Kommentar (klein)',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createLabelsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-color',
                'Textfarbe Label',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-link-hover-color',
                'Textfarbe Label Link (Hover)',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-default-bg',
                'Hintergrundfarbe Label',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-primary-bg',
                'Hintergrundfarbe Label (NEU)',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-info-bg',
                'Hintergrundfarbe Label (INFO)',
                '@swf-brand-info',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-success-bg',
                'Hintergrundfarbe Label (TIPP)',
                '@swf-brand-success',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-warning-bg',
                'Hintergrundfarbe Label (ESD)',
                '@swf-brand-warning',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-danger-bg',
                'Hintergrundfarbe Label (Rabatt)',
                '@swf-brand-danger',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createArticleboxesFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-thumbnail-padding',
                'Innenabstand Artikelbox',
                '4px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-thumbnail-border-radius',
                'Eckenradius Artikelbox',
                '@swf-border-radius-base',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-thumbnail-hover-border',
                'Rahmenfarbe Artikelbox (Hover)',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-thumbnail-bg',
                'Hintergrundfarbe Artikelbox',
                '@swf-shop-bg',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-thumbnail-border',
                'Rahmenfarbe Artikelbox',
                '#ddd',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-thumbnail-caption-color',
                'Textfarbe Artikelbox',
                '@swf-text-color',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createButtonsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-default-color',
                'Textfarbe Standard-Buttons',
                '#333',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-default-bg',
                'Hintergrundfarbe Standard-Buttons',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-default-border',
                'Rahmenfarbe Standard-Buttons',
                '#ccc',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-primary-color',
                'Textfarbe Aktionen-Buttons',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-primary-bg',
                'Hintergrundfarbe Aktionen-Buttons',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-primary-border',
                'Rahmenfarbe Aktionen-Buttons',
                'darken(@swf-btn-primary-bg, 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-danger-color',
                'Textfarbe Löschen-Buttons',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-danger-bg',
                'Hintergrundfarbe Löschen-Buttons',
                '@swf-brand-danger',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-danger-border',
                'Rahmenfarbe Löschen-Buttons',
                'darken(@swf-btn-danger-bg, 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-success-color',
                'Textfarbe Erfolg-Buttons',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-success-bg',
                'Hintergrundfarbe Erfolg-Buttons',
                '@swf-brand-success',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-success-border',
                'Rahmenfarbe Erfolg-Buttons',
                'darken(@swf-btn-success-bg, 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-info-color',
                'Textfarbe Info-Buttons',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-info-bg',
                'Hintergrundfarbe Info-Buttons',
                '@swf-brand-info',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-info-border',
                'Rahmenfarbe Info-Buttons',
                'darken(@swf-btn-info-bg, 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-warning-color',
                'Textfarbe Warnung-Buttons',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-warning-bg',
                'Hintergrundfarbe Warnung-Buttons',
                '@swf-brand-warning',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-warning-border',
                'Rahmenfarbe Warnung-Buttons',
                'darken(@swf-btn-warning-bg, 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-link-disabled-color',
                'Textfarbe Link-Buttons (Disabled)',
                '@swf-gray-light',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'swf-btn-font-weight',
                'Schriftschnitt Buttons',
                'normal',
                array(
                    array(
                        'text' => 'bold',
                        'value' => 'bold',
                    ),
                    array(
                        'text' => 'normal',
                        'value' => 'normal',
                    ),
                ),
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createFormsMessagesFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-success-bg',
                'Hintergrundfarbe Erfolgsmeldung',
                '#dff0d8',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-success-text',
                'Textfarbe Erfolgsmeldungen',
                '#3c763d',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-success-border',
                'Rahmenfarbe Erfolgsmeldungen',
                'darken(spin(@swf-state-success-bg, -10), 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-warning-bg',
                'Hintergrundfarbe Warnmeldung',
                '#fcf8e3',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-warning-text',
                'Textfarbe Warnmeldungen',
                '#8a6d3b',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-warning-border',
                'Rahmenfarbe Warnmeldungen',
                'darken(spin(@swf-state-warning-bg, -10), 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-danger-bg',
                'Hintergrundfarbe Fehlermeldung',
                '#f2dede',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-danger-text',
                'Textfarbe Fehlermeldungen',
                '#a94442',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-danger-border',
                'Rahmenfarbe Fehlermeldungen',
                'darken(spin(@swf-state-danger-bg, -10), 5%)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-info-bg',
                'Hintergrundfarbe Infomeldung',
                '#d9edf7',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-info-text',
                'Textfarbe Infomeldungen',
                '#31708f',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-info-border',
                'Rahmenfarbe Infomeldungen',
                'darken(spin(@swf-state-info-bg, -10), 7%)',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createInputFieldsFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-color',
                'Textfarbe Eingabefeld',
                '@swf-gray',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-bg',
                'Hintergrundfarbe Eingabefeld',
                '#fff',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-bg-disabled',
                'Hintergrundfarbe Eingabefeld (Disabled)',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-border',
                'Rahmenfarbe Eingabefeld',
                '#ccc',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-border-focus',
                'Rahmenfarbe Eingabefeld (Focus)',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-color-placeholder',
                'Textfarbe Platzhalter Eingabefeld',
                '#999',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-border-radius',
                'Eckradius Eingabefeld',
                '@swf-border-radius-base',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-border-radius-large',
                'Eckradius großes Eingabefeld',
                '@swf-border-radius-large',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-border-radius-small',
                'Eckradius kleines Eingabefeld',
                '@swf-border-radius-small',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-height-base',
                'Höhe Eingabefeld',
                '(@swf-line-height-computed + (@swf-padding-base-vertical * 2) + 2)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-height-large',
                'Höhe großes Eingabefeld',
                '(ceil(@swf-font-size-large * @swf-line-height-large) + (@swf-padding-large-vertical * 2) + 2)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-height-small',
                'Höhe kleines Eingabefeld',
                '(floor(@swf-font-size-small * @swf-line-height-small) + (@swf-padding-small-vertical * 2) + 2)',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-group-addon-bg',
                'Hintergrundfarbe Eingabefeld Erweiterung',
                '@swf-gray-lighter',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-group-addon-border-color',
                'Rahmenfarbe Eingabefeld Erweiterung',
                '@swf-input-border',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-legend-color',
                'Textfarbe Legende',
                '@swf-gray-dark',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-legend-border-color',
                'Rahmenfarbe Legende',
                '#e5e5e5',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createSpacingFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-base-vertical',
                'Außenabstand vertikal',
                '6px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-base-horizontal',
                'Außenabstand horizontal',
                '12px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-xs-vertical',
                'Außenabstand vertikal (Smartphone)',
                '1px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-xs-horizontal',
                'Außenabstand horizontal (Smartphone)',
                '5px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-large-vertical',
                'Außenabstand vertikal (groß)',
                '10px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-large-horizontal',
                'Außenabstand horizontal (groß)',
                '16px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-small-vertical',
                'Außenabstand vertikal (klein)',
                '5px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-small-horizontal',
                'Außenabstand horizontal (klein)',
                '10px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-space',
                'Allgemeiner Abstand',
                '10px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-space-mini',
                'Allgemeiner Abstand (Mini)',
                '3px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-space-small',
                'Allgemeiner Abstand (Klein)',
                '5px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-space-large',
                'Allgemeiner Abstand (Groß)',
                '20px',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createSliderGeneralFieldset($fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-font-family',
                'Icon Font',
                '"FontAwesome"',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-slick-arrow-color',
                'Farbe Pfeil',
                '#000',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-slick-dot-color',
                'Farbe Navigationspunkt',
                '#000',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-slick-dot-color-active',
                'Farbe Navigationspunkt (aktiv)',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-slick-dot-color-hover',
                'Farbe Navigationspunkt (hover)',
                '@swf-brand-primary',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-prev-character',
                'Zurück-Pfeil Icon',
                '"\f053"',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-next-character',
                'Vor-Pfeil Icon',
                '"\f054"',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-dot-character',
                'Navigationspunkt Icon',
                '"\f10c"',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-dot-size',
                'Navigationspunkt Größe',
                '13px',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-opacity-default',
                'Navigationspunkt Deckkraft',
                '0.75',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-opacity-on-hover',
                'Navigationspunkt Deckkraft (hover)',
                '1',
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-opacity-not-active',
                'Deckkraft inaktiver Slidernavigationselemente',
                '0.25',
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createPluginTab()
    {
        $tab = $this->createTab(
            'plugins',
            'Erweiterte Funktionen',
            array(
                'attributes' => array(
                    'layout' => 'anchor',
                    'autoScroll' => true,
                ),
            )
        );

        $tab->addElement($this->createGeneralPluginsFieldset());
        $tab->addElement($this->createMenuPluginsFieldset());
        $tab->addElement($this->createListingPluginsFieldset());
        $tab->addElement($this->createDetailPluginsFieldset());
        $tab->addElement($this->createCheckoutPluginsFieldset());

        return $tab;
    }


    private function createGeneralPluginsFieldset()
    {
        $fieldset = $this->createFieldSet(
            'GeneralPlugins',
            'Allgemein',
            array(
                'attributes' => $this->fieldSetDefaults,
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'custom-selects',
                'Standard Select-Felder ersetzen',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, werden die Standard Select-Felder durch optisch auf das Theme angepasste Select-Felder ersetzt.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'pwd-show-hide',
                'Button zur Anzeige des Passworts im Passwortfeld anzeigen',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird ein Button bei den Passwortfeldern angezeigt, mit dem es möglich ist, das Passwort ein-/ auszublenden.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'pwd-strength',
                'Progress Bar zur Anzeige der Stärke des Passworts',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird eine Progress Bar unter den Passwortfeldern angezeigt, die die Stärke des Passworts anzeigt.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'asyncJavascriptLoading',
                'JavaScript asynchron laden',
                true,
                [
                    'attributes' => [
                        'lessCompatible' => false,
                        'boxLabel' => Shopware()->Snippets()->getNamespace('themes/bare/backend/config')->get('async_javascript_loading_description'),
                    ],
                ]
            )
        );

        return $fieldset;
    }


    private function createMenuPluginsFieldset()
    {
        $fieldset = $this->createFieldSet(
            'MenuPlugins',
            'Navigations-Menü',
            array(
                'attributes' => $this->fieldSetDefaults,
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'fixed-navbar',
                'Menü fixieren',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird das Menü nach dem Scrollen am oberen Bildschirmrand fixiert.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'mega-menu',
                'Mega-Menü aktivieren',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird das Standard-Menü durch ein Menü ersetzt, welches über die gesamte Seitenbreite geht.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'mega-menu-col-width',
                'Mega-Menü: Spalten pro Zeile',
                '3',
                array(
                    array(
                        'text' => '4',
                        'value' => '3',
                    ),
                    array(
                        'text' => '3',
                        'value' => '4',
                    ),
                    array(
                        'text' => '2',
                        'value' => '6',
                    ),
                    array(
                        'text' => '1',
                        'value' => '12',
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createNumberField(
                'mega-menu-new-col',
                'Mega-Menü: Kategorien pro Spalte',
                3
            )
        );

        $fieldset->addElement(
            $this->createNumberField(
                'mega-menu-depth',
                'Menü: Tiefe des Kategoriebaums',
                3,
                array(
                    'attributes' => array(
                        'lessCompatible' => false,
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'mega-menu-category-img',
                'Mega-Menü: Kategorie Bild anzeigen',
                false,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird im Mega Menü pro Zeile eine Kategorie mit dem zugehörigen Kategorie Bild angezeigt.',
                        ),
                )
            )
        );

        return $fieldset;
    }


    private function createListingPluginsFieldset()
    {
        $fieldset = $this->createFieldSet(
            'ListingPlugins',
            'Listing',
            array(
                'attributes' => $this->fieldSetDefaults,
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'infinite-scrolling',
                'Infinite Scrolling',
                false,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' => 'Wenn aktiv, wird das Listing live nachgeladen, sobald der Besucher nach unten scrollt.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createNumberField(
                'infinite-threshold',
                'Seitenanzahl für Infinite Scrolling',
                4
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'notify-modal-in-listing',
                'Artikelbenachrichtigung anzeigen',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv kann sich der Kunde über einen Button im Listing benachrichtigen lassen, wenn der Artikel wieder erhältlich ist.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'sidebarFilter',
                'Filter in der Sidebar anzeigen',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Zeigt die Listing Filter in der Sidebar unter dem Menü an.',
                        ),
                )
            )
        );

        return $fieldset;
    }


    private function createDetailPluginsFieldset()
    {
        $fieldset = $this->createFieldSet(
            'DetailPlugins',
            'Produktdetailseite',
            array(
                'attributes' => $this->fieldSetDefaults,
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'deactivate-zoom',
                'Zoomviewer deaktivieren ab',
                'sm',
                array(
                    array(
                        'text' => 'Smartphone',
                        'value' => 'xs',
                    ),
                    array(
                        'text' => 'Smartphone Landscape',
                        'value' => 'sm',
                    ),
                    array(
                        'text' => 'Tablet',
                        'value' => 'hd',
                    ),
                    array(
                        'text' => 'nie',
                        'value' => 'false',
                    ),
                    array(
                        'text' => 'immer',
                        'value' => 'true',
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'zoom-type',
                'Zoomviewer Typ',
                'lens',
                array(
                    array(
                        'text' => 'Lupe',
                        'value' => 'lens',
                    ),
                    array(
                        'text' => 'Fenster',
                        'value' => 'window',
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'zoom-shape',
                'Zoomviewer Form',
                'square',
                array(
                    array(
                        'text' => 'eckig',
                        'value' => 'square',
                    ),
                    array(
                        'text' => 'rund',
                        'value' => 'round',
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'modal-gallery',
                'Galerie-Slider im Modal',
                false,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird im Modal auf der Produktdetailseite ein Galerie-Slider an Stelle des aktuellen Artikelbildes angezeigt.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'modal-gallery-size',
                'Größe des Modals',
                'modal-full',
                array(
                    array(
                        'text' => 'Vollbild',
                        'value' => 'modal-full',
                    ),
                    array(
                        'text' => 'Groß',
                        'value' => 'modal-lg',
                    ),
                    array(

                        'text' => 'Standard',
                        'value' => 'modal-default',
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'ajaxVariantSwitch',
                'Variantenwechsel via Ajax',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, können Varianten auf der Produktdetailseite ohne Neuladen der kompletten Seite gewechselt werden.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'detailOffcanvasCart',
                'Offcanvas Warenkorb',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird auf dem Smartphone der Offcanvas Warenkorb angezeigt, wenn ein Artikel in den Warenkorb gelegt wird.',
                        ),
                )
            )
        );

        return $fieldset;
    }


    private function createCheckoutPluginsFieldset()
    {
        $fieldset = $this->createFieldSet(
            'CheckoutPlugins',
            'Warenkorb',
            array(
                'attributes' => $this->fieldSetDefaults,
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'checkoutHeader',
                'Minimaler Header',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird ein minimaler Header angezeigt, der den Kunden durch den Checkout führt. Andernfalls wird der normale Shop-Header angezeigt.',
                        ),
                )
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'checkoutFooter',
                'Minimaler Footer',
                true,
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird ein minimaler Footer angezeigt, der den Kunden durch den Checkout führt. Andernfalls wird der normale Shop-Footer angezeigt.',
                        ),
                )
            )
        );

        return $fieldset;
    }


    /**
     * Helper function to add default theme
     *
     * @param ArrayCollection $collection
     */
    public function createConfigSets(ArrayCollection $collection)
    {
        $themeDefaults = array(
            'amount-left-columns' => '3',
            'articles-col-width-lg' => '4',
            'articles-col-width-md' => '4',
            'articles-col-width-hd' => '4',
            'articles-col-width-sm' => '6',
            'articles-col-width-xs' => '12',
            'swf-badge-bg' => '@swf-gray-light',
            'swf-badge-border-radius' => '10px',
            'swf-badge-color' => '#fff',
            'swf-badge-font-weight' => 'bold',
            'swf-blockquote-border-color' => '@swf-gray-lighter',
            'swf-blockquote-small-color' => '@swf-gray-light',
            'swf-body-bg' => '#f0f2f4',
            'swf-border-radius-base' => '0px',
            'swf-brand-primary' => '#337ab7',
            'swf-brand-success' => '#5cb85c',
            'swf-brand-info' => '#5bc0de',
            'swf-brand-warning' => '#f0ad4e',
            'swf-brand-danger' => '#d9534f',
            'swf-breadcrumb-active-color' => '@swf-gray-light',
            'swf-breadcrumb-bg' => '#f5f5f5',
            'swf-breadcrumb-color' => '#ccc',
            'swf-btn-danger-bg' => '@swf-brand-danger',
            'swf-btn-danger-border' => 'darken(@swf-btn-danger-bg, 5%)',
            'swf-btn-danger-color' => '#fff',
            'swf-btn-default-bg' => '#fff',
            'swf-btn-default-border' => '#ccc',
            'swf-btn-default-color' => '#333',
            'swf-btn-font-weight' => 'normal',
            'swf-btn-primary-bg' => '@swf-brand-primary',
            'swf-btn-primary-border' => 'darken(@swf-btn-primary-bg, 5%)',
            'swf-btn-primary-color' => '#fff',
            'swf-component-active-bg' => '@swf-brand-primary',
            'swf-component-active-color' => '#fff',
            'swf-content-min-height' => '720px',
            'swf-dropdown-bg' => '#fff',
            'swf-dropdown-caret-color' => '#000',
            'swf-font-size-base' => '14px',
            'swf-font-size-h1' => 'floor(@swf-font-size-base * 2.60)',
            'swf-font-size-h2' => 'floor(@swf-font-size-base * 2.15)',
            'swf-font-size-h3' => 'ceil(@swf-font-size-base * 1.70)',
            'swf-font-size-h4' => 'ceil(@swf-font-size-base * 1.25)',
            'swf-font-size-h5' => '@swf-font-size-base',
            'swf-font-size-h6' => 'ceil(@swf-font-size-base * 0.85)',
            'swf-font-size-small' => 'ceil(@swf-font-size-base * 0.85)',
            'swf-footer-bg' => '#000',
            'swf-footer-border' => '@swf-brand-primary',
            'swf-footer-color' => '#fff',
            'swf-footer-link-color' => '@swf-brand-primary',
            'swf-footer-link-hover-color' => 'darken(@swf-footer-link-color, 5%)',
            'swf-gray-base' => '#000',
            'swf-gray-darker' => 'lighten(@gray-base, 13.5%)',
            'swf-gray-dark' => 'lighten(@gray-base, 20%)',
            'swf-gray' => 'lighten(@gray-base, 33.5%)',
            'swf-gray-light' => 'lighten(@gray-base, 46.7%)',
            'swf-gray-lighter' => 'lighten(@gray-base, 93.5%)',
            'swf-grid-gutter-width' => '30px',
            'swf-headings-font-family' => 'inherit',
            'swf-hr-border' => '@swf-gray-lighter',
            'swf-input-bg' => '#fff',
            'swf-input-border' => '#ccc',
            'swf-input-color' => '@swf-gray',
            'swf-input-color-placeholder' => '#999',
            'swf-label-color' => '#fff',
            'swf-label-danger-bg' => '@swf-brand-danger',
            'swf-label-default-bg' => '@swf-gray-light',
            'swf-label-info-bg' => '@swf-brand-info',
            'swf-label-primary-bg' => '@swf-brand-primary',
            'swf-label-success-bg' => '@swf-brand-success',
            'swf-label-warning-bg' => '@swf-brand-warning',
            'swf-legend-border-color' => '#e5e5e5',
            'swf-legend-color' => '@swf-gray-dark',
            'swf-line-height-base' => '1.428571429',
            'swf-link-color' => '@swf-brand-primary',
            'swf-link-hover-color' => 'darken(@link-color, 15%);',
            'swf-link-hover-decoration' => 'underline',
            'swf-list-group-active-bg' => '@swf-component-active-bg',
            'swf-list-group-active-border' => '@swf-component-active-bg',
            'swf-list-group-active-color' => '#fff',
            'swf-list-group-bg' => '#fff',
            'swf-list-group-border' => '#ddd',
            'swf-list-group-hover-bg' => '#f5f5f5',
            'swf-list-group-link-color' => '#555',
            'swf-modal-backdrop-bg' => '#000',
            'swf-modal-content-bg' => '#fff',
            'swf-modal-footer-border-color' => '@swf-modal-header-border-color',
            'swf-modal-header-border-color' => '#e5e5e5',
            'swf-nav-disabled-link-color' => '@swf-gray-light',
            'swf-nav-link-hover-bg' => '@swf-gray-lighter',
            'swf-nav-tabs-active-link-hover-bg' => '@swf-shop-bg',
            'swf-nav-tabs-active-link-hover-color' => '@swf-gray',
            'swf-nav-tabs-border-color' => '#ddd',
            'swf-nav-tabs-link-hover-border-color' => '@swf-gray-lighter',
            'swf-nav-tabs-active-link-hover-border-color' => '#ddd',
            'swf-navbar-default-bg' => '#f8f8f8',
            'swf-navbar-default-border' => 'darken(@swf-navbar-default-bg, 6.5%)',
            'swf-navbar-default-link-active-bg' => 'darken(@swf-navbar-default-bg, 6.5%)',
            'swf-navbar-default-link-active-color' => '#555',
            'swf-navbar-default-link-color' => '#777',
            'swf-navbar-default-link-hover-bg' => 'transparent',
            'swf-navbar-default-link-hover-color' => '#333',
            'swf-navbar-height' => '50px',
            'swf-padding-base-vertical' => '6px',
            'swf-padding-base-horizontal' => '12px',
            'swf-padding-large-vertical' => '10px',
            'swf-padding-large-horizontal' => '16px',
            'swf-padding-small-vertical' => '5px',
            'swf-padding-small-horizontal' => '10px',
            'swf-pagination-active-bg' => '@swf-brand-primary',
            'swf-pagination-active-color' => '#fff',
            'swf-pagination-bg' => '#fff',
            'swf-pagination-border' => '#ddd',
            'swf-pagination-disabled-color' => '@swf-gray-light',
            'swf-pagination-hover-bg' => '@swf-gray-lighter',
            'swf-panel-bg' => '#fff',
            'swf-panel-default-border' => '#ddd',
            'swf-panel-default-heading-bg' => '#f5f5f5',
            'swf-panel-default-text' => '@swf-gray-dark',
            'swf-panel-footer-bg' => '#f5f5f5',
            'swf-panel-primary-border' => '@swf-brand-primary',
            'swf-panel-primary-text' => '#fff',
            'swf-popover-bg' => '#fff',
            'swf-popover-title-bg' => 'darken(@swf-popover-bg, 3%)',
            'swf-price-default-color' => '@swf-gray',
            'swf-price-discount-color' => '@swf-brand-danger',
            'swf-price-pseudo-color' => '@swf-gray-light',
            'swf-rating-color' => '@swf-brand-primary',
            'swf-shop-bg' => '#fff',
            'swf-space' => '10px',
            'swf-space-large' => '20px',
            'swf-space-mini' => '3px',
            'swf-space-small' => '5px',
            'swf-state-danger-bg' => '#f2dede',
            'swf-state-danger-border' => 'darken(spin(@swf-state-danger-bg, -10), 5%)',
            'swf-state-danger-text' => '#a94442',
            'swf-state-info-bg' => '#d9edf7',
            'swf-state-info-border' => 'darken(spin(@swf-state-info-bg, -10), 7%)',
            'swf-state-info-text' => '#31708f',
            'swf-state-success-bg' => '#dff0d8',
            'swf-state-success-border' => 'darken(spin(@swf-state-success-bg, -10), 5%)',
            'swf-state-success-text' => '#3c763d',
            'swf-state-warning-bg' => '#fcf8e3',
            'swf-state-warning-border' => 'darken(spin(@swf-state-warning-bg, -10), 5%)',
            'swf-state-warning-text' => '#8a6d3b',
            'swf-table-bg' => 'transparent',
            'swf-table-bg-accent' => '#f9f9f9',
            'swf-table-border-color' => '#ddd',
            'swf-text-color' => '@swf-gray-dark',
            'swf-thumbnail-bg' => '@swf-shop-bg',
            'swf-thumbnail-border' => '#ddd',
            'swf-thumbnail-caption-color' => '@swf-text-color',
            'swf-thumbnail-hover-border' => '@swf-brand-primary',
            'swf-thumbnail-padding' => '4px',
            'swf-well-bg' => '#f5f5f5',
            'swf-panel-primary-heading-bg' => '@swf-brand-primary',
            'swf-scroll-up-bottom-position' => '120px',
            'swf-padding-xs-vertical' => '1px',
            'swf-padding-xs-horizontal' => '5px',
            'swf-line-height-large' => '1.33',
            'swf-line-height-small' => '1.5',
            'swf-border-radius-large' => '0px',
            'swf-border-radius-small' => '0px',
            'swf-table-cell-padding' => '8px',
            'swf-table-condensed-cell-padding' => '5px',
            'swf-container-hd' => '(720px + @swf-grid-gutter-width)',
            'swf-container-md' => '(940px + @swf-grid-gutter-width)',
            'swf-container-lg' => '(1140px + @swf-grid-gutter-width)',
            'swf-headings-color' => 'inherit',
            'swf-table-bg-hover' => '#f9f9f9',
            'swf-table-bg-active' => '@swf-table-bg-hover',
            'swf-well-border' => 'darken(@swf-well-bg, 7%)',
            'swf-text-muted' => '@swf-gray-light',
            'swf-abbr-border-color' => '@swf-gray-light',
            'swf-headings-small-color' => '@swf-gray-light',
            'swf-page-header-border-color' => '@swf-gray-lighter',
            'swf-navbar-border-radius' => '@swf-border-radius-base',
            'swf-navbar-default-link-disabled-color' => '#ccc',
            'swf-navbar-default-link-disabled-bg' => 'transparent',
            'swf-navbar-default-toggle-hover-bg' => '#ddd',
            'swf-navbar-default-toggle-icon-bar-bg' => '#888',
            'swf-navbar-link-separator-color' => '@swf-navbar-default-bg',
            'swf-navbar-submenu-border-color' => '@swf-gray-lighter',
            'swf-navbar-submenu-bg-color' => '#fff',
            'swf-pagination-color' => '@swf-link-color',
            'swf-pagination-hover-color' => '@swf-link-hover-color',
            'swf-pagination-hover-border' => '#ddd',
            'swf-pagination-active-border' => '@swf-brand-primary',
            'swf-pagination-disabled-bg' => '#fff',
            'swf-pagination-disabled-border' => '#ddd',
            'swf-nav-link-padding' => '10px 15px',
            'swf-nav-tabs-justified-link-border-color' => '#ddd',
            'swf-nav-tabs-justified-active-link-border-color' => '@swf-body-bg',
            'swf-nav-pills-border-radius' => '@swf-border-radius-base',
            'swf-nav-pills-active-link-hover-bg' => '@swf-component-active-bg',
            'swf-nav-pills-active-link-hover-color' => '@swf-component-active-color',
            'swf-list-group-border-radius' => '@swf-border-radius-base',
            'swf-list-group-active-text-color' => 'lighten(@swf-list-group-active-bg, 40%)',
            'swf-list-group-disabled-color' => '@swf-gray-light',
            'swf-list-group-disabled-bg' => '@swf-gray-lighter',
            'swf-list-group-link-hover-color' => '@swf-list-group-link-color',
            'swf-breadcrumb-padding-vertical' => '8px',
            'swf-breadcrumb-padding-horizontal' => '15px',
            'swf-breadcrumb-separator' => '"/"',
            'swf-badge-link-hover-color' => '#fff',
            'swf-badge-active-color' => '@swf-link-color',
            'swf-badge-active-bg' => '#fff',
            'swf-badge-line-height' => '1',
            'swf-thumbnail-border-radius' => '@swf-border-radius-base',
            'swf-btn-success-color' => '#fff',
            'swf-btn-success-bg' => '@swf-brand-success',
            'swf-btn-success-border' => 'darken(@swf-btn-success-bg, 5%)',
            'swf-btn-info-color' => '#fff',
            'swf-btn-info-bg' => '@swf-brand-info',
            'swf-btn-info-border' => 'darken(@swf-btn-info-bg, 5%)',
            'swf-btn-warning-color' => '#fff',
            'swf-btn-warning-bg' => '@swf-brand-warning',
            'swf-btn-warning-border' => 'darken(@swf-btn-warning-bg, 5%)',
            'swf-btn-link-disabled-color' => '@swf-gray-light',
            'swf-input-bg-disabled' => '@swf-gray-lighter',
            'swf-input-border-radius' => '@swf-border-radius-base',
            'swf-input-border-radius-large' => '@swf-border-radius-large',
            'swf-input-border-radius-small' => '@swf-border-radius-small',
            'swf-input-border-focus' => '@swf-brand-primary',
            'swf-input-height-base' => '(@swf-line-height-computed + (@swf-padding-base-vertical * 2) + 2)',
            'swf-input-height-large' => '(ceil(@swf-font-size-large * @swf-line-height-large) + (@swf-padding-large-vertical * 2) + 2)',
            'swf-input-height-small' => '(floor(@swf-font-size-small * @swf-line-height-small) + (@swf-padding-small-vertical * 2) + 2)',
            'swf-input-group-addon-bg' => '@swf-gray-lighter',
            'swf-input-group-addon-border-color' => '@swf-input-border',
            'swf-label-link-hover-color' => '#fff',
            'swf-alert-padding' => '15px',
            'swf-alert-border-radius' => '@swf-border-radius-base',
            'swf-alert-link-font-weight' => 'bold',
            'swf-alert-success-bg' => '@swf-state-success-bg',
            'swf-alert-success-text' => '@swf-state-success-text',
            'swf-alert-success-border' => '@swf-state-success-border',
            'swf-alert-info-bg' => '@swf-state-info-bg',
            'swf-alert-info-text' => '@swf-state-info-text',
            'swf-alert-info-border' => '@swf-state-info-border',
            'swf-alert-warning-bg' => '@swf-state-warning-bg',
            'swf-alert-warning-text' => '@swf-state-warning-text',
            'swf-alert-warning-border' => '@swf-state-warning-border',
            'swf-alert-danger-bg' => '@swf-state-danger-bg',
            'swf-alert-danger-text' => '@swf-state-danger-text',
            'swf-alert-danger-border' => '@swf-state-danger-border',
            'swf-modal-inner-padding' => '15px',
            'swf-modal-title-padding' => '15px',
            'swf-modal-content-border-color' => 'rgba(0,0,0,.2)',
            'swf-modal-content-fallback-border-color' => '#999',
            'swf-modal-backdrop-opacity' => '.5',
            'swf-modal-lg' => '900px',
            'swf-modal-md' => '600px',
            'swf-modal-sm' => '300px',
            'swf-font-family-sans-serif' => '"Helvetica Neue", Helvetica, Arial, sans-serif',
            'swf-font-family-serif' => 'Georgia, "Times New Roman", Times, serif',
            'swf-font-family-monospace' => 'Menlo, Monaco, Consolas, "Courier New", monospace',
            'swf-font-family-base' => '@swf-font-family-sans-serif',
            'swf-font-size-large' => 'ceil((@swf-font-size-base * 1.25))',
            'swf-line-height-computed' => 'floor((@swf-font-size-base * @swf-line-height-base))',
            'swf-headings-font-weight' => '500',
            'swf-headings-line-height' => '1.1',
            'swf-blockquote-font-size' => '(@swf-font-size-base * 1.25)',
            'swf-panel-body-padding' => '15px',
            'swf-panel-heading-padding' => '10px 15px',
            'swf-panel-footer-padding' => '@swf-panel-heading-padding',
            'swf-panel-border-radius' => '@swf-border-radius-base',
            'swf-panel-success-heading-text' => '@swf-state-success-text',
            'swf-panel-success-border' => '@swf-state-success-border',
            'swf-panel-success-heading-bg' => '@swf-state-success-bg',
            'swf-panel-info-heading-text' => '@swf-state-info-text',
            'swf-panel-info-border' => '@swf-state-info-border',
            'swf-panel-info-heading-bg' => '@swf-state-info-bg',
            'swf-panel-warning-heading-text' => '@swf-state-warning-text',
            'swf-panel-warning-border' => '@swf-state-warning-border',
            'swf-panel-warning-heading-bg' => '@swf-state-warning-bg',
            'swf-panel-danger-heading-text' => '@swf-state-danger-text',
            'swf-panel-danger-border' => '@swf-state-danger-border',
            'swf-panel-danger-heading-bg' => '@swf-state-danger-bg',
            'swf-dropdown-border' => 'rgba(0,0,0,.15)',
            'swf-dropdown-fallback-border' => '#ccc',
            'swf-dropdown-divider-bg' => '#e5e5e5',
            'swf-dropdown-link-color' => '@swf-gray-dark',
            'swf-dropdown-link-hover-color' => 'darken(@swf-gray-dark, 5%)',
            'swf-dropdown-link-hover-bg' => '#f5f5f5',
            'swf-dropdown-link-active-color' => '@swf-component-active-color',
            'swf-dropdown-link-active-bg' => '@swf-component-active-bg',
            'swf-dropdown-link-disabled-color' => '@swf-gray-light',
            'swf-dropdown-header-color' => '@swf-gray-light',
            'swf-screen-sm-min' => '480px',
            'swf-screen-hd-min' => '768px',
            'swf-screen-md-min' => '1024px',
            'swf-screen-lg-min' => '1260px',
            'swf-popover-max-width' => '276px',
            'swf-popover-border-color' => 'rgba(0,0,0,.2)',
            'swf-popover-fallback-border-color' => '#ccc',
            'swf-popover-arrow-width' => '10px',
            'swf-popover-arrow-color' => '@swf-popover-bg',
            'swf-popover-arrow-outer-width' => '(@swf-popover-arrow-width + 1)',
            'swf-popover-arrow-outer-color' => 'fadein(@swf-popover-border-color, 5%)',
            'swf-popover-arrow-outer-fallback-color' => 'darken(@swf-popover-fallback-border-color, 20%)',
            'swf-component-offset-horizontal' => '180px',
            'swf-dl-horizontal-offset' => '@swf-component-offset-horizontal',
            'swf-caret-width-base' => '4px',
            'swf-caret-width-large' => '5px',
            'swf-navbar-off-canvas-width' => '300px',
            'swf-navbar-off-canvas-indent' => '25px',
            'swf-navbar-off-canvas-bg-color' => '#fff',
            'swf-navbar-off-canvas-submenu-bg-color' => '@swf-gray-lighter',
            'swf-navbar-off-canvas-arrow-color' => '@swf-gray-light',
            'swf-navbar-off-canvas-close-icon-color' => '#fff',
            'swf-navbar-off-canvas-close-icon-color-hover' => '@swf-brand-primary',
            'desktopLogo' => 'frontend/_public/src/img/logos/logo.png',
            'mobileLogo' => 'frontend/_public/src/img/logos/logo-mobile.png',
            'favicon' => 'frontend/_public/src/img/favicon.png',
            'appleTouchIcon' => 'frontend/_public/src/img/icons/apple-touch-icon.png',
            'androidLogo' => 'frontend/_public/src/img/icons/android-chrome.png',
            'body-bg-img' => '',
            'body-bg-img-repeat' => 'repeat',
            'body-bg-img-hide' => 'sm',
            // plugin config defaults
            'custom-selects' => 'true',
            'pwd-show-hide' => 'false',
            'pwd-strength' => 'false',
            'asyncJavascriptLoading' => 'true',
            'deactivate-zoom' => 'sm',
            'zoom-type' => 'lens',
            'zoom-shape' => 'square',
            'modal-gallery' => 'true',
            'modal-gallery-size' => 'modal-full',
            'ajaxVariantSwitch' => 'true',
            'detailOffcanvasCart' => 'false',
            'checkoutHeader' => 'true',
            'infinite-scrolling' => 'false',
            'infinite-threshold' => '4',
            'notify-modal-in-listing' => 'false',
            'sidebarFilter' => 'true',
            'fixed-navbar' => 'false',
            'mega-menu' => 'true',
            'mega-menu-col-width' => '3',
            'mega-menu-new-col' => '3',
            'mega-menu-depth' => '3',
            'mega-menu-category-img' => 'false',
            // slider config defaults
            'swf-slick-dot-color-active' => '@swf-brand-primary',
            'swf-slick-dot-color-hover' => '@swf-brand-primary',
            'swf-slick-prev-character' => '"\f053"',
            'swf-slick-next-character' => '"\f054"',
            'swf-slick-dot-character' => '"\f10c"',
            'swf-slick-dot-size' => '13px',
            'swf-slick-opacity-default' => '0.75',
            'swf-slick-opacity-on-hover' => '1',
            'swf-slick-opacity-not-active' => '0.25',
        );

        $set = new ConfigSet();
        $set->setName('Standard Theme')->setDescription(
            'Aktiviert das Standard Theme'
        )->setValues(
            $themeDefaults
        );
        $collection->add($set);
    }
}
