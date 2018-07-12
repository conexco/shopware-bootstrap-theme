{namespace name="frontend/account/login"}

{* Error messages *}
{block name='frontend_register_login_error_messages'}
    {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
{/block}

{* Existing customer *}
{block name='frontend_register_login_customer'}
    <div class="card mb-4">
        <div class="card-body">
            {block name='frontend_register_login_customer_title'}
                <div class="card-title">
                    <h4>{s name="LoginHeaderExistingCustomer"}{/s}</h4>
                </div>
            {/block}

            {block name='frontend_register_login_form'}
                {if $register.personal.sValidation}
                    {$url = {url controller=account action=login sTarget=$sTarget sTargetAction=$sTargetAction sValidation=$register.personal.sValidation} }
                {else}
                    {$url = {url controller=account action=login sTarget=$sTarget sTargetAction=$sTargetAction} }
                {/if}

                <form name="sLogin" method="post" action="{$url}">
                    {if $sTarget}<input name="sTarget" type="hidden" value="{$sTarget|escape}"/>{/if}
                    {block name='frontend_register_login_description'}
                        <span class="form-text mb-3">{s name="LoginHeaderFields"}{/s}</span>
                    {/block}

                    {block name='frontend_register_login_input_email'}
                        <div class="form-group">
                            <label for="email" 
                                   class="col-form-label">
                                    {s name='LoginLabelMail'}{/s}</label>

                            <input name="email" 
                                   type="email" 
                                   autocomplete="email" 
                                   tabindex="1" 
                                   value="{$sFormData.email|escape}" 
                                   id="email" 
                                   class="form-control
                                   {if $sErrorFlag.email} is-invalid{/if}"/>
                        </div>
                    {/block}

                    {block name='frontend_register_login_input_password'}
                        <div class="form-group">
                            <label for="password"
                                   class="col-form-label">
                                    {s name="LoginLabelPassword"}{/s}</label>

                            <input name="password" 
                                   type="password" 
                                   autocomplete="current-password" 
                                   tabindex="2" 
                                   id="password" 
                                   class="form-control
                                   {if $sErrorFlag.password} is-invalid{/if}"/>
                            {block name='frontend_register_login_input_lostpassword'}
                                <span class="form-text small">
                                    <a href="{url controller=account action=password}" 
                                       class="btn-link" 
                                       title="{s name='LoginLinkLostPassword'}{/s}">{s name="LoginLinkLostPassword"}{/s}</a>
                                </span>
                            {/block}
                        </div>
                    {/block}

                    {block name='frontend_register_login_input_form_submit'}
                        <button class="btn btn-primary" type="submit">
                            {s name='LoginLinkLogon'}{/s}
                        </button>
                    {/block}
                </form>
            {/block}
        </div>
    </div>
{/block}
