{block name='frontend_checkout_payment_headline'}
    <h2>{s namespace='frontend/checkout/shipping_payment' name='ChangePaymentTitle'}{/s}</h2>
{/block}

{block name='frontend_checkout_payment_content'}
    <div class="payment--method-list sw5-plugin">{* heidelpay compatibility *}
        {foreach $sPayments as $payment_mean}
            <div class="payment-method payment--method sw5-plugin">{* heidelpay compatibility *}
                {* Method Name *}
                {block name='frontend_checkout_payment_fieldset_input_label'}
                    <div class="radio">
                        <label for="payment_mean{$payment_mean.id}">
                            {* Radio Button *}
                            {block name='frontend_checkout_payment_fieldset_input_radio'}
                                <input type="radio" name="payment" class="auto_submit" value="{$payment_mean.id}" id="payment_mean{$payment_mean.id}"{if $payment_mean.id eq $sFormData.payment or (!$sFormData && !$smarty.foreach.register_payment_mean.index)} checked="checked"{/if} />
                            {/block}
                            {$payment_mean.description}
                        </label>
                    </div>
                {/block}

                {* Method Description *}
                {block name='frontend_checkout_payment_fieldset_description'}
                    <span class="help-block">
                        {include file="string:{$payment_mean.additionaldescription}"}
                    </span>
                {/block}

                {* Method Logo *}
                {block name='frontend_checkout_payment_fieldset_template'}
                    {if "frontend/plugins/payment/`$payment_mean.template`"|template_exists}
                        <div class="method-bankdata{if $payment_mean.id != $form_data.payment} hidden{/if} form-horizontal">
                            {include file="frontend/plugins/payment/`$payment_mean.template`" form_data=$sFormData error_flags=$sErrorFlag payment_means=$sPayments}
                        </div>
                    {/if}
                {/block}
            </div>
        {/foreach}
    </div>    
{/block}
