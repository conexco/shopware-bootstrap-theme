<div class="alert alert-default no-cookies is--hidden sw5-plugin"
    data-cookie-permission="true"
    data-urlPrefix="{url controller=index action=index}"
    {if $Shop}data-shopId="{$Shop->getId()}"{/if}>
    {block name="cookie_permission_container"}
        <div class="cookie-permission-container">
            <div class="container-xs-height">
                <div class="row row-sm-height">
                    <div class="col-12 col-sm-9 col-sm-height col-middle">
                        {block name="cookie_permission_content"}
                            <div class="cookie-permission-content">
                                {block name="cookie_permission_content_text"}
                                    {s namespace="frontend/cookiepermission/index" name="cookiePermission/text"}{/s}
                                {/block}

                                {block name="cookie_permission_content_link"}
                                    {$privacyLink = {config name="data_privacy_statement_link"}}
                                    {if $privacyLink}
                                        <a title="{s namespace="frontend/cookiepermission/index" name="cookiePermission/linkText"}{/s}"
                                           class="cookie-permission--privacy-link sw5-plugin text-primary"
                                           href="{$privacyLink}">
                                            {s namespace="frontend/cookiepermission/index" name="cookiePermission/linkText"}{/s}
                                        </a>
                                    {/if}
                                {/block}
                            </div>
                        {/block}
                    </div>
                    <div class="col-12 col-sm-3 col-sm-height col-middle">
                        {block name="cookie_permission_accept_button"}
                            <div class="cookie-permission-button text-right">
                                <a href="" class="cookie-permission--accept-button sw5-plugin btn btn-primary">
                                    {s namespace="frontend/cookiepermission/index" name="cookiePermission/buttonText"}{/s}
                                </a>
                            </div>
                        {/block}
                    </div>
                </div>
            </div>
        </div>
    {/block}
</div>
