{block name="frontend_data_protection_information"}
    <div class="{if !$footer}form-group{else}mtm{/if}">
        <div class="{if !$footer}{$FormLabelOffset} {$FormInputSize}{else}small{/if}">
            <p class="privacy-information mbn">
                {if {config name=ACTDPRCHECK} && !$hideCheckbox}
                    {block name="frontend_data_protection_information_checkbox"}
                        <div class="checkbox">
                            <label for="privacy-checkbox">
                                <input name="privacy-checkbox"
                                       type="checkbox"
                                       id="privacy-checkbox"
                                       required="required"
                                       aria-required="true"
                                       value="1"
                                       class="is-required"{if $smarty.post['privacy-checkbox']} checked{/if} />

                                {s name="PrivacyText" namespace="frontend/index/privacy"}{/s}
                            </label>
                        </div>
                    {/block}
                {elseif {config name=ACTDPRTEXT}}
                    {block name="frontend_data_protection_information_text"}
                        {s name="PrivacyText" namespace="frontend/index/privacy"}{/s}
                    {/block}
                {/if}
            </p>
        </div>
    </div>
{/block}