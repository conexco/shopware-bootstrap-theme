{* fallback *}
{if !$FormLabelSize}
    {$FormLabelSize='col-md-4'}
{/if}
{if !$FormInputSize}
    {$FormInputSize='col-md-6'}
{/if}
<div class="form-group{if $error_flags.sDebitAccount} has-error{/if}">
    <label class="{$FormLabelSize} control-label" for="kontonr">{s name='PaymentDebitLabelAccount'}{/s}</label>

    <div class="{$FormInputSize}">
        <input name="sDebitAccount" class="form-control is-required" type="text" id="kontonr" value="{$form_data.sDebitAccount|escape}" aria-required="true"{if $payment_mean.id == $form_data.payment} required="required" aria-required="true"{/if}/>
    </div>
</div>
<div class="form-group{if $error_flags.sDebitBankcode} has-error{/if}">
    <label class="{$FormLabelSize} control-label" for="blz">{s name='PaymentDebitLabelBankcode'}{/s}</label>

    <div class="{$FormInputSize}">
        <input name="sDebitBankcode" class="form-control is-required" type="text" id="blz" value="{$form_data.sDebitBankcode|escape}" aria-required="true"{if $payment_mean.id == $form_data.payment} required="required" aria-required="true"{/if}/>
    </div>
</div>
<div class="form-group{if $error_flags.sDebitBankName} has-error{/if}">
    <label class="{$FormLabelSize} control-label" for="bank">{s name='PaymentDebitLabelBankname'}{/s}</label>

    <div class="{$FormInputSize}">
        <input name="sDebitBankName" class="form-control is-required" type="text" id="bank" value="{$form_data.sDebitBankName|escape}" aria-required="true"{if $payment_mean.id == $form_data.payment} required="required" aria-required="true"{/if}/>
    </div>
</div>
<div class="form-group{if $error_flags.sDebitBankHolder} has-error{/if}">
    <label class="{$FormLabelSize} control-label" for="bank2">{s name='PaymentDebitLabelName'}{/s}</label>

    <div class="{$FormInputSize}">
        <input name="sDebitBankHolder" class="form-control is-required" type="text" id="bank2" value="{$form_data.sDebitBankHolder|escape}" aria-required="true"{if $payment_mean.id == $form_data.payment} required="required" aria-required="true"{/if}/>
    </div>
</div>
<span class="help-block">{s name='PaymentDebitInfoFields'}{/s}</span>