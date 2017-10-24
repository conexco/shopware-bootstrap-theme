{namespace name="frontend/detail/option"}

{* Index file for the options. This file will load the associated options *}
{block name="frontend_detail_swag_custom_products_options_index"}
    {$customProducts = $swagCustomProductsTemplate}
    {$options = $customProducts['options']}

    {* Options container *}
    {block name="frontend_detail_swag_custom_products_options"}
        {* Do we have to show a notice for required fields? *}
        {$displayRequiredInfo = false}

        {* Terminate if the configuration has a required field *}
        {foreach $options as $option}
            {if $option['required']}
                {$displayRequiredInfo = true}
                {break}
            {/if}
        {/foreach}

        {* Loads the template file by the option name *}
        <div class="custom-products-options">
            <input type="hidden" name="template-id" value="{$customProducts['id']}">

            {foreach $options as $option}
                {$path="frontend/swag_custom_products/options/{$option['type']}.tpl"}

                {if $path|template_exists}
                    <div class="custom-products-option sw5-plugin{if $option@first} is-first{/if}{if $option@last} is-last{/if}"{if $option['required']} data-swag-custom-products-required="true"{/if}>

                        {* Label *}
                        {block name="frontend_detail_swag_custom_products_options_label"}
                            <label for="custom-products-option-{$option@index}" class="custom-products-label pam sw5-plugin{if !$option['required']} collapsed{/if}" data-toggle="collapse" data-target="#custom-products-option-{$option@index}" data-label="{$option['name']}">
                                {$option['name']}{if $option['required']}&nbsp;**{/if}

                                {$surcharge = $option['surcharge']}
                                {if $surcharge != 0.00}
                                    {* Once price for the option *}
                                    {block name="frontend_detail_swag_custom_products_options_once_price"}
                                        {if $option['is_once_surcharge']}
                                            (+ {$surcharge|currency}&nbsp;{s name="detail/index/once_price"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                                        {/if}
                                    {/block}

                                    {block name="frontend_detail_swag_custom_products_options_surcharges_price"}
                                        {if !$option['is_once_surcharge']}
                                            {$packUnit = $sArticle.packunit}

                                            {if !$packUnit}
                                                {$packUnit= "{s name='detail/index/surcharge_price_unit'}{/s}"}
                                            {/if}

                                            (+ {$surcharge|currency} / {$packUnit}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                                        {/if}
                                    {/block}
                                {/if}

                                <i class="fa fa-angle-up pull-right"></i>
                            </label>
                        {/block}

                        {* Include the actual option template file *}
                        <div id="custom-products-option-{$option@index}" class="collapse{if $option['required']} in{/if}">
                            <div class="custom-product-option-wrapper sw5-plugin pam custom-products-{$option['type']|lower}">
                                {include file=$path key=$option@index}

                                <div class="custom-product-interactive-bar mtm">
                                    {* Option actions *}
                                    {block name="frontend_detail_swag_custom_products_options_actions"}
                                        <div class="custom-products-option-actions">

                                            {block name="frontend_detail_swag_custom_products_options_reset_action"}
                                                <span class="btn btn-default btn-xs custom-products-option-reset" data-custom-products-reset="true">
                                                    <i class="fa fa-times mrs"></i>    
                                                    {s name="detail/index/reset_values"}{/s}
                                                </span>
                                            {/block}
                                        </div>
                                    {/block}

                                    {* add the description for each option *}
                                    {block name="frontend_detail_swag_custom_products_options_description"}
                                        {if $option['description']}
                                            {block name="frontend_detail_swag_custom_products_options_description_link"}
                                                <div class="modal fade" id="custom-product-modal-content{$option['id']}" tabindex="-1" role="dialog">
                                                    <div class="modal-dialog modal-md" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                <h4 class="modal-title" id="exampleModalLabel">{s name='detail/index/btn/read/description'}{/s}</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                {$option['description']}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="custom-products-option-description-link text-right">    
                                                    <a class="text-primary"
                                                       href="#"  
                                                       data-toggle="modal"
                                                       data-target="#custom-product-modal-content{$option['id']}"
                                                       title="{s name='detail/index/btn/read/description'}{/s}">
                                                        {s name="detail/index/btn/read/description"}{/s}&nbsp;
                                                    </a>
                                                </div>
                                            {/block}
                                        {/if}
                                    {/block}
                                </div>
                            </div>  
                        </div>    
                    </div>
                {/if}
            {/foreach}

            {block name="frontend_detail_custom_products_actions_footer"}
                <div class="panel-footer pam">
                    {* Global form actions *}
                    {block name="frontend_detail_custom_products_actions"}
                        <span class="btn btn-default btn-sm mbm custom-products-global-reset sw5-plugin">
                            <span class="fa fa-times mrs"></span>
                            {s name="detail/index/reset_configuration"}{/s}
                        </span>
                    {/block}

                    {* Do we have to show a notice for required fields? *}
                    {block name="frontend_detail_custom_products_required_info"}
                        {if $displayRequiredInfo}
                            <div class="custom-products-required-field-info mbm">
                                <small>**&nbsp;{s name="detail/option/index/required_field_info"}{/s}</small>
                            </div>
                        {/if}
                    {/block}
                </div>
            {/block}
        </div>
    {/block}
{/block}
