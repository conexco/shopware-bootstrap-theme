{block name="widgets_digital_publishing_components_button_element"}
	{$padding = "padding: {$element.paddingTop / 16}rem {$element.paddingRight / 16}rem {$element.paddingBottom / 16}rem {$element.paddingLeft / 16}rem;"}

    {$style = " width: {$element.width / 16}rem; height: {$element.height / 16}rem; font-size: {$element.fontsize / 16}rem; text-align: {$element.orientation};"}

    {$classes = "btn"}

    {if $element.type !== "standard"}
        {if $element.type === "is--primary"}
            {$btnType="btn-primary"}
        {else}
            {$btnType="btn-default"}
        {/if}
        {$classes = "{$classes} {$btnType}"}
    {/if}

    {if $element.class}
        {$classes = "{$classes} {$element.class}"}
    {/if}

    {$link = $element.link}
    {$title = $element.text|escape}

    {if $element.product}
        {$link = "{url controller="detail" sArticle=$element.product.articleID}"}
        {$title = $element.product.articleName|escape}
    {/if}

    <div class="dig-pub-button" style="{$padding}">
        <a{if !is_null($element.autoSize) && !$element.autoSize} style="{$style}"{/if} href="{$link}" target="{$element.target}" title="{$title}" class="{$classes}">{$element.text}</a>
    </div>

{/block}