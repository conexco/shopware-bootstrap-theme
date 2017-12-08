{block name="frontend_index_start"}{/block}

{block name="frontend_index_doctype"}
<!DOCTYPE html>
{/block}

{block name="gridconfig"}
    {include file='frontend/_includes/config.tpl'}
{/block}

{block name='frontend_index_html'}
<html lang="{s name='IndexXmlLang'}de{/s}" itemscope="itemscope" itemtype="http://schema.org/WebPage">
{/block}

{block name='frontend_index_header'}
    {include file='frontend/index/header.tpl'}
{/block}

{block name='frontend_index_body'}
    <body
    {* Background Image *}
    {if $Controller || $BodyBgImg}
        class="{block name="frontend_index_body_classes"}ctl_{controllerName} is-act-{controllerAction}{if $sUserLoggedIn} is-user{/if}{if $sOneTimeAccount} is-one-time-account{/if}{if $BodyBgImg} bg-img-{$theme['body-bg-img-hide']}{/if}{/block}"
    {/if}
    {if $BodyBgImg}
        style="background: url({link file=$BodyBgImg}) {$theme['swf-body-bg-img-repeat']};"
    {/if}>
    {block name='frontend_index_after_body'}{/block}

    {block name='frontend_index_body_inner'}
        {block name="frontend_index_page_wrap"}
            <div class="page-wrap">
                {* Message if javascript is disabled *}
                {block name="frontend_index_no_script_message"}
                    <noscript class="noscript-main">
                        {include file="frontend/_includes/messages.tpl" 
                                 type="danger" 
                                 dismiss="true" 
                                 content="{s name="IndexNoscriptNotice"}{/s}"}
                    </noscript>
                {/block}

                {block name='frontend_index_before_page'}{/block}

                {* Shop header *}
                {block name='frontend_index_navigation'}
                    <header class="header-main">
                        {block name='frontend_index_header_navigation'}
                            <div id="header" class="container d-print-none p-3">
                                
                                {* Include the top bar navigation *}
                                {block name='frontend_index_top_bar_container'}
                                    {include file="frontend/index/topbar-navigation.tpl"}
                                {/block}

                                {block name='frontend_index_header_container_inner'}
                                    {block name='frontend_index_header_row'}
                                        <div class="row align-items-center header-row mb-3">

                                            {* TODO: move to topbar? *}
                                            {* {block name="frontend_index_navigation_nav_toggle"}
                                                <div class="col-3 d-md-none">
                                                    {if !$theme.checkoutHeader || 
                                                        $theme.checkoutHeader && 
                                                            !({controllerAction} == 'confirm' || 
                                                            {controllerAction} == 'shippingPayment' || 
                                                            {controllerAction} == 'finish')}

                                                        <button id="navToggle" 
                                                                class="btn btn-link nav-toggle"
                                                                type="button"
                                                                data-offcanvas="true"
                                                                data-offCanvasSelector="#mainNavigation"
                                                                aria-title="{s name='IndexLinkMenu' namespace='frontend/index/menu_left'}{/s}">
                                                            <span class="nav-toggle-bars"></span>
                                                        </button>
                                                    {/if}
                                                </div>
                                            {/block} *}

                                            {* Shop logo *}
                                            {block name='frontend_index_logo_container'}
                                                {include file="frontend/index/logo-container.tpl"}
                                            {/block}

                                            {* Shop navigation *}
                                            {block name='frontend_index_shop_navigation'}
                                                {include file="frontend/index/shop-navigation.tpl"}
                                            {/block}
                                        </div>
                                    {/block}

                                    {* Maincategories navigation top *}
                                    {block name='frontend_index_navigation_categories_top'}
                                        {block name="frontend_index_navigation_categories_top_include"}
                                            {include file='frontend/index/main-navigation.tpl'}
                                        {/block}
                                    {/block}
                                {/block}
                            </div>
                        {/block}
                    </header>
                {/block}

                {block name='frontend_index_emotion_loading_overlay'}
                    {if ($isEmotionLandingPage || $hasEmotion) && !$hasEscapedFragment}
                        <div class="emotion-overlay sw5-plugin"></div>
                    {/if}
                {/block}

                {block name='frontend_index_scrollup'}
                    <div class="d-none d-md-block">
                        {block name='frontend_index_scrollup_inner'}
                            <a href="#" 
                               class="scroll-up btn btn-primary" 
                               title="{s name='IndexScrollUpTitle'}Nach oben{/s}" 
                               data-scroll-up="true">
                                {block name='frontend_index_scrollup_icon'}
                                    <span class="fa fa-angle-up fa-lg"></span>
                                {/block}
                            </a>
                        {/block}
                    </div>
                {/block}

                {block name='frontend_index_content_main'}
                    <section class="{block name="frontend_index_content_main_classes"}content-main{/block}">
                        {block name='frontend_index_main_section'}
                            {block name='frontend_index_content_container'}
                                {* Content section *}
                                <div id="content" class="container">
                                    {block name='frontend_index_content_container_inner'}
                                        <div class="content-container">
                                            {* Breadcrumb *}
                                            {block name='frontend_index_breadcrumb'}
                                                {if count($sBreadcrumb)}
                                                    {block name='frontend_index_breadcrumb_inner'}
                                                        {include file='frontend/index/breadcrumb.tpl'}
                                                    {/block}
                                                {/if}
                                            {/block}

                                            {* Content top container *}
                                            {block name="frontend_index_content_top"}{/block}

                                            {block name='frontend_index_main_content'}
                                                <div class="row">
                                                    {block name='frontend_index_main_content_inner'}
                                                        {* Sidebar left *}
                                                        {block name='frontend_index_content_left_wrapper'}
                                                            {$gridLeftStart|unescape:'html'}
                                                            {block name='frontend_index_content_left'}
                                                                {include file='frontend/index/sidebar.tpl'}
                                                            {/block}
                                                            {$gridLeftEnd|unescape:'html'}
                                                        {/block}

                                                        {* Main content *} 
                                                        {block name='frontend_index_content_wrapper'}
                                                            {$gridCenterStart|unescape:'html'}
                                                            {block name='frontend_index_content'}{/block}
                                                            {$gridCenterEnd|unescape:'html'}
                                                        {/block}

                                                        {* Sidebar right *}
                                                        {block name='frontend_index_content_right_wrapper'}
                                                            {$gridRightStart|unescape:'html'}
                                                            {block name='frontend_index_content_right'}{/block}
                                                            {$gridRightEnd|unescape:'html'}
                                                        {/block}
                                                    {/block}
                                                </div>
                                            {/block}
                                        </div>    
                                    {/block}
                                </div>
                            {/block}

                            {* Last seen products *}
                            {block name="frontend_index_footer_last_articles"}
                                {if $sLastArticlesShow}
                                    {block name="frontend_index_footer_last_articles_container"}
                                        <div class="container last-seen-products-wrapper">
                                            {block name="frontend_index_footer_last_articles_hr"}
                                                <hr class="hr-brand hr-large">
                                            {/block}
                                            <div class="last-seen-products hidden" data-last-seen-products="true">
                                                <div class="last-seen-products-title page-header">
                                                    <h3>
                                                        {s namespace="frontend/plugins/index/viewlast" name='WidgetsRecentlyViewedHeadline'}{/s}
                                                    </h3>
                                                </div>
                                                <div class="row last-seen-products-container sw5-plugin" 
                                                     data-equalheight="true" 
                                                     data-mode="ajax">
                                                </div>
                                            </div>
                                        </div>
                                    {/block}
                                {/if}
                            {/block}
                        {/block}
                    </section>
                {/block}

                {* Footer *}
                {block name="frontend_index_footer"}
                    <footer class="footer-main d-print-none p-3 mt-3">
                        {block name="frontend_index_footer_container"}
                            <div class="container">
                                {block name="frontend_index_footer_container_inner"}
                                    {block name="frontend_index_footer_container_include"}
                                        {include file='frontend/index/footer.tpl'}
                                    {/block}
                                    
                                    {block name="frontend_index_footer_bootstrap_link"}
                                        <div class="small text-center">
                                            {s name="IndexFooterBootstrapLink"}
                                                <a href="http://www.bootstrap.de" 
                                                   target="_blank" 
                                                   title="Shopware Bootstrap Theme" 
                                                   rel="">
                                                    Shopware Bootstrap Theme
                                                </a>
                                            {/s}
                                        </div>
                                    {/block}
                                {/block}
                            </div>
                        {/block}
                    </footer>
                {/block}

                {block name='frontend_index_body_inline'}{/block}
            </div>
        {/block}

        {* Cookie permission hint *}
        {block name='frontend_index_cookie_permission'}
            {if {config name="show_cookie_note"}}
                {include file="frontend/_includes/cookie_permission_note.tpl"}
            {/if}
        {/block}
    {/block}

    {block name='frontend_index_footer_javascript_include'}
        {block name="frontend_index_header_javascript"}
            <script type="text/javascript" id="footer-js-inline">
                //<![CDATA[
                {block name="frontend_index_header_javascript_inline"}
                    var timeNow = {time() nocache},
                        swfCustomSelects = '{$theme['custom-selects']}',
                        swfCustomSelectOptions = {ldelim}'theme': 'bootstrap', 'downArrowIcon': 'fa'{rdelim},
                        swfAjaxCartScrollbar = true,
                        swfAjaxCartScrollbarOptions = {ldelim}showArrows: false{rdelim},
                        swfDefaultBreakpointMD = {$DefaultBreakpointMD},
                        swfDefaultBreakpointHD = {$DefaultBreakpointHD},
                        swfDefaultBreakpointSM = {$DefaultBreakpointSM},
                        swfDefaultBreakpointXS = {$DefaultBreakpointXS},
                        swfDeactivateZoom = {$DeactivateZoom},
                        swfDetailOffcanvasViewports = ['xs'],
                        swfBlogOffcanvasViewports = ['xs', 's'],
                        swfAccountOffcanvasViewports = ['xs', 's'],
                        swfAjaxCartOffcanvasViewports = ['xs', 's', 'm', 'l', 'xl'],
                        swfAjaxCartPopoverViewports = [];

                    var asyncCallbacks = [];

                    document.asyncReady = function (callback) {
                        asyncCallbacks.push(callback);
                    };

                    var statisticDevices = [
                        { device: 'mobile', enter: 0, exit: 767 },
                        { device: 'tablet', enter: 768, exit: 1259 },
                        { device: 'desktop', enter: 1260, exit: 5160 }
                    ];

                    var controller =  {ldelim}
                        'vat_check_enabled': '{config name='vatcheckendabled'}',
                        'vat_check_required': '{config name='vatcheckrequired'}',
                        'ajax_cart': '{url controller='checkout' action='ajaxCart'}',
                        'ajax_search': '{url controller="ajax_search" _seo=false}',
                        'register': '{url controller="register"}',
                        'checkout': '{url controller="checkout"}',
                        'ajax_validate': '{url controller="register"}',
                        'ajax_add_article': '{url controller="checkout" action="addArticle"}',
                        'ajax_listing': '{url module="widgets" controller="Listing" action="ajaxListing"}',
                        'ajax_cart_refresh': '{url controller="checkout" action="ajaxAmount"}',
                        'csrf_token_generate': '{url controller="csrftoken" fullPath=false}',
                        'ajax_address_selection': '{url controller="address" action="ajaxSelection" fullPath forceSecure}',
                        'ajax_address_editor': '{url controller="address" action="ajaxEditor" fullPath forceSecure}'
                    {rdelim};

                    var snippets = snippets || {ldelim}
                        'noCookiesNotice': '{"{s name='IndexNoCookiesNotice'}{/s}"|escape}'
                    {rdelim};

                    var lastSeenProductsConfig = lastSeenProductsConfig || {ldelim}
                        'baseUrl': '{$Shop->getBaseUrl()}',
                        'shopId': '{$Shop->getId()}',
                        'noPicture': '{link file="frontend/_public/src/img/no-picture.png"}',
                        'productLimit': ~~('{config name="lastarticlestoshow"}'),
                        'currentArticle': {ldelim}{if $sArticle}
                            {foreach $sLastArticlesConfig as $key => $value}
                            '{$key}': '{$value}',
                            {/foreach}
                            'articleId': ~~('{$sArticle.articleID}'),
                            'orderNumber': '{$sArticle.ordernumber}',
                            'linkDetailsRewritten': '{$sArticle.linkDetailsRewrited}',
                            'articleName': '{$sArticle.articleName|escape:"javascript"}{if $sArticle.additionaltext} {$sArticle.additionaltext|escape:"javascript"}{/if}',
                            'images': {ldelim}
                                {foreach $sArticle.image.thumbnails as $key => $image}
                                '{$key}': {ldelim}
                                    'source': '{$image.source}',
                                    'retinaSource': '{$image.retinaSource}',
                                    'sourceSet': '{$image.sourceSet}'
                                    {rdelim},
                                {/foreach}
                                {rdelim}
                            {/if}{rdelim}
                        {rdelim};
                        
                    var csrfConfig = csrfConfig || {ldelim}
                        'generateUrl': '{url controller="csrftoken" fullPath=false}',
                        'basePath': '{$Shop->getBasePath()}',
                        'shopId': '{$Shop->getId()}'
                    {rdelim};    
                {/block}
                //]]>
            </script>
        {/block}

        {block name="frontend_index_header_javascript_jquery"}
            {* Partner statistics widget *}
            {if !{config name=disableShopwareStatistics} }
                {include file='widgets/index/statistic_include.tpl'}
            {/if}
        {/block}

        {* jQuery and all other compiled javascript files *}
        {block name="frontend_index_header_javascript_jquery_lib"}
            {compileJavascript timestamp={themeTimestamp} output="javascriptFiles"}
            {foreach $javascriptFiles as $file}
                <script{if $theme.asyncJavascriptLoading} async{/if} src="{$file}" id="main-script"></script>
            {/foreach}
        {/block}

        {block name="frontend_index_javascript_async_ready"}
            {include file="frontend/index/script-async-ready.tpl"}
        {/block}
    {/block}
    </body>
{/block}
</html>