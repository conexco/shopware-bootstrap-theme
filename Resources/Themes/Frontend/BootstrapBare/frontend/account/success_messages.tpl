{if $sSuccessAction}
    {if $sSuccessAction == 'address'}
        {include file="frontend/_includes/messages.tpl" type="success" content="{s name='AccountAddressSuccess'}{/s}"}
    {elseif $sSuccessAction == 'payment'}
        {include file="frontend/_includes/messages.tpl" type="success" content="{s name='AccountPaymentSuccess'}{/s}"}
    {elseif $sSuccessAction == 'account'}
        {include file="frontend/_includes/messages.tpl" type="success" content="{s name='AccountAccountSuccess'}{/s}"}
    {elseif $sSuccessAction == 'newsletter'}
        {include file="frontend/_includes/messages.tpl" type="success" content="{s name='AccountNewsletterSuccess'}{/s}"}
    {elseif $sSuccessAction == 'optinnewsletter'}
        {include file="frontend/_includes/messages.tpl" type="success" content="{s namespace='frontend' name='sMailConfirmation'}{/s}"}
    {elseif $sSuccessAction == 'deletenewsletter'}
        {include file="frontend/_includes/messages.tpl" type="success" content="{s namespace='frontend/account/internalMessages' name='NewsletterMailDeleted'}{/s}"}
    {elseif $sSuccessAction == 'resetPassword'}
        {include file="frontend/_includes/messages.tpl" type="success" content="{s name='PasswordResetNewSuccess' namespace='frontend/account/reset_password'}{/s}"}
    {else}
        {include file="frontend/_includes/messages.tpl" type="success" content="{s name='AccountUnknownFallback'}Es ist ein unbekannter Fehler aufgetreten - bitte kontaktieren Sie den Support{/s}"}
    {/if}
{/if}
