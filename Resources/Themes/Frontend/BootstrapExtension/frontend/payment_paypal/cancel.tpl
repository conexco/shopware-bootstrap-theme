{extends file='parent:frontend/payment_paypal/cancel.tpl'}

{* Main content *}
{block name='frontend_index_content'}
    {$cancelMessage = "{s name='PaypalCancelMessage'}{/s}"}
    {include file="frontend/_includes/messages.tpl" type="info" content="{$cancelMessage}"}

    <a class="btn btn-secondary"
       href="{url controller=checkout action=cart}"
       title="{s name='PaypalLinkChangeCart'}{/s}">
        {s name='PaypalLinkChangeCart'}{/s}
    </a>
    <a class="btn btn-primary"
       href="{url controller=account action=payment sTarget=checkout sChange=1}"
       title="{s name='PaypalLinkChangePaymentMethod'}{/s}">
        {s name='PaypalLinkChangePaymentMethod'}{/s}
    </a>
{/block}