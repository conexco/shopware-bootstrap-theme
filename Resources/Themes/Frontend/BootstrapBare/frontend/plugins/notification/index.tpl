<div id="article_notification">
    <input type="hidden" value="{$NotifyHideBasket}" name="notifyHideBasket" id="notifyHideBasket"/>

    {block name="frontend_detail_index_notification_alerts"}
        {if $NotifyValid == true}
            {include file="frontend/_includes/messages.tpl" type="success" content="{s name='DetailNotifyInfoValid'}{/s}"}
        {elseif $NotifyInvalid == true && $NotifyAlreadyRegistered != true}
            {include file="frontend/_includes/messages.tpl" type="info" content="{s name='DetailNotifyInfoInvalid'}{/s}"}
        {elseif $NotifyEmailError == true}
            {include file="frontend/_includes/messages.tpl" type="danger" content="{s name='DetailNotifyInfoErrorMail'}{/s}"}
        {elseif $WaitingForOptInApprovement}
            {include file="frontend/_includes/messages.tpl" type="info" content="{s name='DetailNotifyInfoSuccess'}{/s}"}
        {elseif $NotifyAlreadyRegistered == true}
            {include file="frontend/_includes/messages.tpl" type="success" content="{s name='DetailNotifyAlreadyRegistered'}{/s}"}
        {else}
            {if $NotifyValid != true}
                {include file="frontend/_includes/messages.tpl" type="info" content="{s name='DetailNotifyHeader'}{/s}"}
            {/if}
        {/if}
    {/block}

    {block name="frontend_detail_index_notification_form"}
        {if !$NotifyAlreadyRegistered}
            <button id='notifyModalButton' type="button" class="btn btn-primary notify-modal-button" data-toggle="modal" data-target="#notifyModal">
                {s name="NotifyModalNotify"}Benachrichtigen{/s}
            </button>
            <div class="modal fade" id="notifyModal" tabindex="-1" role="dialog" aria-labelledby="notifyModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="notifyModalLabel">{s name="NotifyModalTitle"}Emailbenachrichtigung für diesen Artikel aktivieren{/s}</h4>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="{url action='notify' sArticle=$sArticle.articleID number=$sArticle.ordernumber}" id="sendArticleNotification">
                                <input type="hidden" name="notifyOrdernumber" value="{$sArticle.ordernumber}" id="variantOrdernumber"/>
                                <div class="input-group mbm">
                                    {block name="frontend_detail_index_notification_field"}
                                        <input name="sNotificationEmail" type="email" id="txtmail" class="form-control{if $NotifyEmailError == true} has-error{/if}" placeholder="{s name='DetailNotifyLabelMail'}{/s}"/>
                                    {/block}
                                    {block name="frontend_detail_index_notification_button"}
                                        <span class="input-group-btn">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-envelope"></i>
                                            </button>
                                        </span>
                                    {/block}
                                </div>
                                {* Data protection information *}
                                {block name="frontend_detail_index_notification_privacy"}
                                    {if {config name=ACTDPRTEXT} || {config name=ACTDPRCHECK}}
                                        {include file="frontend/_includes/privacy.tpl"}
                                    {/if}
                                {/block}
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        {/if}
    {/block}
</div>
