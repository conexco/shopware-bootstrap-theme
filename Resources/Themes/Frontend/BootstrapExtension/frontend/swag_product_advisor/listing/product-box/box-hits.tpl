{extends file="frontend/listing/product-box/box-basic.tpl"}

{* The template for the hits-template *}
{block name="frontend_listing_box_article_description"}
    {if $productBoxLayout == 'advisor-tophit'}
        {$smarty.block.parent}
    {/if}
    {block name="frontend_advisor_listing_hits_ct"}
        <div class="advisor-hits row" data-equal="advisorHits">
           {$advisorAttribute = $product['attributes']['advisor']}

            {if $advisorAttribute->getMatches()}
                <div class="col-xs-12 col-lg-6">
                    {block name="frontend_advisor_listing_hits_ct_matches"}
                        <ul class="advisor-matches-list list-unstyled mvm">
                            {foreach $advisorAttribute->getMatches() as $match}
                                {block name="frontend_advisor_listing_hits_ct_match"}
                                    <li class="matches-list-single">
                                        <div class="text-success">
                                            <i class="fa fa-check mrm"></i>{$match['label']}
                                        </div>
                                    </li>
                                {/block}
                            {/foreach}
                        </ul>
                    {/block}
                </div>
            {/if}

            {if $advisorAttribute->getMisses()}
                <div class="col-xs-12 col-lg-6">
                    {block name="frontend_advisor_listing_hits_ct_misses"}
                        {block name="frontend_listing_box_advisor_misses_ct"}{/block}
                    {/block}
                </div>
            {/if}
        </div>
    {/block}
{/block}