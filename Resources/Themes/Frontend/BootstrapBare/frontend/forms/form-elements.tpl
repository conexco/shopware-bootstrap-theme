{namespace name="frontend/forms/elements"}

{block name='frontend_forms_form_elements'}
    {capture name="formlabel"}<label class="control-label {$FormLabelSize}" {/capture}
    <form id="support" name="support" class="{$sSupport.class} form-horizontal" method="post"
        action="{url action='index' id=$id}" enctype="multipart/form-data">
        <input type="hidden" name="forceMail" value="{$forceMail|escape}">

        {* Form Content *}
        {block name='frontend_forms_form_elements_form_content'}
            <fieldset>
                {block name='frontend_forms_form_elements_form_builder'}
                    {foreach from=$sSupport.sElements item=sElement key=sKey}
                        {if $sSupport.sFields[$sKey]||$sElement.note}
                        
                            {$field = $sSupport.sFields[$sKey]|replace:'{literal}':''|replace:'{/literal}':''|replace:'%*%':"{s name='RequiredField' namespace='frontend/register/index'}{/s}"}

                            {if !$sSupport.sFields[$sKey]|strstr:"type=\"checkbox"}
                                <div class="form-group{if $sSupport.sFields[$sKey]|strpos:"instyle_error"} has-error{/if}{if $sSupport.sFields[$sKey]|strstr:"type=\"hidden"} hidden{/if}">
                                    {$sSupport.sLabels.$sKey|replace:'<label ':$smarty.capture.formlabel}
                                    <div class="{$FormInputSize}">
                                        {if $field|strstr:"class=\"strasse"}
                                            <div class="row">
                                                <div class="col-xs-9">
                                                    <input class="form-control required" value="" id="strasse;" name="strasse" type="text">
                                                </div>
                                                <div class="col-xs-3">
                                                    <input class="form-control required" value="" id="strasse;" name="" type="text">
                                                </div>
                                            </div>
                                        {elseif $field|strstr:"class=\"plz"}
                                            <div class="row">
                                                <div class="col-xs-4">
                                                    <input class="form-control required" value="" id="plz;ort" name="plz" type="text">
                                                </div>
                                                <div class="col-xs-8">
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
                                <div class="col-xs-12">
                                    <div class="captcha-placeholder" data-src="{url module=widgets controller=Captcha action=index}"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/block}

                {* Forms actions *}
                {block name='frontend_forms_elements_form_submit'}
                    <div class="form-group">
                        <div class="{$FormLabelOffset} {$FormInputSize}">
                            {* Data protection information *}
                            {block name='frontend_forms_form_elements_form_privacy'}
                                {if {config name=ACTDPRTEXT} || {config name=ACTDPRCHECK}}
                                    {include file="frontend/_includes/privacy.tpl"}
                                {/if}
                            {/block}
                            <span class="help-block required-info">{s name='SupportLabelInfoFields'}{/s}</span>
                            <input class="btn btn-primary" type="submit" name="Submit" value="{s name='SupportActionSubmit'}{/s}">
                        </div>
                    </div>
                {/block}
            </fieldset>
        {/block}
    </form>
{/block}
