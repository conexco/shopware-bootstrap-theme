{extends file='frontend/account/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {$smarty.block.parent}
    {$sBreadcrumb[] = ['name' => "{s name='MyDownloadsTitle'}{/s}", 'link' => {url}]}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    {* Welcome text *}
    {block name="frontend_account_downloads_welcome"}
        {block name="frontend_account_downloads_welcome_headline"}
            <h1>{s name="DownloadsHeader"}{/s}</h1>
        {/block}

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
            <table class="table table-responsive">
                {block name="frontend_account_downloads_table_head"}
                    <thead>
                        <tr>
                            {block name="frontend_account_downloads_table_head_date"}
                                <th class="col-xs-2">{s name="DownloadsColumnDate"}{/s}</th>
                            {/block}
                            {block name="frontend_account_downloads_table_head_info"}
                                <th class="col-xs-8">{s name="DownloadsColumnName"}{/s}</th>
                            {/block}
                            {block name="frontend_account_downloads_table_head_actions"}
                                <th class="col-xs-2">{s name="DownloadsColumnLink"}{/s}</th>
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
                                                    <p><strong>{$article.name}</strong></p>
                                                {/block}
                                                {block name='frontend_account_downloads_serial'}
                                                    {if $article.serial && $offerPosition.cleared|in_array:$sDownloadAvailablePaymentStatus}
                                                        <p class="text-muted">
                                                            {s name="DownloadsSerialnumber"}{/s} 
                                                            <div class="well well-sm">
                                                                <strong>{$article.serial}</strong>
                                                            </div>
                                                        </p>
                                                    {/if}
                                                {/block}
                                            {/block}
                                        </td>
                                        <td>
                                            {block name='frontend_account_downloads_link'}
                                                {if !$offerPosition.cleared|in_array:$sDownloadAvailablePaymentStatus}
                                                    <a href="#" title="{s name='DownloadsLink'}{/s} {$article.name}" class="btn btn-default" disabled="disabled">
                                                        <i class="fa fa-cloud-download fa-lg"></i> {s name="DownloadsLink"}{/s}
                                                    </a>
                                                {else}
                                                    <a href="{$article.esdLink}" title="{s name='DownloadsLink'}{/s} {$article.name}" class="btn btn-primary">
                                                        <i class="fa fa-cloud-download fa-lg"></i> {s name="DownloadsLink"}{/s}
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
        {/block}
    {/if}
{/block}