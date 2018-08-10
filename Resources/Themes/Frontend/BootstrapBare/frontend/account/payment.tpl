{extends file='frontend/account/index.tpl'}

{*! Breadcrumb *}
{block name='frontend_index_start'}
	{$sBreadcrumb[] = ['name'=>"{s name='ChangePaymentTitle'}{/s}", 'link'=>{url}]}
	{$sActiveAction = 'payment'}
{/block}

{*! Main content *}
{block name='frontend_index_content'}
    <div class="card account-change-payment mb-4" data-register="true">

        {* Payment headline *}
        {block name="frontend_account_payment_headline"}
            <h2 class="card-header bg-transparent h3">{s name='PaymentHeadline'}{/s}</h2>
        {/block}

        {block name="frontend_account_payment_content"}
            <div class="card-body">
                {*! Error messages *}
                {block name="frontend_account_error_messages"}
                    {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
                {/block}

                {* Payment form *}
                {block name="frontend_account_payment_form"}
                    <form name="frmRegister" method="post" action="{url action=savePayment sTarget=$sTarget}">
                        {* Payment fieldset *}
                        <div class="mb-3">
                        {block name="frontend_account_payment_form_content"}
                            {include file='frontend/register/payment_fieldset.tpl' form_data=$sFormData error_flags=$sErrorFlag payment_means=$sPaymentMeans}
                        {/block}
                        </div>

                        {* Payment actions *}
                        {block name="frontend_account_payment_action_buttons"}
                            {block name="frontend_account_payment_action_button_send"}
                                <button type="submit" class="btn btn-primary mb-2">{s name='PaymentLinkSend'}{/s}</button>
                            {/block}
                            {block name="frontend_account_payment_action_button_back"}
                                {if $sTarget}
                                    <a class="btn btn-outline-secondary mb-2" href="{url controller=$sTarget}" title="{s name='PaymentLinkBack'}{/s}">
                                        {s name="PaymentLinkBack"}{/s}
                                    </a>
                                {/if}
                            {/block}
                        {/block}
                    </form>
                {/block}
            </div>
        {/block}
    </div>
{/block}