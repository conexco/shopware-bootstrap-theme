{extends file='frontend/index/index.tpl'}

{block name="gridconfig" prepend}
    {if !$sUserLoggedIn}
        {assign "grid" "g010" scope="global"}
    {else}
        {assign "grid" "g110" scope="global"}
    {/if}
{/block}

{* Breadcrumb *}
{block name='frontend_index_start' prepend}
    {$sBreadcrumb = [['name'=>"{s name='NoteTitle'}{/s}", 'link'=>{url}]]}
{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div class="{if $sUserLoggedIn && !$sOneTimeAccount} account-content{else} note-content{/if}" data-compare-ajax="true">
        {block name="frontend_note_index_welcome"}
            {block name="frontend_note_index_welcome_headline"}
                <h1>{s name="NoteHeadline"}{/s}</h1>
            {/block}
        {/block}
        {block name="frontend_note_index_overview"}
            {if !$sNotes}
                {include file="frontend/_includes/messages.tpl" type="info" content="{s name='NoteInfoEmpty'}Aktuell keine Artikel auf dem Merkzettel vorhanden{/s}"}
            {else}
                {block name="frontend_note_index_table"}
                    <p>{s name='NoteText'}{/s}</p>
                    <p class="mbl">{s name='NoteText2'}{/s}</p>
                    {block name="frontend_note_index_columns"}{/block}
                    {block name="frontend_note_index_table_items"}
                        {foreach from=$sNotes item=sBasketItem name=noteitems}
                            {include file="frontend/note/item.tpl" isLast=$sBasketItem@last}
                        {/foreach}
                    {/block}
                {/block}
            {/if}
        {/block}
    </div>
{/block}

{block name='frontend_index_content_left'}
    {if $sUserLoggedIn}
        {include file="frontend/account/sidebar.tpl"}
    {/if}
{/block}

{block name="frontend_index_content_right"}{/block}