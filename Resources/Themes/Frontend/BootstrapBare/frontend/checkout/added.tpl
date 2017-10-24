{block name='frontend_checkout_added_info_teaser'}
    {if $sArticleName}
        <div class="alert alert-success">
            {s name="CheckoutAddArticleInfoAdded"}"{$sArticleName}" wurde in den Warenkorb gelegt!{/s}
        </div>
    {else}
        &nbsp;
    {/if}
{/block}