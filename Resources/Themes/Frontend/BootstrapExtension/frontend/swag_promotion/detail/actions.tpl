{namespace name="frontend/swag_promotion/main"}

{if $sArticle.attributes.promotion}
    {$indexNumber = 1}
    {foreach $sArticle.attributes.promotion->promotions as $promotion}
        {if $promotion->description != ""}
            {*create a footnote if we have a validTo date*}
            {if $promotion->validTo}
                {$index = "<span class='promotion-index'><sup>*{$indexNumber}</sup></span>"}
            {/if}
            {*create content for modal box and off canvas if we have a detailed description*}
            {if $promotion->detailDescription != ""}
                {block name="frontend_detail_index_actions_promotion_short_description"}
                    <div class="promotion-description-box"
                         data-toggle="modal"
                         data-target="#promotion-{$promotion->id}">
                        {block name="frontend_detail_index_actions_promotion_short_description_alert"}
                            <div class="alert alert-info mtl">
                                <div class="row">
                                    {block name="frontend_detail_index_actions_promotion_short_description_alert_text"}
                                        <div class="col-11">
                                            <div class='promotion-description'>
                                                <b>{s name="promotionAttention" namespace="frontend/swag_promotion/main"}Attention:{/s}</b>
                                                {eval var=$promotion->description|strip_tags}{$index}
                                            </div>
                                        </div>
                                    {/block}
                                    {block name="frontend_detail_index_actions_promotion_short_description_alert_icon"}
                                        <div class="col-1 text-right">
                                            <i class="fa fa-angle-right"></i>
                                        </div>
                                    {/block}
                                </div>
                            </div>
                        {/block}
                    </div>
                {/block}
                {block name="frontend_detail_index_actions_promotion_modal"}
                    <div class="modal fade promotion-modal" tabindex="-1" role="dialog" aria-labelledby="{$promotion->name}" id="promotion-{$promotion->id}">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                {block name='frontend_detail_index_actions_promotion_modal_header'}
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        {block name='frontend_detail_index_actions_promotion_modal_title'}
                                            <h4 class="modal-title">{$promotion->name}</h4>
                                        {/block}
                                    </div>
                                {/block}
                                {block name="frontend_detail_index_actions_promotion_modal_body"}
                                    <div class="modal-body">
                                       {eval var=$promotion->detailDescription}
                                    </div>
                                {/block}
                            </div>
                        </div>
                    </div>
                {/block}
            {else}
                {block name="frontend_detail_index_actions_promotion_short_description"}
                    <div class="alert alert-info">
                        <div class='promotion-description'>
                            <b>{s name="promotionAttention" namespace="frontend/swag_promotion/main"}Attention:{/s}</b>
                            {eval var=$promotion->description}{$index}
                        </div>
                    </div>
                {/block}
            {/if}

            {*create footnote for promotion if index is set*}
            {if $index}
                {$footNoteArray[$indexNumber] = "<span class='alert-info small'><sup>*{$indexNumber}</sup>{s name="promotionValidUntil"}{/s}{$promotion->validTo|date_format:"{s name="promotionValidUntilDateFormat"}{/s}"}</span></br>"}
                {$indexNumber = $indexNumber + 1}
            {/if}
        {/if}
    {/foreach}
    {block name="frontend_detail_index_actions_promotion_footnotes"}
        {foreach $footNoteArray as $footNote}
            <div class="promotion-description-footnote">
                {$footNote}
            </div>
        {/foreach}
    {/block}
{/if}