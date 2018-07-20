{$configurator = $sArticle.sConfigurator}

{* TODO: check if cards, thumbnails, or sth. else should be used *}
{block name='frontend_detail_configurator_variant'}
    {block name='frontend_detail_configurator_variant_form'}
        <form method="post" action="{url sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}" 
              class="config-variant-form configurator-form sw5-plugin">

            {foreach $configurator as $configuratorGroup}
                {block name='frontend_detail_configurator_variant_group'}

                    {block name='frontend_detail_configurator_variant_group_name'}
                        <label class="col-form-label h3">{$configuratorGroup.groupname}</label>
                    {/block}

                    {block name='frontend_detail_configurator_variant_group_options'}
                        <div class="configurator-variant mb-3">
                            {foreach $configuratorGroup.values as $option}
                                {block name='frontend_detail_configurator_variant_group_option'}
                                    <div class="variant-option form-check form-check-inline mr-0">
                                        {block name='frontend_detail_configurator_variant_group_option_input'}
                                            <input type="radio"
                                                   id="group[{$option.groupID}][{$option.optionID}]"
                                                   name="group[{$option.groupID}]"
                                                   value="{$option.optionID}"
                                                   title="{$option.optionname}"
                                                   class="form-check-input" 
                                                   {if $theme.ajaxVariantSwitch}data-ajax-select-variants="true"{else}data-auto-submit="true"{/if}
                                                   {if !$option.selectable}disabled="disabled"{/if}
                                                   {if $option.selected && $option.selectable}checked="checked"{/if} />
                                        {/block}
                                        {block name='frontend_detail_configurator_variant_group_option_label'}
                                            <label for="group[{$option.groupID}][{$option.optionID}]"
                                                   class="form-check-label">
                                                {if $option.media}
                                                    {$media = $option.media}
                                                    {block name='frontend_detail_configurator_variant_group_option_label_image'}
                                                        {if isset($media.thumbnails)}
                                                            <img srcset="{$media.thumbnails[0].sourceSet}" 
                                                                 alt="{$option.optionname}" 
                                                                 class="img-thumbnail" />
                                                        {else}
                                                            <img src="{link file='frontend/_public/src/img/no-picture.png'}" 
                                                                 alt="{$option.optionname}" 
                                                                 class="img-thumbnail">
                                                        {/if}
                                                    {/block}
                                                {else}
                                                    {block name='frontend_detail_configurator_variant_group_option_label_text'}
                                                        <div class="mr-2">
                                                            {$option.optionname}
                                                        </div>
                                                    {/block}
                                                {/if}
                                            </label>
                                        {/block}
                                    </div>
                                {/block}
                            {/foreach}
                            <div class="clearfix"></div>
                        </div>
                    {/block}
                {/block}
            {/foreach}
        </form>
    {/block}
{/block}

{block name='frontend_detail_configurator_variant_reset'}
    {include file="frontend/detail/config_reset.tpl"}
{/block}
