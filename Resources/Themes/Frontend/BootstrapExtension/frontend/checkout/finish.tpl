{extends file="parent:frontend/checkout/finish.tpl"}

{block name='paypal_plus_main'}
    <div class="paypal-plus-finish-main mbl">

        {block name='paypal_plus_main_header'}
            <div class="finish-main-ppp-header row">
                <div class="col-4 col-lg-5 text-right ppp-header-left"><h3>{$payPalPlusInvoiceInstruction.amount_value|currency}</h3></div>
                <div class="col-4 col-lg-2 text-center ppp-header-center"><img class="" src="{link file='frontend/_public/src/img/PP_PLUS_PUI_ArrowGraphic.png'}"></div>
                <div class="col-4 col-lg-5 ppp-header-right"><img class="" src="{link file='frontend/_public/src/img/PP_PLUS_PUI_logo.png'}"/></div>
            </div>
        {/block}

        {block name='paypal_plus_main_content'}
            <div class="finish-main-content">
                {block name='paypal_plus_main_content_instructions'}
                    <div class="content-instruction">
                        <p class="instruction-paragraph text-center">
                            {s name=pleaseTransfer namespace=frontend/snippets}Please transfer{/s} {$payPalPlusInvoiceInstruction.amount_value|currency} {s name=to namespace=frontend/snippets}to{/s} {$payPalPlusInvoiceInstruction.payment_due_date|date_format: "%d.%m.%Y"} {s name=atPaypal namespace=frontend/snippets}at PayPal.{/s}
                        </p>
                    </div>
                {/block}

                {block name='paypal_plus_main_content_container'}
                    <div class="content-instruction-details row">
                        <div class="col-12 col-sm-offset-1 col-sm-10 col-lg-offset-2 col-lg-8">
                            {block name='paypal_plus_main_content_container_table'}
                                <table class="table table-striped table-responsive instruction-details-table">
                                    {block name='paypal_plus_main_content_table_receiver'}
                                        <tr class="instruction-details-receiver">
                                            <td>{s name=receiver namespace=frontend/snippets}Receiver:{/s}</td>
                                            <td class="bolder">{$payPalPlusInvoiceInstruction.account_holder_name}</td>
                                        </tr>
                                    {/block}
                                    {block name='paypal_plus_main_content_table_bank'}
                                        <tr class="instruction-details-bank">
                                            <td>{s name=bankName namespace=frontend/snippets}Bank:{/s}</td>
                                            <td class="bolder">{$payPalPlusInvoiceInstruction.bank_name}</td>
                                        </tr>
                                    {/block}
                                    {block name='paypal_plus_main_content_table_amount'}
                                        <tr class="instruction-details-amount">
                                            <td>{s name=amount namespace=frontend/snippets}Amount:{/s}</td>
                                            <td class="bolder">{$payPalPlusInvoiceInstruction.amount_value|currency}</td>
                                        </tr>
                                    {/block}
                                    {block name='paypal_plus_main_content_table_usage'}
                                        <tr class="instruction-details-usage">
                                            <td>{s name=usage namespace=frontend/snippets}Usage:{/s}</td>
                                            <td class="bolder">{$payPalPlusInvoiceInstruction.reference_number}</td>
                                        </tr>
                                    {/block}
                                    {block name='paypal_plus_main_content_table_iban'}
                                        <tr class="instruction-details-iban">
                                            <td>IBAN:</td>
                                            <td class="bolder">{$payPalPlusInvoiceInstruction.international_bank_account_number}</td>
                                        </tr>
                                    {/block}
                                    {block name='paypal_plus_main_content_table_iban'}
                                        <tr class="instruction-details-bic">
                                            <td>BIC:</td>
                                            <td class="bolder">{$payPalPlusInvoiceInstruction.bank_identifier_code}</td>
                                        </tr>
                                    {/block}
                                </table>
                            {/block}
                        </div>
                    </div>
                {/block}
            </div>
        {/block}

        {block name='paypal_plus_main_footer'}
            <div class="row">
                <div class="col-lg-offset-1 col-lg-10">
                    <div class="finish-main-ppp-footer">
                        <p class="text-center">{s name=whyPayPal namespace=frontend/snippets}Why PayPal? PayPal is our partner for processing invoice payments. PayPal has just transferred the amount to us directly. You pay the amount to PayPal according to the payment instructions after you have received and checked your purchase.{/s}</p>
                    </div>
                </div>
            </div>
        {/block}
    </div>
{/block}