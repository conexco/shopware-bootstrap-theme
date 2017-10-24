{block name="widgets_digital_publishing_index"}
    <div class="dig-pub" data-digitalPublishing="true">

        {if $banner.bgType === 'image' && $banner.bgMode === 'cover'}
            <div class="bg--image sw5-plugin">
                {include file="widgets/swag_digital_publishing/components/cover.tpl" media=$banner.media position=$banner.bgOrientation}
            </div>

        {elseif $banner.bgType === 'image' && $banner.bgMode === 'repeat'}
            <div class="bg-pattern" style="background-image: url({$banner.media.source});"></div>

        {elseif $banner.bgType === 'color'}
            <div class="bg-color" style="background: {$banner.bgColor}"></div>
        {/if}

        {foreach $banner.layers as $layer}
            {include file="widgets/swag_digital_publishing/components/layer.tpl" layer=$layer index=$layer@index}
        {/foreach}
    </div>
{/block}