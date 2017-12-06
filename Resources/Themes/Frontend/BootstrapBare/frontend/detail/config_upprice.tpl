{block name="frontend_detail_config_upprice_form"}
    <form method="post" action="{url sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}" class="config-upprice-form configurator-form sw5-plugin">
        {block name="frontend_detail_config_upprice_form_inner"}
            {foreach $sArticle.sConfigurator as $sConfigurator}
                {block name="frontend_detail_config_upprice_form_group"}
                    <div class="form-group">
                        {block name="frontend_detail_config_upprice_form_group_inner"}
                            {* Group name *}
                            {block name='frontend_detail_group_name'}
                                <label>{$sConfigurator.groupname}</label>
                            {/block}

                            {* Group description *}
                            {if $sConfigurator.groupdescription}
                                {block name='frontend_detail_group_description'}
                                    <span class="help-block">{$sConfigurator.groupdescription}</span>
                                {/block}
                            {/if}

                            {* Configurator drop down *}
                            {block name='frontend_detail_group_selection'}
                                <select name="group[{$sConfigurator.groupID}]"{if $theme.ajaxVariantSwitch} data-ajax-select-variants="true"{else} data-auto-submit="true"{/if} class="form-control">
                                    {block name="frontend_detail_config_upprice_select_inner"}
                                        {foreach $sConfigurator.values as $configValue}
                                            {if !{config name=hideNoInstock} || ({config name=hideNoInstock} && $configValue.selectable)}
                                                <option {if $configValue.selected}selected="selected"{/if} value="{$configValue.optionID}">
                                                    {$configValue.optionname}{if $configValue.upprice} {if $configValue.upprice > 0}{/if}{/if}
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