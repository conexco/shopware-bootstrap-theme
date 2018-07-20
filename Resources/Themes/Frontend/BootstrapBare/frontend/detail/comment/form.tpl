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
        <form method="post" action="{url action='rating' sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}">
    {/block}

        {* Review title *}
        {block name='frontend_detail_comment_post_title'}
            <h5>{s name="DetailCommentHeaderWriteReview"}{/s}</h5>
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

        {* Review Rating *}
        {block name='frontend_detail_comment_input_rating'}
            <div class="form-row">
                <div class="form-group col-md-12 col-lg-6">
                    <label for="sVoteStars" 
                           class="col-form-label">
                            {s name="vote_average" namespace="frontend/listing/facet_labels"}{/s}
                    </label>

                    <select name="sVoteStars" 
                            id="sVoteStars" 
                            class="form-control" 
                            required="required" aria-required="true">
                        <option value="10">{s name="Rate5n"}5 sehr gut{/s}</option>
                        <option value="8">{s name="Rate4"}{/s}</option>
                        <option value="6">{s name="Rate3"}{/s}</option>
                        <option value="4">{s name="Rate2"}{/s}</option>
                        <option value="2">{s name="Rate1"}{/s}</option>
                    </select>
                </div>
            </div>
        {/block}

        {* Review author name *}
        {block name='frontend_detail_comment_input_name'}
            <div class="form-group">
                <label for="sVoteName" 
                       class="col-form-label">
                        {s name="DetailCommentLabelName"}{/s}</label>

                <input name="sVoteName"
                       type="text"
                       id="sVoteName" 
                       value="{$sFormData.sVoteName|escape}" 
                       required="required" aria-required="true"
                       class="form-control 
                       {if $sErrorFlag.sVoteName} is-invalid{/if}" />
            </div>
        {/block}

        {* Comment summary*}
        {block name='frontend_detail_comment_input_summary'}
            <div class="form-group">
                <label for="sVoteSummary" 
                       class="col-form-label">
                        {s name="DetailCommentLabelSummary"}{/s}</label>

                <input name="sVoteSummary" 
                       type="text"
                       value="{$sFormData.sVoteSummary|escape}" 
                       id="sVoteSummary" 
                       required="required" aria-required="true"
                       class="form-control
                       {if $sErrorFlag.sVoteSummary} is-invalid{/if}" />
            </div>
        {/block}

        {* E-Mail address *}
        {block name='frontend_detail_comment_input_mail'}
            {if {config name=OptinVote} == true}
                <div class="form-group">
                    <label for="sVoteMail" 
                           class="col-form-label">
                            {s name="DetailCommentLabelMail"}{/s}</label>

                    <input name="sVoteMail" 
                           type="email"
                           id="sVoteMail" 
                           value="{$sFormData.sVoteMail|escape}" 
                           required="required" aria-required="true"
                           class="form-control
                           {if $sErrorFlag.sVoteMail} is-invalid{/if}" />
                </div>
            {/if}
        {/block}

        {* Comment text *}
        {block name='frontend_detail_comment_input_text'}
            <div class="form-group">
                <label for="sVoteComment" 
                       class="col-form-label">
                        {s name='DetailCommentLabelText'}{/s}</label>

                <textarea placeholder="{s name='DetailCommentPlaceholderText'}{/s}" 
                          name="sVoteComment" 
                          id="sVoteComment"
                          rows="7" 
                          required="required" aria-required="true"
                          class="form-control
                          {if $sErrorFlag.sVoteComment} is-invalid{/if}" >
                          {$sFormData.sVoteComment|escape}</textarea>
            </div>
        {/block}

        {* Captcha *}
        {block name='frontend_detail_comment_input_captcha'}
            <div class="form-group">
                {if {config name=captchaMethod} === 'legacy'}
                    <div>
                        {* Deferred loading of the captcha image*}
                        {block name='frontend_detail_comment_input_captcha_placeholder'}
                            <div class="captcha-placeholder" {if $sErrorFlag.sCaptcha} data-hasError="true"{/if} data-src="{url module=widgets controller=Captcha action=refreshCaptcha}"></div>
                        {/block}
                    </div>
                    <div>
                        {block name='frontend_detail_comment_input_captcha_label'}
                            <p class="text-muted small">
                                {s name="DetailCommentLabelCaptcha"}{/s}
                            </p>
                        {/block}
                        {block name='frontend_detail_comment_input_captcha_code'}
                            <input type="text" name="sCaptcha" 
                                   class="form-control {if $sErrorFlag.sCaptcha} is-invalid{/if} captcha" 
                                   required="required" aria-required="true"/>
                        {/block}
                    </div>
                {else}
                    <div class="captcha-placeholder" 
                         data-src="{url module=widgets controller=Captcha action=index}"{if isset($sErrorFlag) && count($sErrorFlag) > 0} data-hasError="true"{/if}>
                    </div>
                {/if}
            </div>
        {/block}

        {* Review actions *}
        {block name='frontend_detail_comment_input_actions'}
            <div class="form-group">
                <span class="form-text text-muted mb-3">{s name="DetailCommentInfoFields"}{/s}</span>
                {* Publish review button *}
                {block name='frontend_detail_comment_input_actions_submit'}
                    <button class="btn btn-primary" name="Submit" type="submit">
                        {s name="DetailCommentActionSave"}{/s}
                    </button>
                {/block}
            </div>
        {/block}
    </form>
{/block}