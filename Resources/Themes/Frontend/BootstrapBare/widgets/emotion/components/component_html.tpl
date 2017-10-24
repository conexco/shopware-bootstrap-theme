{block name="widget_emotion_component_html_panel"}
    <div class="emotion-html sw5-plugin">
        {block name="widget_emotion_component_html_title"}
            {if $Data.cms_title}
                <div class="{if !$Data.needsNoStyling}page-header{/if}">
                    <h3>{$Data.cms_title}</h3>
                </div>
            {/if}
        {/block}
        {block name="widget_emotion_component_html_content"}
            <div class="html-content sw5-plugin">
                {$Data.text}
            </div>
        {/block}
    </div>
{/block}
