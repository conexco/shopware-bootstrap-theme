{extends file="frontend/listing/product-box/box-basic.tpl"}
{namespace name="frontend/listing/box_blog"}

{* Description *}
{block name='frontend_listing_box_article_description'}
    <div class="desc-wrapper" data-equal="desc">
        <p>{$sArticle.description_long|strip_tags|truncate:450}</p>
    </div>
{/block}