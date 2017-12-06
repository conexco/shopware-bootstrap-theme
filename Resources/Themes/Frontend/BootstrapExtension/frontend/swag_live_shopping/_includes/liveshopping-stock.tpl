{block name='frontend_liveshopping_stock_inner'}
    <div class="badge badge-danger counter-stock sw5-plugin">
        {s name="sLiveStillOnly" namespace="frontend/live_shopping/main"}{/s}
        <span class="stock-quantity-number sw5-plugin">{$liveShopping.quantity}</span>
        {if !$sArticle.packunit}
                {s name="sLivePiece" namespace="frontend/live_shopping/main"}{/s}
            {else}
                {$sArticle.packunit}
        {/if}
    </div>
{/block}