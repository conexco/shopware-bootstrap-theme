{$promotionStruct = $sArticle.attributes.promotion}
{if !empty($promotionStruct->promotions)}
    {if $promotionStruct->promotions.0->showBadge}
        {$hasBadge = false}
        {foreach item=prom from=$promotionStruct->promotions}
            {if $prom->showBadge && $hasBadge == false}
                {$hasBadge = true}
                <span class="label label-warning img-label" title="{$prom->badgeText|strip_tags}">
                    {if $prom->badgeText}
                        {$prom->badgeText|strip_tags}
                    {else}
                        {s name="promotionBadge" namespace="frontend/swag_promotion/main"}{/s}
                    {/if}
                </span>
            {/if}
        {/foreach}
    {else}
        <span class="label label-danger price-saving img-label" title="{$description|strip_tags}">{s name="promotionBadge" namespace="frontend/swag_promotion/main"}{/s}</span>
    {/if}
{/if}