{block name="widgets_digital_publishing_components_cover"}

    {$data = "{$media.source} base"}

    {if $media.thumbnails}
        {foreach $media.thumbnails as $image}
            {$data = "{$data}, {$image.source} {$image.maxWidth}"}

            {if $image.retinaSource}
                {$data = "{$data}, {$image.retinaSource} {$image.maxWidth} 2x"}
            {/if}

        {/foreach}
    {/if}

    <div class="cover"
         data-cover="true"
         data-srcSet="{$data}"
         {if $position}data-position="{$position}"{/if}>
    </div>
{/block}