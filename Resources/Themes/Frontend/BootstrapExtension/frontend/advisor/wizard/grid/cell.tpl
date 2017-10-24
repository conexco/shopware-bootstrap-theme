{$answer = null}

{$answers = $question['answers']}

{if $question['type'] === 'price'}
    {$answers = $question['steps']}
{/if}

{foreach $answers as $singleAnswer}
    {if $singleAnswer['colId'] == $colIndex && $singleAnswer['rowId'] == $rowIndex}
        {$answer = $singleAnswer}
    {/if}
{/foreach}

<div class="advisor-grid--advisor-cell{if $answer === null} advisor-cell--empty{/if}">
    {block name="frontend_advisor_content_wizard_grid_cell_inner"}
        <div class="advisor-cell-inner{if $answer !== null} advisor-cell-filled{/if}{if $answer['css']} {$answer['css']|escapeHtmlAttr}{/if}">
            {if $answer !== null}
                {block name="frontend_advisor_content_wizard_grid_cell_image"}
                    {if $question['type'] === 'price'}
                        {block name="frontend_advisor_content_wizard_grid_cell_image_price"}
                            {include file="frontend/advisor/wizard/grid/price_image.tpl"}
                        {/block}
                    {else}
                        {block name="frontend_advisor_content_wizard_grid_cell_image_default"}
                            {include file="frontend/advisor/wizard/grid/image.tpl"}
                        {/block}
                    {/if}
                {/block}
            {/if}
        </div>
    {/block}
</div>