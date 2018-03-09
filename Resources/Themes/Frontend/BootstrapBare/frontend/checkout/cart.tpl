{extends file='frontend/index/index.tpl'}

{block name="gridconfig"}
    {assign "grid" "g010" scope="global"}
    {$smarty.block.parent}
{/block}

{* Title *}
{block name='frontend_index_header_title'}
    {s name="CartTitle"}{/s} | {{config name=shopName}|escapeHtml}
{/block}

{* Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}

{* Empty Sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Main content *}
{block name='frontend_index_content'}

    {* If articles are in the basket... *}
    {if $sBasket.content}

        {* Add article informations *}
        {block name='frontend_checkout_add_article'}
            <noscript>
                {include file='frontend/checkout/added.tpl'}
            </noscript>
        {/block}

        {* Product table *}
        {block name='frontend_checkout_cart_table'}

            {* Error messages *}
            {block name='frontend_checkout_cart_error_messages'}
                {include file="frontend/checkout/error_messages.tpl"}
            {/block}

            {* Deliveryfree dispatch notification *}
            {block name='frontend_checkout_cart_deliveryfree'}
                {if $sShippingcostsDifference}
                    {$shippingDifferenceContent="<strong>{s name='CartInfoFreeShipping'}{/s}</strong> {s name='CartInfoFreeShippingDifference'}{/s}"}
                    {include file="frontend/_includes/messages.tpl" type="warning" content=$shippingDifferenceContent}
                {/if}
            {/block}

            {* Action Buttons Top *}
            {block name='frontend_checkout_cart_table_actions_wrapper'}
                <div class="row">
                    {block name='frontend_checkout_cart_table_actions'}
                        {include file="frontend/checkout/actions.tpl"}
                    {/block}
                </div>
                <hr>
            {/block}

            {* Product table content *}
            {block name='frontend_checkout_cart_panel'}
                {* Product table header *}
                {block name='frontend_checkout_cart_cart_head'}
                    {include file="frontend/checkout/cart_header.tpl"}
                {/block}

                {* Basket items *}
                {foreach $sBasket.content as $sBasketItem}
                    {block name='frontend_checkout_cart_item'}
                        {include file='frontend/checkout/cart_item.tpl'}
                    {/block}
                {/foreach}

                {* Product table footer *}
                {block name='frontend_checkout_cart_cart_footer'}
                    {include file="frontend/checkout/cart_footer.tpl"}
                    <hr class="hidden-xs hidden-sm">
                {/block}
            {/block}

            {* Action Buttons Bottom *}
            {block name='frontend_checkout_cart_table_actions_bottom_wrapper'}
                <div class="row mbl">
                    {block name='frontend_checkout_cart_table_actions_bottom'}
                        {include file="frontend/checkout/actions.tpl" bottom=true}
                    {/block}
                </div>
            {/block}

            {* Premium products *}
            {block name='frontend_checkout_cart_premium'}
                {* Actual listing *}
                {block name='frontend_checkout_cart_premium_products'}
                    {include file='frontend/checkout/premiums.tpl'}
                {/block}
            {/block}
        {/block}
    {else}
        {* Empty basket *}
        {block name='frontend_basket_basket_is_empty'}
            <div class="text-center">
                {include file="frontend/_includes/messages.tpl" type="info" content="{s name='CartInfoEmpty'}{/s}"}
            </div>
            <a class="btn btn-block btn-primary" href="{url controller='index'}" title="{s name='CartEmptyIndexLink'}Zur Startseite{/s}">
                {s name='CartEmptyIndexLink'}{/s}
            </a>
        {/block}
    {/if}
{/block}

{* Empty Sidebar right *}
{block name='frontend_index_content_right'}{/block}



