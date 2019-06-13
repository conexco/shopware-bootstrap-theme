{namespace name="frontend/blog/comments"}

{block name='frontend_blog_comments_form'}
    <form method="post" action="{url controller=blog action=rating blogArticle=$sArticle.id}#commentFormCollapse" class="form-horizontal">
        <fieldset>
            {block name='frontend_blog_comments_form_headline'}
                <legend>{s name="BlogHeaderWriteComment"}{/s}</legend>
            {/block}

            {block name='frontend_blog_comments_form_errors'}
                {if $sAction == "rating"}
                    {if $sErrorFlag}
                        {include file="frontend/_includes/messages.tpl" type="danger" content="{s name='BlogInfoFailureFields'}{/s}"}
                    {else}
                        {if {config name=OptInVote} && !{$smarty.get.sConfirmation} && !{$userLoggedIn}}
                            {include file="frontend/_includes/messages.tpl" type="info" content="{s name='BlogInfoSuccessOptin'}{/s}"}
                        {else}
                            {include file="frontend/_includes/messages.tpl" type="success" content="{s name='BlogInfoSuccess'}{/s}"}
                        {/if}
                    {/if}
                {/if}
            {/block}

            {* Name *}
            {block name='frontend_blog_comments_input_name'}
                <div class="form-group{if $sErrorFlag.name} has-error{/if}">
                    <label for="sCommentName" class="{$FormLabelSize} control-label">{s name="BlogLabelName"}{/s}:*</label>

                    <div class="{$FormInputSize}">
                        <input name="name" type="text" id="sCommentName" value="{$sFormData.name|escape}" placeholder="{s name="BlogLabelName"}{/s}" class="form-control" required="required" aria-required="true" />
                    </div>
                </div>
            {/block}

            {* E-Mail *}
            {block name='frontend_blog_comments_input_mail'}
                <div class="form-group{if $sErrorFlag.eMail} has-error{/if}">
                    <label for="sCommentMail" class="{$FormLabelSize} control-label">{s name="BlogLabelMail"}{/s}:{if {config name=OptInVote}}*{/if}</label>

                    <div class="{$FormInputSize}">
                        <input name="eMail" type="email" id="sCommentMail" placeholder="{s name="BlogLabelMail"}{/s}" value="{$sFormData.eMail|escape}" class="form-control"{if {config name=OptInVote}} required="required" aria-required="true"{/if} />
                    </div>
                </div>
            {/block}

            {* Voting *}
            {block name='frontend_blog_comments_input_voting'}
                <div class="form-group">
                    <label for="sVoteStars" class="{$FormLabelSize} control-label needed">{s name="BlogLabelRating"}{/s}:*</label>

                    <div class="{$FormInputSize}">
                        <select class="form-control" required="required" aria-required="true" name="points" id="sVoteStars">
                            <option value="10"{if $sFormData.points == 5} selected="selected"{/if}>{s name="rate5n"}5 sehr gut{/s}</option>
                            <option value="8"{if $sFormData.points == 4} selected="selected"{/if}>{s name="rate4"}{/s}</option>
                            <option value="6"{if $sFormData.points == 3} selected="selected"{/if}>{s name="rate3"}{/s}</option>
                            <option value="4"{if $sFormData.points == 2} selected="selected"{/if}>{s name="rate2"}{/s}</option>
                            <option value="2"{if $sFormData.points == 1} selected="selected"{/if}>{s name="rate1"}{/s}</option>
                        </select>
                    </div>
                </div>
            {/block}

            {* Summary *}
            {block name='frontend_blog_comments_input_summary'}
                <div class="form-group{if $sErrorFlag.headline} has-error{/if}">
                    <label for="sCommentHeadline" class="{$FormLabelSize} control-label">{s name="BlogLabelSummary"}{/s}:*</label>

                    <div class="{$FormInputSize}">
                        <input name="headline" type="text" value="{$sFormData.headline|escape}" placeholder="{s name="BlogLabelSummary"}{/s}" id="sCommentHeadline" class="form-control" required="required" aria-required="true" />
                    </div>
                </div>
            {/block}

            {* Opinion *}
            {block name='frontend_blog_comments_input_comment'}
                <div class="form-group{if $sErrorFlag.comment} has-error{/if}">
                    <label for="sComment" class="{$FormLabelSize} control-label">{s name="BlogLabelComment"}{/s}*</label>

                    <div class="{$FormInputSize}">
                        <textarea name="comment" id="sComment" class="form-control" rows="7" required="required" aria-required="true">{$sFormData.comment|escape}</textarea>
                    </div>
                </div>
            {/block}

            {* Captcha *}
            {block name='frontend_blog_comments_input_captcha'}
                <div class="form-group{if $sErrorFlag.sCaptcha} has-error{/if} captcha">
                    <div class="{$FormLabelOffset} {$FormInputSize}">
                        {if {config name=captchaMethod} === 'legacy'}
                        <div class="row">
                            <div class="col-xs-12">
                                {block name='frontend_blog_comments_input_captcha_placeholder'}
                                    <div class="captcha-placeholder" 
                                        data-autoLoad="true"{if $sErrorFlag.sCaptcha} data-hasError="true"{/if} 
                                        data-src="{url module=widgets controller=Captcha action=refreshCaptcha}"></div>
                                {/block}
                            </div>
                            <div class="col-xs-12">
                                {block name='frontend_blog_comments_input_captcha_label'}
                                    <p class="mtm"><small>{s name="BlogLabelCaptcha"}{/s}</small></p>
                                {/block}
                                {block name='frontend_blog_comments_input'}
                                    <input type="text" name="sCaptcha" class="form-control mtm" required="required" aria-required="true" />
                                {/block}
                            </div>
                        </div>
                        {else}
                            <div class="captcha-placeholder" data-src="{url module=widgets controller=Captcha action=index}"{if isset($sErrorFlag) && count($sErrorFlag) > 0} data-hasError="true"{/if}></div>
                        {/if}
                    </div>
                </div>
            {/block}

            {* Data protection information *}
            {block name='frontend_forms_form_elements_form_privacy'}
                {if {config name=ACTDPRTEXT} || {config name=ACTDPRCHECK}}
                    {include file="frontend/_includes/privacy.tpl"}
                {/if}
            {/block}

            {* Submit button *}
            {block name='frontend_blog_comments_input_submit'}
                <div class="form-group">
                    <div class="{$FormLabelOffset} {$FormInputSize}">
                        {block name='frontend_blog_comments_input_notice'}
                            <span class="help-block">{s name="BlogInfoFields"}{/s}</span>
                        {/block}
                        
                        <input class="btn btn-primary" type="submit" name="Submit" value="{s name='BlogLinkSaveComment'}{/s}" />
                    </div>
                </div>
            {/block}
        </fieldset>
    </form>
{/block}
