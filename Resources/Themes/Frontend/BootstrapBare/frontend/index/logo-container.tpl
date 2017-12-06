{block name='frontend_index_header_row_left_inner'}
    {block name='frontend_index_logo'}
        <div class="shop-logo">
            {block name='frontend_index_logo_inner'}
                <a href="{url controller='index'}" title="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}">
                    <img src="{link file=$theme.desktopLogo}" alt="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}" class="img-responsive d-none d-sm-block"/>
                    <img src="{link file=$theme.mobileLogo}" alt="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}" class="img-responsive d-sm-none mbm"/>
                </a>
            {/block}
        </div>
    {/block}

    {* Support Info *}
    {block name='frontend_index_logo_supportinfo'}{/block}

    {* Trusted Shops *}
    {block name='frontend_index_logo_trusted_shops'}{/block}
{/block}
