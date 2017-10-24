{* fallback *}
{if !$FormLabelSize}
    {$FormLabelSize='col-md-4'}
{/if}
{if !$FormInputSize}
    {$FormInputSize='col-md-6'}
{/if}
<div class="form-group{if $error_flags.sSepaIban} has-error{/if}">
    <label class="{$FormLabelSize} control-label" for="iban">{s name='PaymentSepaLabelIban' namespace="frontend/plugins/payment/sepa"}{/s}*:</label>

    <div class="{$FormInputSize}">
        <input class="form-control is-required" name="sSepaIban" type="text" id="iban"
               value="{if $form_data.sSepaIban}{$form_data.sSepaIban|escape}{elseif $form_data.paymentData}{$form_data.paymentData->getIban()|escape}{/if}"
               {if $payment_mean.id == $form_data.payment}required="required" aria-required="true"{/if} />
    </div>
</div>
{if {config name=sepaShowBic}}
    <div class="form-group{if $error_flags.sSepaBic} has-error{/if}">
        <label class="{$FormLabelSize} control-label" for="bic">{s name='PaymentSepaLabelBic' namespace="frontend/plugins/payment/sepa"}{/s}{if {config name=sepaRequireBic}}*{/if}:</label>

        <div class="{$FormInputSize}">
            <input class="form-control{if {config name=sepaRequireBic}} is-required{/if}" name="sSepaBic" type="text" id="bic"
                   value="{if $form_data.sSepaBic}{$form_data.sSepaBic|escape}{elseif $form_data.paymentData}{$form_data.paymentData->getBic()|escape}{/if}"
                    {if $payment_mean.id == $form_data.payment && {config name=sepaRequireBic}}required="required" aria-required="true"{/if} />
        </div>
    </div>
{/if}
{if {config name=sepaShowBankName}}
    <div class="form-group{if $error_flags.sSepaBankName} has-error{/if}">
        <label class="{$FormLabelSize} control-label" for="bank">{s name='PaymentSepaLabelBankName' namespace="frontend/plugins/payment/sepa"}{/s}{if {config name=sepaRequireBankName}}*{/if}
            :</label>

        <div class="{$FormInputSize}">
            <input class="form-control{if {config name=sepaRequireBankName}} is-required{/if}" name="sSepaBankName" type="text" id="bank"
                   value="{if $form_data.sSepaBankName}{$form_data.sSepaBankName|escape}{elseif $form_data.paymentData}{$form_data.paymentData->getBankName()|escape}{/if}"
                    {if $payment_mean.id == $form_data.payment && {config name=sepaRequireBic}}required="required" aria-required="true"{/if} />
        </div>
    </div>
{/if}
{if {config name=sepaSendEmail}}
    <div class="form-group{if $error_flags.sSepaBankHolder} has-error{/if}">
        <div class="col-sm-offset-4 col-sm-10">
            <div class="checkbox">
                <label for="usebilling">
                    <input name="sSepaUseBillingData" type="checkbox" id="usebilling" value="true"
                            {if $form_data.sSepaUseBillingData === 'true' || !($form_data.paymentData || $form_data.isPost) || (!$form_data.isPost && $form_data.paymentData && $form_data.paymentData->getUseBillingData())}
                                checked="checked"
                            {/if}
                    />
                    {s name='PaymentSepaLabelUseBillingData' namespace="frontend/plugins/payment/sepa"}{/s}
                </label>
            </div>
        </div>
    </div>
{/if}

<span class="help-block">{s name='PaymentSepaInfoFields' namespace="frontend/plugins/payment/sepa"}{/s}</span>