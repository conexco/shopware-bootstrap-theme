{extends file='frontend/index/index.tpl'}

{* Main content *}
{block name='frontend_index_content'}
    {block name='frontend_newsletter_listing'}
        {if $sContent}
            {* Newsletter table header *}
            {block name="frontend_newsletter_listing_headline"}
                <h1>{s name="NewsletterListingHeaderName"}Newsletter Archiv{/s}</h2>
            {/block}

            {* Newsletter listing entry list *}
            {block name="frontend_newsletter_listing_entry_list"}
                <ul class="list-unstyled">
                    {foreach from=$sContent item=sContentItem key=key name="counter"}
                        {* Newsletter entry *}
                        {block name='frontend_newsletter_listing_entry'}
                            <li class="mbm">
                                {* Newsletter entry description *}
                                {block name="frontend_newsletter_listing_entry_description"}
                                    {if $sContentItem.date}{$sContentItem.date|date_format:"%d.%m.%Y"} - {/if}{$sContentItem.description}
                                {/block}
                                {* Newsletter entry button *}
                                {block name="frontend_newsletter_listing_entry_button"}
                                    <a href="{$sContentItem.link}" class="btn btn-primary btn-sm pull-right">{s name='NewsletterListingLinkDetails'}{/s}</a>
                                    <div class="clearfix"></div>
                                {/block}
                            </li>
                        {/block}
                    {/foreach}
                </ul>
            {/block}
        {else}
            {* Error message *}
            {block name='frontend_newsletter_listing_error_message'}
                {include file="frontend/_includes/messages.tpl" type="danger" content="{s name='NewsletterListingInfoEmpty'}{/s}"}
            {/block}
        {/if}
        {* Paging *}
        {block name="frontend_newsletter_listing_paging"}
            {$pages = $sNumberPages}
            {$baseUrl = {url controller="newsletter" action="listing"} }
            {include file="frontend/listing/actions/action-pagination.tpl"}
        {/block}
    {/block}
{/block}