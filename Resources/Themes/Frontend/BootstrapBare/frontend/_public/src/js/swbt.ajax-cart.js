;(function ($) {
    "use strict";

    var $document = $(document);

    $.plugin('ajaxCart', {
        defaults: {
            contentWrapperSelector: '.popover-content, .off-canvas',
            deleteBtnSelector: '.delete-article',
            quantitySelectSelector: '.change-quantity'
        },

        init: function () {
            var me = this;

            me.applyDataAttributes();
            me.registerEvents();

            $.publish('plugin/modifyAjaxCart/onInit', [ me ]);
        },

        registerEvents: function () {
            var me = this;

            $document.on('click', me.opts.deleteBtnSelector, $.proxy(me.deleteAction, me));
            $document.on('change', me.opts.quantitySelectSelector, $.proxy(me.changeQuantityAction, me));

            // refresh popover
            $.subscribe(me.getEventName('plugin/swAddArticle/onAddArticle'), $.proxy(me.resetAjaxCartPlugin, me));
        },

        resetAjaxCartPlugin: function(plugin, me) {
            var me = this,
                $offcanvas = me.$el.data('plugin_swOffcanvasMenu'),
                $popover = me.$el.data('plugin_popoverWrapper');

            if ($popover) {
                $popover.destroy();
                StateManager.addPlugin('[data-ajax-cart="true"]', 'popoverWrapper', (typeof swfAjaxCartPopoverViewports != 'undefined' ? swfAjaxCartPopoverViewports : ['m', 'l', 'xl']));
            }

            if ($offcanvas) {
                $offcanvas.ajaxOffcanvasLoaded = false;
            }
        },

        deleteAction: function (event) {
            event.preventDefault();

            var me = this,
                $currentTarget = $(event.currentTarget),
                $content = $currentTarget.closest(me.opts.contentWrapperSelector),
                $form = $currentTarget.closest('form'),
                url = $form.attr('action');

            if (!$content || !url) {
                return;
            }

            $content.loader('show');

            $.publish('plugin/modifyAjaxCart/onDeleteAction', [ me, $content ]);

            $.ajax({
                type: 'GET',
                url: safeUrl(url),
                success: function () {
                    cartRefresh();
                    me.reloadAction($content);

                    // needed for IE11
                    picturefill();

                    $.publish('plugin/modifyAjaxCart/onDeleteActionAfterAjax', [ me, $content ]);
                }
            });
        },

        changeQuantityAction: function (event) {
            var me = this,
                $select = $(event.target),
                $content = $select.closest(me.opts.contentWrapperSelector);

            $content.loader('show');

            $.publish('plugin/modifyAjaxCart/onchangeQuantityAction', [ me, $content ]);

            $.ajax({
                type: 'POST',
                url: safeUrl(controller.checkout) + '/changeQuantity',
                data: $select.closest('form').serialize(),
                success: function () {
                    cartRefresh();
                    me.reloadAction($content);

                    // needed for IE11
                    picturefill();

                    $.publish('plugin/modifyAjaxCart/onchangeQuantityActionAfterAjax', [ me, $content ]);
                }
            });
        },

        reloadAction: function ($content) {
            var me = this;
            $.ajax({
                type: 'GET',
                url: safeUrl(controller.ajax_cart),
                success: function (data) {
                    var popoverData = me.$el.data('bs.popover');
                    if (popoverData) {
                        popoverData.options.content = data;
                    }

                    $content.html(data);

                    // needed for IE11
                    picturefill();

                    $content.initScrollpaneSelectboxit();
                    $content.find('.slick').slickWrapper();
                    $content.find('[data-equalheight="true"]:not([data-mode="ajax"]):visible').equalHeight();
                    $content.find('[data-free-goods-promotion="true"]').swfPromotionHandleFreeGoods();

                    $.publish('plugin/modifyAjaxCart/onReloadActionAfterAjax', [ me, $content ]);
                }
            });
        },

        destroy: function () {
            this._destroy();
        }
    });
}(jQuery));