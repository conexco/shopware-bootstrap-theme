{block name="frontend_note_item"}
    <div class="table-row mvl">
        <div class="row">
            {if $sBasketItem.sConfigurator}
                {$detailLink={url controller="detail" sArticle=$sBasketItem.articleID number=$sBasketItem.ordernumber}}
            {else}
                {$detailLink=$sBasketItem.linkDetails}
            {/if}
            {block name="frontend_note_item_info"}
                {* Article picture *}
                {block name="frontend_note_item_image"}
                    <div class="col-12 col-sm-6 col-lg-2 mbl mbn-lg">
                        {$desc = $sBasketItem.articlename|escape}
                        {if $sBasketItem.image.thumbnails[0]}
                            {if $sBasketItem.image.description}
                                {$desc = $sBasketItem.image.description|escape}
                            {/if}
                            <a href="{$detailLink}" title="{$sBasketItem.articlename|escape}">
                                <img srcset="{$sBasketItem.image.thumbnails[0].sourceSet}" alt="{$desc}" title="{$desc|truncate:160:""}" class="img-fluid mx-auto d-block" />
                            </a>
                        {else}
                            <a href="{$detailLink}" title="{$sBasketItem.articlename|escape}">
                                <img src="{link file='frontend/_public/src/img/no-picture.png'}" alt="{$desc}" title="{$desc|truncate:160:""}" class="img-fluid mx-auto d-block" />
                            </a>
                        {/if}
                    </div>
                {/block}
                {* Article details *}
                {block name="frontend_note_item_details"}
                    <div class="col-12 col-sm-6 col-lg-7">
                        <div class="row">
                            <div class="col-12 col-lg-9">
                                {* Article name *}
                                {block name="frontend_note_item_details_name"}
                                    {* Article name *}
                                    <h4>
                                        <a href="{$detailLink}" title="{$sBasketItem.articlename|escape}">
                                            {$sBasketItem.articlename|truncate:40}
                                        </a>
                                    </h4>
                                {/block}
                                <dl class="dl-horizontal">
                                    {* Supplier name *}
                                    {block name="frontend_note_item_details_supplier"}
                                        <dt>{s name='NoteInfoSupplier'}{/s}</dt>
                                        <dd> {$sBasketItem.supplierName}</dd>
                                    {/block}
                                    {* Order number *}
                                    {block name="frontend_note_item_details_ordernumber"}
                                        <dt>{s name='NoteInfoId'}{/s}</dt>
                                        <dd> {$sBasketItem.ordernumber}</dd>
                                    {/block}
                                    {* Date added *}
                                    {block name="frontend_note_item_datum_add"}
                                        {if $sBasketItem.datum_add}
                                            <dt>{s name='NoteInfoDate'}Hinzugefügt am:{/s}</dt>
                                            <dd> {$sBasketItem.datum_add|date:DATE_MEDIUM}</dd>
                                        {/if}
                                    {/block}
                                </dl>
                                {* Article Description *}
                                {block name="frontend_note_item_description"}
                                    <p>{$sBasketItem.description_long|strip_tags|trim|truncate:160}</p>
                                {/block}
                                {* Unit price *}
                                {block name="frontend_note_item_unitprice"}
                                    {include file="frontend/listing/product-box/product-price-unit.tpl" sArticle=$sBasketItem}
                                {/block}
                                {* Reviews *}
                                {block name="frontend_note_item_reviews"}
                                    {if !{config name=VoteDisable}}
                                        <div class="mbm">
                                            {include file='frontend/_includes/rating.tpl' points=$sBasketItem.sVoteAverage.average type="aggregated" count=$sBasketItem.sVoteAverage.count}
                                        </div>
                                    {/if}
                                {/block}
                            </div>
                            <div class="col-12 col-lg-3">
                                {* Delivery informations *}
                                {block name="frontend_note_item_delivery"}
                                    {if {config name=BASKETSHIPPINGINFO}}
                                        {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sBasketItem}
                                    {/if}
                                {/block}
                                {block name="frontend_note_index_items"}{/block}
                            </div>
                        </div>
                    </div>
                {/block}
                {block name="frontend_note_item_sale"}
                    <div class="col-12 col-lg-3">
                        <div class="row">
                            <div class="col-12 col-sm-offset-6 col-sm-6 col-lg-12 col-lg-offset-0">
                                <div class="row mbl">
                                    {* Item price *}
                                    {block name="frontend_note_item_price"}
                                        <div class="col-8">
                                            {if $sBasketItem.itemInfo}
                                                {$sBasketItem.itemInfo}
                                            {else}
                                                <strong class="price">{$sBasketItem.price|currency}*</strong>
                                            {/if}
                                        </div>
                                    {/block}

                                    {block name="frontend_note_item_delete"}
                                        <div class="col-4 text-right">
                                            {* Remove article *}
                                            <form action="{url controller='note' action='delete' sDelete=$sBasketItem.id}" method="post">
                                                <button type="submit" title="{"{s name='NoteLinkDelete'}{/s}"|escape}" class="note-delete btn btn-danger sw5-plugin">
                                                    <i class="fa fa-trash-o"></i>
                                                </button>
                                            </form>
                                        </div>
                                    {/block}
                                </div>    
                            </div>
                        </div>
                        {* Additional links *}
                        {block name="frontend_note_item_actions"}
                            <div class="row">
                                <div class="col-12 col-sm-6 col-sm-push-6 col-lg-12 col-lg-push-0 mbm-lg">
                                    {block name="frontend_note_item_actions_add_article"}
                                        {* Place article in basket *}
                                        {if !$sBasketItem.sConfigurator && !$sBasketItem.sVariantArticle}
                                            <a href="{url controller=checkout action=addArticle sAdd=$sBasketItem.ordernumber}" class="btn btn-primary btn-block phm" title="{s name='NoteLinkBuy'}{/s}">
                                                {s name="DetailBuyActionAdd" namespace="frontend/detail/buy"}{/s}
                                            </a>
                                        {/if}
                                    {/block}
                                </div>
                                <div class="col-12 col-sm-6 col-sm-pull-6 col-lg-12 col-lg-pull-0">
                                    {* Compare article *}
                                    {if {config name="compareShow"}}
                                        <form action="{url controller='compare' action='add_article' articleID=$sBasketItem.articleID}" method="post">
                                            <button type="submit"
                                               data-product-compare-add="true"
                                               class="compare--link btn btn-outline-secondary btn-block phm d-none d-md-block"
                                               title="{"{s name='ListingBoxLinkCompare'}{/s}"|escape}">
                                                <i class="fa fa-exchange mrs"></i> {s name='ListingBoxLinkCompare'}{/s}
                                            </button>
                                        </form>
                                    {/if}
                                </div>
                            </div>
                        {/block}
                    </div>
                {/block}
            {/block}
        </div>
    </div>
{/block}
