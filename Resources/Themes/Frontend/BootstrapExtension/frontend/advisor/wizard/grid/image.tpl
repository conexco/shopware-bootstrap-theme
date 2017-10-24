{block name="frontend_advisor_content_wizard_grid_image_config"}
    {$media = $answer['media']}
    {if $media}
        {if $media['thumbnails']}
            {$thumbnails = $media['thumbnails']}
            {$baseSource = $thumbnails[0]['source']}
            {$colSize = 100 / $numberColumns}

            {foreach $thumbnails as $image}
                {$srcSet = "{if $image@index !== 0}{$srcSet}, {/if}{$image['source']} {$image['maxWidth']}w"}

                {if $image['retinaSource']}
                    {$srcSetRetina = "{if $image@index !== 0}{$srcSetRetina}, {/if}{$image['retinaSource']} {$image['maxWidth']}w"}
                {/if}
            {/foreach}
        {else}
            {$baseSource = $media['file']}
        {/if}
    {/if}
{/block}

{$inputType = 'checkbox'}
{if $question['template'] == 'radio_image'}
    {$inputType = 'radio'}
{/if}
{block name="frontend_advisor_content_wizard_grid_image_input"}
    <input type="{$inputType}"
           id="answer{$answer['answerId']|escapeHtml}"
           name="q{$question['id']|escapeHtml}_values{if $inputType == 'checkbox'}_{$answer['answerId']}{/if}"
           value="{$answer['answerId']|escapeHtml}"
           class="filter-advisor-checkbox sw5-plugin advisor--hide-input"
           {if $answer['selected']} checked="checked"{/if}/>
{/block}

<label class="{if $inputType == 'radio'}question-radio-image sw5-plugin {/if}question-label" for="answer{$answer['answerId']|escapeHtml}">

    {$label = $answer['value']}
    {block name="frontend_advisor_content_wizard_grid_label_config"}
        {if $answer['label']}
            {$label = $answer['label']}
        {/if}
    {/block}

    {block name="frontend_advisor_content_wizard_grid_image_ct"}
        <div class="advisor-cell-image" style="height:{$question['rowHeight']}px">
            <picture>
                {if $srcSetRetina}
                    {block name="frontend_advisor_content_wizard_grid_sources_retina"}
                        <source sizes="100vw" srcset="{$srcSetRetina}" media="(min-resolution: 192dpi)"/>
                        <source sizes="50vw" srcset="{$srcSetRetina}" media="(min-resolution: 192dpi and min-width: 30em)"/>
                        {if $numberColumns > 2}
                            <source sizes="{$colSize}vw" srcset="{$srcSetRetina}" media="(min-resolution: 192dpi and min-width: 48em)"/>
                        {/if}
                    {/block}
                {/if}
                {if $srcSet}
                    {block name="frontend_advisor_content_wizard_grid_sources"}
                        <source sizes="100vw" srcset="{$srcSet}" />
                        <source sizes="50vw" srcset="{$srcSet}" media="(min-width: 30em)"/>
                        {if $numberColumns > 2}
                            <source sizes="{$colSize}vw" srcset="{$srcSet}" media="(min-width: 48em)"/>
                        {/if}
                    {/block}
                {/if}
                <img class="img-responsive" src="{$baseSource}" sizes="{$colSize}vw" class="banner--image"{if $advisor['name']} alt="{$label|escapeHtml}"{/if} />
            </picture>
        </div>
    {/block}

    {block name="frontend_advisor_content_wizard_grid_image_text"}
        {if !$question['hideText']}
            <div class="text-center">
                {$label|truncate:140}
            </div>
        {/if}
    {/block}
</label>