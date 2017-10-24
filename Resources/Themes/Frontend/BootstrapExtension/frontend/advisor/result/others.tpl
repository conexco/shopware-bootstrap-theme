{$othersTitle = $advisor['othersTitle']}
{if $othersTitle['showTitle'] && !$product.attributes.advisor->hasMatch() && !$othersTitleFound}
    {$othersTitleFound = true}
    {block name="frontend_advisor_listing_others_title_ct"}
        {include file="frontend/advisor/result/others_title.tpl" scope='parent'}
    {/block}
{/if}