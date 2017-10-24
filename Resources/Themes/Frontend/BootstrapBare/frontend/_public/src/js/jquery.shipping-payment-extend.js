/**
 * Extended Shopware ShippingPayment Plugin
 */
$.overridePlugin('swShippingPayment', {

    defaults: {
        formSelector: '#shippingPaymentForm',
        radioSelector: 'input.auto_submit[type=radio]',
        submitSelector: 'input[type=submit]',
        outerFormSubmitSelector: '#shippingPaymentFormButton' 
    },

    /**
     * Called on change event of the radio fields.
     */
    onInputChanged: function () {
        var me = this,
            form = me.$el.find(me.opts.formSelector),
            url = form.attr('action'),
            data = form.serialize() + '&isXHR=1';

        $.publish('plugin/swShippingPayment/onInputChangedBefore', me);

        $('body').loader('show');

        $.ajax({
            type: 'POST',
            url: safeUrl(url),
            data: data,
            success: function(res) {
                me.$el.empty().html(res);
                me.$el.find('input[type="submit"][form], button[form]').swFormPolyfill();

                $('body').loader('hide');

                $.publish('plugin/swShippingPayment/onInputChanged', me);
            }
        })
    }
});
