{block name="frontend_index_shopware_footer_include_inner"}
    <div id="footer" class="mhm">
        {block name='frontend_index_footer_menu'}
            {include file='frontend/index/footer-navigation.tpl'}
        {/block}
    </div>
{/block}

{block name='frontend_index_footer_copyright'}
    <div class="mtm">
        {block name='frontend_index_footer_vatinfo'}
            <p class="text-center">
                <small>
                    {if $sOutputNet}
                        {s name='FooterInfoExcludeVat'}&nbsp;{/s}
                    {else}
                        {s name='FooterInfoIncludeVat'}&nbsp;{/s}
                    {/if}
                </small>
            </p>
        {/block}
    </div>
{/block}