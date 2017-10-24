;(function ($, undefined) {

    $(function () {
        StateManager.addPlugin('[data-free-goods-promotion="true"]', 'swfPromotionHandleFreeGoods');
    });

    $.plugin('swfPromotionHandleFreeGoods', {

        defaults: { 
            variantSelectSelector: '.free-good-select',
            variantBtnSelector: '.free-good-add'
        },

        init: function () {
            var me = this;

            me.registerEvents();
        },

        registerEvents: function () {
            var me = this;

            me._on(me.opts.variantSelectSelector, 'change', $.proxy(me.setBtnStatus, me));
        },

        setBtnStatus: function (e) {
            var me = this,
                $select = $(e.currentTarget),
                $form = $select.closest('form'),
                $btn = $form.find(me.opts.variantBtnSelector);
 
            if ($select.val()) {
                $btn.prop('disabled', false);
            } else {
                $btn.prop('disabled', true);
            }    

            $.publish('plugin/swfPromotionHandleFreeGoods/onSetBtnStatus', me);
        }

    });

    $.plugin('swfPromotionHandleFreeGoodsCart', {

        defaults: {
            addToCartBtnSelector: '.free-goods-product-button',
            sliderContainerSelector: '.free-goods-product-slider-container',
            productInnerSelector: '.product-inner',
            popoverOffcanvasSelector: '.popover-content, .off-canvas'
        },

        init: function() {
            var me = this;

            me.applyDataAttributes();
            me.registerEvents();
        },

        registerEvents: function() {
            var me = this;

            $(document).delegate(me.opts.addToCartBtnSelector, 'click', $.proxy(me.callAjax, me));

            // popover
            me.$el.on('inserted.bs.popover', $.proxy(me.initSlider, me));
            $.subscribe('plugin/modifyAjaxCart/onReloadActionAfterAjax', $.proxy(me.initSlider, me));

            // offcanvas
            $.subscribe('plugin/swOffcanvasMenu/onOpenMenuAfterAjax', $.proxy(me.initSlider, me));
        },

        initSlider: function() {
            var me = this,
                popoverPlugin = me.$el.data('bs.popover'),
                offcanvasPlugin = me.$el.data('plugin_swOffcanvasMenu'),
                $cart;
            if (popoverPlugin) {
                $cart = popoverPlugin.tip();
            } else if (offcanvasPlugin) {
                $cart = offcanvasPlugin.$offCanvas;
            }

            $.publish('plugin/swfPromotionHandleFreeGoodsCart/beforeInitSlider', [me]);

            $cart.find(me.opts.sliderContainerSelector).slickWrapper();

            $cart.find('select').selectBoxIt (
                $.extend({}, swfCustomSelectOptions, {
                    viewport: $cart.find(me.opts.productInnerSelector)
                })
            );
        },

        callAjax: function (e) {
            var me = this,
                $btn = $(e.currentTarget),
                url = $btn.attr('data-url'),
                name = '[name=' + $btn.attr('data-name') + ']',
                data = { 
                    orderNumber: $('select' + name).val() || $('input' + name).val(),
                    promotionId: $btn.attr('data-promotionId') 
                },
                ajaxCart = me.$el.data('plugin_ajaxCart');

            if (!url || data.orderNumber == '') {
                return;
            }

            $btn.loader('show');

            $.ajax({
                type: 'post',
                url: url,
                data: data
            }).done(function (result) {
                var data = $.parseJSON(result);
                if (data.success == true) {
                    ajaxCart.reloadAction($btn.parents(me.opts.popoverOffcanvasSelector));
                }
            });
        }
    });

})(jQuery);