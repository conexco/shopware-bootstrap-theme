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

            // delete btn and quantity select selector
            me.actionBtnSelector = me.opts.quantitySelectSelector + ' .form-control, ' + me.opts.deleteBtnSelector;

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

            // disable delete btn and quantity select before ajax call  
            $content.find(me.actionBtnSelector).attr('disabled', 'disabled');

            $.publish('plugin/modifyAjaxCart/onDeleteAction', [ me, $content ]);

            $.ajax({
                type: 'POST',
                dataType: 'html',
                url: safeUrl(url),
                success: function (data) {

                    me.reloadAction($content, data);

                    $.publish('plugin/modifyAjaxCart/onDeleteActionAfterAjax', [ me, $content ]);
                }
            });
        },

        changeQuantityAction: function (event) {
            var me = this,
                $select = $(event.target),
                $content = $select.closest(me.opts.contentWrapperSelector),
                $form = $select.closest('form'),
                formData = $form.serialize(),
                url = $form.attr('action');

            if (!$content || !url) {
                return;
            }

            // disable delete btn and quantity select before ajax call  
            $content.find(me.actionBtnSelector).attr('disabled', 'disabled');

            $.publish('plugin/modifyAjaxCart/onchangeQuantityAction', [ me, $content ]);

            $.ajax({
                type: 'POST',
                url: safeUrl(url),
                dataType: 'html',
                data: formData,
                success: function (data) {

                    me.reloadAction($content, data);

                    $.publish('plugin/modifyAjaxCart/onchangeQuantityActionAfterAjax', [ me, $content ]);
                }
            });
        },

        reloadAction: function ($content, data) {
            var me = this;

            // init cart refresh
            cartRefresh();

            var popoverData = me.$el.data('bs.popover');
            if (popoverData) {
                popoverData.options.content = data;
            }

            $content.html(data);

            // needed for IE11
            picturefill();

            $content.swSelectboxReplacement();
            $content.find('.slick').slickWrapper();
            $content.find('[data-equalheight="true"]:not([data-mode="ajax"]):visible').equalHeight();

            $.publish('plugin/modifyAjaxCart/onReloadActionAfterAjax', [ me, $content ]);
        },

        destroy: function () {
            this._destroy();
        }
    });
}(jQuery));