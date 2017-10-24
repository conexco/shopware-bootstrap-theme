;(function ($, window, document, undefined) {
    'use strict';

    // private vars
    var $body = $('body'),
        $document = $(document);

    $.overridePlugin('swQuickView', {

        defaults: {
            ajaxUrl: '',
            productSelector: '[data-ordernumber]',
            detailBtnSelector: '',
            productNumberAttribute: 'data-ordernumber',
            productLinkSelector: '.product-box a, .banner-mapping-link',
            quickViewCls: 'quick-view-custom',
            viewCls: 'quick-view-content',
            activeCls: 'is-active',
            mainViewState: 'main',
            prevViewState: 'prev',
            nextViewState: 'next',
            configuratorFormSelector: '.configurator-form',
            variantSelectBoxSelector: '*[data-ajax-select-variants="true"]',
            resetConfigurationButtonSelector: '.reset--configuration',
            quickViewImageSliderSelector: '.slick',
            buyButtonFormSelector: '*[data-add-article="true"]',
            compareButtonSelector: '*[data-compare-ajax="true"]',
            noScrollCls: 'no-scroll',
            // custom
            modalCls: 'quick-view-modal'
        },

        init: function () {
            var me = this;

            me.applyDataAttributes();
            
            if (me.opts.ajaxUrl.length < 1) {
                return;
            }

            me.$quickView = $('<div>', { 'class': me.opts.quickViewCls });
            me.viewSelector = '.' + me.opts.viewCls;

            me.trackProducts();

            me.$quickView.appendTo($body);
            me.registerEvents();
        },

        initImageSlider: function () {
            var me = this;

            me.$modal.find(me.opts.quickViewImageSliderSelector).slickWrapper();
        },

        initWishList: function() {
            var me = this;

            me.$modal.swAjaxWishlist();
        },

        registerEvents: function () {
            var me = this;

            $.subscribe(me.getEventName('plugin/slickWrapper/onLoadItemsSuccess'), $.proxy(me.trackProducts, me));
            $.subscribe(me.getEventName('plugin/swInfiniteScrolling/onFetchNewPageFinished'), $.proxy(me.trackProducts, me));
            $.subscribe(me.getEventName('plugin/swListingActions/onGetFilterResultFinished'), $.proxy(me.trackProducts, me));
            $.subscribe(me.getEventName('plugin/swLastSeenProducts/onCreateProductList'), $.proxy(me.trackProducts, me));

            me.$el.on(me.getEventName('click'), me.opts.productLinkSelector, $.proxy(me.onProductLink, me));

            me._on($document, 'keydown', $.proxy(me.onKeyPress, me));

            me.$quickView.on(me.getEventName('click'), '[data-view="'+me.opts.nextViewState+'"]',  $.proxy(me.showNext, me));
            me.$quickView.on(me.getEventName('click'), '[data-view="'+me.opts.prevViewState+'"]',  $.proxy(me.showPrev, me));
        },

        trackProducts: function() {
            var me = this;

            me.$quickView.empty();

            if (me.opts.detailBtnSelector && me.opts.detailBtnSelector.length) {
                me.$products = me.$el.find(me.opts.productSelector + ' ' + me.opts.detailBtnSelector).parents(me.opts.productSelector);
                // parents() collects the elements in reverse order, so we have to bring them back into the right order
                me.$products = $(me.$products.get().reverse());
            } else {
                me.$products = me.$el.find(me.opts.productSelector);
            }

            me.products = {};
            me.activeProduct = false;

            $.each(me.$products, function(index, el) {
                if (!$(el).is(me.opts.productSelector)) {
                    return;
                }

                var $el = $(el),
                    $view = $('<div>'),
                    number = $el.attr(me.opts.productNumberAttribute);

                $view.addClass(me.opts.viewCls)
                     .addClass('view-' + index)
                     .addClass('product-' + number)
                     .appendTo(me.$quickView);

                me.products[index] = {
                    '$el': $el,
                    '$view': $view,
                    'index': index,
                    'number': number,
                    'loaded': false
                };
            });

            $.publish('plugin/swQuickview/onTrackProducts', [ me ]);
        },

        loadProduct: function(index, withoutConfiguration, isVariant) {
            var me = this;

            isVariant = isVariant || false;

            if (me.products[index] === undefined) {
                return;
            }

            var product = me.products[index],
                orderNumber = product.number,
                values = { sOrderNumber: orderNumber };

            if (!withoutConfiguration) {
                values = $.extend(values, me.getConfiguratorFormValues(product.$view));
            }
            
            if (isVariant) {
                // set height, if a variant changes, to prevent size changing
                product.$view.height(product.$view.height());
            }    

            me.resetProductView(product.$view);

            $.publish('plugin/swQuickview/onBeforeRequestData', [me, values]);

            $('body').loader('show');

            $.ajax({
                url: me.opts.ajaxUrl,
                data: values,
                method: 'GET',
                success: function (response) {
                    if (!response.length) {
                        me.hideQuickView();
                        return;
                    }

                    product.loaded = true;

                    // Display only one modal backdrop
                    var noBackdrop = {};
                    if ($('.modal-backdrop.in').length)
                        noBackdrop = {backdrop:false};

                    // Open modal
                    me.$modal = product.$view.showModal(response, me.opts.modalCls+orderNumber, function() {
                        $('body').loader('hide');
                    }, noBackdrop);

                    // Remove modal toggles to prevent additional modals from opening
                    me.$modal.find('[data-toggle="img-modal"], [data-toggle="ajax-modal"]').attr('data-toggle', '');
                    
                    // Register bootstrap modal hide event and call hidequickview function
                    me.$modal.off('hidden.bs.modal');
                    me.$modal.on('hidden.bs.modal', $.proxy(me.hideQuickView, me));

                    me.updatePluginsAndEvents(product.$view, index);

                    $.publish('plugin/swQuickview/onProductLoaded', [me, product.$view, response, values]);
                }
            });

            $.publish('plugin/swQuickview/onLoadProduct', [ me ]);
        },

        resetProductView: function($productView) {
            var me = this;

            $productView
                .off(me.getEventName('change'), me.opts.variantSelectBoxSelector)
                .off(me.getEventName('click'), me.opts.resetConfigurationButtonSelector);

            $.publish('plugin/swQuickview/onResetProductView', [me, $productView]);
        },

        updatePluginsAndEvents: function($productView, quickViewIndex) {
            var me = this;

            window.StateManager.updatePlugin(me.opts.buyButtonFormSelector, 'swAddArticle');
            window.StateManager.updatePlugin(me.opts.compareButtonSelector, 'swProductCompareAdd');

            me.initImageSlider();
            me.initWishList();

            $productView
                .on(me.getEventName('change'), me.opts.variantSelectBoxSelector, $.proxy(me.onVariantChange, me, quickViewIndex, false))
                .on(me.getEventName('click'), me.opts.resetConfigurationButtonSelector, $.proxy(me.onVariantChange, me, quickViewIndex, true));

            $.publish('plugin/swQuickview/onUpdatePluginsAndEvents', [me, $productView, quickViewIndex]);
        },

        showQuickView: function($product) {
            if (!$product.is(this.opts.productSelector)) {
                return;
            }

            var me = this,
                index = me.$products.index($product),
                product = me.products[index];

            $('html').addClass(me.opts.noScrollCls);

            me.superclass.showQuickView.apply(this, arguments);

            if (product.loaded) {
                $('.'+me.opts.modalCls+$product.data('ordernumber')).modal('show');
            }

            $.publish('plugin/swQuickview/onShowQuickViewAfterOverride', [me]);
        },

        hideQuickView: function(event) {
            var me = this;

            event.preventDefault();

            me.$quickView.removeClass(me.opts.activeCls);

            $('html').removeClass(me.opts.noScrollCls);

            $.each(me.products, function(index, product) {
                // Hide all modals
                product.$view.find('.modal').modal('hide');
                product.$view.clearView();
            });

            me.activeProduct = false;

            $.publish('plugin/swQuickview/onHideQuickView', [ me ]);
        },

        showNext: function() {
            var me = this,
                product = me.products[me.activeProduct],
                index = product.index,
                nextIndex = index + 1;

            me.superclass.showNext.apply(this, arguments);

            if (me.products[nextIndex].loaded) {
                $('.'+me.opts.modalCls+$(me.products[nextIndex]).data('ordernumber')).modal('show');
            }
            
            $.publish('plugin/swQuickview/onShowNextAfterOverride', [me]);
        },

        showPrev: function() {
            var me = this,
                product = me.products[me.activeProduct],
                index = product.index,
                prevIndex = index - 1;

            me.superclass.showPrev.apply(this, arguments);    

            if (me.products[prevIndex].loaded) {
                $('.'+me.opts.modalCls+$(me.products[prevIndex]).data('ordernumber')).modal('show');
            }

            $.publish('plugin/swQuickview/onShowPrevAfterOverride', [ me ]);
        }
    });
})(jQuery, window, document);
