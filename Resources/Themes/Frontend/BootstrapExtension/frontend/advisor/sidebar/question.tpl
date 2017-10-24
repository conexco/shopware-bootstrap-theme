{$openQuestion = $question['expandQuestion']}
<a class="sidebar-collapse{if $openQuestion} sidebar-open{else} collapsed{/if}" role="button" data-toggle="collapse" href="#collapse-{$question['question']}" aria-expanded="false" aria-controls="collapse-{$question['question']}">
    {block name="frontend_advisor_sidebar_question_name"}
        <div class="question-name sw5-plugin">
            {block name="frontend_advisor_sidebar_question_name_text"}
                {$question['question']}
                {if $question['required']}
                    **
                {/if}
            {/block}


            {* Criteria is only given on the result, so we are on the result-page *}
            {if $criteria}
                {$openQuestion = $question['answered']}
            {/if}

            {block name="frontend_advisor_sidebar_question_name_arrow"}
                <div class="question-name-arrow sw5-plugin">
                    <i class="fa fa-angle-up"></i>
                </div>
            {/block}
        </div>
    {/block}
</a>
<div class="collapse{if $openQuestion} in{/if}" id="collapse-{$question['question']}">
    {* Contains all answers for a question *}
    {block name="frontend_advisor_sidebar_question_answers"}
        <div class="question-answer sw5-plugin">
            {block name="frontend_advisor_sidebar_question_answers_ct"}
                {$templateBase = "frontend/advisor/sidebar/question/"}

                {if $question['type'] == 'price'}
                    {$templateBase = {$templateBase|cat:'price/'}}
                {/if}

                {$template = $templateBase|cat:$question['template']|cat:".tpl"|strtolower}
                {block name="frontend_advisor_sidebar_answer_ct"}
                    {if $template|template_exists}
                        {include file={$template}}
                    {/if}
                {/block}
            {/block}

            {if $question['infoText']}
                {block name="frontend_advisor_sidebar_question_info"}
                    {include file="frontend/advisor/sidebar/question/info.tpl"}
                {/block}
            {/if}

            {block name="frontend_advisor_sidebar_question_reset"}
                {if $question['template'] != "range_slider"}
                    {include file="frontend/advisor/sidebar/question/reset.tpl"}
                {/if}
            {/block}
        </div>
    {/block}
</div>






