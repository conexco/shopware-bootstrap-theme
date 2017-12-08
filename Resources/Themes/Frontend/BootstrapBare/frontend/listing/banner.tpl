{block name="frontend_listing_banner"}
    
    {if $sBanner}
        <div class="mbm">
            {if $sBanner.liveshoppingData}
                {include file="frontend/listing/box_liveshopping.tpl" liveArt=$sBanner.liveshoppingData}
            {elseif $sBanner.media.thumbnails}
                {if !$sBanner.link || $sBanner.link == "#" || $sBanner.link == ""}
                    {* Image only banner *}
                    {block name='frontend_listing_image_only_banner'}
                        <picture>
                            <source srcset="{$sBanner.media.thumbnails[1].sourceSet}" media="(min-width: {$theme['swf-screen-hd-min']})">

                            <img srcset="{$sBanner.media.thumbnails[0].sourceSet}" alt="{$sBanner.description|escape}" class="mx-auto d-block img-fluid" />
                        </picture>
                    {/block}
                {else}
                    {* Normal banner *}
                    {block name='frontend_listing_normal_banner'}
                        <a href="{if $sBanner.link}{$sBanner.link}{else}#{/if}" {if $sBanner.link_target}target="{$sBanner.link_target}"{/if} title="{$sBanner.description|escape}">
                            <picture>
                                <source srcset="{$sBanner.media.thumbnails[1].sourceSet}" media="(min-width: {$theme['swf-screen-hd-min']})">

                                <img srcset="{$sBanner.media.thumbnails[0].sourceSet}" alt="{$sBanner.description|escape}" class="mx-auto d-block img-fluid" />
                            </picture>
                        </a>
                    {/block}
                {/if}
            {/if}
        </div>
    {/if}
{/block}