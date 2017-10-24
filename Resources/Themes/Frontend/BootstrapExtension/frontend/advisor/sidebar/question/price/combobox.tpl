{* Contains the price-combobox *}
{block name="frontend_advisor_sidebar_answer_price_combobox"}
    <select class="advisor-price-combobox sw5-plugin form-control" name="q{$question['id']|escapeHtml}_values_max"{if $question['required']} required="required"{/if}>
        {block name="frontend_advisor_sidebar_price_combobox_empty"}
            <option class="advisor--empty-text sw5-plugin" disabled="disabled"{if !$question['answered']} selected="selected"{/if}>
                {s name="article/fields/empty_text" namespace="backend/emotion/view/components/article"}{/s}
            </option>
        {/block}

        {foreach $question['steps'] as $step}
            {block name="frontend_advisor_sidebar_price_combobox_option"}
                {$value = {"{s namespace="frontend/advisor/main" name="QuestionStepText"}up to{/s} {$step['value']|escapeHtml|currency}"}}
                {if $step['label']}
                    {$value = $step['label']|escapeHtml}
                {/if}
                {$value}
                <option
                    {if $step['css']} class="{$step['css']|escapeHtmlAttr}"{/if}
                    value="{$step['value']}"
                    {if $step['selected']} selected="selected"{/if}>
                    {$value}
                </option>
            {/block}
        {/foreach}
    </select>
{/block}