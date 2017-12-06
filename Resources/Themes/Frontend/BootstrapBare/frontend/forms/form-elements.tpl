{namespace name="frontend/forms/elements"}

{block name='frontend_forms_form_elements'}
    {capture name="formlabel"}<label class="control-label {$FormLabelSize}" {/capture}
    <form id="support" name="support" class="{$sSupport.class} form-horizontal" method="post"
          action="{url controller='ticket' action='index' id=$id}" enctype="multipart/form-data">
        <input type="hidden" name="forceMail" value="{$forceMail|escape}">

        {* Form Content *}
        {block name='frontend_forms_form_elements_form_content'}
            {if $sSupport.sErrors.e || $sSupport.sErrors.v}
                <div class="alert alert-danger">
                    {if $sSupport.sErrors.v}
                        {foreach from=$sSupport.sErrors.v key=sKey item=sError}
                            {if $sKey !=0&&$sSupport.sElements.$sError.error_msg}<br/>{/if}
                            {$sSupport.sElements.$sError.error_msg}
                        {/foreach}
                        {if $sSupport.sErrors.e}<br/>{/if}
                    {/if}
                    {if $sSupport.sErrors.e}
                        {if $sSupport.sErrors.e['sCaptcha'] == true}
                            {$errorContent="{$errorContent}{s name='SupportInfoFillCaptcha' namespace="frontend/forms/elements"}{/s}"}
                        {else}
                            {s name='SupportInfoFillRedFields'}{/s}
                        {/if}
                    {/if}
                </div>
            {/if}

            <fieldset>
                {block name='frontend_forms_form_elements_form_builder'}
                    {foreach from=$sSupport.sElements item=sElement key=sKey}
                        {if $sSupport.sFields[$sKey]||$sElement.note}
                        
                            {$field = $sSupport.sFields[$sKey]|replace:'{literal}':''|replace:'{/literal}':''|replace:'%*%':"{s name='RequiredField' namespace='frontend/register/index'}{/s}"}

                            {if !$sSupport.sFields[$sKey]|strstr:"type=\"checkbox"}
                                <div class="form-group{if $sSupport.sFields[$sKey]|strpos:"instyle_error"} has-error{/if}">
                                    {$sSupport.sLabels.$sKey|replace:'<label ':$smarty.capture.formlabel}
                                    <div class="{$FormInputSize}">
                                        {if $field|strstr:"class=\"strasse"}
                                            <div class="row">
                                                <div class="col-9">
                                                    <input class="form-control required" value="" id="strasse;" name="strasse" type="text">
                                                </div>
                                                <div class="col-3">
                                                    <input class="form-control required" value="" id="strasse;" name="" type="text">
                                                </div>
                                            </div>
                                        {elseif $field|strstr:"class=\"plz"}
                                            <div class="row">
                                                <div class="col-4">
                                                    <input class="form-control required" value="" id="plz;ort" name="plz" type="text">
                                                </div>
                                                <div class="col-8">
                                                    <input class="form-control required" value="" id="plz;ort" name="ort" type="text">
                                                </div>
                                            </div>
                                        {elseif $field|strstr:"type=\"file"}
                                            {$field}
                                        {elseif $field|strstr:"id=\"telefon"}
                                            {$field|replace:'text':'tel'|replace:'normal':'form-control'}
                                        {elseif $field|strstr:"<select"}
                                            {$field|replace:'required="required"':''|replace:'normal':'form-control'}    
                                        {else}
                                            {$field|replace:'normal':'form-control'}
                                        {/if}
                                    </div>
                                    {if $sElement.note}
                                        <p class="help-block">
                                            {$sElement.note}
                                        </p>
                                    {/if}
                                </div>
                            {else}
                                <div class="form-group">
                                    <div class="{$FormLabelOffset} {$FormInputSize}">
                                        <div class="checkbox">
                                            <label>
                                                {$field} {$sElement.label}
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            {/if}
                        {/if}
                    {/foreach}
                {/block}

                {* Captcha *}
                {block name='frontend_forms_elements_form_captcha'}
                    <div class="form-group{if $sSupport.sErrors.e.sCaptcha} has-error{/if} captcha">
                        <div class="{$FormLabelOffset} {$FormInputSize}">
                            <div class="row">
                                <div class="col-12">
                                    <div class="captcha-placeholder" data-src="{url module=widgets controller=Captcha action=refreshCaptcha}"></div>
                                </div>
                                <div class="col-12">
                                    <p class="mtm"><small>{s name='SupportLabelCaptcha'}{/s}</small></p>
                                    <input type="text" name="sCaptcha" class="form-control mtm is-required" required="required" aria-required="true" />
                                </div>
                            </div>
                        </div>
                    </div>
                {/block}

                {* Forms actions *}
                {block name='frontend_forms_elements_form_submit'}
                    <div class="form-group">
                        <div class="{$FormLabelOffset} {$FormInputSize}">
                            <span class="help-block required-info">{s name='SupportLabelInfoFields'}{/s}</span>
                            <input class="btn btn-primary" type="submit" name="Submit" value="{s name='SupportActionSubmit'}{/s}">
                        </div>
                    </div>
                {/block}
            </fieldset>
        {/block}
    </form>
{/block}
