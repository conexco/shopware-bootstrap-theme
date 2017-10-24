{extends file="parent:frontend/note/item.tpl"}
{namespace name="frontend/plugins/swag_advanced_cart/plugin"}

{block name="frontend_note_item_delete"}
    {block name="frontend_note_advanced_cart_item_delete"}
        {include file="frontend/wishlist/item/delete.tpl"}
    {/block}
{/block}

{block name="frontend_note_item_actions_add_article"}
    {block name="frontend_note_advanced_cart_item_add_article"}
        {if $item.article.ordernumber}
            {include file="frontend/wishlist/item/add.tpl"}
        {/if}
    {/block}
{/block}

{block name="frontend_note_item_details_ordernumber"}
    {$smarty.block.parent}
    {block name="frontend_note_advanced_cart_item_details_ordernumber"}
        {if $item.article.ordernumber}
            {include file="frontend/wishlist/item/ordernumber.tpl"}
        {/if}
    {/block}
{/block}

{block name="frontend_note_item_rating"}
    {block name="frontend_note_advanced_cart_item_rating"}
        {if $item.article.ordernumber}
            {$smarty.block.parent}
        {/if}
    {/block}
{/block}

{block name="frontend_note_item_details_supplier"}
    {block name="frontend_note_advanced_cart_item_details_supplier"}
        {if $item.article.ordernumber}
            {$smarty.block.parent}
        {/if}
    {/block}
{/block}

{block name="frontend_note_item_details_ordernumber"}
    {block name="frontend_note_advanced_cart_item_details_ordernumber"}
        {if $item.article.ordernumber}
            {$smarty.block.parent}
        {/if}
    {/block}
{/block}

{block name="frontend_note_item_date"}
    {block name="frontend_note_advanced_cart_item_date"}
        {if $item.article.ordernumber}
            {$smarty.block.parent}
        {/if}
    {/block}
{/block}

{block name="frontend_note_item_delivery"}
    {block name="frontend_note_advanced_cart_item_delivery"}
        {if $item.article.ordernumber}
            {$smarty.block.parent}
        {/if}
    {/block}
{/block}

{block name="frontend_note_item_sale"}
    {block name="frontend_note_advanced_cart_item_sale"}
        {if $item.article.ordernumber}
            {$smarty.block.parent}
        {/if}
    {/block}
{/block}