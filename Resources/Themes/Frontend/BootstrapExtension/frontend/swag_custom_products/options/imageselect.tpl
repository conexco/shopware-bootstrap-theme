{namespace name="frontend/detail/option"}

{block name="frontend_detail_swag_custom_products_options_imageselection_fields"}
    {$type = 'radio'}

    {if $option.allows_multiple_selection}
        {$type = "checkbox"}
    {/if}

    <div id="custom-products-option-{$key}" class="wizard-input custom-products-color-selection-wrapper" data-group-field="true"{if $option['required']} data-validate-group="true" data-validate-message="{s name='detail/validate/image_selection'}{/s}"{/if}>
        {foreach $option['values'] as $value}
            {block name="frontend_detail_swag_custom_products_options_imageselection_element"}
                <div class="custom-products-image-selection card card-body mbm">

                    {block name="frontend_detail_swag_custom_products_options_imageselection_hidden_input"}
                        <input type="{$type}" id="custom-products-color-selection-{$key}-{$value@index}"
                               class="hidden"
                               name="custom-option-id--{$option['id']}[]"
                               value="{$value['id']}"
                               data-field="true"
                               {if $value['is_default_value']}checked="checked" data-default-value="{$value['id']}"{/if}
                               {if $value['required']} required="required"{/if}
                        >
                    {/block}

                    {block name="frontend_detail_swag_custom_products_options_imageselection_label"}
                        <label class="custom-products-image-selection-label text-center" for="custom-products-color-selection-{$key}-{$value@index}">
                            {block name="frontend_detail_swag_custom_products_options_imageselection_color"}
                                {if $value['image']}
                                    {$valueMedia = $value['image']}
                                    {$thumbnails = $valueMedia['thumbnails']}

                                    {if !empty($thumbnails)}
                                        {foreach $thumbnails as $image}
                                            {$srcSet = "{if $image@index !== 0}{$srcSet}, {/if}{$image['source']} {$image['maxWidth']}w"}
                                        {/foreach}
                                        <img class="color-selection-display-image img-fluid img-center" srcset="{$srcSet}" alt="{if $value['seo_title']}{$value['seo_title']|escapeHtml}{else}{$valueMedia['name']|escapeHtml}{/if}" itemprop="image" />
                                    {else}
                                        {$baseSource = $valueMedia['file']}
                                        <img class="color-selection-display-image img-fluid img-center" src="{$baseSource}" alt="{$valueMedia['name']|escapeHtml}" itemprop="image" />
                                    {/if}
                                {/if}
                            {/block}

                            {block name="frontend_detail_swag_custom_products_options_imageselection_description"}
                                <div class="custom-products-image-selection-description mts">
                                    {$value['name']}
                                </div>
                            {/block}

                            <div class="custom-products-image-selection-price">
                                {* Once price for the option *}
                                {if $value['is_once_surcharge']}
                                    {block name="frontend_detail_swag_custom_products_options_checkbox_once_price"}
                                        (+ {$value['surcharge']|currency}&nbsp;{s name="detail/option/once_price"}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                                    {/block}
                                {else}
                                    {* Surcharge price for the option *}
                                    {block name="frontend_detail_swag_custom_products_options_imageselection_surcharges_price"}
                                        {if $value['surcharge']}
                                            {$packUnit = $sArticle.packunit}

                                            {if !$packUnit}
                                                {$packUnit="{s name='detail/index/surcharge_price_unit'}{/s}"}
                                            {/if}

                                            (+ {$value['surcharge']|currency} / {$packUnit}{s name="Star" namespace="frontend/listing/box_article"}{/s})
                                        {/if}
                                    {/block}
                                {/if}
                            </div>
                        </label>
                    {/block}
                </div>
            {/block}
        {/foreach}
    </div>
{/block}