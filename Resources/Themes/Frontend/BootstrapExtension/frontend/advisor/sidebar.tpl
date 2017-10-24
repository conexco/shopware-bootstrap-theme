{block name="frontend_index_left_categories"}
    {* Container for the sidebar *}
    {block name="frontend_advisor_content_sidebar"}
        <div class="advisor-content-sidebar advisor-state-{$advisorState} content-sidebar-position-{$position}" data-advisor-sidebar="true" data-minQuestions="{$advisor['minMatchingAttributes']}">
            <div class="advisor--sidebar">
                {block name="frontend_advisor_content_sidebar_form"}
                    {* sidebar-questions-form is needed for filter reset *}
                    <form class="sidebar-questions-form sw5-plugin" method="post" action="{url action=save controller=advisor advisorId={$advisor['id']} hash={$advisorHash}}">
                        <input type="hidden" name="advisorId" value="{$advisor['id']}" />
                        <div class="panel panel-default">
                            {block name="frontend_advisor_content_sidebar_header"}
                                <div class="panel-heading">
                                    {$advisor['name']}
                                </div>
                            {/block}
                            {* Contains all questions *}
                            {block name="frontend_advisor_content_sidebar_questions"}
                                <ul class="list-group">
                                    {foreach $advisor['questions'] as $question}
                                        {block name="frontend_advisor_content_sidebar_question_ct"}
                                            <li class="advisor-question sw5-plugin list-group-item{if $question['template'] == 'range_slider'} advisor-price{/if}">
                                                {include file="frontend/advisor/sidebar/question.tpl" isFirst={$question@first}}
                                            </li>
                                        {/block}
                                    {/foreach}
                                </ul>
                            {/block}

                            {block name="frontend_advisor_content_sidebar_buttons"}
                                <div class="advisor-sidebar-buttons">

                                    {$minimumAnswers = $advisor['minMatchingAttributes']}
                                    {if $minimumAnswers >= 0}
                                        <div class="sidebar-buttons-warning sw5-plugin"{if $minimumAnswers == 0 || $advisor['answeredQuestions']|count >= $minimumAnswers} style="display: none;"{/if}>
                                            {$messagePart1 = {"{s namespace='frontend/advisor/main' name='MinimumAnswersWarning1'}Please give at least{/s}"}}
                                            {$messagePart2 = {"{s namespace='frontend/advisor/main' name='MinimumAnswersWarning2'}more answer(s){/s}"}}

                                            {$message = "`$messagePart1` <span class='sidebar-buttons-minimum-answers sw5-plugin'>`$minimumAnswers`</span> `$messagePart2`"}
                                            {include file="frontend/_includes/messages.tpl" type="warning" content=$message}
                                        </div>
                                    {/if}

                                    {block name="frontend_advisor_content_sidebar_button_submit"}
                                        <button type="submit" class="advisor-submit-btn sw5-plugin btn-block btn btn-primary" disabled="disabled">
                                            {$advisor['buttonText']|truncate:20}
                                        </button>
                                    {/block}

                                    {block name="frontend_advisor_content_sidebar_button_reset"}
                                        <a class="advisor-reset-advisor-btn sw5-plugin btn-block btn btn-default" title="{s name="ResetAdvisorBtnText" namespace="frontend/advisor/main"}Reset advisor{/s}" href="{$advisorResetUrl}">
                                            {s name="ResetAdvisorBtnText" namespace="frontend/advisor/main"}Reset advisor{/s}
                                        </a>
                                    {/block}
                                </div>
                            {/block}

                            {* Displays the "required fields" info *}
                            {block name="frontend_advisor_content_sidebar_required_info"}
                                {if $advisor['hasRequired'] == true}
                                    <div class="advisor-required-info mhm mbm">
                                        ** {s name="RequiredInfo" namespace="frontend/advisor/main"}Required fields{/s}
                                    </div>
                                {/if}
                            {/block}
                        </div>
                    </form>
                {/block}
            </div>
        </div>
    {/block}
{/block}