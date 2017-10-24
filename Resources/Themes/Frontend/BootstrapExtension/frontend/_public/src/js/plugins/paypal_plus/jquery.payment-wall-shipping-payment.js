(function ($, window, undefined) {

    /**
     * prevent closing of the indicator on click by overwriting the default value
     */
    var initialSetting = $.loadingIndicator.defaults.closeOnClick;
    $.subscribe('plugin/swShippingPayment/onInputChangedBefore', function () {
        $.loadingIndicator.defaults.closeOnClick = false;
    });

    /**
     * event listener which will be triggered if the customer changes their shipping or payment method
     * to call the PayPal payment wall after AJAX request
     */
    $.subscribe('plugin/swShippingPayment/onInputChanged', function (event, plugin) {
        var me = plugin,
            form = me.$el.find(me.opts.formSelector),
            data = form.serializeArray(),
            approvalUrl = me.$el.find('.pp-approval-url'),
            $paypalPlusContainer = $('#ppplus'),
            paypalPaymentId = window.parseInt($paypalPlusContainer.attr('data-paypal-payment-id'));

        // reset the default
        $.loadingIndicator.defaults.closeOnClick = initialSetting;

        if (typeof paymentWall !== 'undefined') {

            if (approvalUrl) {
                window.ppp = paymentWall($, approvalUrl.text());
            } else {
                window.ppp = paymentWall($);
            }

            var paymentId = -1;
            $.each(data, function (i, item) {
                if (item.hasOwnProperty('name') && item.name === 'payment') {
                    paymentId = window.parseInt(item.value);
                    return false;
                }
            });

            $paypalPlusContainer.find('iframe').one('load', function () {
                if (paymentId !== -1 && paymentId !== paypalPaymentId) {
                    window.ppp.deselectPaymentMethod();
                }
            });
        }
    });

    /**
     * listens to message events fired by the PayPal payment wall iFrame
     *
     * sets the current payment method to paypal if clicked in the iFrame
     */
    $(function () {
        var isClick = function () {
                return events.indexOf('loaded') == -1;
            },
            handleEvents = function () {
                var $paypalPlusContainer = $('#ppplus'),
                    paypalPaymentId = $paypalPlusContainer.attr('data-paypal-payment-id'),
                    payPalCheckBox = $("#payment_mean" + paypalPaymentId);

                if (isClick()) {
                    if (!payPalCheckBox.prop('checked')) {
                        payPalCheckBox.prop('checked', true);
                        $('*[data-ajax-shipping-payment="true"]').data('plugin_swShippingPayment').onInputChanged();
                    }
                }
                events = [];
            },
            events = [],
            timeOut;

        window.addEventListener('message', function (event) {
            var $paypalPlusContainer = $('#ppplus'),
                paypalSandbox = $paypalPlusContainer.attr('data-paypal-sandbox'),
                originUrl = paypalSandbox == 'true' ? "https://www.sandbox.paypal.com" : 'https://www.paypal.com',
                isConfirmAction = $('.is-act-confirm').length > 0;

            if (isConfirmAction) {
                return false;
            }

            if (event.origin !== originUrl) {
                return false;
            }

            if (timeOut !== undefined) {
                clearTimeout(timeOut);
            }

            var data = $.parseJSON(event.data);

            events.push(data.action);
            //wait until all events are fired
            timeOut = setTimeout(function () {
                handleEvents();
            }, 500);
        }, false);
    });
})(jQuery, window);
