{extends file="frontend/index/index.tpl"}

{* Empty left sidebar *}
{block name="frontend_index_content_left"}
    {include file='frontend/index/sidebar.tpl'}
{/block}

{* Main content *}
{block name="frontend_index_content"}

    {if $sSuccess}
        {include file="frontend/_includes/messages.tpl" type="success" content="{s name='TellAFriendHeaderSuccess'}{/s}"}
    {else}
        {if $sError}
            {include file="frontend/_includes/messages.tpl" type="danger" content="{s name='TellAFriendInfoFields'}{/s}"}
        {/if}
    {/if}

    {block name='frontend_tellafriend_success'}
        {if !$sSuccess}
            {block name='frontend_tellafriend_form'}
                <form name="mailtofriend" method="post" class="form-horizontal">
                    <input type="hidden" name="sMailTo" value="1"/>
                    <input type="hidden" name="sDetails" value="{$sArticle.articleID}"/>

                    {* Validation errors *}
                    {if $error}
                        {include file="frontend/_includes/messages.tpl" type="danger" list=$error}
                    {/if}

                    {block name='frontend_tellafriend_headline'}
                        <h2>
                            <a href="{$sArticle.linkDetails}" title="{$sArticle.articleName}">{$sArticle.articleName}</a> {s name='TellAFriendHeadline'}{/s}
                        </h2>
                    {/block}

                    <fieldset>
                        {* TellAFriend name *}
                        {block name='frontend_tellafriend_field_name'}
                            <div class="form-group">
                                <label class="control-label {$FormLabelSize}" for="sName">{s name='TellAFriendLabelName'}{/s}*:</label>

                                <div class="{$FormInputSize}">
                                    <input name="sName" type="text" id="txtName" class="form-control" value="{$sName|escape}"/>
                                </div>
                            </div>
                        {/block}

                        {* TellAFriend email address *}
                        {block name='frontend_tellafriend_field_email'}
                            <div class="form-group">
                                <label class="control-label {$FormLabelSize}" for="sMail">{s name='TellAFriendPlaceholderMail'}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <input name="sMail" type="email" id="txtMail" class="form-control" value="{$sMail|escape}"/>
                                </div>
                            </div>
                        {/block}

                        {* TellAFriend receiver email address *}
                        {block name='frontend_tellafriend_field_friendsemail'}
                            <div class="form-group">
                                <label class="control-label {$FormLabelSize}" for="sRecipient">{s name='TellAFriendLabelFriendsMail'}{/s}*:</label>

                                <div class="{$FormInputSize}">
                                    <input name="sRecipient" type="email" id="txtMailTo" class="form-control" value="{$sRecipient|escape}"/>
                                </div>
                            </div>
                        {/block}

                        {* TellAFriend comment *}
                        {block name='frontend_tellafriend_field_comment'}
                            <div class="form-group">
                                <label class="control-label {$FormLabelSize}" for="comment">{s name='TellAFriendPlaceholderComment'}{/s}</label>

                                <div class="{$FormInputSize}">
                                    <textarea name="sComment" id="comment" class="form-control">{$sComment|escape}</textarea>
                                </div>
                            </div>
                        {/block}

                        {* Captcha *}
                        {block name='frontend_tellafriend_captcha'}
                            <div class="form-group{if $sErrorFlag.sCaptcha} has-error{/if} captcha">
                                <div class="{$FormLabelOffset} {$FormInputSize}">
                                    {if {config name=captchaMethod} === 'legacy'}
                                        <div class="row">
                                            <div class="col-12">
                                                {* Deferred loading of the captcha image *}
                                                {block name='frontend_tellafriend_captcha_placeholder'}
                                                    <div class="captcha-placeholder"{if $sErrorFlag.sCaptcha} data-hasError="true"{/if} data-src="{url module=widgets controller=Captcha action=refreshCaptcha}"></div>
                                                {/block}
                                            </div>
                                            <div class="col-12">
                                                <p class="mtm"><small>{s name='TellAFriendLabelCaptchaInfo'}{/s}</small></p>
                                                <input type="text" name="sCaptcha" class="form-control mtm is-required" required="required" aria-required="true" />
                                            </div>
                                        </div>
                                    {else}
                                        <div class="captcha-placeholder" data-src="{url module=widgets controller=Captcha action=index}"{if $sError} data-hasError="true"{/if}></div>
                                    {/if}
                                </div>
                            </div>
                        {/block}

                        {* Send recommendation button *}
                        {block name='frontend_tellafriend_captcha_code_actions'}
                            <div class="form-group">
                                <div class="{$FormLabelOffset} {$FormInputSize}">
                                    <a href="{$sArticle.linkDetails}" class="btn btn-outline-secondary">{s name='TellAFriendLinkBack'}{/s}</a>
                                    <input type="submit" value="{s name='TellAFriendActionSubmit'}{/s}" class="btn btn-primary"/>
                                </div>
                            </div>
                        {/block}
                    </fieldset>
                </form>
            {/block}
        {/if}
    {/block}
{/block}

