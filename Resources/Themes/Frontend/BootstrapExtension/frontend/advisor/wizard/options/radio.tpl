{foreach $question['answers'] as $answer}
    {$label = $answer['value']}
    {if $answer['label']}
        {$label = $answer['label']}
    {/if}

    <div class="question-radio sw5-plugin question-filter{if $answer['css']} {$answer['css']|escapeHtmlAttr}{/if} col-xs-12 col-md-offset-4 col-md-4 phn-xs phn-sm phn-hd">
        {block name="frontend_advisor_wizard_question_radio_input"}
            <input type="radio"
                id="answer{$answer['answerId']|escapeHtml}"
                name="q{$question['id']|escapeHtml}_values"
                value="{$answer['answerId']|escapeHtml}"
                class="filter-advisor-radio sw5-plugin advisor--hide-input"
                {if $answer['selected']} checked="checked"{/if}/>
        {/block}

        {block name="frontend_advisor_wizard_question_radio_label_ct"}
            <label class="question-label sw5-plugin"
                   for="answer{$answer['answerId']|escapeHtml}">
                {block name="frontend_advisor_wizard_question_checkbox_label_text"}
                    <span class="label-answer-name">{$label|escapeHtml}</span>
                {/block}
            </label>
        {/block}
    </div>
{/foreach}