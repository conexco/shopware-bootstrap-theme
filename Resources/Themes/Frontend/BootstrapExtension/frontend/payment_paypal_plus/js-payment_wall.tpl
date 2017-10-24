{block name="frontend_checkout_payment_paypalplus_paymentwall"}
    {$PayPalPlusContinue = "{s name='PaypalPlusLinkChangePayment'}Weiter{/s}"}
    <script type="text/javascript">
        var asyncConf = ~~("{$theme.asyncJavascriptLoading}");
        if (typeof document.asyncReady === 'function' && asyncConf) {
            document.asyncReady(function () {
                window.jQuery_SW = $.noConflict(true);
            });
        } else {
            window.jQuery_SW = $.noConflict(true);
        }
    </script>
    <script src="https://www.paypalobjects.com/webstatic/ppplus/ppplus.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var paymentWall,
            deselectPayPalMethod;

        var paymentWallFn = function () {
            window.jQuery = $ = window.jQuery_SW;
            window.paypalIsCurrentPaymentMethodPaypal = {if $sUserData.additional.payment.id == $PayPalPaymentId}true{else}false{/if};

            paymentWall = function ($, approvalUrl) {
                var $basketButton = $('#basketButton'),
                    bbFunction = 'val',
                    $agb = $('#sAGB'),
                    ppp,
                    preSelection = 'none',
                    $payPalCheckBox = $("#payment_mean" + {$PayPalPaymentId}),
                    isConfirmAction = $('.is-act-confirm').length > 0,
                    urlForSendingCustomerData = '{url controller=checkout action=preRedirect forceSecure}',
                    urlForSendingCustomerDataError = '{url controller=payment_paypal action=return forceSecure}',
                    customerCommentField = $(".user-comment-hidden"),

                    onConfirm = function (event) {
                        if (!window.paypalIsCurrentPaymentMethodPaypal || ($agb && $agb.length > 0 && !$agb.prop('checked'))) {
                            return;
                        }

                        event.preventDefault();

                        $.ajax({
                            type: "POST",
                            url: urlForSendingCustomerData,
                            data: { sComment: customerCommentField.val() },
                            success: function () {
                                ppp.doCheckout();
                            },
                            error: function () {
                                $(location).attr('href', urlForSendingCustomerDataError);
                            }
                        });
                    };

                approvalUrl = approvalUrl || "{$PaypalPlusApprovalUrl|escape:javascript}";

                if (!$basketButton[0]) {
                    $basketButton = $('.confirm-form-submit button[type=submit]');
                    bbFunction = 'html';
                }

                $basketButton.data('orgValue', $basketButton[bbFunction]());

                $('#confirmForm').on('submit', onConfirm);
                $basketButton.on('click', onConfirm);

                if (!$('#ppplus').length) {
                    return;
                }

                if ($payPalCheckBox.length > 0 && $payPalCheckBox.prop('checked')) {
                    preSelection = 'paypal';
                } else if (isConfirmAction && window.paypalIsCurrentPaymentMethodPaypal) {
                    preSelection = 'paypal'
                }

                ppp = PAYPAL.apps.PPP({
                    approvalUrl: approvalUrl,
                    placeholder: "ppplus",
                    mode: "{if $PaypalPlusModeSandbox}sandbox{else}live{/if}",
                    buttonLocation: "outside",
                    useraction: "commit",
                    country: '{$sUserData.additional.country.countryiso}',
                    {if $PaypalLocale == 'de_DE' || $PaypalLocale == 'de_AT'}
                    {$PaypalPlusLang = 'DE_de'}
                    {elseif $PaypalLocale == 'en_US' || $PaypalLocale == 'en_GB'}
                    {$PaypalPlusLang = 'US_en'}
                    {else}
                    {$PaypalPlusLang = $PaypalLocale}
                    {/if}
                    language: '{$PaypalPlusLang}',
                    preselection: preSelection,
                    showPuiOnSandbox: true,
                    showLoadingIndicator: true
                });

                return ppp;
            };

            deselectPayPalMethod = function ($) {
                var callback = function (event) {
                    var $paypalPlusContainer = $('#ppplus'),
                        paypalSandbox = $paypalPlusContainer.attr('data-paypal-sandbox'),
                        originUrl = paypalSandbox == 'true' ? "https://www.sandbox.paypal.com" : 'https://www.paypal.com',
                        data;

                    if (event.origin !== originUrl) {
                        return;
                    }

                    data = $.parseJSON(event.data);

                    if (data.action !== 'loaded') {
                        return;
                    }

                    if (!window.paypalIsCurrentPaymentMethodPaypal) {
                        window.ppp.deselectPaymentMethod();
                    }

                    window.removeEventListener('message', callback, false);
                };

                window.addEventListener('message', callback, false);
            };

            window.ppp = paymentWall($);
            deselectPayPalMethod($);
        };

        var asyncConf = ~~("{$theme.asyncJavascriptLoading}");
        if (typeof document.asyncReady === 'function' && asyncConf) {
            document.asyncReady(paymentWallFn);
        } else {
            paymentWallFn();
        }
    </script>
{/block}
