{block name='frontend_index_header_row_right_inner'}
    {block name='frontend_index_shop_navigation'}
        <div class="row">
            {block name='frontend_index_shop_navigation_inner'}
                {*! Shop navigation *}
                {block name='frontend_index_checkout_actions'}
                    {action module=widgets controller=checkout action=info}
                {/block}
            {/block}
        </div>
    {/block}
    {block name='frontend_index_search_trusted'}
        <div class="row mvm">
            {block name='frontend_index_search_trusted_inner'}
                {block name='frontend_index_search'}
                    <div class="col-xs-12 col-md-8 col-lg-8">
                        {*! Search *}
                        {block name='frontend_index_search_inner'}
                            {include file="frontend/index/search.tpl"}
                        {/block}
                    </div>
                {/block}
                {block name='frontend_index_trusted'}
                    {*! Trusted Shops *}
                    <div class="hidden-xs hidden-sm col-md-4 col-lg-4">
                        {block name='frontend_index_trusted_inner'}
                            {if $sTrustedShops.id}
                                {assign var="tsid" value=$sTrustedShops.id}
                            {elseif {config name=TSID}}
                                {assign var="tsid" value={config name=TSID}}
                            {/if}
                            {if $tsid}
                                <a href="https://www.trustedshops.com/shop/certificate.php?shop_id={$tsid}" title="{s name='WidgetsTrustedLogo' namespace='frontend/plugins/trusted_shops/logo'}{/s}" target="_blank">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-3">
                                            <img src="{link file='frontend/_public/src/img/logos/trusted-shops-logo.png'}" alt="{s name='WidgetsTrustedLogo' namespace='frontend/plugins/trusted_shops/logo'}{/s}" class="img-responsive"/>
                                        </div>
                                        <div class="hidden-sm col-md-9">
                                            <p>
                                                <small>{s name='WidgetsTrustedLogoText2'}<span><strong>Sicher</strong> einkaufen</span><br/>Trusted Shops zertifiziert{/s}</small>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            {/if}
                        {/block}
                    </div>
                {/block}
            {/block}
        </div>
    {/block}
{/block}