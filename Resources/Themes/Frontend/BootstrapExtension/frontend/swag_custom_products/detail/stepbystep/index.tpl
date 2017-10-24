{namespace name="frontend/detail/option"}

{block name="frontend_detail_swag_custom_products_wizard"}

    {* the button to open the modal with the wizard *}
    {block name="frontend_detail_swag_custom_products_wizard_open_button"}
        <div class="phm pbm">
            <a href="#" class="btn btn-default btn-block custom-products--open-wizard sw5-plugin" data-toggle="modal" data-target="#customProductsWizard" data-backdrop="static" title="{s name="detail/index/btn/configure"}Configure now{/s}">
                {s name="detail/index/btn/configure"}Configure now{/s}
            </a>
        </div>    
    {/block}

    {* the wizard content *}
    {block name="frontend_detail_swag_custom_products_wizard_modal_content"}
        <div id="customProductsWizard" class="modal" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Schließen"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">{$swagCustomProductsTemplate['display_name']}</h4>
                    </div>
                    <div class="custom-products--wizard-container sw5-plugin">
                        <div class="modal-body">
                            {block name="frontend_detail_swag_custom_products_wizard_modal_content_option_allocation"}
                                {$options = $swagCustomProductsTemplate['options']}
                            {/block}

                            {block name="frontend_detail_swag_custom_products_wizard_modal_content_content"}
                                {block name="frontend_detail_swag_custom_products_wizard_modal_content_options"}
                                    <div class="wizard-container-options">
                                        {foreach $options as $option}
                                            {$path="frontend/swag_custom_products/options/{$option['type']}.tpl"}

                                            {if $path|template_exists}
                                                <div class="custom-products-option is-wizard
                                                    {if $option@first} is-first is-active{else} is--hidden{/if}
                                                    {if $option@last} is-last{/if}"

                                                    {if $option['required']} data-swag-custom-products-required="true"{/if}>
                                                    {$addSurcharge = ""}
                                                    {* Once price for the option *}
                                                    {block name="frontend_detail_swag_custom_products_options_once_price"}
                                                        {if $option['is_once_surcharge']}
                                                            {$addSurcharge = "(+ {$option['surcharge']|currency}&nbsp;{s name="detail/option/once_price"}{/s})"}
                                                        {else}
                                                            {* Surcharge price for the option *}
                                                            {block name="frontend_detail_swag_custom_products_options_surcharges_price"}
                                                                {if $option['surcharge']}
                                                                    {$packUnit = $sArticle.packunit}

                                                                    {if !$packUnit}
                                                                        {$packUnit="{s name='detail/index/surcharge_price_unit'}{/s}"}
                                                                    {/if}

                                                                    {$addSurcharge = "(+ {$option['surcharge']|currency} / {$packUnit})"}
                                                                {/if}
                                                            {/block}
                                                        {/if}
                                                    {/block}

                                                    <strong>
                                                        {$option['name']}{if $option['required']}&nbsp;**{/if}
                                                        <small>&nbsp;{$addSurcharge}</small>
                                                    </strong>  
                                                    {block name="frontend_detail_swag_custom_products_wizard_options_description"}
                                                        {if $option['description']}
                                                            <div class="option-description">
                                                                {$option['description']}
                                                            </div>
                                                        {/if}
                                                    {/block}

                                                    {* Include the actual option template file *}
                                                    <div class="custom-products-{$option['type']|lower} custom-product-option-wrapper-wizard sw5-plugin">
                                                        {include file=$path key=$option@index}

                                                        {* Option actions *}
                                                        {block name="frontend_detail_swag_custom_products_options_actions"}
                                                            <div class="custom-product-interactive-bar mvs">
                                                                <div class="custom-products-option-actions">
                                                                    {block name="frontend_detail_swag_custom_products_options_reset_action"}
                                                                        <span class="btn btn-default btn-xs custom-products-option-reset"
                                                                              data-custom-products-reset="true">
                                                                            <i class="fa fa-times mrs"></i>
                                                                            {s name="detail/index/reset_values"}reset{/s}
                                                                        </span>
                                                                    {/block}
                                                                </div>
                                                            </div>
                                                        {/block}
                                                    </div>
                                                </div>
                                            {/if}
                                        {/foreach}
                                    </div>
                                {/block}

                                {* surcharges *}
                                {block name="frontend_detail_swag_custom_products_wizard_modal_content_surcharges"}
                                    <div class="wizard-container-surcharges">
                                        {block name="frontend_detail_swag_custom_products_wizard_modal_content_surcharges_container"}
                                            <div class="custom-products-global-calculation-overview">
                                                {include file="frontend/swag_custom_products/detail/surcharges.tpl"}
                                            </div>
                                        {/block}
                                    </div>
                                {/block}  
                            {/block}

                            {* the navigation bar *}
                            {block name="frontend_detail_swag_custom_products_wizard_modal_content_navigation"}
                                <div class="row wizard-container-navigation">
                                    <div class="col-xs-6">
                                        {block name="frontend_detail_swag_custom_products_wizard_modal_content_navigation_select"}
                                            <select class="form-control navigation-select sw5-plugin">
                                                {foreach $options as $option}
                                                    <option value="{$option@index}">{$option['name']}{if $option['required']}&nbsp;**{/if}</option>
                                                {/foreach}
                                            </select>
                                        {/block}
                                    </div>
                                    <div class="col-xs-6 text-right">
                                        {block name="frontend_detail_swag_custom_products_wizard_modal_content_navigation_back"}
                                            <button type="button" class="btn btn-default custom-products-navigation-btn-left sw5-plugin">
                                                <i class="fa fa-angle-left mrs"></i> {s name="detail/index/wizard/navigation/back"}Back{/s}
                                            </button>
                                        {/block}

                                        {block name="frontend_detail_swag_custom_products_wizard_modal_content_navigation_next"}
                                            <button type="button" class="btn btn-default custom-products-navigation-btn-right sw5-plugin">
                                                {s name="detail/index/wizard/navigation/next"}Next{/s} <i class="fa fa-angle-right mls"></i>
                                            </button>
                                        {/block}
                                    </div>
                                </div>
                            {/block}
                        </div>
                        <div class="modal-footer">
                            {block name="frontend_detail_swag_custom_products_wizard_modal_content_required"}
                                <div class="wizard-container-required-label text-left">
                                    <small>** {s name="detail/index/wizard/required/field"}Required field{/s}</small>
                                </div>
                            {/block}
                            {block name="frontend_detail_swag_custom_products_wizard_modal_content_take_configuratin_button"}
                                <button type="button" class="btn btn-primary take-configuration" data-dismiss="modal">
                                    {s name="detail/index/wizard/assume/configuration"}Assume configuration{/s}
                                </button>
                            {/block}
                        </div>
                    </div>
                </div>
            </div>        
        </div>    
    {/block}
{/block}