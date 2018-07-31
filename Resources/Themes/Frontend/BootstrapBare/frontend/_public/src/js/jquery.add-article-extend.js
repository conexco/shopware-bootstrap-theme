;(function($, window) {
    'use strict';

    /**
     * Customized Shopware Add Article Plugin
     *
     * @example Button Element (can be pretty much every element)
     *
     * HTML:
     *
     * <button data-add-article="true" data-addArticleUrl="{url controller='checkout' action='addArticle' sAdd=$sArticle.ordernumber}">
     *     Jetzt bestellen
     * </button>
     *
     * @example Form
     *
     * HTML:
     *
     * <form data-add-article="true" data-eventName="submit">
     *     <input type="hidden" name="sAdd" value="SW10165"> // Contains the ordernumber of the article
     *     <input type="hidden" name="sQuantity" value"10"> // Optional (Default: 1). Contains the amount of articles to be added (Can also be an select box)
     *
     *     <button>In den Warenkorb</button>
     * </form>
     *
     *
     * You can either add an article by giving a specific url to the property "addArticleUrl" (First example)
     * or you can add hidden input fields to the element with name "sAdd" and "sQuantity" (Second example).
     *
     * JS:
     *
     * $('*[data-add-article="true"]').swAddArticle();
     *
     */
    $.plugin('swAddArticle', {

        defaults: {
            /**
             * Event name that the plugin listens to.
             *
             * @type {String}
             */
            'eventName': 'click',

            /**
             * The ajax url that the request should be send to.
             *
             * Default: myShop.com/(Controller:)checkout/(Action:)addArticle
             *
             * @type {String}
             */
            'addArticleUrl': controller['ajax_add_article'],

            /**
             * Whether or not the modal box should be shown.
             *
             * @type {Boolean}
             */
            'showModal': true,

            /**
             * Selector for the slider in the add article modal box.
             *
             * @type {String}
             */
            'sliderSelector': '.modal .cross-seller-slider',

            /* custom */
            'displayMode': 'modal',
            'triggerElSelector': '[data-ajax-cart="true"]',
            'hiddenCls': 'd-none'
        },

        /**
         * Default plugin initialisation function.
         * Registers an event listener on the change event.
         * When it's triggered, the parent form will be submitted.
         *
         * @public
         * @method init
         */
        init: function () {
            var me = this,
                opts = me.opts;

            // Applies HTML data attributes to the current options
            me.applyDataAttributes();

            opts.showModal = !!opts.showModal && opts.showModal !== 'false';

            // Will be automatically removed when destroy() is called.
            me._on(me.$el, opts.eventName, $.proxy(me.sendSerializedForm, me));

            StateManager.addPlugin(opts.sliderSelector, 'slickWrapper');

            me._$triggerEl = $(opts.triggerElSelector);
        },

        /**
         * Gets called when the element was triggered by the given event name.
         * Serializes the plugin element and sends it to the given url.
         * When the ajax request was successful, the slickWrapper will be called.
         *
         * @public
         * @event sendSerializedForm
         * @param {jQuery.Event} event
         */
        sendSerializedForm: function (event) {
            event.preventDefault();

            var me = this,
                opts = me.opts,
                $el = me.$el,
                ajaxData = $el.closest('form').serialize();

            ajaxData += '&isXHR=1';

            if (opts.showModal) {
                $('body').loader('show');
            } else {
                if (me.$el.is('button')) {
                    me.$el.loader('show');
                } else {
                    me.$el.find('button').loader('show');
                }
            }

            $.publish('plugin/' + me.getName() + '/onBeforeAddArticle', [ me, ajaxData ]);
            // fallback
            $.publish('plugin/addArticleModal/onBeforeAddArticle', [ me, ajaxData ]);

            $.ajax({
                'data': ajaxData,
                'method': 'POST',
                'dataType': 'jsonp',
                'url': opts.addArticleUrl,
                'success': function (result) {
                    $.publish('plugin/' + me.getName() + '/onAddArticle', [ me, result ]);
                    // fallback
                    $.publish('plugin/addArticleModal/onAddArticle', [ me, result ]);

                    var plugin = me._$triggerEl.data('plugin_swOffcanvasMenu');
                    if (me.opts.displayMode == 'offcanvas' && plugin) {  // show offcanvas cart

                        plugin.$offCanvas.html(result);
                        plugin.$offCanvas.find('.alert, .alerts').removeClass(me.opts.hiddenCls);

                        // event needs to be unsubscribed first or otherwise it would be subscribed multiple times
                        $.unsubscribe('plugin/swOffcanvasMenu/onCloseMenu.swAddArticle');
                        $.subscribe('plugin/swOffcanvasMenu/onCloseMenu.swAddArticle', function(event, plugin) {
                            plugin.$offCanvas.find('.alert, .alerts').addClass(me.opts.hiddenCls);
                        });

                        $.unsubscribe('plugin/swOffcanvasMenu/onOpenMenu.swAddArticle');
                        $.subscribe('plugin/swOffcanvasMenu/onOpenMenu.swAddArticle', function(event, plugin) {
                            plugin.$offCanvas.find('.slick').slickWrapper();
                            plugin.$offCanvas.find('[data-equalheight="true"]:not([data-mode="ajax"]):visible').equalHeight();
                        });

                        plugin.ajaxOffcanvasLoaded = true;
                        plugin.openMenu();

                        plugin.$offCanvas.swSelectboxReplacement();
                    }

                    if (opts.showModal) {    // show add article modal
                        $('body').showModal(result, 'add-article-modal', function() {
                            $('body').loader('hide');
                            picturefill();
                            StateManager.updatePlugin(opts.sliderSelector, 'slickWrapper');
                        });
                    } else {    // show button loader
                        if (me.$el.is('button')) {
                            me.$el.loader('hide');
                        } else {
                            me.$el.find('button').loader('hide');
                        }
                    }
                }
            });
        }
    });
})(jQuery, window);
