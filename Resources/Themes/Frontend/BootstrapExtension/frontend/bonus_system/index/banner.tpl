{block name="frontend_listing_banner"}
    {* Normal banner *}
    {if $sBonusSystem.settings.display_banner==1 && $sBonusSystem.settings.bonus_listing_banner}
        {block name='frontend_listing_normal_banner'}
            <img class="img-responsive mbl" src="{$sBonusSystem.settings.bonus_listing_banner}" />
        {/block}
    {/if}
{/block}
