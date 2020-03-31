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

use Doctrine\Common\Collections\ArrayCollection;
use Shopware\Components\Form as Form;
use Shopware\Components\Theme\ConfigSet;

class Theme extends \Shopware\Components\Theme
{
    /** @var string Defines the human readable name */
    protected $name = 'Bootstrap';

    /** @var string Description of the theme */
    protected $description = 'Shopware Bootstrap Theme';

    /** @var string The author of the theme */
    protected $author = 'conexco - the e-commerce experts';

    /** @var string License of the theme */
    protected $license = 'GNU GPLv3';

    /** @var bool Parent theme injected before plugins */
    protected $injectBeforePlugins = true;

    const VENDORS_JS_PATH = 'vendors/js/';
    const RESPONSIVE_THEME_JS_PATH = 'vendors/js/shopware/';
    const SOURCE_JS_PATH = 'src/js/';

    /** @var array Defines the files which should be compiled by the javascript compressor */
    protected $javascript;

    public function __construct()
    {
        $vendorsJavascripts = [
            'modernizr/modernizr.custom.35977.js',
            'jquery.js',
            'bootstrap.js',
            'jquery.ui.widget-factory.js',
            'jquery.selectBoxIt.js',
            'picturefill.js',
            'slick.js',
            'imagesloaded.js',
            'jquery.elevatezoom.js',
            'jquery.clingify.js',
            'jquery.bootstrap-strength.js',
        ];

        $shopwareJavascripts = [
            "jquery.plugin-base.js",
            "jquery.state-manager.js",
            "jquery.storage-manager.js",
            "jquery.register.js",
            "jquery.infinite-scrolling.js",
            "jquery.emotion.js",
            "jquery.filter-component.js",
            "jquery.last-seen-products.js",
            "jquery.product-compare-add.js",
            "jquery.product-compare-menu.js",
            "jquery.auto-submit.js",
            "jquery.listing-actions.js",
            "jquery.ajax-wishlist.js",
            "jquery.captcha.js",
            "jquery.cookie-permission.js",
            "jquery.storage-field.js",
            "jquery.range-slider.js",
            "jquery.off-canvas-menu.js",
            "jquery.ajax-product-navigation.js",
            "jquery.shipping-payment.js",
            "jquery.ajax-variant.js",
            "jquery.csrf-protection.js",
            "jquery.address-selection.js",
            "jquery.address-editor.js",
            "jquery.form-polyfill.js",
            "jquery.pseudo-text.js",
            "jquery.preloader-button.js",
            "jquery.invalid-tos-jump.js",
            "jquery.notification-message-close.js",
            "jquery.cookie-consent-manager.js",
        ];

        $sourceJavascripts = [
            "jquery.ui.datepicker.js",
            "swbt.helper.js",
            "swbt.overlay.js",
            "swbt.loader.js",
            "swbt.modal.js",
            "swbt.scroll-up.js",
            "swbt.popover-wrapper.js",
            "jquery.product-compare-add-extend.js",
            "jquery.product-compare-menu-extend.js",
            "swbt.search-popover.js",
            "jquery.add-article-extend.js",
            "swbt.slick-wrapper.js",
            "jquery.last-seen-products-extend.js",
            "swbt.newsletter-form.js",
            "swbt.image-zoom.js",
            "swbt.detail-tabs.js",
            "swbt.ajax-cart.js",
            "swbt.password-input-viewer.js",
            "swbt.password-strength-wrapper.js",
            "jquery.register-extend.js",
            "jquery.infinite-scrolling-extend.js",
            "jquery.emotion-extend.js",
            "jquery.auto-submit-extend.js",
            "jquery.listing-actions-extend.js",
            "jquery.range-slider-extend.js",
            "jquery.ajax-wishlist-extend.js",
            "jquery.off-canvas-menu-extend.js",
            "jquery.ajax-product-navigation-extend.js",
            "jquery.shipping-payment-extend.js",
            "jquery.ajax-variant-extend.js",
            "swbt.menu.js",
            "jquery.address-selection-extend.js",
            "jquery.address-editor-extend.js",
            "jquery.preloader-button-extend.js",

            "swbt._init.js",
        ];

        $this->javascript = array_merge(
            array_map(function ($filename) {
                return self::VENDORS_JS_PATH . $filename;
            }, $vendorsJavascripts),
            array_map(function ($filename) {
                return self::RESPONSIVE_THEME_JS_PATH . $filename;
            }, $shopwareJavascripts),
            array_map(function ($filename) {
                return self::SOURCE_JS_PATH . $filename;
            }, $sourceJavascripts)
        );
    }


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
                )
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
                'attributes' => $this->fieldSetColumnDefaults
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'desktopLogo',
                'Standard Logo',
                $this->themeDefaults['desktopLogo'],
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
                $this->themeDefaults['mobileLogo'],
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
                )
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'favicon',
                'Favicon',
                $this->themeDefaults['favicon'],
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
                $this->themeDefaults['appleTouchIcon'],
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
                $this->themeDefaults['androidLogo'],
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
                $this->themeDefaults['body-bg-img'],
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
                $this->themeDefaults['body-bg-img-repeat'],
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
                $this->themeDefaults['body-bg-img-hide'],
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
                )
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
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-primary',
                'Farbe Primär',
                $this->themeDefaults['swf-brand-primary']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-success',
                'Farbe Erfolg',
                $this->themeDefaults['swf-brand-success']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-warning',
                'Farbe Warnung',
                $this->themeDefaults['swf-brand-warning']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-danger',
                'Farbe Fehler',
                $this->themeDefaults['swf-brand-danger']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-brand-info',
                'Farbe Info',
                $this->themeDefaults['swf-brand-info']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-base',
                'Basis Grau',
                $this->themeDefaults['swf-gray-base'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-darker',
                'sehr dunkles Grau',
                $this->themeDefaults['swf-gray-darker']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-dark',
                'dunkles Grau',
                $this->themeDefaults['swf-gray-dark']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray',
                'Grau',
                $this->themeDefaults['swf-gray']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-light',
                'helles Grau',
                $this->themeDefaults['swf-gray-light']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-gray-lighter',
                'sehr helles Grau',
                $this->themeDefaults['swf-gray-lighter']
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
                )
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-family-base',
                'Standardschriftart',
                $this->themeDefaults['swf-font-family-base']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-family-serif',
                'Standardschriftart (serif)',
                $this->themeDefaults['swf-font-family-serif']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-family-sans-serif',
                'Standardschriftart (sans-serif)',
                $this->themeDefaults['swf-font-family-sans-serif']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-family-monospace',
                'Standardschriftart (monospace)',
                $this->themeDefaults['swf-font-family-monospace']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-headings-font-family',
                'Schriftart Überschriften',
                $this->themeDefaults['swf-headings-font-family']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-base',
                'Standardschriftgröße',
                $this->themeDefaults['swf-font-size-base']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-small',
                'Kleine Schriftgröße',
                $this->themeDefaults['swf-font-size-small']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-large',
                'Große Schriftgröße',
                $this->themeDefaults['swf-font-size-large']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-line-height-base',
                'Standard Zeilenhöhe',
                $this->themeDefaults['swf-line-height-base'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-line-height-large',
                'Große Zeilenhöhe',
                $this->themeDefaults['swf-line-height-large'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-line-height-small',
                'Kleine Zeilenhöhe',
                $this->themeDefaults['swf-line-height-small'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-line-height-computed',
                'Berechnete Zeilenhöhe',
                $this->themeDefaults['swf-line-height-computed'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createNumberField(
                'swf-headings-font-weight',
                'Schriftschnitt Überschrift',
                $this->themeDefaults['swf-headings-font-weight'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-headings-line-height',
                'Zeilenhöhe Überschrift',
                $this->themeDefaults['swf-headings-line-height'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h1',
                'Schriftgröße Überschrift 1',
                $this->themeDefaults['swf-font-size-h1']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h2',
                'Schriftgröße Überschrift 2',
                $this->themeDefaults['swf-font-size-h2']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h3',
                'Schriftgröße Überschrift 3',
                $this->themeDefaults['swf-font-size-h3']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h4',
                'Schriftgröße Überschrift 4',
                $this->themeDefaults['swf-font-size-h4']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h5',
                'Schriftgröße Überschrift 5',
                $this->themeDefaults['swf-font-size-h5']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-font-size-h6',
                'Schriftgröße Überschrift 6',
                $this->themeDefaults['swf-font-size-h6']
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-blockquote-font-size',
                'Schriftgröße Zitatblock',
                $this->themeDefaults['swf-blockquote-font-size'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createSpacingAndOthersFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-content-min-height',
                'Mindesthöhe Contentbereich',
                $this->themeDefaults['swf-content-min-height'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-border-radius-base',
                'Eckenradius',
                $this->themeDefaults['swf-border-radius-base'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-border-radius-large',
                'großer Eckenradius',
                $this->themeDefaults['swf-border-radius-large'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-border-radius-small',
                'kleiner Eckenradius',
                $this->themeDefaults['swf-border-radius-small'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-table-cell-padding',
                'Innenabstand Tabellenzeile',
                $this->themeDefaults['swf-table-cell-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-table-condensed-cell-padding',
                'Innenabstand Tabellenzeile (condensed)',
                $this->themeDefaults['swf-table-condensed-cell-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'swf-link-hover-decoration',
                'Textdekoration Link',
                $this->themeDefaults['swf-link-hover-decoration'],
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
                $this->themeDefaults['swf-component-offset-horizontal'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-dl-horizontal-offset',
                'Einrückung Definitionsliste',
                $this->themeDefaults['swf-dl-horizontal-offset'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createColorSettingsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-body-bg',
                'Hintergrundfarbe (Body)',
                $this->themeDefaults['swf-body-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-shop-bg',
                'Hintergrundfarbe (Shop)',
                $this->themeDefaults['swf-shop-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-text-color',
                'Schriftfarbe',
                $this->themeDefaults['swf-text-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-headings-color',
                'Schriftfarbe Überschrift',
                $this->themeDefaults['swf-headings-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-headings-small-color',
                'Schriftfarbe kleine Überschrift',
                $this->themeDefaults['swf-headings-small-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-page-header-border-color',
                'Rahmenfarbe Seitenüberschrift',
                $this->themeDefaults['swf-page-header-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-link-color',
                'Linkfarbe',
                $this->themeDefaults['swf-link-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-link-hover-color',
                'Linkfarbe (Hover)',
                $this->themeDefaults['swf-link-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-bg',
                'Hintergrundfarbe (Footer)',
                $this->themeDefaults['swf-footer-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-border',
                'Rahmenfarbe (Footer)',
                $this->themeDefaults['swf-footer-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-color',
                'Schriftfarbe (Footer)',
                $this->themeDefaults['swf-footer-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-link-color',
                'Schriftfarbe Link (Footer)',
                $this->themeDefaults['swf-footer-link-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-footer-link-hover-color',
                'Schriftfarbe Link Hover (Footer)',
                $this->themeDefaults['swf-footer-link-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-bg',
                'Hintergrundfarbe Tabellen',
                $this->themeDefaults['swf-table-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-bg-hover',
                'Hintergrundfarbe Tabellen (Hover)',
                $this->themeDefaults['swf-table-bg-hover'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-bg-active',
                'Hintergrundfarbe Tabellen (Aktiv)',
                $this->themeDefaults['swf-table-bg-active'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-bg-accent',
                'Hintergrundfarbe 2 Tabellen',
                $this->themeDefaults['swf-table-bg-accent'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-table-border-color',
                'Rahmenfarbe Tabellen',
                $this->themeDefaults['swf-table-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-well-bg',
                'Hintergrundfarbe Hervorhebung',
                $this->themeDefaults['swf-well-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-well-border',
                'Rahmenfarbe Hervorhebung',
                $this->themeDefaults['swf-well-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-component-active-bg',
                'Hintergrundfarbe aktive Elemente',
                $this->themeDefaults['swf-component-active-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-component-active-color',
                'Textfarbe aktive Elemente',
                $this->themeDefaults['swf-component-active-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-hr-border',
                'Farbe Trennlinie',
                $this->themeDefaults['swf-hr-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-text-muted',
                'Farbe ausgegrauter Text',
                $this->themeDefaults['swf-text-muted'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-abbr-border-color',
                'Rahmenfarbe Abkürzungen',
                $this->themeDefaults['swf-abbr-border-color'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createBreakpointsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-screen-lg-min',
                'Breakpoint großer Desktop',
                $this->themeDefaults['swf-screen-lg-min'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-screen-md-min',
                'Breakpoint Tablet Landscape / Kleiner Desktop',
                $this->themeDefaults['swf-screen-md-min'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-screen-hd-min',
                'Breakpoint Tablet',
                $this->themeDefaults['swf-screen-hd-min'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-screen-sm-min',
                'Breakpoint Smartphone Landscape',
                $this->themeDefaults['swf-screen-sm-min'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createDivisionFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createSelectField(
                'articles-col-width-lg',
                'Großer Desktop',
                $this->themeDefaults['articles-col-width-lg'],
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
                $this->themeDefaults['articles-col-width-md'],
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
                $this->themeDefaults['articles-col-width-hd'],
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
                $this->themeDefaults['articles-col-width-sm'],
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
                $this->themeDefaults['articles-col-width-xs'],
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


    private function createGridFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createNumberField(
                'amount-left-columns',
                'Breite Seitenbereich (Anzahl Spalten)',
                $this->themeDefaults['amount-left-columns'],
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
                $this->themeDefaults['swf-grid-gutter-width'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-container-hd',
                'Breite Spalten-Container (Tablet)',
                $this->themeDefaults['swf-container-hd'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-container-md',
                'Breite Spalten-Container (Tablet Landscape, kleiner Desktop)',
                $this->themeDefaults['swf-container-md'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-container-lg',
                'Breite Spalten-Container (großer Desktop)',
                $this->themeDefaults['swf-container-lg'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createTopNavigationFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-bg',
                'Hintergrundfarbe Top-Navigation',
                $this->themeDefaults['swf-navbar-default-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-color',
                'Linkfarbe Top-Navigation',
                $this->themeDefaults['swf-navbar-default-link-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-border',
                'Rahmenfarbe Top-Navigation',
                $this->themeDefaults['swf-navbar-default-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-hover-color',
                'Linkfarbe (Hover) Top-Navigation',
                $this->themeDefaults['swf-navbar-default-link-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-active-color',
                'Linkfarbe (Aktiv) Top-Navigation',
                $this->themeDefaults['swf-navbar-default-link-active-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-disabled-color',
                'Linkfarbe (Disabled) Top-Navigation',
                $this->themeDefaults['swf-navbar-default-link-disabled-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-hover-bg',
                'Hintergrundfarbe (Hover) Top-Navigation',
                $this->themeDefaults['swf-navbar-default-link-hover-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-active-bg',
                'Hintergrundfarbe (Aktiv) Top-Navigation',
                $this->themeDefaults['swf-navbar-default-link-active-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-link-disabled-bg',
                'Hintergrundfarbe (Disabled) Top-Navigation',
                $this->themeDefaults['swf-navbar-default-link-disabled-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-toggle-icon-bar-bg',
                'Smartphone-Button Iconfarbe Top-Navigation',
                $this->themeDefaults['swf-navbar-default-toggle-icon-bar-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-default-toggle-hover-bg',
                'Smartphone-Button Iconfarbe (Hover) Top-Navigation',
                $this->themeDefaults['swf-navbar-default-toggle-hover-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-link-separator-color',
                'Link Trennlinien Farbe Top-Navigation',
                $this->themeDefaults['swf-navbar-link-separator-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-submenu-bg-color',
                'Hintergrundfarbe Untermenüs Top-Navigation',
                $this->themeDefaults['swf-navbar-submenu-bg-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-submenu-border-color',
                'Rahmenfarbe Untermenüs Top-Navigation',
                $this->themeDefaults['swf-navbar-submenu-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-navbar-height',
                'Höhe Top-Navigation',
                $this->themeDefaults['swf-navbar-height'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-navbar-border-radius',
                'Eckradius Top-Navigation',
                $this->themeDefaults['swf-navbar-border-radius'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createTopNavigationOffCanvasFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-navbar-off-canvas-width',
                'Breite Off-Canvas',
                $this->themeDefaults['swf-navbar-off-canvas-width'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-navbar-off-canvas-indent',
                'Einrückung Untermenüpunkte Off-Canvas',
                $this->themeDefaults['swf-navbar-off-canvas-indent'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-bg-color',
                'Hintergrundfarbe Off-Canvas',
                $this->themeDefaults['swf-navbar-off-canvas-bg-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-submenu-bg-color',
                'Hintergrundfarbe Untermenüs Off-Canvas',
                $this->themeDefaults['swf-navbar-off-canvas-submenu-bg-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-arrow-color',
                'Navigations-Pfeil Farbe Off-Canvas',
                $this->themeDefaults['swf-navbar-off-canvas-arrow-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-close-icon-color',
                'Schließen-Icon Farbe Off-Canvas',
                $this->themeDefaults['swf-navbar-off-canvas-close-icon-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-navbar-off-canvas-close-icon-color-hover',
                'Schließen-Icon Farbe (Hover) Off-Canvas',
                $this->themeDefaults['swf-navbar-off-canvas-close-icon-color-hover'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createOtherNavigationElementsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-nav-link-padding',
                'Innenabstand Navs',
                $this->themeDefaults['swf-nav-link-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-link-hover-bg',
                'Hintergrundfarbe Navs (Hover)',
                $this->themeDefaults['swf-nav-link-hover-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-disabled-link-color',
                'Textfarbe Tabs (Inaktiv)',
                $this->themeDefaults['swf-nav-disabled-link-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-active-link-hover-color',
                'Textfarbe Tab-Navigation (Aktiv & Hover)',
                $this->themeDefaults['swf-nav-tabs-active-link-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-active-link-hover-bg',
                'Hintergrundfarbe Tabs',
                $this->themeDefaults['swf-nav-tabs-active-link-hover-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-border-color',
                'Rahmenfarbe Tabs',
                $this->themeDefaults['swf-nav-tabs-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-link-hover-border-color',
                'Rahmenfarbe Tab-Navigation (Hover)',
                $this->themeDefaults['swf-nav-tabs-link-hover-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-active-link-hover-border-color',
                'Rahmenfarbe aktive Tab-Navigation (Hover)',
                $this->themeDefaults['swf-nav-tabs-active-link-hover-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-justified-link-border-color',
                'Rahmenfarbe (Justified) Tab-Navigation',
                $this->themeDefaults['swf-nav-tabs-justified-link-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-tabs-justified-active-link-border-color',
                'Rahmenfarbe (Justified) Tab-Navigation (Aktiv)',
                $this->themeDefaults['swf-nav-tabs-justified-active-link-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-nav-pills-border-radius',
                'Eckradius Button-Navigation',
                $this->themeDefaults['swf-nav-pills-border-radius'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-pills-active-link-hover-bg',
                'Hintergrundfarbe Button-Navigation (Aktiv & Hover)',
                $this->themeDefaults['swf-nav-pills-active-link-hover-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-nav-pills-active-link-hover-color',
                'Textfarbe Button-Navigation (Aktiv & Hover)',
                $this->themeDefaults['swf-nav-pills-active-link-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-scroll-up-bottom-position',
                'Scroll-Up Position vom unteren Seitenrand',
                $this->themeDefaults['swf-scroll-up-bottom-position'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createPagingFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-color',
                'Textfarbe Seiten-Nummerierung',
                $this->themeDefaults['swf-pagination-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-border',
                'Rahmenfarbe Seiten-Nummerierung',
                $this->themeDefaults['swf-pagination-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-hover-border',
                'Rahmenfarbe Seiten-Nummerierung (Hover)',
                $this->themeDefaults['swf-pagination-hover-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-bg',
                'Hintergrundfarbe Seiten-Nummerierung',
                $this->themeDefaults['swf-pagination-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-disabled-bg',
                'Hintergrundfarbe Seiten-Nummerierung (Disabled)',
                $this->themeDefaults['swf-pagination-disabled-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-disabled-border',
                'Rahmenfarbe Seiten-Nummerierung (Disabled)',
                $this->themeDefaults['swf-pagination-disabled-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-hover-color',
                'Linkfarbe Seiten-Nummerierung (Hover)',
                $this->themeDefaults['swf-pagination-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-active-color',
                'Linkfarbe Seiten-Nummerierung (Aktiv)',
                $this->themeDefaults['swf-pagination-active-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-disabled-color',
                'Linkfarbe Seiten-Nummerierung (Disabled)',
                $this->themeDefaults['swf-pagination-disabled-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-active-bg',
                'Hintergrundfarbe Seiten-Nummerierung (Aktiv)',
                $this->themeDefaults['swf-pagination-active-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-active-border',
                'Rahmenfarbe Seiten-Nummerierung (Aktiv)',
                $this->themeDefaults['swf-pagination-active-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-pagination-hover-bg',
                'Hintergrundfarbe Seiten-Nummerierung (Hover)',
                $this->themeDefaults['swf-pagination-hover-bg'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createLeftMenuAndFilterFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-list-group-border-radius',
                'Eckradius Menü/Filter',
                $this->themeDefaults['swf-list-group-border-radius'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-border',
                'Rahmenfarbe Menü/Filter',
                $this->themeDefaults['swf-list-group-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-bg',
                'Hintergrundfarbe Menü/Filter',
                $this->themeDefaults['swf-list-group-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-link-color',
                'Linkfarbe Menü/Filter',
                $this->themeDefaults['swf-list-group-link-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-hover-bg',
                'Hintergrundfarbe Menü/Filter (Hover)',
                $this->themeDefaults['swf-list-group-hover-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-link-hover-color',
                'Linkfarbe Menü/Filter (Hover)',
                $this->themeDefaults['swf-list-group-link-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-active-text-color',
                'Textfarbe Menü/Filter (Aktiv)',
                $this->themeDefaults['swf-list-group-active-text-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-active-border',
                'Rahmenfarbe Menü/Filter (Aktiv)',
                $this->themeDefaults['swf-list-group-active-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-active-bg',
                'Hintergrundfarbe Menü/Filter (Aktiv)',
                $this->themeDefaults['swf-list-group-active-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-active-color',
                'Linkfarbe Menü/Filter (Aktiv)',
                $this->themeDefaults['swf-list-group-active-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-disabled-text',
                'Textfarbe Menü/Filter (Disabled)',
                $this->themeDefaults['swf-list-group-disabled-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-disabled-bg',
                'Hintergrundfarbe Menü/Filter (Disabled)',
                $this->themeDefaults['swf-list-group-disabled-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-list-group-disabled-color',
                'Linkfarbe Menü/Filter (Disabled)',
                $this->themeDefaults['swf-list-group-disabled-color'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createNavigationOthersFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-bg',
                'Hintergrundfarbe Zähler',
                $this->themeDefaults['swf-badge-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-color',
                'Textfarbe Zähler',
                $this->themeDefaults['swf-badge-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-link-hover-color',
                'Textfarbe Zähler mit Link (Hover)',
                $this->themeDefaults['swf-badge-link-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-active-bg',
                'Hintergrundfarbe Zähler (Aktiv)',
                $this->themeDefaults['swf-badge-active-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-badge-active-color',
                'Textfarbe Zähler (Aktiv)',
                $this->themeDefaults['swf-badge-active-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-badge-line-height',
                'Zeilenhöhe Zähler',
                $this->themeDefaults['swf-badge-line-height'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'swf-badge-font-weight',
                'Schriftgewicht Zähler',
                $this->themeDefaults['swf-badge-font-weight'],
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
                $this->themeDefaults['swf-badge-border-radius'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-breadcrumb-bg',
                'Hintergrundfarbe Breadcrumbs',
                $this->themeDefaults['swf-breadcrumb-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-breadcrumb-color',
                'Farbe Trennzeichen Breadcrumbs',
                $this->themeDefaults['swf-breadcrumb-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-breadcrumb-active-color',
                'Textfarbe Breadcrumb (Aktiv)',
                $this->themeDefaults['swf-breadcrumb-active-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-breadcrumb-padding-vertical',
                'Innenabstand vertikal Breadcrumbs',
                $this->themeDefaults['swf-breadcrumb-padding-vertical'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-breadcrumb-padding-horizontal',
                'Innenabstand horizontal Breadcrumbs',
                $this->themeDefaults['swf-breadcrumb-padding-horizontal'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-breadcrumb-separator',
                'Trennzeichen Breadcrumbs',
                $this->themeDefaults['swf-breadcrumb-separator'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createMessagesFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-alert-padding',
                'Innenabstand Meldung',
                $this->themeDefaults['swf-alert-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-alert-border-radius',
                'Eckradius Meldung',
                $this->themeDefaults['swf-alert-border-radius'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'swf-alert-link-font-weight',
                'Schriftgewicht Meldung',
                $this->themeDefaults['swf-alert-link-font-weight'],
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
                $this->themeDefaults['swf-alert-success-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-success-text',
                'Textfarbe Erfolgsmeldung',
                $this->themeDefaults['swf-alert-success-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-success-border',
                'Rahmenfarbe Erfolgsmeldung',
                $this->themeDefaults['swf-alert-success-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-info-bg',
                'Hintergrundfarbe Infomeldung',
                $this->themeDefaults['swf-alert-info-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-info-text',
                'Textfarbe Infomeldung',
                $this->themeDefaults['swf-alert-info-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-info-border',
                'Rahmenfarbe Infomeldung',
                $this->themeDefaults['swf-alert-info-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-warning-bg',
                'Hintergrundfarbe Warnmeldung',
                $this->themeDefaults['swf-alert-warning-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-warning-text',
                'Textfarbe Warnmeldung',
                $this->themeDefaults['swf-alert-warning-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-warning-border',
                'Rahmenfarbe Warnmeldung',
                $this->themeDefaults['swf-alert-warning-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-danger-bg',
                'Hintergrundfarbe Fehlermeldung',
                $this->themeDefaults['swf-alert-danger-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-danger-text',
                'Textfarbe Fehlermeldung',
                $this->themeDefaults['swf-alert-danger-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-alert-danger-border',
                'Rahmenfarbe Fehlermeldung',
                $this->themeDefaults['swf-alert-danger-border'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createPopoverFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-popover-max-width',
                'Maximale Breite Popover',
                $this->themeDefaults['swf-popover-max-width'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-bg',
                'Hintergrundfarbe Popover',
                $this->themeDefaults['swf-popover-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-title-bg',
                'Hintergrundfarbe Kopfzeile Popover',
                $this->themeDefaults['swf-popover-title-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-border-color',
                'Rahmenfarbe Popover',
                $this->themeDefaults['swf-popover-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-fallback-border-color',
                'Rahmenfarbe Popover (InternetExplorer8 Fallback)',
                $this->themeDefaults['swf-popover-fallback-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-popover-arrow-width',
                'Breite Popover-Pfeil',
                $this->themeDefaults['swf-popover-arrow-width'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-arrow-color',
                'Farbe Popover-Pfeil',
                $this->themeDefaults['swf-popover-arrow-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-popover-arrow-outer-width',
                'Äußere Breite Popover-Pfeil',
                $this->themeDefaults['swf-popover-arrow-outer-width'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-arrow-outer-color',
                'Äußere Farbe Popover-Pfeil',
                $this->themeDefaults['swf-popover-arrow-outer-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-popover-arrow-outer-fallback-color',
                'Äußere Farbe Popover-Pfeil (InternetExplorer8 Fallback)',
                $this->themeDefaults['swf-popover-arrow-outer-fallback-color'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createDropdownsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-bg',
                'Hintergrundfarbe Dropdown',
                $this->themeDefaults['swf-dropdown-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-caret-color',
                'Pfeilfarbe Dropdown',
                $this->themeDefaults['swf-dropdown-caret-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-border',
                'Rahmenfarbe Dropdown',
                $this->themeDefaults['swf-dropdown-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-fallback-border',
                'Rahmenfarbe Dropdown (InternetExplorer8 Fallback)',
                $this->themeDefaults['swf-dropdown-fallback-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-divider-bg',
                'Trennlinie Farbe Dropdown',
                $this->themeDefaults['swf-dropdown-divider-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-header-color',
                'Textfarbe Überschrift Dropdown',
                $this->themeDefaults['swf-dropdown-header-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-color',
                'Textfarbe Link Dropdown',
                $this->themeDefaults['swf-dropdown-link-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-hover-color',
                'Textfarbe Link (Hover) Dropdown',
                $this->themeDefaults['swf-dropdown-link-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-hover-bg',
                'Hintergrundfarbe Link (Hover) Dropdown',
                $this->themeDefaults['swf-dropdown-link-hover-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-active-color',
                'Textfarbe Link (Aktiv) Dropdown',
                $this->themeDefaults['swf-dropdown-link-active-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-active-bg',
                'Hintergrundfarbe Link (Aktiv) Dropdown',
                $this->themeDefaults['swf-dropdown-link-active-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-dropdown-link-disabled-color',
                'Textfarbe Link (Disabled) Dropdown',
                $this->themeDefaults['swf-dropdown-link-disabled-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-caret-width-base',
                'Breite Pfeil Dropdown-Button',
                $this->themeDefaults['swf-caret-width-base'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-caret-width-large',
                'Breite großer Pfeil Dropdown-Button',
                $this->themeDefaults['swf-caret-width-large'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createModalsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-content-bg',
                'Hintergrundfarbe Modal',
                $this->themeDefaults['swf-modal-content-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-content-border-color',
                'Rahmenfarbe Modal',
                $this->themeDefaults['swf-modal-content-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-content-fallback-border-color',
                'Rahmenfarbe Modal (InternetExplorer8 Fallback)',
                $this->themeDefaults['swf-modal-content-fallback-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-backdrop-bg',
                'Hintergrundfarbe Modal-Layer',
                $this->themeDefaults['swf-modal-backdrop-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-backdrop-opacity',
                'Deckkraft Modal-Layer',
                $this->themeDefaults['swf-modal-backdrop-opacity'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-header-border-color',
                'Rahmenfarbe Kopfzeile Modal',
                $this->themeDefaults['swf-modal-header-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-modal-footer-border-color',
                'Rahmenfarbe Fußzeile Modal',
                $this->themeDefaults['swf-modal-footer-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-inner-padding',
                'Innenabstand Modal',
                $this->themeDefaults['swf-modal-inner-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-title-padding',
                'Innenabstand Kopfzeile Modal',
                $this->themeDefaults['swf-modal-title-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-lg',
                'Großer Desktop Modal Breite',
                $this->themeDefaults['swf-modal-lg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-md',
                'Kleiner Desktop Modal Breite',
                $this->themeDefaults['swf-modal-md'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-modal-sm',
                'Tablet Modal Breite',
                $this->themeDefaults['swf-modal-sm'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createPanelsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-panel-body-padding',
                'Innenabstand Panel',
                $this->themeDefaults['swf-panel-body-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-panel-heading-padding',
                'Innenabstand Kopfzeile',
                $this->themeDefaults['swf-panel-heading-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-panel-footer-padding',
                'Innenabstand Fußzeile',
                $this->themeDefaults['swf-panel-footer-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-panel-border-radius',
                'Eckradius Panel',
                $this->themeDefaults['swf-panel-border-radius'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-bg',
                'Hintergrundfarbe',
                $this->themeDefaults['swf-panel-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-default-border',
                'Rahmenfarbe',
                $this->themeDefaults['swf-panel-default-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-default-heading-bg',
                'Hintergrundfarbe Kopfzeile',
                $this->themeDefaults['swf-panel-default-heading-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-footer-bg',
                'Hintergrundfarbe Fußzeile',
                $this->themeDefaults['swf-panel-footer-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-default-text',
                'Textfarbe Kopfzeile/Fußzeile',
                $this->themeDefaults['swf-panel-default-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-primary-border',
                'Rahmenfarbe Aktionspanel',
                $this->themeDefaults['swf-panel-primary-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-primary-heading-bg',
                'Hintergrundfarbe Kopfzeile Aktionspanel',
                $this->themeDefaults['swf-panel-primary-heading-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-primary-text',
                'Textfarbe Kopfzeile Aktionspanel',
                $this->themeDefaults['swf-panel-primary-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-success-border',
                'Rahmenfarbe Erfolgspanel',
                $this->themeDefaults['swf-panel-success-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-success-heading-bg',
                'Hintergrundfarbe Kopfzeile Erfolgspanel',
                $this->themeDefaults['swf-panel-success-heading-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-success-heading-text',
                'Textfarbe Kopfzeile Erfolgspanel',
                $this->themeDefaults['swf-panel-success-heading-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-info-border',
                'Rahmenfarbe Infopanel',
                $this->themeDefaults['swf-panel-info-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-info-heading-bg',
                'Hintergrundfarbe Kopfzeile Infopanel',
                $this->themeDefaults['swf-panel-info-heading-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-info-heading-text',
                'Textfarbe Kopfzeile Infopanel',
                $this->themeDefaults['swf-panel-info-heading-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-warning-border',
                'Rahmenfarbe Warnungspanel',
                $this->themeDefaults['swf-panel-warning-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-warning-heading-bg',
                'Hintergrundfarbe Kopfzeile Warnungspanel',
                $this->themeDefaults['swf-panel-warning-heading-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-warning-heading-text',
                'Textfarbe Kopfzeile Warnungspanel',
                $this->themeDefaults['swf-panel-warning-heading-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-danger-border',
                'Rahmenfarbe Fehlerpanel',
                $this->themeDefaults['swf-panel-danger-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-danger-heading-bg',
                'Hintergrundfarbe Kopfzeile Fehlerpanel',
                $this->themeDefaults['swf-panel-danger-heading-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-panel-danger-heading-text',
                'Textfarbe Kopfzeile Fehlerpanel',
                $this->themeDefaults['swf-panel-danger-heading-text'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createPricesFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-price-default-color',
                'Textfarbe Preise',
                $this->themeDefaults['swf-price-default-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-price-pseudo-color',
                'Textfarbe Pseudopreise',
                $this->themeDefaults['swf-price-pseudo-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-price-discount-color',
                'Textfarbe Rabattpreise',
                $this->themeDefaults['swf-price-discount-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-rating-color',
                'Farbe Bewertungssterne',
                $this->themeDefaults['swf-rating-color'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createCommentsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-blockquote-border-color',
                'Rahmenfarbe Kommentar',
                $this->themeDefaults['swf-blockquote-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-blockquote-small-color',
                'Textfarbe Kommentar (klein)',
                $this->themeDefaults['swf-blockquote-small-color'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createLabelsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-color',
                'Textfarbe Label',
                $this->themeDefaults['swf-label-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-link-hover-color',
                'Textfarbe Label Link (Hover)',
                $this->themeDefaults['swf-label-link-hover-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-default-bg',
                'Hintergrundfarbe Label',
                $this->themeDefaults['swf-label-default-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-primary-bg',
                'Hintergrundfarbe Label (NEU)',
                $this->themeDefaults['swf-label-primary-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-info-bg',
                'Hintergrundfarbe Label (INFO)',
                $this->themeDefaults['swf-label-info-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-success-bg',
                'Hintergrundfarbe Label (TIPP)',
                $this->themeDefaults['swf-label-success-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-warning-bg',
                'Hintergrundfarbe Label (ESD)',
                $this->themeDefaults['swf-label-warning-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-label-danger-bg',
                'Hintergrundfarbe Label (Rabatt)',
                $this->themeDefaults['swf-label-danger-bg'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createArticleboxesFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-thumbnail-padding',
                'Innenabstand Artikelbox',
                $this->themeDefaults['swf-thumbnail-padding'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-thumbnail-border-radius',
                'Eckenradius Artikelbox',
                $this->themeDefaults['swf-thumbnail-border-radius'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-thumbnail-hover-border',
                'Rahmenfarbe Artikelbox (Hover)',
                $this->themeDefaults['swf-thumbnail-hover-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-thumbnail-bg',
                'Hintergrundfarbe Artikelbox',
                $this->themeDefaults['swf-thumbnail-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-thumbnail-border',
                'Rahmenfarbe Artikelbox',
                $this->themeDefaults['swf-thumbnail-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-thumbnail-caption-color',
                'Textfarbe Artikelbox',
                $this->themeDefaults['swf-thumbnail-caption-color'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createButtonsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-default-color',
                'Textfarbe Standard-Buttons',
                $this->themeDefaults['swf-btn-default-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-default-bg',
                'Hintergrundfarbe Standard-Buttons',
                $this->themeDefaults['swf-btn-default-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-default-border',
                'Rahmenfarbe Standard-Buttons',
                $this->themeDefaults['swf-btn-default-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-primary-color',
                'Textfarbe Aktionen-Buttons',
                $this->themeDefaults['swf-btn-primary-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-primary-bg',
                'Hintergrundfarbe Aktionen-Buttons',
                $this->themeDefaults['swf-btn-primary-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-primary-border',
                'Rahmenfarbe Aktionen-Buttons',
                $this->themeDefaults['swf-btn-primary-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-danger-color',
                'Textfarbe Löschen-Buttons',
                $this->themeDefaults['swf-btn-danger-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-danger-bg',
                'Hintergrundfarbe Löschen-Buttons',
                $this->themeDefaults['swf-btn-danger-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-danger-border',
                'Rahmenfarbe Löschen-Buttons',
                $this->themeDefaults['swf-btn-danger-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-success-color',
                'Textfarbe Erfolg-Buttons',
                $this->themeDefaults['swf-btn-success-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-success-bg',
                'Hintergrundfarbe Erfolg-Buttons',
                $this->themeDefaults['swf-btn-success-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-success-border',
                'Rahmenfarbe Erfolg-Buttons',
                $this->themeDefaults['swf-btn-success-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-info-color',
                'Textfarbe Info-Buttons',
                $this->themeDefaults['swf-btn-info-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-info-bg',
                'Hintergrundfarbe Info-Buttons',
                $this->themeDefaults['swf-btn-info-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-info-border',
                'Rahmenfarbe Info-Buttons',
                $this->themeDefaults['swf-btn-info-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-warning-color',
                'Textfarbe Warnung-Buttons',
                $this->themeDefaults['swf-btn-warning-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-warning-bg',
                'Hintergrundfarbe Warnung-Buttons',
                $this->themeDefaults['swf-btn-warning-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-warning-border',
                'Rahmenfarbe Warnung-Buttons',
                $this->themeDefaults['swf-btn-warning-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-btn-link-disabled-color',
                'Textfarbe Link-Buttons (Disabled)',
                $this->themeDefaults['swf-btn-link-disabled-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'swf-btn-font-weight',
                'Schriftschnitt Buttons',
                $this->themeDefaults['swf-btn-font-weight'],
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


    private function createFormsMessagesFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-success-bg',
                'Hintergrundfarbe Erfolgsmeldung',
                $this->themeDefaults['swf-state-success-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-success-text',
                'Textfarbe Erfolgsmeldungen',
                $this->themeDefaults['swf-state-success-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-success-border',
                'Rahmenfarbe Erfolgsmeldungen',
                $this->themeDefaults['swf-state-success-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-warning-bg',
                'Hintergrundfarbe Warnmeldung',
                $this->themeDefaults['swf-state-warning-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-warning-text',
                'Textfarbe Warnmeldungen',
                $this->themeDefaults['swf-state-warning-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-warning-border',
                'Rahmenfarbe Warnmeldungen',
                $this->themeDefaults['swf-state-warning-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-danger-bg',
                'Hintergrundfarbe Fehlermeldung',
                $this->themeDefaults['swf-state-danger-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-danger-text',
                'Textfarbe Fehlermeldungen',
                $this->themeDefaults['swf-state-danger-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-danger-border',
                'Rahmenfarbe Fehlermeldungen',
                $this->themeDefaults['swf-state-danger-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-info-bg',
                'Hintergrundfarbe Infomeldung',
                $this->themeDefaults['swf-state-info-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-info-text',
                'Textfarbe Infomeldungen',
                $this->themeDefaults['swf-state-info-text'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-state-info-border',
                'Rahmenfarbe Infomeldungen',
                $this->themeDefaults['swf-state-info-border'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createInputFieldsFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-color',
                'Textfarbe Eingabefeld',
                $this->themeDefaults['swf-input-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-bg',
                'Hintergrundfarbe Eingabefeld',
                $this->themeDefaults['swf-input-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-bg-disabled',
                'Hintergrundfarbe Eingabefeld (Disabled)',
                $this->themeDefaults['swf-input-bg-disabled'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-border',
                'Rahmenfarbe Eingabefeld',
                $this->themeDefaults['swf-input-border'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-border-focus',
                'Rahmenfarbe Eingabefeld (Focus)',
                $this->themeDefaults['swf-input-border-focus'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-color-placeholder',
                'Textfarbe Platzhalter Eingabefeld',
                $this->themeDefaults['swf-input-color-placeholder'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-border-radius',
                'Eckradius Eingabefeld',
                $this->themeDefaults['swf-input-border-radius'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-border-radius-large',
                'Eckradius großes Eingabefeld',
                $this->themeDefaults['swf-input-border-radius-large'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-border-radius-small',
                'Eckradius kleines Eingabefeld',
                $this->themeDefaults['swf-input-border-radius-small'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-height-base',
                'Höhe Eingabefeld',
                $this->themeDefaults['swf-input-height-base'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-height-large',
                'Höhe großes Eingabefeld',
                $this->themeDefaults['swf-input-height-large'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-input-height-small',
                'Höhe kleines Eingabefeld',
                $this->themeDefaults['swf-input-height-small'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-group-addon-bg',
                'Hintergrundfarbe Eingabefeld Erweiterung',
                $this->themeDefaults['swf-input-group-addon-bg'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-input-group-addon-border-color',
                'Rahmenfarbe Eingabefeld Erweiterung',
                $this->themeDefaults['swf-input-group-addon-border-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-legend-color',
                'Textfarbe Legende',
                $this->themeDefaults['swf-legend-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-legend-border-color',
                'Rahmenfarbe Legende',
                $this->themeDefaults['swf-legend-border-color'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createSpacingFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-base-vertical',
                'Außenabstand vertikal',
                $this->themeDefaults['swf-padding-base-vertical'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-base-horizontal',
                'Außenabstand horizontal',
                $this->themeDefaults['swf-padding-base-horizontal'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-xs-vertical',
                'Außenabstand vertikal (Smartphone)',
                $this->themeDefaults['swf-padding-xs-vertical'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-xs-horizontal',
                'Außenabstand horizontal (Smartphone)',
                $this->themeDefaults['swf-padding-xs-horizontal'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-large-vertical',
                'Außenabstand vertikal (groß)',
                $this->themeDefaults['swf-padding-large-vertical'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-large-horizontal',
                'Außenabstand horizontal (groß)',
                $this->themeDefaults['swf-padding-large-horizontal'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-small-vertical',
                'Außenabstand vertikal (klein)',
                $this->themeDefaults['swf-padding-small-vertical'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-padding-small-horizontal',
                'Außenabstand horizontal (klein)',
                $this->themeDefaults['swf-padding-small-horizontal'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-space',
                'Allgemeiner Abstand',
                $this->themeDefaults['swf-space'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-space-mini',
                'Allgemeiner Abstand (Mini)',
                $this->themeDefaults['swf-space-mini'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-space-small',
                'Allgemeiner Abstand (Klein)',
                $this->themeDefaults['swf-space-small'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-space-large',
                'Allgemeiner Abstand (Groß)',
                $this->themeDefaults['swf-space-large'],
                $this->hiddenField
            )
        );

        return $fieldset;
    }


    private function createSliderGeneralFieldset(Form\Container\FieldSet $fieldset)
    {
        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-font-family',
                'Icon Font',
                $this->themeDefaults['swf-slick-font-family'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-slick-arrow-color',
                'Farbe Pfeil',
                $this->themeDefaults['swf-slick-arrow-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-slick-dot-color',
                'Farbe Navigationspunkt',
                $this->themeDefaults['swf-slick-dot-color'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-slick-dot-color-active',
                'Farbe Navigationspunkt (aktiv)',
                $this->themeDefaults['swf-slick-dot-color-active'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'swf-slick-dot-color-hover',
                'Farbe Navigationspunkt (hover)',
                $this->themeDefaults['swf-slick-dot-color-hover'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-prev-character',
                'Zurück-Pfeil Icon',
                $this->themeDefaults['swf-slick-prev-character'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-next-character',
                'Vor-Pfeil Icon',
                $this->themeDefaults['swf-slick-next-character'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-dot-character',
                'Navigationspunkt Icon',
                $this->themeDefaults['swf-slick-dot-character'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-dot-size',
                'Navigationspunkt Größe',
                $this->themeDefaults['swf-slick-dot-size'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-opacity-default',
                'Navigationspunkt Deckkraft',
                $this->themeDefaults['swf-slick-opacity-default'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-opacity-on-hover',
                'Navigationspunkt Deckkraft (hover)',
                $this->themeDefaults['swf-slick-opacity-on-hover'],
                $this->hiddenField
            )
        );

        $fieldset->addElement(
            $this->createTextField(
                'swf-slick-opacity-not-active',
                'Deckkraft inaktiver Slidernavigationselemente',
                $this->themeDefaults['swf-slick-opacity-not-active'],
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
                )
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
                'attributes' => $this->fieldSetDefaults
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'custom-selects',
                'Standard Select-Felder ersetzen',
                $this->themeDefaults['custom-selects'],
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
                $this->themeDefaults['pwd-show-hide'],
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
                $this->themeDefaults['pwd-strength'],
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
                $this->themeDefaults['asyncJavascriptLoading'],
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
                'attributes' => $this->fieldSetDefaults
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'fixed-navbar',
                'Menü fixieren',
                $this->themeDefaults['fixed-navbar'],
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
            $this->createSelectField(
                'mega-menu-col-width',
                'Mega-Menü: Spalten pro Zeile',
                $this->themeDefaults['mega-menu-col-width'],
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
                $this->themeDefaults['mega-menu-new-col']
            )
        );

        $fieldset->addElement(
            $this->createNumberField(
                'mega-menu-depth',
                'Menü: Tiefe des Kategoriebaums',
                $this->themeDefaults['mega-menu-depth'],
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
                $this->themeDefaults['mega-menu-category-img'],
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
                'attributes' => $this->fieldSetDefaults
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'infinite-scrolling',
                'Infinite Scrolling',
                $this->themeDefaults['infinite-scrolling'],
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
                $this->themeDefaults['infinite-threshold']
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'notify-modal-in-listing',
                'Artikelbenachrichtigung anzeigen',
                $this->themeDefaults['notify-modal-in-listing'],
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
                $this->themeDefaults['sidebarFilter'],
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
                'attributes' => $this->fieldSetDefaults
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'deactivate-zoom',
                'Zoomviewer deaktivieren ab',
                $this->themeDefaults['deactivate-zoom'],
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
                        'value' => false,
                    ),
                    array(
                        'text' => 'immer',
                        'value' => true,
                    ),
                )
            )
        );

        $fieldset->addElement(
            $this->createSelectField(
                'zoom-type',
                'Zoomviewer Typ',
                $this->themeDefaults['zoom-type'],
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
                $this->themeDefaults['zoom-shape'],
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
                $this->themeDefaults['modal-gallery'],
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
                $this->themeDefaults['modal-gallery-size'],
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
                $this->themeDefaults['ajaxVariantSwitch'],
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
                $this->themeDefaults['detailOffcanvasCart'],
                array(
                    'attributes' =>
                        array(
                            'boxLabel' =>
                                'Wenn aktiv, wird der Offcanvas Warenkorb anstelle des Modals angezeigt, wenn ein Artikel in den Warenkorb gelegt wird.',
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
                'attributes' => $this->fieldSetDefaults
            )
        );

        $fieldset->addElement(
            $this->createCheckboxField(
                'checkoutHeader',
                'Minimaler Header',
                $this->themeDefaults['checkoutHeader'],
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
                $this->themeDefaults['checkoutFooter'],
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
        $set = new ConfigSet();
        $set->setName('Standard Theme')->setDescription(
            'Aktiviert das Standard Theme'
        )->setValues(
            $this->themeDefaults
        );
        $collection->add($set);
    }

    private $themeDefaults = array(
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
            'swf-gray-darker' => 'lighten(@swf-gray-base, 13.5%)',
            'swf-gray-dark' => 'lighten(@swf-gray-base, 20%)',
            'swf-gray' => 'lighten(@swf-gray-base, 33.5%)',
            'swf-gray-light' => 'lighten(@swf-gray-base, 46.7%)',
            'swf-gray-lighter' => 'lighten(@swf-gray-base, 93.5%)',
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
            'swf-navbar-border-radius' => '@swf-border-radius-base',
            'swf-navbar-default-link-disabled-color' => '#ccc',
            'swf-navbar-default-link-disabled-bg' => 'transparent',
            'swf-navbar-default-toggle-hover-bg' => '#ddd',
            'swf-navbar-default-toggle-icon-bar-bg' => '#888',
            'swf-navbar-link-separator-color' => '@swf-navbar-default-bg',
            'swf-navbar-submenu-border-color' => '@swf-gray-lighter',
            'swf-navbar-submenu-bg-color' => '#fff',
            'swf-navbar-off-canvas-width' => '300px',
            'swf-navbar-off-canvas-indent' => '25px',
            'swf-navbar-off-canvas-bg-color' => '#fff',
            'swf-navbar-off-canvas-submenu-bg-color' => '@swf-gray-lighter',
            'swf-navbar-off-canvas-arrow-color' => '@swf-gray-light',
            'swf-navbar-off-canvas-close-icon-color' => '#fff',
            'swf-navbar-off-canvas-close-icon-color-hover' => '@swf-brand-primary',
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
            'swf-list-group-disabled-text' => '@swf-gray-light',
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
            'desktopLogo' => 'frontend/_public/src/img/logos/logo.png',
            'mobileLogo' => 'frontend/_public/src/img/logos/logo-mobile.png',
            'favicon' => 'frontend/_public/src/img/favicon.png',
            'appleTouchIcon' => 'frontend/_public/src/img/icons/apple-touch-icon.png',
            'androidLogo' => 'frontend/_public/src/img/icons/android-chrome.png',
            'body-bg-img' => '',
            'body-bg-img-repeat' => 'repeat',
            'body-bg-img-hide' => 'sm',
            // plugin config defaults
            'custom-selects' => true,
            'pwd-show-hide' => false,
            'pwd-strength' => false,
            'asyncJavascriptLoading' => true,
            'deactivate-zoom' => 'sm',
            'zoom-type' => 'lens',
            'zoom-shape' => 'square',
            'modal-gallery' => true,
            'modal-gallery-size' => 'modal-full',
            'ajaxVariantSwitch' => true,
            'detailOffcanvasCart' => true,
            'checkoutHeader' => true,
            'checkoutFooter' => true,
            'infinite-scrolling' => false,
            'infinite-threshold' => '4',
            'notify-modal-in-listing' => false,
            'sidebarFilter' => true,
            'fixed-navbar' => true,
            'mega-menu-col-width' => '3',
            'mega-menu-new-col' => '3',
            'mega-menu-depth' => '3',
            'mega-menu-category-img' => false,
            // slider config defaults
            'swf-slick-font-family' => '"FontAwesome"',
            'swf-slick-arrow-color' => '#000',
            'swf-slick-dot-color' => '#000',
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
}
