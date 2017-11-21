{extends file='frontend/account/index.tpl'}

{*! Breadcrumb *}
{block name='frontend_index_start'}
	{$sBreadcrumb[] = ['name'=>"{s name='ChangePaymentTitle'}{/s}", 'link'=>{url}]}
	{$sActiveAction = 'payment'}
{/block}

{*! Main content *}
{block name='frontend_index_content'}
    <div class="account-change-payment" data-register="true">

        {* Payment headline *}
        {block name="frontend_account_payment_headline"}
            <h1>{s name='PaymentHeadline'}{/s}</h1>
        {/block}

        {block name="frontend_account_payment_content"}
            {*! Error messages *}
            {block name="frontend_account_error_messages"}
                {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
            {/block}

            {* Payment form *}
            {block name="frontend_account_payment_form"}
                <form name="frmRegister" method="post" action="{url action=savePayment sTarget=$sTarget}" class="form-horizontal">
                    {* Payment fieldset *}
                    {block name="frontend_account_payment_form_content"}
                        {include file='frontend/register/payment_fieldset.tpl' form_data=$sFormData error_flags=$sErrorFlag payment_means=$sPaymentMeans}
                    {/block}
                    {* Payment actions *}
                    {block name="frontend_account_payment_action_buttons"}
                        <div class="{$FormLabelOffset}">
                            {block name="frontend_account_payment_action_button_send"}
                                <button type="submit" class="btn btn-primary mbl">{s name='PaymentLinkSend'}{/s}</button>
                            {/block}
                            {block name="frontend_account_payment_action_button_back"}
                                {if $sTarget}
                                    <a class="btn btn-default mbl" href="{url controller=$sTarget}" title="{s name='PaymentLinkBack'}{/s}">
                                        {s name="PaymentLinkBack"}{/s}
                                    </a>
                                {/if}
                            {/block}
                        </div>
                    {/block}
                </form>
            {/block}
        {/block}
    </div>
{/block}