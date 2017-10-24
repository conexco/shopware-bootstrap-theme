{block name='frontend_index_header_row_left_inner'}
    <div class="row">
        {block name='frontend_index_toggle_navbar'}
            <div class="col-xs-3 visible-xs visible-sm"></div>
        {/block}
        {block name='frontend_index_logo'}
            <div class="col-xs-9 col-hd-12">
                {block name='frontend_index_logo_inner'}
                    <a href="{url controller='index'}" title="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}">
                        <img src="{link file=$theme.desktopLogo}" alt="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}" class="img-responsive hidden-xs hidden-sm"/>
                        <img src="{link file=$theme.mobileLogo}" alt="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}" class="img-responsive visible-xs visible-sm mbm"/>
                    </a>
                {/block}
            </div>
        {/block}
        {* Support Info *}
        {block name='frontend_index_logo_supportinfo'}{/block}
        {* Trusted Shops *}
        {block name='frontend_index_logo_trusted_shops'}{/block}
    </div>
{/block}
