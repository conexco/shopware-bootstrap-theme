$.overridePlugin('swLiveShopping', {
    /**
     * Initializes the plugin
     *
     * @returns {Plugin}
     */
    init: function () {

        var me = this,
            opts = me.opts;

        // Applies HTML data attributes to the current options
        me.applyDataAttributes();

        // get the needed elements
        me.parentDetail = me.$el.hasClass('liveshopping-details');
        me.parentListing = me.$el.hasClass('liveshopping--listing');//needs to have "--"

        me.dayElement = me.$el.find('.liveshopping-days');
        me.hourElement = me.$el.find('.liveshopping-hours');
        me.minuteElement = me.$el.find('.liveshopping-minutes');
        me.secondElement = me.$el.find('.liveshopping-seconds');

        me.elapseElement = me.$el.find('.elapse-inner');

        me.currentPriceElement = me.$el.find('.liveshopping-price');
        me.currentListingPriceElement = me.$el.find('.liveshopping-price');

        me.referenceUnitPriceElement = me.$el.find('.unit-price');
        me.referenceListingUnitPriceElement = me.$el.find('.price-unit-price');
        me.stockWrapperElement = me.$el.find('.counter-stock');

        me.bonusPointElement = $('.bonussystem-info');

        me.priceElement = me.$el.parent().find('.price-saving, .price .price-pseudo, .price-content');
        me.listingElements = me.$el.find('.liveshopping-price');

        // Initially hide the bonus point element
        // Will be shown again once the ajax request returned the current price
        if (me.bonusPointElement.length && me.parentDetail) {
            me.bonusPointElement.fadeOut('fast');
        }

        // create time runner
        var date = new Date(),
            newDate = (date.getTime() / 1000) - 1;

        me.timeRunner = new window.timeRunner(newDate, me.timerCallback, me);

        me.afterInit();
    },

    /**
     * Plugin function to refresh the live shopping data on detail page.
     *
     * This function is used for "discount/surcharge per minute" live shopping
     * articles. It sends an ajax request to the data url which is placed
     * in a hidden input field within the live shopping container.
     *
     * @returns {boolean}
     */
    refreshDetailData: function(options) {
        var me = this;

        $.ajax({
            url: me.opts.dataUrl,
            dataType: "json",
            type: 'GET',
            success: function(record, success) {
                if (record.success == false) {
                    me.shutdown();
                    return;
                }

                me.$el.show();
                me.priceElement.hide();

                me.currentPriceElement.fadeOut('fast');

                me.currentPriceElement.html(
                    me.formatCurrency(record.data.currentPrice) + ' ' + me.opts.star
                );

                me.updateBonusPoints(record.data.currentPrice);

                window.setTimeout(function() {
                    me.currentPriceElement.fadeIn('slow');
                }, 150);

                me.referenceUnitPriceElement.html(
                    me.formatCurrency(record.data.referenceUnitPrice)
                );

                me.stockWrapperElement.find('.stock-quantity-number').text(
                    record.data.quantity
                );
            }
        });

        return true;
    },

    /**
     * Helper function to set the bonus points depending on the current live shopping price
     *
     * @param currentPrice
     */
    updateBonusPoints: function(currentPrice) {
        var me = this;

        if (!me.bonusPointElement.length) {
            return;
        }

        // Get the bonus system conversion factor
        var bonusConversionFactor =  $('.ctl_detail #bonus_point_conversion_factor').val();

        // Set a new value for points per unit
        $('.ctl_detail #earning_points_per_unit').val(currentPrice/bonusConversionFactor);
        // Force recalculation of bonus points
        $('.ctl_detail #sQuantity').trigger('change');

        // Fade In the element
        me.bonusPointElement.fadeIn('slow');
    }
});