{foreach $question['answers'] as $answer}
    {$label = $answer['value']}
    {if $answer['label']}
        {$label = $answer['label']}
    {/if}

    <div class="question-checkbox question-filter{if $answer['css']} {$answer['css']|escapeHtmlAttr}{/if} col-xs-12 col-md-offset-4 col-md-4 phn-xs phn-sm phn-hd">
        {block name="frontend_advisor_wizard_question_checkbox_input"}
            <input type="checkbox"
                id="answer{$answer['answerId']|escapeHtml}"
                name="q{$question['id']|escapeHtml}_values_{$answer@key}"
                value="{$answer['answerId']|escapeHtml}"
                class="filter-advisor-checkbox sw5-plugin advisor--hide-input"
                {if $answer['selected']} checked="checked"{/if}/>
        {/block}

        {block name="frontend_advisor_wizard_question_checkbox_label_ct"}
            <label class="question-label"
                   for="answer{$answer['answerId']|escapeHtml}">
                {block name="frontend_advisor_wizard_cell_checkbox_label_text"}
                    {$label|escapeHtml}
                {/block}
            </label>
        {/block}
    </div>
{/foreach}