{block name="widgets_digital_publishing_components_layer"}

    {$style = "z-index: {(2 + $layer.position)};"}
    {$style = "{$style} padding: {$layer.marginTop / 16}rem {$layer.marginRight / 16}rem {$layer.marginBottom / 16}rem {$layer.marginLeft / 16}rem;"}

    {if empty($layer.orientation)}
        {$layer.orientation = "center center"}
    {/if}

    <div class="dig-pub-layer {$layer.orientation}" style="{$style}">

        {block name="widgets_digital_publishing_components_layer_wrapper"}
            <div class="layer-wrapper" style="width: {$layer.width}; height: {$layer.height};">

                {block name="widgets_digital_publishing_components_layer_content"}

                    {$contentStyle = ""}

                    {if $layer.bgColor}
                        {$contentStyle = "background: {$layer.bgColor}; {$contentStyle}"}
                    {/if}

                    {if $layer.borderRadius > 0}
                        {$contentStyle = "border-radius: {$layer.borderRadius}px; {$contentStyle}"}
                    {/if}

                    <div class="layer-content"{if !empty($contentStyle)} style="{$contentStyle}"{/if}>

                        {block name="widgets_digital_publishing_components_layer_elements"}

                            {foreach $layer.elements as $element}
                                {if $element.name == 'text'}
                                    {include file="widgets/swag_digital_publishing/components/text.tpl" element=$element}

                                {elseif $element.name == 'button'}
                                    {include file="widgets/swag_digital_publishing/components/button.tpl" element=$element}

                                {elseif "widgets/swag_digital_publishing/components/{$element.name}.tpl"|template_exists}
                                    {include file="widgets/swag_digital_publishing/components/{$element.name}.tpl" element=$element}
                                {/if}
                            {/foreach}
                        {/block}

                        {block name="widgets_digital_publishing_components_layer_link"}
                            {if $layer.link}
                                {$link = $layer.link}
                                {$title = $layer.label|escape}

                                {if $layer.product}
                                    {$link = "{url controller="detail" sArticle=$layer.product.articleID}"}
                                    {$title = $layer.product.articleName|escape}
                                {/if}

                                <a href="{$link}" title="{$title}" class="dig-pub-link"></a>
                            {/if}
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}