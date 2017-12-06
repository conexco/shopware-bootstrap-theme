{extends file='frontend/index/index.tpl'}

{* Main content *}
{block name='frontend_index_content'}
    {block name='frontend_newsletter_detail'}
        {if $sContentItem}
            {* Newsletter title *}
            {block name='frontend_newsletter_listing_title'}
                <h1>{if $sContentItem.date}{$sContentItem.date|date_format:"%d.%m.%Y"} - {/if}{$sContentItem.description}</h1>
            {/block}

            {* Actual newsletter *}
            {block name='frontend_newsletter_listing_iframe'}
                <div class="row">
                    <div class="col-12">
                        <iframe src="{$sContentItem.link}" width="100%" height="600" scrolling="yes" marginheight="0" marginwidth="0" frameborder="0"></iframe>
                    </div>
                </div>
            {/block}
        {else}
            {* Error message *}
            {block name='frontend_newsletter_listing_error_message'}
                {include file="frontend/_includes/messages.tpl" type="warning" content="{s name='NewsletterDetailInfoEmpty'}{/s}"}
            {/block}
        {/if}
        {* Newsletter detail buttons *}
        {block name="frontend_newsletter_detail_buttons"}
            {block name="frontend_newsletter_detail_buttons_backlink"}
                <a href="{$sBackLink}" class="btn btn-outline-secondary">{s name='NewsletterDetailLinkBack'}{/s}</a>
            {/block}    

            {block name="frontend_newsletter_detail_buttons_window"}    
                <a href="{$sContentItem.link}" class="btn btn-primary" target="_blank">{s name='NewsletterDetailLinkOpenNewWindow'}{/s}</a>
            {/block}    
        {/block}
    {/block}
{/block}