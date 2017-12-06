{block name="frontend_advisor_content_wizard_question_options"}
    {$template = $question['template']}
    <div class="content-wizard-{$template} row">
        {if $template == 'radio' && $question['type'] != 'price'}
            {block name="frontend_advisor_content_wizard_question_option_radio"}
                {include file="frontend/advisor/wizard/options/radio.tpl"}
            {/block}
        {elseif $template == 'radio' && $question['type'] == 'price'}
            {block name="frontend_advisor_content_wizard_question_option_price_radio"}
                {include file="frontend/advisor/wizard/options/price/radio.tpl"}
            {/block}
        {elseif $template == 'checkbox'}
            {block name="frontend_advisor_content_wizard_question_option_checkbox"}
                {include file="frontend/advisor/wizard/options/checkbox.tpl"}
            {/block}
        {elseif $template == 'range_slider'}
            <div class="col-12 col-md-offset-4 col-md-4 phn-xs">
                {block name="frontend_advisor_content_wizard_question_option_range"}
                    {include file="frontend/advisor/range_slider.tpl"}
                {/block}
            </div>
        {/if}
    </div>
{/block}