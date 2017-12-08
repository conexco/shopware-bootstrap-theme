{extends file='frontend/home/index.tpl'}

{block name='frontend_index_header_canonical'}
    <link rel="canonical" href="{url controller=campaign emotionId=$landingPage.id}" />
{/block}

{block name='frontend_index_header_title'}{strip}
    {if $seo_title}
        {$seo_title|escapeHtml} | {{config name=sShopname}|escapeHtml}
    {else}
        {$smarty.block.parent}
    {/if}
{/strip}{/block}

{* In case this campaign is rendered as a pageNotFoundError, we make sure the sidebar menu is hidden by setting the campaign body class *}
{block name="frontend_index_body_classes"}{$smarty.block.parent}{if {controllerName|lower} =='error'} is-ctl-campaign d-none{/if}{/block}

{* Keywords *}
{block name="frontend_index_header_meta_keywords"}{if $seo_keywords}{$seo_keywords|escapeHtml}{/if}{/block}

{* Description *}
{block name="frontend_index_header_meta_description"}{if $seo_description}{$seo_description|escapeHtml}{/if}{/block}

{* Promotion *}
{block name='frontend_home_index_promotions'}
    {foreach $landingPage.emotions as $emotion}
        <div class="content-emotions">
            <div class="emotion-wrapper sw5-plugin"
                 data-controllerUrl="{url module=widgets controller=emotion action=index emotionId=$emotion.id controllerName=$Controller}"
                 data-availableDevices="{$emotion.devices}">
            </div>
        </div>
    {/foreach}
{/block}

{* Sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}{/block}
