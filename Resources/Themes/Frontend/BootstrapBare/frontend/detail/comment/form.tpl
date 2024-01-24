{namespace name="frontend/detail/comment"}

{* Display notice if the shop owner needs to unlock a comment before it will'be listed *}
{block name='frontend_detail_comment_vote_unlockmsg'}
    {if {config name=VoteUnlock}}
        {include file="frontend/_includes/messages.tpl" type="info" content="{s name='DetailCommentTextReview'}{/s}"}
    {/if}
{/block}

{* Publish review form *}
{block name='frontend_detail_comment_post_form'}
    {block name='frontend_detail_comment_post_form_tag'}
        <form method="post" action="{url action='rating' sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}" class="form-horizontal">
    {/block}
    <fieldset>
        {* Review title *}
        {block name='frontend_detail_comment_post_title'}
            <legend>{s name="DetailCommentHeaderWriteReview"}{/s}</legend>
        {/block}

        {* Response save comment *}
        {block name='frontend_detail_comment_error_messages'}
            {if $sAction == "ratingAction"}
                {if $sErrorFlag}
                    {if $sErrorFlag['sCaptcha']}
                        {include file="frontend/_includes/messages.tpl" type="error" content="{s name='DetailCommentInfoFillOutCaptcha'}{/s}"}
                    {else}
                        {include file="frontend/_includes/messages.tpl" type="danger" dismiss="true" content="{s name='DetailCommentInfoFillOutFields'}{/s}"}
                    {/if}
                {else}
                    {if {config name="OptinVote"} && !{$smarty.get.sConfirmation} && !{$userLoggedIn}}
                        {include file="frontend/_includes/messages.tpl" type="info" dismiss="true" content="{s name='DetailCommentInfoSuccessOptin'}{/s}"}
                    {else}
                        {include file="frontend/_includes/messages.tpl" type="success" dismiss="true" content="{s name='DetailCommentInfoSuccess'}{/s}"}
                    {/if}
                {/if}
            {/if}
        {/block}

        {* Review author name *}
        {block name='frontend_detail_comment_input_name'}
            <div class="form-group{if $sErrorFlag.sVoteName} has-error{/if}">
                <label for="sVoteName" class="{$FormLabelSize} control-label">{s name="DetailCommentLabelName"}{/s}</label>

                <div class="{$FormInputSize}">
                    <input name="sVoteName" placeholder="{s name="DetailCommentLabelName"}{/s}" type="text" class="form-control" id="sVoteName" value="{$sFormData.sVoteName|escape}"/>
                </div>
            </div>
        {/block}

        {* Review Rating *}
        {block name='frontend_detail_comment_input_rating'}
            <div class="form-group">
                <label for="sVoteStars" class="{$FormLabelSize} control-label">{s name="vote_average" namespace="frontend/listing/facet_labels"}{/s}</label>

                <div class="{$FormInputSize}">
                    <select name="sVoteStars" id="sVoteStars" class="form-control" required="required" aria-required="true">
                        <option value="10">{s name="Rate5n"}5 sehr gut{/s}</option>
                        <option value="8">{s name="Rate4"}{/s}</option>
                        <option value="6">{s name="Rate3"}{/s}</option>
                        <option value="4">{s name="Rate2"}{/s}</option>
                        <option value="2">{s name="Rate1"}{/s}</option>
                    </select>
                </div>
            </div>
        {/block}

        {* Comment summary*}
        {block name='frontend_detail_comment_input_summary'}
            <div class="form-group{if $sErrorFlag.sVoteSummary} has-error{/if}">
                <label for="sVoteSummary" class="{$FormLabelSize} control-label">{s name="DetailCommentLabelSummary"}{/s}</label>

                <div class="{$FormInputSize}">
                    <input name="sVoteSummary" placeholder="{s name="DetailCommentLabelSummary"}{/s}" type="text" class="form-control" value="{$sFormData.sVoteSummary|escape}" id="sVoteSummary" required="required" aria-required="true"/>
                </div>
            </div>
        {/block}

        {* E-Mail address *}
        {block name='frontend_detail_comment_input_mail'}
            {if {config name=OptinVote} == true}
                <div class="form-group{if $sErrorFlag.sVoteMail} has-error{/if}">
                    <label for="sVoteMail" class="{$FormLabelSize} control-label">{s name="DetailCommentLabelMail"}{/s}</label>

                    <div class="{$FormInputSize}">
                        <input placeholder="{s name="DetailCommentLabelMail"}{/s}" name="sVoteMail" type="email" class="form-control" id="sVoteMail" value="{$sFormData.sVoteMail|escape}" required="required" aria-required="true"/>
                    </div>
                </div>
            {/if}
        {/block}

        {* Comment text *}
        {block name='frontend_detail_comment_input_text'}
            <div class="form-group{if $sErrorFlag.sVoteComment} has-error{/if}">
                <label for="sVoteComment" class="{$FormLabelSize} control-label">{s name='DetailCommentLabelText'}{/s}</label>

                <div class="{$FormInputSize}">
                    <textarea placeholder="{s name='DetailCommentLabelText'}{/s}" name="sVoteComment" id="sVoteComment" class="form-control" rows="7" required="required" aria-required="true">{$sFormData.sVoteComment|escape}</textarea>
                </div>
            </div>
        {/block}

        {* Captcha *}
        {block name='frontend_detail_comment_input_captcha'}
        <div class="form-group{if $sErrorFlag.sCaptcha} has-error{/if} captcha">
            <div class="{$FormLabelOffset} {$FormInputSize}">
                    {if {config name=captchaMethod} === 'legacy'}
                        <div class="row">
                            <div class="col-xs-12">
                                {* Deferred loading of the captcha image*}
                                {block name='frontend_detail_comment_input_captcha_placeholder'}
                                    <div class="captcha-placeholder" {if $sErrorFlag.sCaptcha} data-hasError="true"{/if} data-src="{url module=widgets controller=Captcha action=refreshCaptcha}"></div>
                                {/block}
                            </div>
                            <div class="col-xs-12">
                                {block name='frontend_detail_comment_input_captcha_label'}
                                    <p class="mtm">
                                        <small>{s name="DetailCommentLabelCaptcha"}{/s}</small>
                                    </p>
                                {/block}
                                {block name='frontend_detail_comment_input_captcha_code'}
                                    <input type="text" name="sCaptcha" class="form-control mtm" required="required" aria-required="true"/>
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

        {* Review actions *}
        {block name='frontend_detail_comment_input_actions'}
            <div class="form-group">
                <div class="{$FormLabelOffset} {$FormInputSize}">
                    <span class="help-block">{s name="DetailCommentInfoFields"}{/s}</span>
                    {* Publish review button *}
                    {block name='frontend_detail_comment_input_actions_submit'}
                        <button class="btn btn-primary" name="Submit" type="submit">
                            {s name="DetailCommentActionSave"}{/s}
                        </button>
                    {/block}
                </div>
            </div>
        {/block}
    </fieldset>
    </form>
{/block}
