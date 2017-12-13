{extends file="frontend/listing/product-box/box-basic.tpl"}
{namespace name="frontend/listing/box_blog"}

{* Description *}
{block name='frontend_listing_box_article_description_inner'}
    <div class="product-description small">
        {$sArticle.description_long|strip_tags|truncate:450}
    </div>
{/block}
