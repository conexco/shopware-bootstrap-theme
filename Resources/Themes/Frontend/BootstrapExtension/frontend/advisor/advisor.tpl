{block name="frontend_advisor_content"}
    <div class="advisor-content row">
        {$isSideBarMode = $advisor['mode'] == 'sidebar_mode'}

        {* Intended to be double included *}
        {if $isSideBarMode}
            <div class="col-xs-12 col-md-4 col-lg-3">
                {block name="frontend_advisor_content_sidebar_upper"}
                    {include file="frontend/advisor/sidebar.tpl" position='upper'}
                {/block}
            </div>
        {/if}

        {* The main advisor content *}
        {block name="frontend_advisor_content_main"}
            {if $isSideBarMode}
                <div class="col-xs-12 col-md-8 col-lg-9">
            {else}
                <div class="col-xs-12">
            {/if}
                <div class="advisor-content-inner
                    {if $isSideBarMode} advisor-sidebar-content{/if}
                    {if !$isSideBarMode && $advisorState === 'listing'} advisor--wizard-listing-content{/if}
                    {if $advisorErrors} advisor-error-content{/if}">
                    {if !$advisorErrors}
                        {block name="frontend_advisor_content_main_default"}
                            {$template = "frontend/advisor/{$advisorState}.tpl"}
                            {if $template|template_exists}
                                {include file=$template}
                            {/if}
                        {/block}
                    {else}
                        {block name="frontend_advisor_content_main_error"}
                            {include file="frontend/advisor/error.tpl"}
                        {/block}
                    {/if}
                </div>
            </div>
        {/block}

        {* Intended to be double included *}
        {if $isSideBarMode && $advisorState == 'start'}
            {block name="frontend_advisor_content_sidebar_lower"}
                {include file="frontend/advisor/sidebar.tpl" position='lower'}
            {/block}
        {/if}
    </div>
{/block}
