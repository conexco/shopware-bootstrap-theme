{namespace name='frontend/cookie_consent/main'}

{* Set swbt-modal class to auto-open the modal in $.moda.open() instead of recreating it. *}
<div id='cookie-consent' class='modal swbt-modal' data-cookie-consent-manager='true'>
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            {block name='frontend_index_cookie_consent_manager_content'}
                {block name='frontend_index_cookie_consent_manager_header'}
                    <div class='modal-header cookie-consent--header'>
                        {s name="manager/title"}{/s}
                        <button type="button" class="close cookie-permission--close-button cookie-consent--close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>                </div>
                {/block}
                <div class="panel-body">
                    {block name='frontend_index_cookie_consent_manager_description'}
                        <div class='cookie-consent--description'>
                            {s name="manager/description"}{/s}
                        </div>
                    {/block}
                    {block name='frontend_index_cookie_consent_manager_configuration'}
                        {if $cookieGroups}
                            <div class='cookie-consent--configuration'>
                                {block name="frontend_index_cookie_consent_manager_configuration_header"}
                                    <div class='cookie-consent--configuration-header'>
                                        <div class='cookie-consent--configuration-header-text h5'>{s name="manager/configuration/title"}{/s}</div>
                                    </div>
                                {/block}

                                {block name="frontend_index_cookie_consent_manager_configuration_container"}
                                    <div id="cookie-consent--configuration-main" class='cookie-consent--configuration-main panel-group' role="tablist" aria-multiselectable="true">
                                        {foreach $cookieGroups as $cookieGroup}
                                            {if $cookieGroup['cookies']|count}
                                                {include file="frontend/index/cookie_consent/group.tpl"}
                                            {/if}
                                        {/foreach}
                                    </div>
                                {/block}
                            </div>
                        {/if}
                    {/block}
                </div>
                {if $cookieGroups}
                    <div class="modal-footer">
                        {block name="frontend_index_cookie_consent_manager_save"}
                            <div class="cookie-consent--save">
                                <input class="cookie-consent--save-button btn btn-primary" type="button" value="{s name="manager/save"}{/s}" />
                            </div>
                        {/block}
                    </div>
                {/if}
            {/block}
        </div>
    </div>
</div>
