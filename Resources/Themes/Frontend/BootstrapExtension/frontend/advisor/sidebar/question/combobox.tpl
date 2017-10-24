{* Contains the default combobox *}
{block name="frontend_advisor_sidebar_answer_default_combobox"}
    <select class="advisor-combobox sw5-plugin" name="q{$question['id']|escapeHtml}_values"{if $question['required']} required="required"{/if}>
        {block name="frontend_advisor_sidebar_default_combobox_empty"}
            <option class="advisor--empty-text" disabled="disabled" value=""{if !$question['answered']} selected="selected"{/if}>
                {s name="article/fields/empty_text" namespace="backend/emotion/view/components/article"}{/s}
            </option>
        {/block}

        {foreach $question['answers'] as $answer}
            {$label = $answer['value']}
            {if $answer['label']}
                {$label = $answer['label']}
            {/if}
            {block name="frontend_advisor_sidebar_default_combobox_option"}
                <option
                    {if $answer['css']} class="{$answer['css']|escapeHtmlAttr}"{/if}
                    value="{$answer['answerId']}"
                    {if $answer['selected']} selected="selected"{/if}>
                    {$label}
                </option>
            {/block}
        {/foreach}
    </select>
{/block}