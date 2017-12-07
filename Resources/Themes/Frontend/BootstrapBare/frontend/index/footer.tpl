{block name="frontend_index_shopware_footer_include_inner"}
    <div id="footer">
        {block name='frontend_index_footer_menu'}
            {include file='frontend/index/footer-navigation.tpl'}
        {/block}
    </div>
{/block}

{block name='frontend_index_footer_copyright'}
    <div class="footer-vat-info mb-2">
        {block name='frontend_index_footer_vatinfo'}
            <div class="small text-center">
                {if $sOutputNet}
                    {s name='FooterInfoExcludeVat'}&nbsp;{/s}
                {else}
                    {s name='FooterInfoIncludeVat'}&nbsp;{/s}
                {/if}
            </div>
        {/block}
    </div>
{/block}