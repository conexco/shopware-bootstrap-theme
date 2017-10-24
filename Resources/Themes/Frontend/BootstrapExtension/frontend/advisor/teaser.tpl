{block name="frontend_advisor_start_teaser_image"}
    {if $advisor['teaser']['thumbnails']}
        {$thumbnails = $advisor['teaser']['thumbnails']}
        {foreach $thumbnails as $image}
            {$srcSet = "{if $image@index !== 0}{$srcSet}, {/if}{$image['source']} {$image['maxWidth']}w"}
        {/foreach}
        <img srcset="{$srcSet}" class="img-responsive"{if $advisor['name']} alt="{$advisor['name']|escapeHtml}" title="{$advisor['name']|escapeHtml}"{/if} itemprop="image" />
    {else}
        {$baseSource = $advisor['teaser']['file']}
        <img src="{$baseSource}" class="img-responsive"{if $advisor['name']} alt="{$advisor['name']|escapeHtml}" title="{$advisor['name']|escapeHtml}"{/if} itemprop="image" />
    {/if}
{/block}