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
    <div class="card {if $sUserLoggedIn && !$sOneTimeAccount} account-content{else} note-content{/if} mb-4"
         data-compare-ajax="true">
        {block name="frontend_note_index_welcome"}
            {block name="frontend_note_index_welcome_headline"}
                <h1 class="card-header bg-transparent h3">
                    {s name="NoteHeadline"}{/s}
                </h1>
            {/block}
        {/block}
        <div class="card-body">
            {block name="frontend_note_index_overview"}
                {if !$sNotes}
                    {include file="frontend/_includes/messages.tpl" type="info" content="{s name='NoteInfoEmpty'}Aktuell keine Artikel auf dem Merkzettel vorhanden{/s}"}
                {else}
                    {block name="frontend_note_index_table"}
                        <p class="card-text">{s name='NoteText'}{/s}</p>
                        <p class="card-text">{s name='NoteText2'}{/s}</p>
                    {/block}
        </div>
                    {block name="frontend_note_index_table_items"}
                    <ul class="list-group list-group-flush">
                        {foreach from=$sNotes item=sBasketItem name=noteitems}
                            <li class="list-group-item">
                                {include file="frontend/note/item.tpl" isLast=$sBasketItem@last}
                            </li>
                        {/foreach}
                    </ul>
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