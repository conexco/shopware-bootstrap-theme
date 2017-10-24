{* Contains the price-radio buttons *}
{block name="frontend_advisor_sidebar_answer_price_radio"}
    {foreach $question['steps'] as $step}
        {block name="frontend_advisor_sidebar_price_radio_ct"}
            <div class="question-radio sw5-plguin question-filter-wrapper{if $step['css']} {$step['css']|escapeHtmlAttr}{/if}">
                <span class="filter-panel-radio question-filter">
                    {block name="frontend_advisor_sidebar_price_radio_input"}
                        <input type="radio"
                           id="answer{$step['answerId']|escapeHtml}{$position}"
                           name="q{$question['id']|escapeHtml}_values_max"
                           value="{$step['value']|escapeHtml}"
                           class="filter-advisor-price-radio sw5-plguin"
                           {if $question['required']} required="required"{/if}
                           {if $step['selected']} checked="checked"{/if}/>
                    {/block}

                    <span class="radio-state">&nbsp;</span>
                </span>

                {block name="frontend_advisor_sidebar_price_radio_label"}
                    <label class="question-label sw5-plguin"
                           for="answer{$step['answerId']|escapeHtml}{$position}">
                        {$value = {"{s namespace="frontend/advisor/main" name="QuestionStepText"}up to{/s} {$step['value']|escapeHtml|currency}"}}
                        {if $step['label']}
                            {$value = $step['label']|escapeHtml}
                        {/if}
                        {$value}
                    </label>
                {/block}
            </div>
        {/block}
    {/foreach}
{/block}