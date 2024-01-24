(function($, window) {
// calculate and set breakpoints: 1rem = 16px
window.StateManager.init([
    {
        state:  'xs', // xs
        enter:  0,
        exit:   swfDefaultBreakpointXS / 16         // 479px
    },
    {
        state:  's',  // sm
        enter:  (swfDefaultBreakpointXS + 1) / 16,  // 480px
        exit:   swfDefaultBreakpointSM / 16         // 767px
    },
    {
        state:  'm',  // hd
        enter:  (swfDefaultBreakpointSM + 1) / 16,  // 768px
        exit:   swfDefaultBreakpointHD / 16         // 1023px
    },
    {
        state:  'l',  // md
        enter:  (swfDefaultBreakpointHD + 1) / 16,  // 1024px
        exit:   swfDefaultBreakpointMD / 16         // 1259px
    },
    {
        state:  'xl', // lg
        enter:  (swfDefaultBreakpointMD + 1) / 16,  // 1260px
        exit:   (5160 / 16)
    }
]);

window.StateManager.registerListener([{
    state: '*',
    enter: function() {
        if ($('body').hasClass('ctl_detail'))
            $('#similar').find('[data-equalheight="true"]').equalHeight();
    }
}]);

// register move helper
window.StateManager.registerListener([{
    state: '*',
    enter: function() {
        applyMoveHelper();
    }
}]);

// Shopware plugin-base
window.StateManager
    // Menu
    .addPlugin('[data-main-nav="true"]', 'mainNavigation')

    .addPlugin('#navToggle', 'swOffcanvasMenu', ['xs', 's'])

    // Product compare menu
    .addPlugin('*[data-product-compare-menu="true"]', 'swProductCompareMenu', {
        fullwidthat: 8
    }, ['xl'])
    .addPlugin('*[data-product-compare-menu="true"]', 'swProductCompareMenu', {
        fullwidthat: 6
    }, ['l'])
    .addPlugin('*[data-product-compare-menu="true"]', 'swProductCompareMenu', {
        fullwidthat: 4
    }, ['m'])

    // Offcanvas tabs detail
    .addPlugin('.off-canvas-tabs [data-offcanvas="true"]', 'swOffcanvasMenu', (typeof swfDetailOffcanvasViewports != 'undefined' ? swfDetailOffcanvasViewports : ['xs']))

    // Offcanvas ajax cart
    .addPlugin('[data-ajax-cart="true"][data-offcanvas="true"]', 'swOffcanvasMenu', (typeof swfAjaxCartOffcanvasViewports != 'undefined' ? swfAjaxCartOffcanvasViewports : ['xs', 's']))

    // Offcanvas blog
    .addPlugin('.off-canvas-blog [data-offcanvas="true"]', 'swOffcanvasMenu', (typeof swfBlogOffcanvasViewports != 'undefined' ? swfBlogOffcanvasViewports : ['xs', 's']))

    // Offcanvas account
    .addPlugin('.off-canvas-account [data-offcanvas="true"]', 'swOffcanvasMenu', (typeof swfAccountOffcanvasViewports != 'undefined' ? swfAccountOffcanvasViewports : ['xs', 's']))

    // Ajax cart popover
    .addPlugin('[data-ajax-cart="true"]', 'popoverWrapper', (typeof swfAjaxCartPopoverViewports != 'undefined' ? swfAjaxCartPopoverViewports : ['m', 'l', 'xl']))

    // Default popover
    .addPlugin('[data-toggle="popover"]', 'popoverWrapper')

    // Product navigation on detail
    .addPlugin('body', 'swAjaxProductNavigation')

    // Captcha
    .addPlugin('div.captcha-placeholder[data-src]', 'swCaptcha')

    // Tabs on detail
    .addPlugin('.ctl_detail', 'detailTabs')

    // Last seen products
    .addPlugin('*[data-last-seen-products="true"]', 'swLastSeenProducts', $.extend({}, lastSeenProductsConfig))

    // Register
    .addPlugin('div[data-register="true"]', 'swRegister')

    // Emotion world
    .addPlugin('.emotion-wrapper', 'swEmotionLoader')

    // Add article modal
    .addPlugin('*[data-add-article="true"]', 'swAddArticle')

    // Add product to compare
    .addPlugin('*[data-compare-ajax="true"]', 'swProductCompareAdd')

    // Listing
    .addPlugin('*[data-listing-actions="true"]', 'swListingActions')

    // Ajax wishlist
    .addPlugin('*[data-ajax-wishlist="true"]', 'swAjaxWishlist')

    // Ajax cart
    .addPlugin('[data-ajax-cart="true"]', 'ajaxCart')

    // Image zoom
    .addPlugin('*[data-image-zoom="true"]', 'imageZoom')

    // Auto submit
    .addPlugin('form *[data-auto-submit="true"]', 'swAutoSubmit')

    // Newsletter form
    .addPlugin('*[data-newsletter="true"]', 'newsletterForm')

    // ShippingPayment change after register
    .addPlugin('*[data-ajax-shipping-payment="true"]', 'swShippingPayment')

    // Infinite scrolling
    .addPlugin('*[data-infinite-scrolling="true"]', 'swInfiniteScrolling')

    // Load new variants via ajax
    .addPlugin('*[data-ajax-variants-container="true"]', 'swAjaxVariant')

    // Range slider
    .addPlugin('*[data-range-slider="true"]', 'swRangeSlider')

    // Address Selection
    .addPlugin('*[data-address-selection="true"]', 'swAddressSelection')

    // Address Editor
    .addPlugin('*[data-address-editor="true"]', 'swAddressEditor')

    // allows submit button outside of forms in IE/Edge
    .addPlugin('input[type="submit"][form], button[form]', 'swFormPolyfill')

    // adds comment text to checkout confirm form
    .addPlugin('*[data-pseudo-text="true"]', 'swPseudoText')

    // prevents multiple clicks on the same button
    .addPlugin('*[data-preloader-button="true"]', 'swPreloaderButton')

    // Ajax Search Plugin
    .addPlugin('[data-ajax-search="true"]', 'ajaxSearch')

    // ScrollUp Button
    .addPlugin('[data-scroll-up="true"]', 'scrollUp', ['xl'])

    // Image Modal / Image Modal Gallery
    .addPlugin('a[data-toggle="img-modal"], [data-toggle="img-modal"] a', 'imgModal')

    // Ajax Modal
    .addPlugin('a[data-toggle="ajax-modal"], [data-toggle="ajax-modal"] a', 'ajaxModal')

    // Notify Modal
    .addPlugin('.submit-notify-modal', 'notifyModal')

    // Cookie Permisson Info
    .addPlugin('*[data-cookie-permission="true"]', 'swCookiePermission')

    // GDPR Cookie Compliance Banner
    .addPlugin('*[data-notification-message-close="true"]', 'swNotificationMessageClose')
    .addPlugin('*[data-cookie-consent-manager="true"]', 'swCookieConsentManager')

    // Filter
    .addPlugin('*[data-filter-type]', 'swFilterComponent')

    // Sidebar Filter
    .addPlugin('.sidebar-filter-offcanvas [data-offcanvas="true"]', 'swOffcanvasMenu', ['xs', 's'])
;   // window.StateManager addPlugin end

$(function($) {
    // don't add over window.StateManager because it causes issues with equalHeight function
    $('.slick').slickWrapper();

    $('[data-equalheight="true"]:not([data-mode="ajax"]):visible').equalHeight();

    $('[data-fixed-navbar="true"]').clingify({breakpoint: swfDefaultBreakpointSM || 767});

    $('body').swSelectboxReplacement();

    if (swfShowHidePwd) {
        window.StateManager.addPlugin('input[type="password"]', 'passwordInputViewer');
    }
    if (swfShowPwdStrength) {
        window.StateManager.addPlugin('.register-form input[type="password"]', 'passwordStrengthWrapper', $.extend({}, swfShowPwdStrengthConfig));
    }

    $.subscribe('plugin/swAddArticle/onAddArticle', cartRefresh);

    // Check if cookies are disabled and show notification
    if (!StorageManager.hasCookiesSupport)
        createNoCookiesNoticeBox(window.snippets.noCookiesNotice);

    // Create the no cookies notification message
    function createNoCookiesNoticeBox(message) {
        $('<div/>', {
            'class': 'alert alert-warning no-cookies',
            'html': message
        })
        .append('<i class="fa fa-times mtx pull-right"></i>')
        .on('click', function() {
            $(this).closest('.no-cookies').hide();
        })
        .appendTo('.page-wrap');
    }
});
})(jQuery, window);
