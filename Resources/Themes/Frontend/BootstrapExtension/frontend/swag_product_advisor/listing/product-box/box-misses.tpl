{extends file="parent:frontend/swag_product_advisor/listing/product-box/box-hits.tpl"}

{* The template for the misses-template *}
{block name="frontend_listing_box_advisor_misses_ct"}
	{$smarty.block.parent}
    <ul class="advisor-misses-list list-unstyled mvm">
        {foreach $advisorAttribute->getMisses() as $miss}
            {block name="frontend_advisor_listing_hits_ct_miss"}
                <li class="misses-list-single">
                    <div class="text-danger">
                        <i class="fa fa-times mrm"></i>
                        {$miss['label']}
                    </div>
                </li>
            {/block}
        {/foreach}
    </ul>
{/block}