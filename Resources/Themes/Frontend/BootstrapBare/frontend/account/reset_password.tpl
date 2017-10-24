{extends file='frontend/index/index.tpl'}


{block name="gridconfig" prepend}
    {assign "grid" "g010" scope="global"}
{/block}


{block name='frontend_index_content_left'}{/block}


{* Main content *}
{block name='frontend_index_content'}

    {* Error messages *}
    {block name="frontend_account_error_messages"}
        {if $sErrorMessages}
            {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
        {/if}
    {/block}

    {if !$invalidToken}
        {* New password panel *}
        {block name='frontend_account_password_new_content'}

            {* New password form *}
            {block name='frontend_account_password_new_form'}
                <form action="{url action=resetPassword}" method="post" class="form-horizontal">
                    <fieldset>
                        {* New password panel title *}
                        {block name='frontend_account_password_new_title'}
                            <legend>{s name='PasswordResetNewHeadline'}{/s}</legend>
                        {/block}

                        {* New password panel content *}
                        {block name='frontend_account_password_new'}
                            {* New password fields *}
                            {block name='frontend_account_password_new_fields'}

                                {* Secret hash hidden input *}
                                {block name='frontend_account_password_new_hash_input'}
                                    <input name="hash" value="{$hash}" type="hidden" id="hash" class="{if $sErrorFlag.hash}has-error{/if}">
                                {/block}

                                {* New password input *}
                                {block name='frontend_account_password_new_password_input'}
                                    <div class="form-group {if $sErrorFlag.password}has-error{/if}">
                                        <label class="control-label {$FormLabelSize}">{s name="AccountLabelNewPassword2" namespace='frontend/account/index'}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                        <div class="{$FormInputSize}">
                                            <input name="password[password]"
                                                   type="password" 
                                                   autocomplete="new-password"
                                                   id="newpwd" 
                                                   class="form-control">
                                        </div>
                                    </div>
                                {/block}

                                {* New password confirmation input *}
                                {block name='frontend_account_password_new_password_confirmation_input'}
                                    <div class="form-group {if $sErrorFlag.passwordConfirmation}has-error{/if}">
                                        <label class="control-label {$FormLabelSize}">{s name="AccountLabelRepeatPassword2" namespace='frontend/account/index'}{/s}{s name="Star" namespace="frontend/listing/box_article"}{/s}</label>

                                        <div class="{$FormInputSize}">
                                            <input name="password[passwordConfirmation]"
                                                   id="newpwdrepeat" 
                                                   type="password" 
                                                   autocomplete="new-password"
                                                   class="form-control">
                                        </div>
                                    </div>
                                {/block}
                            {/block}

                            {* New password helptext *}
                            {block name='frontend_account_password_new_helptext'}
                                <div class="form-group">
                                    <div class="{$FormInputSize} {$FormLabelOffset}">
                                        <p class="help-block">
                                            {s name='RegisterInfoPassword' namespace='frontend/register/personal_fieldset'}{/s} {config name=MinPassword} {s name='RegisterInfoPasswordCharacters' namespace='frontend/register/personal_fieldset'}{/s} {s name='RegisterInfoPassword2' namespace='frontend/register/personal_fieldset'}{/s}
                                        </p>
                                        <p class="help-block">
                                            {s name='PasswordResetNewHelpText'}{/s}
                                        </p>
                                    </div>
                                </div>
                            {/block}
                        {/block}

                        {* New password actions *}
                        {block name='frontend_account_password_new_password_actions'}
                            <div class="form-group">
                                <div class="{$FormInputSize} {$FormLabelOffset}">
                                    <button type="submit" class="btn btn-primary" name="AccountLinkChangePassword">{s name='AccountLinkChangePassword' namespace='frontend/account/index'}{/s}</button>
                                </div>
                            </div>
                        {/block}
                    </fieldset>
                </form>
            {/block}
        {/block}
    {/if}    
{/block}