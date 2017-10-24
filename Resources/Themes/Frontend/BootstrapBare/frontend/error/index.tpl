{extends file='frontend/index/index.tpl'}
{block name='frontend_index_header_title' prepend}{s name="ErrorIndexTitle"}{/s} | {/block}
{block name='frontend_index_content'}
    {if $isCsrfException}
        {include file='frontend/error/csrf.tpl'}
    {else}
        {include file='frontend/error/exception.tpl'}
    {/if}
{/block}
{block name='frontend_index_actions'}{/block}
{block name='frontend_index_checkout_actions'}{/block}
{block name='frontend_index_search'}{/block}