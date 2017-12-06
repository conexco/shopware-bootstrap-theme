{namespace name="frontend/account/login"}

<div class="register-existing-customer panel panel-default">
    <div class="panel-heading">{s name="LoginHeaderExistingCustomer"}{/s}</div>
    <div class="panel-body">
        {block name='frontend_register_login_form'}
            <form name="sLogin" method="post" action="{$loginUrl}" class="form-horizontal">
                {if $sTarget}<input name="sTarget" type="hidden" value="{$sTarget|escape}" />{/if}
                <fieldset>
                    {block name='frontend_register_login_description'}
                        <div class="register-login-description help-block">{s name="LoginHeaderFields"}{/s}</div>
                    {/block}
                    <div class="form-group">
                        <label for="email" class="col-md-4 control-label">{s name="LoginLabelMail"}{/s}</label>
                        <div class="col-md-6">
                            <input name="email" type="email" tabindex="1" value="{$sFormData.email|escape}" id="email" class="register-login-field form-control{if $sErrorFlag.email} has-error{/if}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-md-4 control-label">{s name="LoginLabelPassword"}{/s}</label>
                        <div class="col-sm-6">
                            <input name="password" type="password" tabindex="2" id="passwort" class="register-login-field form-control{if $sErrorFlag.password} has-error{/if}" />
                            {block name='frontend_register_login_input_lostpassword'}
                                <div class="register-login-lostpassword">
                                    <div class="help-block">
                                        <a href="{url controller=account action=password}" title="{"{s name="LoginLinkLostPassword"}{/s}"|escape}">
                                            {s name="LoginLinkLostPassword"}{/s}
                                        </a>
                                    </div>
                                </div>
                            {/block}
                        </div>
                    </div>
                    <div class="col-md-offset-4 col-md-6">
                        {block name='frontend_register_login_input_form_submit'}
                            <div class="register-login-action">
                                <button type="submit" class="register-login-btn btn btn-primary" name="Submit">{s name="LoginLinkLogon"}{/s} <i class="icon-arrow-right"></i></button>
                            </div>
                        {/block}
                    </div>
                </fieldset>
            </form>
        {/block}
    </div>
</div>