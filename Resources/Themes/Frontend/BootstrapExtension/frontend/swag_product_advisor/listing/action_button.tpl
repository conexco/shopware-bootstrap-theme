{if $productBoxLayout == 'advisor-tophit'}
    {block name="frontend_advisor_listing_tophit_action"}
    <a class="advisor-tophit-buy btn btn-default mbm" href="{$sArticle.linkDetails}">
            {s name="TopHitActionText" namespace="frontend/advisor/main"}View product now{/s}
            <i class="icon--arrow-right"></i>
        </a>
    {/block}
{/if}
