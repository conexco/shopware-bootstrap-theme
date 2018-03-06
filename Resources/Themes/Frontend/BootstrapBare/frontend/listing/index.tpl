{extends file='frontend/index/index.tpl'}

{block name='frontend_index_header'}
    {include file='frontend/listing/header.tpl'}
{/block}

{* Hide sidebar if at least one emotion is in fullscreen mode *}
{block name="gridconfig"}
    {$fullscreenEmotion=false}
    {foreach $emotions as $emotion}
        {if $emotion.fullscreen}
            {$fullscreenEmotion=true}
        {/if}
    {/foreach}
    {if $fullscreenEmotion}
        {assign "grid" "g010" scope="global"}
    {else}
        {assign "grid" "g110" scope="global"}
    {/if}
    {$smarty.block.parent}
{/block}

{block name='frontend_index_left_menu_content'}{/block}

{block name='frontend_index_content_left'}
    {block name='frontend_index_controller_url'}
        {* Controller url for the found products counter *}
        {$countCtrlUrl = "{url module="widgets" controller="listing" action="listingCount" params=$ajaxCountUrlParams fullPath}"}
    {/block}

    {if !$fullscreenEmotion}
        {include file='frontend/listing/sidebar.tpl'}
    {/if}
{/block}

{* Main content *}
{block name='frontend_index_content'}

    {* Banner *}
    {block name="frontend_listing_index_banner"}
        {if !$hasEmotion && !$sLiveShopping}
            {include file='frontend/listing/banner.tpl' sLiveShopping=$sLiveShopping}
        {/if}
    {/block}

    {* Liveshopping *}
    {block name="frontend_listing_index_liveshopping"}
        {if $sLiveShopping}
            {include file='frontend/listing/liveshopping.tpl'}
        {/if}
    {/block}

    {* Category headline *}
    {block name="frontend_listing_index_text"}
        {if !$hasEmotion}
            {include file='frontend/listing/text.tpl'}
        {/if}
    {/block}

    {* Topseller *}
    {block name="frontend_listing_index_topseller"}
        {if !$hasEmotion && !$sSupplierInfo && {config name=topSellerActive}}
            {action module=widgets controller=listing action=top_seller sCategory=$sCategoryContent.id}
        {/if}
    {/block}

    {* Define all necessary template variables for the listing *}
    {block name="frontend_listing_index_layout_variables"}
        {$emotionViewports = [0 => 'xl', 1 => 'l', 2 => 'm', 3 => 's', 4 => 'xs']}

        {* Count of available product pages *}
        {$pages = 1}
        {if $criteria}
            {$pages = ceil($sNumberArticles / $criteria->getLimit())}
        {/if}

        {* Layout for the product boxes *}
        {$productBoxLayout = 'basic'}

        {if $sCategoryContent.productBoxLayout !== null && $sCategoryContent.productBoxLayout !== 'extend'}
            {$productBoxLayout = $sCategoryContent.productBoxLayout}
        {/if}
    {/block}

    {* Listing *}
    {block name="frontend_listing_index_listing"}
        {include file='frontend/listing/listing.tpl'}
    {/block}

    {* Tagcloud *}
    {block name="frontend_listing_index_tagcloud"}
        {if {config name=show namespace=TagCloud }}
            {action module=widgets controller=listing action=tag_cloud sCategory=$sCategoryContent.id}
        {/if}
    {/block}
{/block}

{* Sidebar right *}
{block name='frontend_index_content_right'}{/block}

