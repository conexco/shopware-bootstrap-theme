{extends file='frontend/index/index.tpl'}

{namespace name="frontend/account/ajax_logout"}

{* Breadcrumb *}
{block name='frontend_index_start' append}
    {$sBreadcrumb = [['name'=>"{s name='AccountLogoutTitle'}{/s}", 'link'=>{url}]]}
{/block}

{block name='frontend_index_content'}
    <div class="account-logout">
        {block name="frontend_account_logout_info"}
            <div class="card">
                <div class="card-body">    
                    {block name="frontend_account_logout_info_headline"}
                        <h1 class="card-title">{s name="AccountLogoutHeader"}{/s}</h1>  
                    {/block}

                    {block name="frontend_account_logout_info_content"}
                        <p class="card-text">{s name="AccountLogoutText"}{/s}</p>
                    {/block}
                </div>
                {block name="frontend_account_logout_info_actions"}
                    <div class="card-footer">
                        <a class="btn btn-outline-primary" 
                           href="{url controller='index'}" 
                           title="{"{s name='AccountLogoutButton'}{/s}"|escape}">
                            {s name="AccountLogoutButton"}{/s}
                        </a>

                        <a class="btn btn-primary ml-2" 
                           href="{url controller='account'}" 
                           title="{"{s name='AccountLogoutAccountButton'}{/s}"|escape}">
                            {s name="AccountLogoutAccountButton"}{/s}
                        </a>
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}