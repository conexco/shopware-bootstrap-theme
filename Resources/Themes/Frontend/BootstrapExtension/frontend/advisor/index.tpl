{extends file="parent:frontend/index/index.tpl"}

{* Hide sidebar if at least one emotion is in fullscreen mode *}
{block name="gridconfig" prepend}
    {assign "grid" "g010" scope="global"}
{/block}

{block name="frontend_index_header_title"}
    {$advisor['name']}
{/block}

{block name="frontend_index_content_left"}
{/block}


{block name="frontend_index_content"}
    {include file='frontend/advisor/advisor.tpl'}
{/block}

{block name="frontend_index_header_canonical"}
    <link rel="canonical" href="{$advisorCanonicalUrl}" />
{/block}