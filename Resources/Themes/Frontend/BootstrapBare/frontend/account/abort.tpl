{extends file='frontend/index/index.tpl'}

{namespace name="frontend/account/ajax_logout"}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {$smarty.block.parent}
    {$sBreadcrumb = [['name' => "{s name='OneTimeAbortTitle'}{/s}", 'link' => {url}]]}
{/block}

{block name='frontend_index_content'}
    <div class="panel panel-default">
        {block name="frontend_account_logout_info"}
            {block name="frontend_account_logout_info_headline"}
                <div class="panel-heading">
                    <h1 class="panel-title">{s name="OneTimeAbortTitle"}{/s}</h1>
                </div>
            {/block}

            {block name="frontend_account_logout_info_content"}
                <div class="panel-body">
                    <p>{s name="OneTimeAbortText"}{/s}</p>
                </div>
            {/block}

            {block name="frontend_account_logout_info_actions"}
                <div class="panel-footer">
                    <a class="btn btn-default"
                       href="{url controller='index'}"
                       title="{"{s name='OneTimeAbortButton'}{/s}"|escape}">
                        {s name="OneTimeAbortButton"}{/s}
                    </a>
                </div>
            {/block}
        {/block}
    </div>
{/block}
