{namespace name="frontend/detail/description"}

{* Offcanvas close button *}
{include file="frontend/_includes/close-offcanvas.tpl"}

{* Description title *}
{block name="frontend_detail_tabs_content_description_title"}
    {block name="frontend_detail_tabs_content_description_title_inner"}
        <h3 class="h4">
            {s name="DetailDescriptionHeader"}{/s} "{$sArticle.articleName}"
        </h3>
    {/block}
{/block}

{* Product description *}
{block name='frontend_detail_description_text'}
    <div itemprop="description">
        {$sArticle.description_long|replace:"<table":"<table class=\"table table-striped\""}
    </div>
{/block}

{* Properties *}
{block name='frontend_detail_description_properties'}
    {if $sArticle.sProperties}
        <div class="row">
            <div class="col-lg-6 mb-3">
                <table class="table table-sm table-striped">
                    {foreach $sArticle.sProperties as $sProperty}
                        <tr>
                            {* Property label *}
                            {block name='frontend_detail_description_properties_label'}
                                <td class="bold">{$sProperty.name|escape}:</td>
                            {/block}

                            {* Property content *}
                            {block name='frontend_detail_description_properties_content'}
                                <td>{$sProperty.value|escape}</td>
                            {/block}
                        </tr>
                    {/foreach}
                </table>
            </div>
        </div>
    {/if}
{/block}

{* Links *}
{block name='frontend_detail_description_links'}
    {if $sArticle.sLinks}
        <div class="h5">
            {s name="ArticleTipMoreInformation"}{/s} "{$sArticle.articleName}"
        </div>

        {block name='frontend_detail_description_links_list'}
            <ul class="list-unstyled">
                {block name='frontend_detail_actions_contact'}
                    {if $sInquiry}
                        <li class="nav-item">
                            <a href="{$sInquiry}" 
                               rel="nofollow" 
                               title="{s name='DetailLinkContact'}{/s}">
                                {s name="DetailLinkContact" namespace="frontend/detail/actions"}{/s}
                            </a>
                        </li>
                    {/if}
                {/block}

                {foreach from=$sArticle.sLinks item=information}
                    <li class="list-item">
                        {if $information.supplierSearch}
                            <a href="{url controller='listing' action='manufacturer' sSupplier=$sArticle.supplierID}" 
                               target="{$information.target}" 
                               title="{"{s name="DetailDescriptionLinkInformation"}{/s}"|escape}">
                                {s name="DetailDescriptionLinkInformation"}{/s}
                            </a>
                        {else}
                            <a href="{$information.link}" 
                               target="{if $information.target}{$information.target|escapeHtml}{else}_blank{/if}" 
                               rel="nofollow">
                                {$information.description|escapeHtml}
                            </a>
                        {/if}
                    </li>
                {/foreach}
            </ul>
        {/block}
    {/if}
{/block}

{* Supplier *}
{block name='frontend_detail_description_supplier'}
    {if $sArticle.supplierDescription}
        <div class="h5">
            {s name="DetailDescriptionSupplier"}{/s} {$sArticle.supplierName}
        </div>
        
        <p>{$sArticle.supplierDescription}</p>
    {/if}
{/block}

{* Downloads *}
{block name='frontend_detail_description_downloads'}
    {if $sArticle.sDownloads}

        {* Downloads title *}
        {block name='frontend_detail_description_downloads_title'}
            <div class="h5">
                {s name="DetailDescriptionHeaderDownloads"}{/s}
            </div>
        {/block}

        {* Downloads list *}
        {block name='frontend_detail_description_downloads_content'}
            <ul class="list-unstyled">
                {foreach $sArticle.sDownloads as $download}
                    {block name='frontend_detail_description_downloads_content_link'}
                        <li class="list-item">
                            <a href="{$download.filename}" 
                               target="_blank"
                               title="{"{s name="DetailDescriptionLinkDownload"}{/s}"|escape} {$download.description|escape}">
                                {s name="DetailDescriptionLinkDownload"}{/s} {$download.description}
                            </a>
                        </li>
                    {/block}
                {/foreach}
            </ul>
        {/block}
    {/if}
{/block}

{* Comment - Item open text fields attr3 *}
{block name='frontend_detail_description_our_comment'}
    {if $sArticle.attr3}

        {* Comment title  *}
        {block name='frontend_detail_description_our_comment_title'}
            <div class="h5">
                {s name='DetailDescriptionComment'}{/s} "{$sArticle.articleName}"
            </div>
        {/block}

        {block name='frontend_detail_description_our_comment_title_content'}
            <blockquote>
                {$sArticle.attr3}
            </blockquote>
        {/block}
    {/if}
{/block}
