{extends file="parent:frontend/detail/index.tpl"}
{namespace name="frontend/plugins/swag_advanced_cart/article_detail"}

{block name="frontend_index_content"}
    {block name="frontend_advanced_cart_alert_add_success"}
        <div class="add-article-wishlist-alert wishlist-alert-add-success">
            {include file="frontend/_includes/messages.tpl" type="success" content="{s name='AddListSuccess'}Der Artikel wurde erfolgreich hinzugefügt.{/s}"}
        </div>
    {/block}
    {$smarty.block.parent}
{/block}