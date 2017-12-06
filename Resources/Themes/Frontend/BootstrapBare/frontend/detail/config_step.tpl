{block name='frontend_detail_configurator_error'}
    {if $sArticle.sError && $sArticle.sError.variantNotAvailable}
        <div class="alert alert-error">{s name='VariantAreNotAvailable'}Die ausgewählte Variante steht aktuell nicht zur Verfügung{/s}</div>
    {/if}
{/block}

{block name="frontend_detail_config_step_form"}
    <form method="post" action="{url sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}" class="config-step-form configurator-form sw5-plugin">
        {block name="frontend_detail_config_step_form_inner"}
            {foreach from=$sArticle.sConfigurator item=sConfigurator name=group key=groupID}
                {block name="frontend_detail_config_step_form_group"}
                    <div class="form-group">
                        {block name="frontend_detail_config_step_form_group_inner"}
                            {* Group name *}
                            {block name='frontend_detail_group_name'}
                                <label>{$sConfigurator.groupname}</label>
                            {/block}

                            {* Group description *}
                            {block name='frontend_detail_group_description'}
                                {if $sConfigurator.groupdescription}
                                    {block name='frontend_detail_group_description_inner'}
                                        <span class="help-block">
                                                {$sConfigurator.groupdescription}
                                            </span>
                                    {/block}
                                {/if}
                            {/block}

                            {$pregroupID=$groupID-1}
                            {* Configurator drop down *}
                            {block name='frontend_detail_group_selection'}
                                <select{if $groupID gt 0 && empty($sArticle.sConfigurator[$pregroupID].user_selected)} disabled="disabled"{/if} name="group[{$sConfigurator.groupID}]"{if $theme.ajaxVariantSwitch} data-ajax-select-variants="true"{else} data-auto-submit="true"{/if}>
                                    {block name="frontend_detail_config_step_select_inner"}
                                        {* Please select... *}
                                        {if empty($sConfigurator.user_selected)}
                                            <option value="" selected="selected">{s name="DetailConfigValueSelect"}{/s}</option>
                                        {/if}

                                        {foreach from=$sConfigurator.values item=configValue name=option key=optionID}
                                            {if !isset($configValue.active)||$configValue.active==1}
                                                <option {if !$configValue.selectable}disabled{/if} {if $configValue.selected && $sConfigurator.user_selected} selected="selected"{/if} value="{$configValue.optionID}">
                                                    {$configValue.optionname}{if $configValue.upprice && !$configValue.reset} {if $configValue.upprice > 0}{/if}{/if}
                                                    {if !$configValue.selectable}{s name="DetailConfigValueNotAvailable"}{/s}{/if}
                                                </option>
                                            {/if}
                                        {/foreach}
                                    {/block}
                                </select>
                            {/block}
                        {/block}
                    </div>
                {/block}
            {/foreach}
            {block name='frontend_detail_configurator_noscript_action'}
                <noscript>
                    <button name="recalc" type="submit" class="btn btn-sm btn-outline-secondary">
                        {s name='DetailConfigActionSubmit'}{/s}
                    </button>
                </noscript>
            {/block}
        {/block}
    </form>
{/block}

{block name='frontend_detail_configurator_step_reset'}
    {include file="frontend/detail/config_reset.tpl"}
{/block}

