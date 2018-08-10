{extends file='frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start' append}
    {$sBreadcrumb[] = ['name'=>"{s name='MyDownloadsTitle'}{/s}", 'link'=>{url}]}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    <div class="card mb-4">
        {* Welcome text *}
        {block name="frontend_account_downloads_welcome"}
            {block name="frontend_account_downloads_welcome_headline"}
                <h2 class="card-header bg-transparent h3">{s name="DownloadsHeader"}{/s}</h2>
            {/block}
            <div class="card-body">
                {block name="frontend_account_downloads_welcome_content"}
                    <p>{s name='DownloadsInfoText'}{/s}</p>
                {/block}
                {/block}

                {* Error message *}
                {block name="frontend_account_downloads_error_messages"}
                    {if $sErrorCode}
                        {$errorText="{s name='DownloadsInfoNotFound'}{/s}"}
                        {if $sErrorCode == 1}
                            {$errorText="{s name='DownloadsInfoAccessDenied'}{/s}"}
                        {/if}

                        {include file="frontend/_includes/messages.tpl" type="danger" content=$errorText}
                    {/if}
                {/block}

                {* Missing ESD articles *}
                {if !$sDownloads}
                    {block name='frontend_account_downloads_info_empty'}
                        {include file="frontend/_includes/messages.tpl" type="info" content="{s name='DownloadsInfoEmpty'}{/s}"}
                    {/block}
                {else}
                    {block name="frontend_account_downloads_table"}
                        <div class="table-responsive">
                            <table class="table table-sm">
                                {block name="frontend_account_downloads_table_head"}
                                    <thead>
                                    <tr>
                                        {block name="frontend_account_downloads_table_head_date"}
                                            <th scope="col">{s name="DownloadsColumnDate"}{/s}</th>
                                        {/block}

                                        {block name="frontend_account_downloads_table_head_info"}
                                            <th scope="col">{s name="DownloadsColumnName"}{/s}</th>
                                        {/block}

                                        {block name="frontend_account_downloads_table_head_actions"}
                                            <th scope="col">{s name="DownloadsColumnLink"}{/s}</th>
                                        {/block}
                                    </tr>
                                    </thead>
                                {/block}

                                <tbody>
                                {foreach from=$sDownloads item=offerPosition}
                                    {foreach name=offerdetails from=$offerPosition.details item=article}
                                        {if $article.esdarticle}
                                            {block name="frontend_account_downloads_table_row"}
                                                <tr>
                                                    <td>
                                                        {block name="frontend_account_downloads_date"}
                                                            {$offerPosition.datum|date}
                                                        {/block}
                                                    </td>

                                                    <td>
                                                        {block name="frontend_account_downloads_info"}
                                                            {block name='frontend_account_downloads_name'}
                                                                <p>{$article.name}</p>
                                                            {/block}

                                                            {block name='frontend_account_downloads_serial'}
                                                                {if $article.serial && $offerPosition.cleared|in_array:$sDownloadAvailablePaymentStatus}
                                                                    <div class="small text-muted">
                                                                        {s name="DownloadsSerialnumber"}{/s}
                                                                    </div>
                                                                    <div class="small mb-1">
                                                                        {$article.serial}
                                                                    </div>
                                                                {/if}
                                                            {/block}
                                                        {/block}
                                                    </td>

                                                    <td>
                                                        {block name='frontend_account_downloads_link'}
                                                            {if $article.esdarticle && $offerPosition.cleared|in_array:$sDownloadAvailablePaymentStatus}
                                                                <a href="{$article.esdLink}" title="{"{s name='DownloadsLink'}{/s}"|escape} {$article.name|escape}" class="btn btn-outline-primary btn-sm">
                                                                    <i class="fa fa-cloud-download"></i>
                                                                    {s name="DownloadsLink"}{/s}
                                                                </a>
                                                            {/if}
                                                        {/block}
                                                    </td>
                                                </tr>
                                            {/block}
                                        {/if}
                                    {/foreach}
                                {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {/block}
                {/if}
            </div>

    </div>
{/block}
