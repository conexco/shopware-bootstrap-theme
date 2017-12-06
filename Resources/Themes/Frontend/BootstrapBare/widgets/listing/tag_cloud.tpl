{block name="frontend_home_index_tagcloud_inner"}
    {if $sCloud}
        <div class="panel panel-default tagcloud-wrapper d-none d-md-block">
            {block name="frontend_index_tagcloud_content"}
                <div class="panel-body tagcloud">
                    {foreach from=$sCloud item=sCloudItem}
                        {block name="frontend_index_tagcloud_entry"}
                            <a href="{$sCloudItem.link}" title="{$sCloudItem.name}" class="{$sCloudItem.class} mhs">
                                {$sCloudItem.name|truncate:15:"":false}
                            </a>
                        {/block}
                    {/foreach}
                </div>
            {/block}
        </div>
    {/if}
{/block}
