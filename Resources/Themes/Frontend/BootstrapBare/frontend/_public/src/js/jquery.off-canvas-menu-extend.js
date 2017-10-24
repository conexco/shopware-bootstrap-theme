/**
 * Extended Shopware Off canvas menu plugin
 */
$.overridePlugin('swOffcanvasMenu', {
    defaults: {
        'moveWrapper': false,
        'offCanvasSelector': '.sidebar-main',
        'closeButtonSelector': '.close-off-canvas',
        'direction': 'fromLeft',
        'offCanvasElementCls': 'off-canvas',
        'leftMenuCls': 'is-left',
        'rightMenuCls': 'is-right',
        'activeMenuCls': 'is-active',
        'openClass': 'is-open',
        'fullscreen': false,
        'fullscreenCls': 'is-full-screen',
        'disableTransitions': false,
        'disableTransitionCls': 'no-transitions',
        'mode': 'local',
        'ajaxURL': ''
    },

    /**
     * Opens the off-canvas menu based on the direction.
     * Also closes all other off-canvas menus.
     *
     * @public
     * @method openMenu
     */
    openMenu: function () {
        var me = this,
            opts = me.opts,
            menuWidth = me.$offCanvas.outerWidth();

        if (me.isOpened) {
            return;
        }
        me.isOpened = true;

        $.publish('plugin/swOffcanvasMenu/onBeforeOpenMenu', [ me ]);

        $('html').addClass('no-scroll');

        $.overlay.open({
            onClose: $.proxy(me.closeMenu, me)
        });

        if (opts.moveWrapper) {
            if (opts.direction === 'fromRight') {
                menuWidth *= -1;
            }

            me.$pageWrap.css('left', menuWidth);
        }

        me.$offCanvas.addClass(opts.openClass);
        $.publish('plugin/swOffcanvasMenu/onOpenMenu', [ me ]);

        if (opts.mode === 'ajax' && opts.ajaxURL && !me.ajaxOffcanvasLoaded) {
            me.$offCanvas.html('');
            me.$offCanvas.loader('show');
            $.ajax({
                url: safeUrl(opts.ajaxURL),
                success: function (result) {
                    me.$offCanvas.html(result);

                    // needed for IE11
                    picturefill();

                    // insert new content before initScrollpaneSelectboxit function call
                    $.publish('plugin/swOffcanvasMenu/onOpenMenuAjax', [ me ]);

                    me.$offCanvas.initScrollpaneSelectboxit();

                    me.$offCanvas.find('.slick').slickWrapper();
                    me.$offCanvas.find('[data-equalheight="true"]:not([data-mode="ajax"]):visible').equalHeight();
                    me.$offCanvas.find('[data-free-goods-promotion="true"]').swfPromotionHandleFreeGoods();

                    me.ajaxOffcanvasLoaded = true;

                    $.publish('plugin/swOffcanvasMenu/onOpenMenuAfterAjax', [ me ]);
                }
            });
        }
    },

    /**
     * Closes the menu and slides the content wrapper
     * back to the normal position.
     *
     * @public
     * @method closeMenu
     */
    closeMenu: function () {
        var me = this,
            opts = me.opts;

        if (!me.isOpened) {
            return;
        }
        me.isOpened = false;

        $.overlay.close();

        // Disable scrolling on body
        $('html').removeClass('no-scroll');

        if (opts.moveWrapper) {
            me.$pageWrap.css('left', 0);
        }

        me.$offCanvas.removeClass(opts.openClass);

        $.publish('plugin/swOffcanvasMenu/onCloseMenu', [ me ]);
    }
});