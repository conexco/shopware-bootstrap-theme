{* The teaser image *}
{block name="frontend_advisor_start_teaser"}
    {if $advisor['teaser']}
        <div class="content-inner-advisor-teaser">
            {block name="frontend_advisor_start_teaser_container"}
                <div class="advisor-teaser">
                    {include file="frontend/advisor/teaser.tpl"}
                </div>
            {/block}
        </div>
    {/if}
{/block}

{* The advisor-name, -description and the starting button *}
{block name="frontend_advisor_start_main"}
    <div class="content-inner--main">
        {block name="frontend_advisor_start_main_name"}
            <div class="main--advisor-name">
                <h1>{$advisor['name']}</h1>
            </div>
        {/block}

        {block name="frontend_advisor_start_main_text"}
            <div class="main--advisor-text">
                {$advisor['description']}
            </div>
        {/block}

        {if !$isSideBarMode}
            {block name="frontend_advisor_start_main_button"}
                <div class="main-advisor-start">
                    <a class="btn btn-primary" href="{$advisor['firstQuestionUrl']}">
                        {s name="StartAdvisorText" namespace="frontend/advisor/main"}Start advisor{/s}
                    </a>
                </div>
            {/block}
        {/if}
    </div>
{/block}