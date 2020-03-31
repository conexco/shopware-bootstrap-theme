{block name="frontend_index_start"}{/block}

{block name="frontend_index_doctype"}
<!DOCTYPE html>
{/block}

{block name="gridconfig"}
    {include file='frontend/_public/src/config.tpl'}
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
                        {include file="frontend/_includes/messages.tpl" type="danger" dismiss="true" content="{s name="IndexNoscriptNotice"}{/s}"}
                    </noscript>
                {/block}

                {block name='frontend_index_before_page'}{/block}

                {block name='frontend_index_navigation'}
                    <header>
                        {block name='frontend_index_header_navigation'}
                            <div class="container hidden-print" id="header">
                                {block name='frontend_index_header_container_inner'}

                                    {*! Shop header *}
                                    {block name='frontend_index_header_row'}
                                        <div class="row" id="header-row">
                                            {block name="frontend_index_navigation_nav_toggle"}
                                                <div class="col-xs-3 visible-xs visible-sm">
                                                    {if !$theme.checkoutHeader || $theme.checkoutHeader && !({controllerAction} == 'confirm' || {controllerAction} == 'shippingPayment' || {controllerAction} == 'finish')}
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
                                            {/block}

                                            {block name='frontend_index_header_row_left'}
                                                <div class="col-xs-9 col-hd-5 col-md-3">
                                                    {*! Shop logo *}
                                                    {block name='frontend_index_logo_container'}
                                                        {include file="frontend/index/logo-container.tpl"}
                                                    {/block}
                                                </div>
                                            {/block}

                                            {block name='frontend_index_header_hr'}
                                                <div class="col-xs-12 visible-xs">
                                                    <hr class="mts mbm">
                                                </div>
                                            {/block}

                                            {block name='frontend_index_header_row_right'}
                                                <div class="col-xs-12 col-hd-7 col-md-9">
                                                    {* Shop navigation *}
                                                    {block name='frontend_index_shop_navigation'}
                                                        {include file="frontend/index/shop-navigation.tpl"}
                                                    {/block}
                                                </div>
                                            {/block}
                                        </div>
                                    {/block}

                                    {*! Maincategories navigation top *}
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
                    <div class="visible-lg">
                        {block name='frontend_index_scrollup_inner'}
                            <a href="#" class="scroll-up btn btn-primary" title="{s name='IndexScrollUpTitle'}Nach oben{/s}" data-scroll-up="true">
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
                                {*! Content section *}
                                <div id="content" class="container">
                                    {* Cookie consent manager*}
                                    {block name='frontend_index_cookie_consent_manager'}
                                        {include file='frontend/index/cookie_consent.tpl'}
                                    {/block}
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

                                            {*! Content top container *}
                                            {block name="frontend_index_content_top"}{/block}

                                            {block name='frontend_index_main_content'}
                                                <div class="row">
                                                    {block name='frontend_index_main_content_inner'}
                                                        {block name='frontend_index_content_left_wrapper'}
                                                            {*! Sidebar left *}
                                                            {$gridLeftStart|unescape:'html'}
                                                            {block name='frontend_index_content_left'}
                                                                {include file='frontend/index/sidebar.tpl'}
                                                            {/block}
                                                            {$gridLeftEnd|unescape:'html'}
                                                        {/block}
                                                        {block name='frontend_index_content_wrapper'}
                                                            {*! Main content *}
                                                            {$gridCenterStart|unescape:'html'}
                                                            {block name='frontend_index_content'}{/block}
                                                            {$gridCenterEnd|unescape:'html'}
                                                        {/block}
                                                        {block name='frontend_index_content_right_wrapper'}
                                                            {*! Sidebar right *}
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
                                {if $sLastArticlesShow && !$isEmotionLandingPage}
                                    {block name="frontend_index_footer_last_articles_container"}
                                        <div class="container last-seen-products-wrapper">
                                            {block name="frontend_index_footer_last_articles_hr"}
                                                <hr class="hr-brand hr-large">
                                            {/block}
                                            <div class="last-seen-products hidden" data-last-seen-products="true">
                                                <div class="last-seen-products-title page-header">
                                                    <h3>{s namespace="frontend/plugins/index/viewlast" name='WidgetsRecentlyViewedHeadline'}{/s}</h3>
                                                </div>
                                                <div class="row last-seen-products-container sw5-plugin" data-equalheight="true" data-mode="ajax">
                                                </div>
                                            </div>
                                        </div>
                                    {/block}
                                {/if}
                            {/block}
                        {/block}
                    </section>
                {/block}

                {*! FOOTER *}
                {block name="frontend_index_footer"}
                    <footer class="hidden-print">
                        {block name="frontend_index_footer_container"}
                            <div class="container">
                                {block name="frontend_index_footer_container_inner"}
                                    {block name="frontend_index_footer_container_include"}
                                        {include file='frontend/index/footer.tpl'}
                                    {/block}

                                    {block name="frontend_index_footer_bootstrap_link"}
                                        <p class="text-center">
                                            <small>
                                                {s name="IndexFooterBootstrapLink"}<a href="http://www.bootstrap.de" target="_blank" title="Shopware Bootstrap Theme" rel="">Shopware Bootstrap Theme</a>{/s}
                                            </small>
                                        </p>
                                    {/block}
                                {/block}
                            </div>
                        {/block}
                    </footer>
                {/block}

                {block name='frontend_index_body_inline'}{/block}
            </div>
        {/block}

        {* If required add the cookiePermission hint *}
        {block name='frontend_index_cookie_permission'}
            {if {config name="show_cookie_note"}}
                {include file="frontend/_includes/cookie_permission_note.tpl"}
            {/if}
        {/block}
    {/block}

    {block name='frontend_index_footer_javascript_include'}
        {block name="frontend_index_ajax_seo_optimized"}
            {*
                @deprecated

                SEO support for AJAX routes is deprecated in 5.4.

                You can disable the check for AJAX routes in Shopware 5.4 by overriding this block and setting the variable
                to false.

                This block will be removed in Shopware 5.5 and all affected AJAX routes below will have SEO support disabled.
            *}
            {$ajaxSeoSupport = true}
        {/block}

        {block name="frontend_index_header_javascript"}
            {$controllerData = [
                'vat_check_enabled' => {config name='vatcheckendabled'},
                'vat_check_required' => {config name='vatcheckrequired'},
                'register' => {url controller="register"},
                'checkout' => {url controller="checkout"},
                'ajax_search' => {url controller="ajax_search" _seo=false},
                'ajax_cart' => {url controller='checkout' action='ajaxCart' _seo=$ajaxSeoSupport},
                'ajax_validate' => {url controller="register" _seo=$ajaxSeoSupport},
                'ajax_add_article' => {url controller="checkout" action="addArticle" _seo=$ajaxSeoSupport},
                'ajax_listing' => {url module="widgets" controller="Listing" action="ajaxListing" _seo=$ajaxSeoSupport},
                'ajax_cart_refresh' => {url controller="checkout" action="ajaxAmount" _seo=$ajaxSeoSupport},
                'ajax_address_selection' => {url controller="address" action="ajaxSelection" fullPath _seo=$ajaxSeoSupport},
                'ajax_address_editor' => {url controller="address" action="ajaxEditor" fullPath _seo=$ajaxSeoSupport}
            ]}

            {$snippetsData = [
                'noCookiesNotice' => {"{s name='IndexNoCookiesNotice'}{/s}"|escape:'javascript'}
            ]}

            {$themeConfig = [
                'offcanvasOverlayPage' => $theme.offcanvasOverlayPage
            ]}

            {$lastSeenProductsKeys = []}
            {foreach $sLastArticlesConfig as $key => $value}
                {$lastSeenProductsKeys[$key] = $value}
            {/foreach}

            {$lastSeenProductsConfig = [
                'baseUrl' => $Shop->getBaseUrl(),
                'shopId' => $Shop->getId(),
                'noPicture' => {link file="frontend/_public/src/img/no-picture.jpg"},
                'productLimit' => {"{config name=lastarticlestoshow}"|floor},
                'currentArticle' => ""
            ]}

            {if $sArticle}
                {$lastSeenProductsConfig.currentArticle = $sLastArticlesConfig}
                {$lastSeenProductsConfig.currentArticle.articleId = $sArticle.articleID}
                {$lastSeenProductsConfig.currentArticle.linkDetailsRewritten = $sArticle.linkDetailsRewrited}
                {$lastSeenProductsConfig.currentArticle.articleName = $sArticle.articleName}
                {if $sArticle.additionaltext}
                    {$lastSeenProductsConfig.currentArticle.articleName = $lastSeenProductsConfig.currentArticle.articleName|cat:' ':$sArticle.additionaltext}
                {/if}
                {$lastSeenProductsConfig.currentArticle.imageTitle = $sArticle.image.description}
                {$lastSeenProductsConfig.currentArticle.images = []}

                {foreach $sArticle.image.thumbnails as $key => $image}
                    {$lastSeenProductsConfig.currentArticle.images[$key] = [
                        'source' => $image.source,
                        'retinaSource' => $image.retinaSource,
                        'sourceSet' => $image.sourceSet
                    ]}
                {/foreach}
            {/if}

            {$csrfConfig = [
                'generateUrl' => {url controller="csrftoken" fullPath=false},
                'basePath' => $Shop->getBasePath(),
                'shopId' => $Shop->getId()
            ]}

            {* let the user modify the data here *}
            {block name="frontend_index_header_javascript_data"}{/block}

            <script type="text/javascript" id="footer-js-inline">
                {block name="frontend_index_header_javascript_inline"}
                    var timeNow = {time() nocache},
                        swfCustomSelects = '{$theme['custom-selects']}',
                        swfCustomSelectOptions = {ldelim}'theme': 'bootstrap', 'downArrowIcon': 'fa'{rdelim},
                        swfShowHidePwd = '{$theme['pwd-show-hide']}',
                        swfShowPwdStrength = '{$theme['pwd-strength']}',
                        swfShowPwdStrengthConfig = {ldelim}minLenght: {config name=MinPassword}{rdelim},
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

                    var controller = controller || JSON.parse('{$controllerData|json_encode}');
                    var snippets = snippets || JSON.parse('{$snippetsData|json_encode}');
                    var themeConfig = themeConfig || JSON.parse('{$themeConfig|json_encode}');
                    var lastSeenProductsConfig = lastSeenProductsConfig || {$lastSeenProductsConfig|json_encode};
                    var csrfConfig = csrfConfig || JSON.parse('{$csrfConfig|json_encode}');
                    var statisticDevices = [
                        { device: 'mobile', enter: 0, exit: 767 },
                        { device: 'tablet', enter: 768, exit: 1259 },
                        { device: 'desktop', enter: 1260, exit: 5160 }
                    ];

                    var cookieRemoval = cookieRemoval || {config name="cookie_note_mode"};
                {/block}
            </script>
        {/block}

        {block name="frontend_index_header_javascript_jquery"}
            {* Add the partner statistics widget, if configured *}
            {if !{config name=disableShopwareStatistics} }
                {include file='widgets/index/statistic_include.tpl'}
            {/if}
        {/block}

        {* Include jQuery and all other javascript files at the bottom of the page *}
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
