/**
 * Extended Shopware Ajax Variant plugin
 */
$.overridePlugin('swAjaxVariant', {
    defaults: {
        productDetailsSelector: '.product-detail-upper',
        configuratorFormSelector: '.configurator-form',
        orderNumberSelector: '.entry-sku',
        historyIdentifier: 'sw-ajax-variants',
        productDetailsDescriptionSelector: '.tab-content-description',
        footerJavascriptInlineSelector: '#footer-js-inline'
    },

    /**
     * Initializes the plugin and sets up the necessary event handler
     */
    init: function() {
        var me = this,
            ie;

        me.applyDataAttributes();

        // Detecting IE version using feature detection (IE7+, browsers prior to IE7 are detected as 7)
        ie = (function (){
            if (window.ActiveXObject === undefined) return null;
            if (!document.querySelector) return 7;
            if (!document.addEventListener) return 8;
            if (!window.atob) return 9;
            if (!document.__proto__) return 10;
            return 11;
        })();

        if (ie && ie <= 9) {
            me.hasHistorySupport = false;
        }

        me.$el
            .on(me.getEventName('click'), '*[data-ajax-variants="true"]', $.proxy(me.onChange, me))
            .on(me.getEventName('change'), '*[data-ajax-select-variants="true"]', $.proxy(me.onChange, me))
            .on(me.getEventName('click'), '.reset--configuration', $.proxy(me.onChange, me));

        $(window).on("popstate", $.proxy(me.onPopState, me));

        if(me.hasHistorySupport) {
            me.publishInitialState();
        }
    },

    /**
     * Requests the HTML structure of the product detail page using AJAX and injects the returned
     * content into the page.
     *
     * @param {Object} values
     * @param {Boolean} pushState
     */
    requestData: function(values, pushState) {
        var me = this,
            stateObj = me._createHistoryStateObject();

        $('body').loader('show');

        $.publish('plugin/swAjaxVariant/onBeforeRequestData', [ me, values, location ]);

        values.template = 'ajax';

        if(stateObj.params.hasOwnProperty('c')) {
            values.c = stateObj.params.c;
        }

        $.ajax({
            url: stateObj.location,
            data: values,
            method: 'GET',
            success: function(response) {
                var $response = $($.parseHTML(response, document, true)),
                    $productDetailsOriginal = $(me.opts.productDetailsSelector),
                    $productDetails,
                    $productDescription,
                    orderNumber;

                $productDetails = $response.find(me.opts.productDetailsSelector);

                $productDetailsOriginal.html($productDetails.html());

                // Replace the description box
                $productDescription = $response.find(me.opts.productDetailsDescriptionSelector);
                $(me.opts.productDetailsDescriptionSelector).html($productDescription.html());

                // Get the ordernumber for the url
                ordernumber = $.trim(me.$el.find(me.opts.orderNumberSelector).text());

                // Update global variables
                window.controller = window.snippets = window.themeConfig = window.lastSeenProductsConfig = window.csrfConfig = null;
                $(me.opts.footerJavascriptInlineSelector).replaceWith($response.filter(me.opts.footerJavascriptInlineSelector));

                StateManager
                    .addPlugin('*[data-image-zoom="true"]', 'imageZoom')
                    .addPlugin('*[data-add-article="true"]', 'swAddArticle');

                picturefill();

                $productDetailsOriginal.find('.slick').slickWrapper();

                if (swfCustomSelects)
                    $productDetailsOriginal.find('select').selectBoxIt(swfCustomSelectOptions);

                // call move elements helper
                applyMoveHelper();

                // Plugin developers should subscribe to this event to update their plugins accordingly
                $.publish('plugin/swAjaxVariant/onRequestData', [ me, response, values, stateObj.location ]);

                if(pushState && me.hasHistorySupport) {

                    var location = stateObj.location + '?number=' + ordernumber;

                    if(stateObj.params.hasOwnProperty('c')) {
                        location += '&c=' + stateObj.params.c;
                    }

                    window.history.pushState(stateObj.state, stateObj.title, location);
                }

                // Image Modal / Image Modal Gallery
                StateManager.addPlugin('a[data-toggle="img-modal"], [data-toggle="img-modal"] a', 'imgModal')

            },
            complete: function() {
                $('body').loader('hide');
            }
        });
    },

    /**
     * Event handler which will fired when the user selects a variant in the storefront.
     * @param {EventObject} event
     */
    onChange: function(event) {
        var me = this,
            $target = $(event.target),
            $form = $target.parents('form'),
            values = {},
            skuAvailable = true;

        $.each($form.serializeArray(), function(i, item) {
            if (item.name === '__csrf_token') {
                return;
            }

            values[item.name] = item.value;
        });

        event.preventDefault();

        if (!me.hasHistorySupport) {
            $('body').loader('show');
            $form.submit();

            return false;
        }

        $.publish('plugin/swAjaxVariant/onChange', [ me, values, $target ]);

        if ($('.entry-sku').length == 0)
            skuAvailable = false;

        me.requestData(values, skuAvailable);
    }
});