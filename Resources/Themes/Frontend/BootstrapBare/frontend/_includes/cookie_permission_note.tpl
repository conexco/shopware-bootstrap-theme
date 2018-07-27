{namespace name="frontend/cookiepermission/index"}

<div class="alert alert-default pan no-cookies is--hidden sw5-plugin"
    data-cookie-permission="true"
    data-urlPrefix="{url controller=index action=index}"
    {if $Shop}
    data-shopId="{$Shop->getId()}"
    {/if}>

    {if {config name="cookie_note_mode"} != 2}
        {block name="cookie_permission_container"}
            <div class="container pbm cookie-permission--container cookie-mode--{config name="cookie_note_mode"}">
                <div class="row">
                    {block name="cookie_permission_content"}
                        <div class="col-md-9 col-lg-10">
                            <div class="cookie-permission--content">
                                {block name="cookie_permission_content_text"}
                                    {if {config name="cookie_note_mode"} == 1}
                                        {s name="cookiePermission/textMode1"}{/s}
                                    {else}
                                        {s name="cookiePermission/text"}{/s}
                                    {/if}
                                {/block}

                                {block name="cookie_permission_content_link"}
                                    {$privacyLink = {config name="data_privacy_statement_link"}}
                                    {if $privacyLink}
                                        <a title="{s name="cookiePermission/linkText"}{/s}"
                                           class="cookie-permission--privacy-link"
                                           href="{$privacyLink}">
                                            {s name="cookiePermission/linkText"}{/s}
                                        </a>
                                    {/if}
                                {/block}
                            </div>
                        </div>    
                    {/block}

                    {block name="cookie_permission_accept_button"}
                        <div class="col-md-3 col-lg-2 text-right">
                            <div class="cookie-permission--button">
                                {block name="cookie_permission_decline_button_fixed"}
                                    {if {config name="cookie_note_mode"} == 1}
                                        {block name="cookie_permission_decline_button"}
                                            <a href="#" class="cookie-permission--decline-button btn btn-default btn-xs">
                                                {s name="cookiePermission/declineText"}{/s}
                                            </a>
                                        {/block}
                                    {/if}
                                {/block}

                                {block name="cookie_permission_accept_button_fixed"}
                                    <a href="#" class="cookie-permission--accept-button btn btn-primary btn-xs">
                                        {s name="cookiePermission/buttonText"}{/s}
                                    </a>
                                {/block}
                            </div>
                        </div>    
                    {/block}
                </div>    
            </div>
        {/block}        
    {/if}
</div>

{block name="cookie_removal_container"}
    {if {config name="cookie_note_mode"} == 2}
        <div class="modal fade cookie-removal-modal" data-cookie-removal="true" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" 
                                class="close" 
                                data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title">
                            {s name="cookiePermission/title"}{/s}
                        </h4>
                    </div>

                    <div class="modal-body">
                        <div class="cookie-removal--container">
                            <p>
                                {s name="cookiePermission/infoText"}{/s}<br>
                            </p>

                            <ul class="cookie-removal--list">
                                <li>{s name="cookiePermission/productToCart"}{/s}</li>
                                <li>{s name="cookiePermission/wishList"}{/s}</li>
                                <li>{s name="cookiePermission/productRecommandations"}{/s}</li>
                            </ul>
                        </div>

                        {$privacyLink = {config name="data_privacy_statement_link"}}

                        {if $privacyLink}
                            <a title="{s name="cookiePermission/linkText"}{/s}"
                               class="privacy--notice"
                               href="{$privacyLink}">
                                {s name="cookiePermission/linkText"}{/s}
                            </a>
                        {/if}
                    </div>

                    {block name="cookie_removal_container_footer"}
                        <div class="modal-footer cookie-removal--footer">
                            <div class="cookie-removal--buttons">
                                <button type="button" class="btn btn-primary cookie-permission--accept-button">
                                    {s name="cookiePermission/buttonText"}{/s}
                                </button>

                                <button type="button" class="btn btn-default cookie-permission--close-button">
                                    {s name="cookiePermission/close"}{/s}
                                </button>
                            </div>
                        </div>
                    {/block}
                </div>
            </div>
        </div>
    {/if}    
{/block}
