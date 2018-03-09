{extends file='frontend/index/index.tpl'}

{block name="gridconfig"}
    {assign "grid" "g010" scope="global"}
    {$smarty.block.parent}
{/block}

{* Sidebar left *}
{block name='frontend_index_content_left'}
{/block}

{block name="frontend_index_content_top"}{/block}

{* Page title *}
{block name='frontend_index_header_title'}{strip}
    {if $sCategoryContent.metaTitle}
        {$sCategoryContent.metaTitle|escapeHtml} | {{config name=sShopname}|escapeHtml}
    {else}
        {$smarty.block.parent}
    {/if}
{/strip}{/block}

{* Canonical URL *}
{block name='frontend_index_header_canonical'}
    <link rel="canonical" href="{url controller='index'}" />
{/block}

{* Breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}

{* Topseller *}
{block name='frontend_home_right_topseller'}{/block}

{* Main content *}
{block name='frontend_index_content'}
    <div id="center">
        {* Banner *}
        {block name='frontend_home_index_banner'}
            {include file='frontend/listing/banner.tpl'}
        {/block}

        {* Liveshopping *}
        {block name='frontend_home_index_liveshopping'}
            {if $sLiveShopping}
                {include file='frontend/listing/liveshopping.tpl'}
            {/if}
        {/block}

        {* Category headline *}
        {block name='frontend_home_index_text'}
            {include file='frontend/listing/text.tpl'}
        {/block}

        {* Promotion *}
        {block name='frontend_home_index_promotions'}
            {if $hasCustomerStreamEmotion}
                {action module=frontend controller=listing action=layout sCategory=$sCategoryContent.id}
            {elseif $hasEmotion}
                <div class="content-emotions">
                    {foreach $emotions as $emotion}
                        {block name='frontend_home_index_emotion_wrapper'}
                            <div class="emotion-wrapper sw5-plugin" data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}" data-availableDevices="{$emotion.devices}">
                            </div>
                        {/block}
                    {/foreach}
                </div>
            {/if}
        {/block}

        {* Blog Articles *}
        {block name='frontend_home_index_blog'}
            {if $sBlog.sArticles|@count}
                <h2>{s name='WidgetsBlogHeadline'}{/s}:</h2>
                {foreach from=$sBlog.sArticles item=article key=key name="counter"}
                    {include file="frontend/blog/box.tpl" sArticle=$article key=$key homepage=true}
                {/foreach}
            {/if}
        {/block}

        {* Tagcloud *}
        {block name="frontend_home_index_tagcloud"}
            {if {config name=show namespace=TagCloud }}
                {action module=widgets controller=listing action=tag_cloud sController=index}
            {/if}
        {/block}
    </div>
{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}
{/block}

{* Category text *}
{block name='frontend_home_index_text'}
    {if !$hasEmotion}
        {$smarty.block.parent}
    {/if}
{/block}
