{namespace name="frontend/account/login"}

{* Error messages *}
{block name='frontend_register_login_error_messages'}
    {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
{/block}

{* Existing customer *}
{block name='frontend_register_login_customer'}
    <div class="panel panel-default">
        {block name='frontend_register_login_customer_title'}
            <div class="panel-heading">
                {s name="LoginHeaderExistingCustomer"}{/s}
            </div>
        {/block}
        <div class="panel-body">
            {block name='frontend_register_login_form'}
                {if $register.personal.sValidation}
                    {$url = {url controller=account action=login sTarget=$sTarget sTargetAction=$sTargetAction sValidation=$register.personal.sValidation} }
                {else}
                    {$url = {url controller=account action=login sTarget=$sTarget sTargetAction=$sTargetAction} }
                {/if}

                <form name="sLogin" method="post" action="{$url}" class="form-horizontal">
                    {if $sTarget}<input name="sTarget" type="hidden" value="{$sTarget|escape}"/>{/if}
                    <fieldset>
                        {block name='frontend_register_login_description'}
                            <span class="help-block">{s name="LoginHeaderFields"}{/s}</span>
                        {/block}

                        {block name='frontend_register_login_input_email'}
                            <div class="form-group{if $sErrorFlag.email} has-error{/if}">
                                <label for="email" class="{$FormLabelSize} control-label">{s name='LoginLabelMail'}{/s}</label>
                                <div class="{$FormInputSize}">
                                    <input name="email" type="email" autocomplete="email" tabindex="1" value="{$sFormData.email|escape}" id="email" class="form-control"/>
                                </div>
                            </div>
                        {/block}

                        {block name='frontend_register_login_input_password'}
                            <div class="form-group {if $sErrorFlag.password} has-error{/if}">
                                <label class="{$FormLabelSize} control-label" for="password">{s name="LoginLabelPassword"}{/s}</label>
                                <div class="{$FormInputSize}">
                                    <input name="password" type="password" autocomplete="current-password" tabindex="2" id="password" class="form-control"/>
                                    {block name='frontend_register_login_input_lostpassword'}
                                        <span class="help-block">
                                            <a href="{url controller=account action=password}" title="{s name='LoginLinkLostPassword'}{/s}">{s name="LoginLinkLostPassword"}{/s}</a>
                                        </span>
                                    {/block}
                                </div>
                            </div>
                        {/block}

                        {block name='frontend_register_login_input_form_submit'}
                            <div class="form-group mbn">
                                <div class="{$FormInputSize} {$FormLabelOffset}">
                                    <input class="btn btn-primary" type="submit" value="{s name='LoginLinkLogon'}{/s}" name="Submit"/>
                                </div>
                            </div>
                        {/block}
                    </fieldset>
                </form>
            {/block}
        </div>
    </div>
{/block}
