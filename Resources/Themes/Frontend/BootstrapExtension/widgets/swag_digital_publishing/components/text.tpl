{block name="widgets_digital_publishing_components_text_element"}

    {$padding = "padding: {$element.paddingTop / 16}rem {$element.paddingRight / 16}rem {$element.paddingBottom / 16}rem {$element.paddingLeft / 16}rem;"}

    {$style = "font-family: {$element.font};"}
    {$style = "{$style} font-size: {$element.fontsize / 16}rem;"}
    {$style = "{$style} line-height: {$element.lineHeight};"}
    {$style = "{$style} color: {$element.fontcolor};"}
    {$style = "{$style} text-align: {$element.orientation};"}

    {*Internet explorer 11 fix for long texts*}
    {$style = "{$style} white-space: pre-wrap;"}

    {if $element.fontweight}
        {$style = "{$style} font-weight: bold;"}
    {/if}

    {if $element.fontstyle}
        {$style = "{$style} font-style: italic;"}
    {/if}

    {if $element.underline}
        {$style = "{$style} text-decoration: underline;"}
    {/if}

    {if $element.uppercase}
        {$style = "{$style} text-transform: uppercase;"}
    {/if}

    {if $element.shadowColor}
        {$style = "{$style} text-shadow: {$element.shadowOffsetX}px {$element.shadowOffsetY}px {$element.shadowBlur}px {$element.shadowColor};"}
    {/if}

    {if !$element.type}
        {$element.type = 'p'}
    {/if}

    <div class="dig-pub-text" style="{$padding}">
        <{$element.type} style="{$style}"{if $element.class} class="{$element.class}"{/if}>{$element.text|nl2br}</{$element.type}>
    </div>
{/block}