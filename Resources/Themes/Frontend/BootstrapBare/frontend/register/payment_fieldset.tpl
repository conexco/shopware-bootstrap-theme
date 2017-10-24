{block name="frontend_register_payment"}
    <fieldset class="register--payment sw5-plugin">{* heidelpay compatibility *}
        {block name="frontend_register_payment_headline"}
            <legend>
                {if isset($fieldset_title) && !empty($fieldset_title)}
                    {$fieldset_title}
                {else}
                    {s name='RegisterPersonalMarketingHeadline'}{/s}
                {/if}
            </legend>
        {/block}
        {block name="frontend_register_payment_fieldset"}
            {foreach from=$payment_means item=payment_mean name=register_payment_mean}
                {block name="frontend_register_payment_method"}
                    
                    <div class="payment--method payment-method sw5-plugin">{* heidelpay compatibility *}
                        {block name='frontend_register_payment_fieldset_input'}
                            <div class="radio payment-selection-input sw5-plugin">
                                {block name="frontend_register_payment_fieldset_input_label"}
                                    <label for="payment_mean{$payment_mean.id}">
                                        {block name='frontend_register_payment_fieldset_input_radio'}
                                            <input type="radio" name="register[payment]" value="{$payment_mean.id}" id="payment_mean{$payment_mean.id}"{if $payment_mean.id eq $form_data.payment or (!$form_data && !$smarty.foreach.register_payment_mean.index)} checked="checked"{/if} />
                                        {/block}
                                        {block name="frontend_register_payment_fieldset_input_label_text"}
                                            {$payment_mean.description}
                                        {/block}
                                    </label>
                                {/block}
                            </div>
                        {/block}

                        {block name='frontend_register_payment_fieldset_description'}
                            <span class="help-block">
                                {include file="string:{$payment_mean.additionaldescription}"}
                            </span>
                        {/block}

                        {block name='frontend_register_payment_fieldset_template'}
                            {if "frontend/plugins/payment/`$payment_mean.template`"|template_exists}
                                <div class="payment-content sw5-plugin{if $payment_mean.id != $form_data.payment} hidden{/if}">
                                    {include file="frontend/plugins/payment/`$payment_mean.template`" checked = ($payment_mean.id == $form_data.payment)}
                                </div>
                            {/if}
                        {/block}
                    </div>
                {/block}
            {/foreach}
        {/block}
    </fieldset>
{/block}
