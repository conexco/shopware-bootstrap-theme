{extends file='frontend/listing/product-box/box-basic.tpl'}

{* Product description *}
{block name='frontend_listing_box_article_description_inner'}
    <div class="product-description small">
        {$sArticle.description_long|strip_tags|truncate:380}
    </div>
{/block}