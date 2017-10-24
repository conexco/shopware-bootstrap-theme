{block name="frontend_checkout_payment_paypalplus_checkoutonly"}
    <script type="text/javascript">
        var asyncConf = ~~("{$theme.asyncJavascriptLoading}");
        if (typeof document.asyncReady === 'function' && asyncConf) {
            document.asyncReady(function() {
                window.jQuery_SW = $.noConflict(true);
            });
        } else {
            window.jQuery_SW = $.noConflict(true);
        }
    </script>
    <script src="https://www.paypalobjects.com/webstatic/ppplus/ppplus.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var paymentWallFn = function() {
            window.jQuery = $ = window.jQuery_SW;
            $(document).ready(function($) {
                var $agb = $('#sAGB'),
                    urlForSendingCustomerData = '{url controller=checkout action=preRedirect forceSecure}',
                    urlForSendingCustomerDataError = '{url controller=payment_paypal action=return forceSecure}',
                    customerCommentField = $(".user-comment-hidden"),

                    onConfirm = function(event) {
                        if ($agb && $agb.length > 0 && !$agb.prop('checked')) {
                            return;
                        }

                        event.preventDefault();

                        $.ajax({
                            type: "POST",
                            url: urlForSendingCustomerData,
                            data: { sComment: customerCommentField.val() },
                            success: function() {
                                PAYPAL.apps.PPP.doCheckout();
                            },
                            error: function() {
                                $(location).attr('href', urlForSendingCustomerDataError);
                            }
                        });
                    };

                $('#confirm--form').on('submit', onConfirm);
            });
        };

        var asyncConf = ~~("{$theme.asyncJavascriptLoading}");
        if (typeof document.asyncReady === 'function' && asyncConf) {
            document.asyncReady(paymentWallFn);
        } else {
            paymentWallFn();
        }

    </script>
{/block}
