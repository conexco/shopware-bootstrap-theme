{namespace name="frontend/detail/description"}

{* Offcanvas close button *}
{include file="frontend/_includes/close-offcanvas.tpl"}

{* Description title *}
{block name="frontend_detail_tabs_content_description_title"}
    <div class="page-header">
        {block name="frontend_detail_tabs_content_description_title_inner"}
            <h3>{s name="DetailDescriptionHeader"}{/s} "{$sArticle.articleName}"</h3>
        {/block}
    </div>
{/block}

{* Properties *}
{if $sArticle.sProperties}
    {block name='frontend_detail_description_properties'}
        <dl class="dl-horizontal">
            {foreach from=$sArticle.sProperties item=sProperty}
                {* Property label *}
                {block name='frontend_detail_description_properties_label'}
                    <dt>{$sProperty.name|escape}</dt>
                {/block}
                {* Property content *}
                {block name='frontend_detail_description_properties_content'}
                    <dd>{$sProperty.value|escape}</dd>
                {/block}
            {/foreach}
        </dl>
    {/block}
{/if}

{* Product description *}
{block name='frontend_detail_description_text'}
    <div itemprop="description">
        {$sArticle.description_long|replace:"<table":"<table class=\"table table-striped\""}
    </div>
{/block}

{* Supplier *}
{block name='frontend_detail_description_supplier'}
    {if $sArticle.supplierDescription}
        <h3>{s name="DetailDescriptionSupplier"}{/s} "{$sArticle.supplierName}"</h3>
        <p>{$sArticle.supplierDescription}</p>
    {/if}
{/block}

{* Links *}
{block name='frontend_detail_description_links'}
    {if $sArticle.sLinks}
        <h3>{s name="ArticleTipMoreInformation"}{/s} "{$sArticle.articleName}"</h3>
        <ul>
            {foreach from=$sArticle.sLinks item=information}
                <li>
                    {if $information.supplierSearch}
                        <a href="{url controller='listing' action='manufacturer' sSupplier=$sArticle.supplierID}" target="{$information.target}" title="{"{s name="DetailDescriptionLinkInformation"}{/s}"|escape}">
                            {s name="DetailDescriptionLinkInformation"}{/s}
                        </a>
                    {else}
                        <a href="{$information.link}" target="{if $information.target}{$information.target|escapeHtml}{else}_blank{/if}" rel="nofollow">
                            {$information.description|escapeHtml}
                        </a>
                    {/if}
                </li>
            {/foreach}
        </ul>
    {/if}
{/block}

{* Downloads *}
{block name='frontend_detail_description_downloads'}
    {if $sArticle.sDownloads}
        <h3>{s name="DetailDescriptionHeaderDownloads"}{/s}</h3>
        <ul>
            {foreach from=$sArticle.sDownloads item=download}
                <li>
                    <a href="{$download.filename}" target="_blank">
                        {$download.description}
                    </a>
                </li>
            {/foreach}
        </ul>
    {/if}
{/block}

{* Our comment *}
{if $sArticle.attr3}
    {block name='frontend_detail_description_our_comment'}
        <div id="unser_kommentar">
            <h3>{se name='DetailDescriptionComment'}{/se} "{$sArticle.articleName}"</h3>
            <blockquote>
                <p>{$sArticle.attr3}</p>
            </blockquote>
        </div>
    {/block}
{/if}
