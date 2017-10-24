<div id="advisor-listing-container sw5-plugin" class="advisor-listing-error">
    {block name="frontend_advisor_result_no_results"}
        {block name="frontend_advisor_result_no_results_title"}
            <h3 class="advisor-no-results-title">
                {s name="noResultTitle" namespace="frontend/advisor/error"}No results were found!{/s}
            </h3>
        {/block}

        {block name="frontend_advisor_result_no_results_text"}
            <p class="advisor-no-results-text">
                {s name="noResultText" namespace="frontend/advisor/error"}Sadly there are no matching results for your selection.{/s}
            </p>
        {/block}

        {if $advisor['mode'] === 'wizard_mode'}
            {block name="frontend_advisor_result_no_results_button"}
                <a class="btn btn-primary no-results-button-return" href="{$advisor['lastQuestionUrl']}">
                    {s name="LastQuestionBtnText" namespace="frontend/advisor/main"}Return to last question{/s}
                </a>
            {/block}
        {/if}
    {/block}
</div>