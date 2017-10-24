$.overridePlugin('swAboCommerce', {
    defaults: {
        /**
         * The selector for the radio, that has to be clicked to change the delivery-type to "single delivery".
         */
        singleDeliveryRadioSelector: '.abo-single-delivery-input',

        /**
         * Opposite of the radio mentioned above.
         * The selector of the radio that has to be clicked to change the delivery-type to "abo delivery".
         */
        aboDeliveryRadioSelector: '.abo-delivery-input',

        /**
         * Selector for a button which opens the abo-information on click.
         */
        openAboInfoSelector: '.abo-delivery-info-icon',

        /**
         * Selector for the label to be clicked for the price-info to be displayed.
         */
        openAboDiscountLabel: '.abo-discount-label',

        /**
         * Selectors of the delivery-, duration- and quantity-select-fields.
         */
        selectFieldSelector: 'select.abo-duration-interval, select.abo-delivery-interval, select.abo-quantity-select',

        /**
         * Selector of the container, that contains all the important abo-commerce data as a JSON-string.
         */
        aboCommerceDataSelector:  '.abo-commerce-data',

        /**
         * Selector of the container, which contains the various delivery-selects
         */
        deliveryContainerSelector: '.abo-delivery-interval-container',

        /**
         * Selector for the delivery-information container
         */
        aboDeliveryInfoSelector: '.product-buybox .abo-info-wrapper'
    },

    /**
     * Method to register all needed events
     */
    registerEvents: function () {
        var me = this,
            $body = $('body');

        $body.on(me.getEventName('click'), me.opts.singleDeliveryRadioSelector, $.proxy(me.onSingleDeliveryClick, me));
        $body.on(me.getEventName('click'), me.opts.aboDeliveryRadioSelector, $.proxy(me.onDeliveryClick, me));
        $body.on(me.getEventName('change'), me.opts.selectFieldSelector, $.proxy(me.onChangeAboSelects, me));

        // register popover
        $(me.opts.openAboInfoSelector).popoverWrapper({
            html: true,
            content: function() {
                return $('.abo-price-separation-popup').html();
            }
        });
        $body.on('shown.bs.popover', me.opts.openAboInfoSelector, $.proxy(me.onOpenAboInfo, me));
    },

    /**
     * This event is triggered once the user changes either the delivery-interval- or the duration-interval-selection
     * @param event
     */
    onChangeAboSelects: function (event) {
        var me = this,
            $el = $(event.target),
            // need the delivery interval
            deliveryInterval = parseFloat($('select.abo-delivery-interval').val()),

            $durationInterval = $('select.abo-duration-interval'),
            // need the duration interval
            durationInterval = parseFloat($durationInterval.val()),
            $quantity = $el.parents('.product-buybox').find('#sQuantity'),
            // need the article quantity
            quantity = parseFloat($quantity.val()),
            deliveryTextValue,
            durationTextValue;

        // when delivery interval is changed
        if ($el.hasClass('abo-delivery-interval')) {
            var options = me.getOptions(deliveryInterval),
                durationInterval = options['minPossibleDuration'];

            quantity = me.changeQuantity($quantity, $el);

            // set the select values
            $durationInterval.html(options['durations']);

            //update selectBoxIt
            var durationIntervalSelectBox = $durationInterval.data("selectBox-selectBoxIt");
            if (durationIntervalSelectBox) {
                durationIntervalSelectBox.refresh();
            }
        }

        // Set the new values into the hidden fields
        $('input[name=sDeliveryInterval]').val(deliveryInterval);
        $('input[name=sDurationInterval]').val(durationInterval);

        //Refresh the price and the percentage
        me.refreshPriceDisplay(durationInterval);

        // calculate values for delivery duration text
        durationTextValue = ( durationInterval / deliveryInterval ) + 1;
        deliveryTextValue = durationTextValue * quantity;

        // change the display
        $('.abo-info .abo-info-delivery').html(deliveryTextValue);
        $('.abo-info .abo-info-duration').html(durationTextValue);

        $.publish('plugin/swAboCommerce/onChangeAboSelects');
    },

    /**
     * This event is triggered when the user wants to open the additional information about the abo-prices
     * @param event
     */
    onOpenAboInfo: function (event) {
        $.publish('plugin/swAboCommerce/onOpenAboInfo');
    },

    /**
     * This event is triggered when the user clicks on the "Single delivery"-radio
     */
    onSingleDeliveryClick: function () {
        var me = this;
        //Hide the abo-comboboxes
        me.$deliveryIntervalContainer.addClass('hidden');
        me.$productBuybox.addClass('hidden');

        $('.abo-hidden-values').attr('disabled', true);

        $.publish('plugin/swAboCommerce/onSingleDeliveryClick');
    },

    /**
     * This event is triggered when the user clicks on the "Abo"-radio
     */
    onDeliveryClick: function () {
        var me = this;

        //Show the abo-comboboxes
        me.$deliveryIntervalContainer.removeClass('hidden');
        me.$productBuybox.removeClass('hidden');

        me.setDurationOptions();

        $('.abo-hidden-values').attr('disabled', false);

        $.publish('plugin/swAboCommerce/onDeliveryClick');
    },

    /**
     * Helper method to initially fix the duration-options
     */
    refreshDurationOptions: function () {
        $('select.abo-delivery-interval').change();
    },

    /**
     * Refreshes the price and the percent discount display
     * in the abo commerce component.
     *
     * @param {integer} duration - Selected abo duration
     * @return void
     */
    refreshPriceDisplay: function (duration) {
        var me = this,
            price = me.getPrice(duration),
            discountPrice = price.discountPrice;

        if (typeof price === 'undefined') {
            return;
        }

        var percent = price.discountPercentage;

        $('.abo-pseudo-price')[(percent > 0) ? 'removeClass' : 'addClass']('hidden');

        $('.abo-percentage-container span.percent').html(me.numberFormat(percent, 2, ',', '.'));
        $('.delivery-price').html(me.formatPrice(discountPrice));
    },

    /**
     * Helper method to create the options of a select-box dynamically
     * @param deliveryInterval
     * @returns {string}
     */
    getOptions: function (deliveryInterval) {
        var me = this,
            durations = '',
            $intervalUnit = $('.abo-commerce-delivery-interval-unit span'),
            minPossibleDuration,
            i= me.aboData.minDuration;

        for (i; i < me.aboData.maxDuration + 1; i++) {

            // when the variable i modulo delivery interval is not zero, continue
            if (i % deliveryInterval) {
                continue;
            }

            if (i >= me.aboData.minDuration && !minPossibleDuration) {
                minPossibleDuration = i;
            }

            durations += '<option value=' + i + '>' + i + $intervalUnit.html() + '</option>';
        }
        $.publish('plugin/aboCommerce/onGetOptions');
        return { 'durations': durations, 'minPossibleDuration': minPossibleDuration };
    },

    /**
     * Helper method to trigger the "onDeliveryClick"-method when the radio is already selected on page-load (e.g. browser cache)
     */
    checkForRadio: function () {
        var me = this;
        if($('.abo-delivery-input').is(':checked')) {
            me.onDeliveryClick();
        }
    },

    /**
     * Determines the price for the selected duration
     *
     * @param {integer} duration - User selected duration (optional)
     * @param {Object} aboData - Contains all information about the abo
     * @return {Object} - terminated price array
     * @private
     */
    getPrice: function (duration) {
        var me = this, prices = me.aboData.prices, result = prices[0], blockPrice = 0;
        duration = duration || $('input[name=sDurationInterval]').val();
        duration = (1 * duration);

        // Loop through the price array to determine the price
        // or percent discount
        for (var i in prices) {
            var tmpPrice = prices[i];
            tmpPrice.duration = (1 * tmpPrice.duration);

            if (duration >= tmpPrice.duration) {
                result = tmpPrice;
            }
        }

        // Check if we're dealing with block prices
        if (me._blockPrices && me._blockPrices.length) {
            var quantitiy = (1 * $('.abo-delivery .sQuantity :selected').val());

            for (var j in me._blockPrices) {
                var tmpBlockPrice = me._blockPrices[j];

                if (quantitiy >= (1 * tmpBlockPrice.from)) {
                    blockPrice = tmpBlockPrice;
                }
            }
            result.discountPrice = me.toFixed(blockPrice.price) - result.discountAbsolute;
            result.blockPrice = me.toFixed(blockPrice.price);
        }
        return result;
    },

    /**
     * Private helper method which will convert a {number}
     * into a formatted price.
     *
     * @private
     * @param {Number} price - The price which needs to be formatted
     * @param {String} template - The template which should be used (optional)
     * @return {String}
     */
    formatPrice: function (price, template) {
        var me = this,
            newPrice;

        template = template || $('.abo-price-template-data').html();

        if (!price) {
            return false;
        }
        newPrice = Math.round(price * 100) / 100;
        if (isNaN(newPrice)) {
            newPrice = Math.round(me.toFixed(price) * 100) / 100;
        }
        newPrice = newPrice.toFixed(2);

        // we replace the price
        if (-1 != template.search('0,00')) {
            newPrice = template.replace('0,00', newPrice);
        } else {
            newPrice = template.replace('0.00', newPrice);
        }
        newPrice = newPrice.replace('.', ',');

        return newPrice;
    },

    /**
     * Helper method to set the options of the select-box dynamically
     */
    setDurationOptions: function () {
        var me = this,
            container = $('.abo-delivery-interval-container'),
            deliverySelect = container.find('select.abo-delivery-interval'),
            durationSelect = container.find('select.abo-duration-interval');

        var durations = me.getOptions(deliverySelect.find('option:selected').val());
        durationSelect.html(durations['durations']);

        //update selectBoxIt
        var deliverySelectBox = deliverySelect.data("selectBox-selectBoxIt");
        if (deliverySelectBox) {
            deliverySelectBox.refresh();
        }
    }
});

$(document).ready(function (){
    // destroy old swAboCommerce Js Plugin and call it again with overriden functions
    var oldAboPlugin = $('body').data('plugin_swAboCommerce');
    if (oldAboPlugin) {
        oldAboPlugin.destroy();
        $('body').swAboCommerce();
    }
});