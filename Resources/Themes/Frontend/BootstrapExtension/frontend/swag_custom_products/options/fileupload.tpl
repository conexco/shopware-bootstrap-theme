{namespace name="frontend/detail/option"}

{* Field *}
{block name="frontend_detail_swag_custom_products_options_upload_field"}
    <div class="alert alert-danger is--hidden">
        <div class="alert-content sw5-plugin">
            {s name="upload/general_error"}{/s}
        </div>
    </div>

    {block name="frontend_detail_swag_custom_products_options_upload_wrapper"}
        <div class="custom-products-upload-wrapper text-center mbs"
             data-swag-custom-products-upload="true"
             data-uploadURL="{url module="widgets" controller="SwagCustomProducts" action="upload" fullPath}"
             data-templateId="{$swagCustomProductsTemplate['id']}"
             data-maxFiles="{$option['max_files']}"
             data-maxFileSize="{$option['max_file_size']}"
             data-optionId="{$option['id']}"
        >

            {block name="frontend_detail_swag_custom_products_options_upload_field"}
                <input type="file" name="custom-option-id--{$option['id']}[]"
                       class="upload-field"
                       {if $option['max_files'] > 1} multiple="multiple"{/if}
                       id="custom-products-option-{$key}"
                       data-field="true"
                        {if $option['required']}
                            data-validate="true"
                            data-validate-message-required="{s name="detail/validate/upload_required"}{/s}"
                        {/if}
               />
            {/block}

            {block name="frontend_detail_swag_custom_products_options_upload_label"}
                <label for="custom-products-option-{$key}" class="custom-products-upload-label pal">
                    <p>{s name="upload/drag_drop_label"}{/s}</p>
                    <p><strong class="upload-divider">{s name="upload/drag_drop_divider_label"}{/s}</strong></p>
                    <button class="btn btn-outline-secondary btn-sm upload-btn-select">{s name="upload/btn_label"}{/s}</button>
                </label>
            {/block}

            {block name="frontend_detail_swag_custom_products_options_upload_information"}
                <div class="custom-products-uploading-information sw5-plugin uploading-panel">
                    <p class="uploading-text">{s name="upload/currently_uploading"}{/s}</p>
                </div>
            {/block}

            {block name="frontend_detail_swag_custom_products_options_upload_failure"}
                <div class="custom-products-uploading-failure sw5-plugin uploading-panel text-danger">
                    <i class="fa fa-times"></i>

                    <p class="uploading-text too-much-files">{s name="upload/too_much_files"}{/s}</p>
                    <p class="uploading-text max-file-size">{s name="upload/max_file_size"}{/s}</p>
                    <p class="uploading-text duplicate-name">{s name="upload/duplicate_name"}{/s}</p>
                </div>
            {/block}

            {block name="frontend_detail_swag_custom_products_options_upload_success"}
                <div class="custom-products-uploading-success sw5-plugin uploading-panel text-success">
                    <i class="fa fa-check"></i>

                    <p class="uploading-text">{s name="upload/added_successfully"}{/s}</p>
                </div>
            {/block}
        </div>
    {/block}

    {block name="frontend_detail_swag_custom_products_options_upload_config"}
        <span class="uploading-is-required">{s name="upload/maximum_allowed"}{/s}</span>
    {/block}

    {* Will be filled using javascript *}
    {block name="frontend_detail_swag_custom_products_options_upload_list"}
        <div class="custom-products-upload-list sw5-plugin"></div>
    {/block}

    {block name="frontend_detail_swag_custom_products_options_upload_btn"}
        <button class="btn btn-primary mtm upload-btn-send-request sw5-plugin">
            {s name="upload/btn_upload_label"}{/s}
        </button>
    {/block}
{/block}
