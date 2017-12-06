{namespace name="frontend/advisor/main"}

<div class="advisor-wizard" data-advisor-wizard="true">
    {block name="frontend_advisor_content_wizard_title"}
        <h3 class="page-header">
            {$advisor['name']}
        </h3>
    {/block}

    {* Builds a warning message which shows all required fields missing *}
    {block name="frontend_advisor_content_wizard_warning_required"}
        {if $missingQuestions}
            {block name="frontend_advisor_content_wizard_warning_message"}
                {$message = "{s name='RequiredFieldsMissingMessage'}The following questions have yet to be answered:{/s} <br /><ul class='advisor-wizard--warning-ul'>"}
                {foreach $missingQuestions as $missingQuestion}
                    {$message = "`$message` <li class='advisor-wizard--warning-li'><a href='`$missingQuestion['questionUrl']`'>`$missingQuestion['question']`</a>"}
                {/foreach}
                {$message = "`$message` </ul>"}
            {/block}

            {block name="frontend_advisor_content_wizard_warning"}
                {include file="frontend/_includes/messages.tpl" type="warning" content=$message}
            {/block}
        {/if}
    {/block}

    {* Contains the progress-bar and the currently active step *}
    {block name="frontend_advisor_content_wizard_progress"}
        <div class="advisor-wizard-progress text-center">
            {block name="frontend_advisor_content_wizard_progress_width"}
                {$width = ($advisor['currentQuestionIndex'] / $advisor['questionCount']) * 100}
            {/block}

            {block name="frontend_advisor_content_wizard_progress_step"}
                {$advisor['currentQuestionIndex']} {s name="WizardQuestionCountDelimiter"}/{/s} {$advisor['questionCount']}
            {/block}

            {block name="frontend_advisor_content_wizard_progress_bar"}
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: {$width}%;">
                        <span class="sr-only">{$width}% Complete</span>
                    </div>
                </div>
            {/block}
        </div>
    {/block}

    {block name="frontend_advisor_content_wizard_question_form"}
        <form method="post" data-save-url="{url controller=advisor action=quickSave hash=$advisorHash}" action="{$advisorNextQuestion}">
            {* Contains the main question-data (Question itself, question text and the grid, if necessary) *}
            {block name="frontend_advisor_content_wizard_question"}
                {$question = $advisor['currentQuestion']}
                <div class="advisor-wizard-question sw5-plugin"{if $question['required']} data-advisor-required="required"{/if}>
                    {block name="frontend_advisor_content_wizard_question_title"}
                        <h4 class="text-center">
                            {$question['question']} {if $question['required']}**{/if}
                        </h4>
                    {/block}

                    {block name="frontend_advisor_content_wizard_question_info"}
                        {if $question['infoText']}
                            <div class="wizard-question-info text-center">
                                {$question['infoText']}
                            </div>
                        {/if}
                    {/block}

                    {block name="frontend_advisor_content_wizard_question_content"}
                        <div class="wizard-question-content mbl-xs">
                            {block name="frontend_advisor_content_wizard_question_key"}
                                <input type="hidden"
                                       name="questionKey"
                                       value="{$question['id']|escapeHtml}"/>
                            {/block}

                            {if $question['template'] === 'radio_image' || $question['template'] === 'checkbox_image'}
                                {include file="frontend/advisor/wizard/grid.tpl"}
                            {else}
                                {include file="frontend/advisor/wizard/options.tpl"}
                            {/if}
                        </div>
                    {/block}
                </div>
            {/block}

            {* Contains the wizard-actions, e.g. the next- and back-button *}
            {block name="frontend_advisor_content_wizard_actions"}
                <div class="advisor-wizard-actions mbm row">
                    <div class="col-12 col-sm-6">
                        <div class="row">
                            {if $advisor['currentQuestionIndex'] != 1}
                                <div class="col-12 col-sm-6 col-lg-4">
                                    {block name="frontend_advisor_content_wizard_actions_back"}
                                        {block name="frontend_advisor_content_wizard_back_button"}
                                            <a class="advisor-wizard-back btn btn-secondary btn-block mbm-xs" href="{$advisorPreviousQuestion}" title="{s name="WizardBackButtonText"}Back{/s}">
                                                {s name="WizardBackButtonText"}Back{/s}
                                            </a>
                                        {/block}
                                    {/block}
                                </div>
                            {/if}
                            <div class="col-12 col-sm-6 col-lg-4">
                                {* The reset-advisor button *}
                                {block name="frontend_advisor_content_wizard_actions_reset"}
                                    <a class="advisor-reset-advisor-btn sw5-plugin btn btn-secondary btn-block" title="{s name="ResetAdvisorBtnText"}Reset advisor{/s}" href="{$advisorResetUrl}">
                                        {s name="ResetAdvisorBtnText" namespace="frontend/advisor/main"}Reset advisor{/s}
                                    </a>
                                {/block}
                            </div>
                        </div>

                    </div>
                    <div class="col-12 col-sm-6">
                        <div class="row">
                            <div class="col-12 col-sm-6 col-lg-offset-4 col-lg-4 pvm-xs">

                                {block name="frontend_advisor_content_wizard_actions_skip"}
                                    <select class="wizard-actions-question-select sw5-plugin" data-class="wizard-actions--question-js-select">
                                        {block name="frontend_advisor_content_wizard_actions_skip_empty"}
                                            <option class="advisor--empty-text" selected="selected" value="">
                                                {s name="JumpToQuestionText"}Skip to question{/s}
                                            </option>
                                        {/block}

                                        {* Do not change the name of $curQuestion to $question ! *}
                                        {foreach $advisor['questions'] as $curQuestion}
                                            {block name="frontend_advisor_content_wizard_actions_skip_condition"}
                                                {block name="frontend_advisor_content_wizard_actions_skip_option"}
                                                    <option data-question-url="{$curQuestion['questionUrl']}">
                                                        {$curQuestion['question']}
                                                        {if $curQuestion['required']}**{/if}
                                                    </option>
                                                {/block}
                                            {/block}
                                        {/foreach}
                                    </select>
                                {/block}
                            </div>
                            <div class="col-12 col-sm-6 col-lg-4">
                                {* The next-question button *}
                                {block name="frontend_advisor_content_wizard_actions_next"}
                                    {$disableButton = false}
                                    {if $question['template'] !== 'range_slider' && $question['required'] && !$question['answered']}
                                        {$disableButton = true}
                                    {/if}
                                    <div class="wizard-actions-next-button">
                                        {if $advisor['questionCount'] === $advisor['currentQuestionIndex']}
                                            {block name="frontend_advisor_content_wizard_start_button"}
                                                <button type="submit" class="btn btn-primary btn-block">
                                                    {$advisor['buttonText']}
                                                </button>
                                            {/block}
                                        {else}
                                            {block name="frontend_advisor_content_wizard_next_button"}
                                                <button type="submit" class="btn btn-primary btn-block">
                                                    {s name="WizardNextButtonText"}Next question{/s}
                                                </button>
                                            {/block}
                                        {/if}
                                    </div>
                                {/block}
                            </div>
                        </div>

                    </div>


                </div>

                {if $advisor['hasRequired'] == true}
                    <div class="wizard-required">** {s name="RequiredInfo"}Required questions{/s}</div>
                {/if}
            {/block}
        </form>
    {/block}
</div>