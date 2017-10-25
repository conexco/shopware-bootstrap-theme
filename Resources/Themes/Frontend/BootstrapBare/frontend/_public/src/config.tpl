{block name="swbt_config"}
    {*! Default Grid Sizing *}
    {block name="swbt_config_gridsizes"}
        {assign "side" "&lt;div class=\"col-md-`$theme['amount-left-columns']`\" id=\"gLeft\"&gt;"}
        {assign "center" "&lt;div class=\"col-md-{math equation="x-y" x=12 y=$theme['amount-left-columns']}\" id=\"gCenter\"&gt;"}
        {assign "full" "&lt;div class=\"col-md-12\" id=\"gFull\"&gt;"}
        {assign "close" "&lt;/div&gt;"}

        {if $grid eq "g011"}
            {assign "gridLeftStart" "" scope="global"}
            {assign "gridLeftEnd" "" scope="global"}
            {assign "gridCenterStart" "$center" scope="global"}
            {assign "gridCenterEnd" "$close" scope="global"}
            {assign "gridRightStart" "$side" scope="global"}
            {assign "gridRightEnd" "$close" scope="global"}
        {elseif $grid eq "g010"}
            {assign "gridLeftStart" "" scope="global"}
            {assign "gridLeftEnd" "" scope="global"}
            {assign "gridCenterStart" "$full" scope="global"}
            {assign "gridCenterEnd" "$close" scope="global"}
            {assign "gridRightStart" "" scope="global"}
            {assign "gridRightEnd" "" scope="global"}
        {else}
            {assign "gridLeftStart" "$side" scope="global"}
            {assign "gridLeftEnd" "$close" scope="global"}
            {assign "gridCenterStart" "$center" scope="global"}
            {assign "gridCenterEnd" "$close" scope="global"}
            {assign "gridRightStart" "" scope="global"}
            {assign "gridRightEnd" "" scope="global"}
        {/if}
    {/block}

    {*! Register Form Sizing *}
    {block name="swbt_config_formsizes"}
        {assign "FormInputSize" "col-md-6" scope="global"}
        {assign "FormLabelSize" "col-md-4" scope="global"}
        {assign "FormLabelOffset" "col-md-offset-4" scope="global"}
    {/block}

    {*! Breakpoints *}
    {block name="swbt_config_breakpoints"}
        {assign var="DefaultBreakpointMD" value=$theme['swf-screen-lg-min']|strip:"px"-1 scope="global"}
        {assign var="DefaultBreakpointHD" value=$theme['swf-screen-md-min']|strip:"px"-1 scope="global"}
        {assign var="DefaultBreakpointSM" value=$theme['swf-screen-hd-min']|strip:"px"-1 scope="global"}
        {assign var="DefaultBreakpointXS" value=$theme['swf-screen-sm-min']|strip:"px"-1 scope="global"}
    {/block}

    {*! Zoom Config *}
    {block name="swbt_config_zoom"}
        {if $theme['deactivate-zoom'] == 'xs'}
            {assign var="DeactivateZoom" value=$DefaultBreakpointXS scope="global"}
        {elseif $theme['deactivate-zoom'] === 'sm'}
            {assign var="DeactivateZoom" value=$DefaultBreakpointSM scope="global"}
        {elseif $theme['deactivate-zoom'] === 'hd'}
            {assign var="DeactivateZoom" value=$DefaultBreakpointHD scope="global"}
        {elseif $theme['deactivate-zoom'] === 'true'}
            {assign var="DeactivateZoom" value=0 scope="global"}
        {else}
            {assign var="DeactivateZoom" value=9999 scope="global"}
        {/if}
    {/block}

    {*! Background Image *}
    {block name="swbt_config_background_image"}
        {if $theme['body-bg-img'] == '' || $theme['body-bg-img'] == '"/"' || $theme['body-bg-img-repeat'] == 'hide'}
            {assign var="BodyBgImg" value=false scope="global"}
        {else}
            {assign var="BodyBgImg" value=$theme['body-bg-img'] scope="global"}
        {/if}
    {/block}
{/block}
