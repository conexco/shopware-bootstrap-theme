{extends file='frontend/index/index.tpl'}

{block name="gridconfig" prepend}
    {assign "grid" "g010" scope="global"}
{/block}

{block name='frontend_index_content_left'}{/block}

{* Main content *}
{block name='frontend_index_content'}
    {* Error messages *}
    {block name='frontend_account_error_messages'}
        {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
    {/block}

    {if $sSuccess}
        {* Success message *}
        {block name='frontend_account_password_success'}
            {include file="frontend/_includes/messages.tpl" type="success" content="{s name='PasswordInfoSuccess'}{/s}"}
            <p>
                <a href="javascript:history.back();" class="btn btn-default"><span>{s name="LoginBack"}{/s}</span></a>
            </p>
        {/block}
    {else}
        {* Recover password form *}
        {block name="frontend_account_password_reset"}
            <form name="frmRegister" method="post" class="form-horizontal" action="{url action=password}">
                <fieldset>
                    {block name="frontend_account_password_reset_headline"}
                        <legend>{s name="PasswordHeader"}{/s}</legend>
                    {/block}

                    {block name='frontend_account_password_form'}
                        {block name="frontend_account_password_reset_content"}
                            <div class="form-group">
                                <label class="control-label {$FormLabelSize}">{s name="PasswordLabelMail"}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <input name="email" type="email" id="txtmail" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="{$FormInputSize} {$FormLabelOffset}">
                                    <p class="help-block">{s name="PasswordText"}{/s}</p>
                                </div>
                            </div>
                        {/block}

                        {block name="frontend_account_password_reset_actions"}
                            <div class="form-group">
                                <div class="{$FormInputSize} {$FormLabelOffset}">
                                    <button type="submit" class="btn btn-primary">{s name="PasswordSendAction"}{/s}</button>
                                    <a href="{url controller='account'}" class="btn btn-default">{s name="PasswordLinkBack"}{/s}</a>
                                </div>
                            </div>
                        {/block}
                    {/block}    
                </fieldset>
            </form>
        {/block}
    {/if}
{/block}