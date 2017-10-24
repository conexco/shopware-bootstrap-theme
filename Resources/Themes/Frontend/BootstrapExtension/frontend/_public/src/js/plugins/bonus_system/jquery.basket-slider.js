$.overridePlugin('swBonusSlider', {
    /**
     * Helper method to slide the conversion-container equally to the slider-handle. Uses the built-in link-library of the no-ui-slider
     */
    linkContainer: function () {
        var me = this,
            slider = me.$el,
            sliderContainer = $('.bonus-basket-slider'),
            points = $( "#bonus-voucher-points"),
            valueContainer = $( "#bonus-voucher-value");

        slider.Link('lower').to('-inline-<div class="bonussystem-conversion-container"></div>', function (value) {
            var newValue = value / sliderContainer.find('#bonus-conversion-factor').val(),
                curr = sliderContainer.find('#currency_display').val();

            curr = me.stringReplace("0.00" , newValue.toFixed(2), curr);
            curr = me.stringReplace("0,00" , me.stringReplace('.', ',', newValue.toFixed(2)), curr);

            points.val(value);
            valueContainer.val(newValue.toFixed(2));

            var $sliderHandle = $(this).parent();
            if ($sliderHandle.data('bs.tooltip')) {
                $sliderHandle.data('bs.tooltip').options.title = value + ' P / ' + curr;
            } else {
                $sliderHandle.tooltip({
                    'toggle': 'tooltip',
                    'placement': 'top',
                    'trigger': 'hover',
                    'title': value + ' P / ' + curr
                });
            }
        });
    }
});