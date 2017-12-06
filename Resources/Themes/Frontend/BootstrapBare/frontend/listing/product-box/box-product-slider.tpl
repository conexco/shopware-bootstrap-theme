{extends file="frontend/listing/product-box/box-basic.tpl"}
{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article_rating"}{/block}

{block name="frontend_listing_box_article_description"}{/block}

{block name="frontend_listing_box_article_actions"}{/block}

{block name='frontend_listing_box_article_badges'}{/block}

{block name="frontend_listing_box_article_buy"}{/block}

{block name="frontend_listing_box_article_item_start"}
    <div class="phm product-box box-{$productBoxLayout}">
        <div class="card card-body">
{/block}

{block name="frontend_listing_box_article_item_end"}
        </div>
    </div>
{/block}
