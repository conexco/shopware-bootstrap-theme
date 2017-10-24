{* Contains the default checkbox *}
{block name="frontend_advisor_sidebar_answer_checkbox"}
    <div class="answers-checkbox-wrapper sw5-plugin{if $question['required']} required{/if}">
        {foreach $question['answers'] as $answer}
            {$label = $answer['value']}
            {if $answer['label']}
                {$label = $answer['label']}
            {/if}

            {block name="frontend_advisor_sidebar_checkbox_ct"}
                <div class="question-checkbox question-filter{if $answer['css']} {$answer['css']|escapeHtmlAttr}{/if}">
                    <span class="filter-panel-checkbox">
                        {block name="frontend_advisor_sidebar_checkbox_input"}
                            <input type="checkbox"
                                id="answer{$answer['answerId']|escapeHtml}{$position}"
                                name="q{$question['id']|escapeHtml}_values_{$answer@key}"
                                value="{$answer['answerId']|escapeHtml}"
                                class="filter-advisor-checkbox sw5-plugin"
                                {if $answer['selected']} checked="checked"{/if}/>
                        {/block}

                        <span class="checkbox--state">&nbsp;</span>
                    </span>

                    {block name="frontend_advisor_sidebar_checkbox_label"}
                        <label class="question-label"
                               for="answer{$answer['answerId']|escapeHtml}{$position}">
                            {$label|escapeHtml} &nbsp;
                        </label>
                    {/block}
                </div>
            {/block}
        {/foreach}
    </div>
{/block}