{extends file='frontend/index/index.tpl'}

{namespace name="frontend/account/ajax_logout"}

{* Breadcrumb *}
{block name='frontend_index_start' append}
    {$sBreadcrumb = [['name'=>"{s name='AccountLogoutTitle'}{/s}", 'link'=>{url}]]}
{/block}

{block name='frontend_index_content'}
    {block name="frontend_account_logout_info"}
        <div class="panel panel-default">
            {block name="frontend_account_logout_info_headline"}
                <div class="panel-heading">  
                    <h1 class="panel-title">{s name="AccountLogoutHeader"}{/s}</h1>  
                </div>  
            {/block}

            {block name="frontend_account_logout_info_content"}
                <div class="panel-body">
                    <p>{s name="AccountLogoutText"}{/s}</p>
                </div>
            {/block}

            {block name="frontend_account_logout_info_actions"}
                <div class="panel-footer">
                    <a class="btn btn-outline-secondary" href="{url controller='index'}" title="{"{s name='AccountLogoutButton'}{/s}"|escape}">
                        {s name="AccountLogoutButton"}{/s}
                    </a>
                    <a class="btn btn-primary mlm" href="{url controller='account'}" title="{"{s name='AccountLogoutAccountButton'}{/s}"|escape}">
                        {s name="AccountLogoutAccountButton"}{/s}
                    </a>
                </div>
            {/block}
        </div>
    {/block}
{/block}