{if $PaypalShowButton}
    <div class="col-xs-12 text-right mtm paypal-express">
        {* PayPal express button *}
        <a href="{url controller=payment_paypal action=express}"
           title="{s name='PaypalButtonLinkTitleText'}{/s}"
           class="paypal-express-btn">
            {if !$PaypalLocale || $PaypalLocale == 'de_DE'}
                <img srcset="{link file='frontend/_public/src/img/paypal-button-express-de.png'}, {link file='frontend/_public/src/img/paypal-button-express-de-2x.png'} 2x"
                     alt="{s name='PaypalButtonAltText'}{/s}">
            {elseif $PaypalLocale|strpos:"en" !== false}
                <img src="{link file='frontend/_public/src/img/paypal-button-express-en.png'}"
                     alt="{s name='PaypalButtonAltText'}{/s}">
            {else}
                <img src="https://www.paypal.com/{$PaypalLocale}/i/btn/btn_xpressCheckout.gif"
                     alt="{s name='PaypalButtonAltText'}{/s}">
            {/if}
        </a>
    </div>
{/if}