{foreach $question['steps'] as $step}
    <div class="question-radio sw5-plugin question-filter{if $step['css']} {$step['css']|escapeHtmlAttr}{/if} col-12 col-md-offset-4 col-md-4 phn-xs phn-sm phn-hd">
        {block name="frontend_advisor_wizard_question_price_radio_input"}
            <input type="radio"
                id="answer{$step['answerId']|escapeHtml}"
                name="q{$question['id']|escapeHtml}_values_max"
                value="{$step['value']|escapeHtml}"
                class="filter-advisor-price-radio sw5-plugin advisor--hide-input"
                {if $step['selected']} checked="checked"{/if}/>
        {/block}

        {block name="frontend_advisor_wizard_question_price_radio_label_ct"}
            <label class="question-label sw5-plugin"
                for="answer{$step['answerId']|escapeHtml}">
                {block name="frontend_advisor_wizard_cell_price_radio_label_text"}
                    {$value = {"{s namespace="frontend/advisor/main" name="QuestionStepText"}up to{/s} {$step['value']|escapeHtml|currency}"}}
                    {if $step['label']}
                        {$value = $step['label']|escapeHtml}
                    {/if}
                    <span class="label-answer-name">{$value}</span>
                {/block}
            </label>
        {/block}
    </div>
{/foreach}