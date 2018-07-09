/**
 * Extends Shopware Sub Category Navigation plugin
 */
$.overridePlugin('swSubCategoryNav', {

    defaults: {
        'enabled': true,
        'eventName': 'click',
        'sidebarCategorySelector': '.sub-category-navigation',
        'backwardsSelector': '.link-go-back',
        'forwardsSelector': '.link-go-forward',
        'mainMenuSelector': '.link-go-main',
        'mainCategoryId': null,
        'categoryId': null,
        'fetchUrl': '',
        'overlaySelector': '.offcanvas-overlay',
        'sidebarMainSelector': '.main-nav',
        'mobileNavigationSelector': '.navigation--smartphone',  // not needed in bt
        'loadingClass': 'nav-ajax-loader fa fa-spinner fa-pulse fa-lg',
        'backSlideClass': 'background',
        'iconRightSelector': '.is-icon-right',
        'disableScrollingClass': 'is-inactive',
        'animationSpeedIn': 450,
        'animationSpeedOut': 300,
        'easingIn': 'cubic-bezier(.3,0,.15,1)',
        'easingOut': 'cubic-bezier(.02, .01, .47, 1)',
        'easingFallback': 'swing',
        // custom
        'offcanvasWidth': 300
    },

    slideOut: function (template) {
        var me = this,
            opts = me.opts,
            $overlays,
            $slide;

        $.publish('plugin/swSubCategoryNav/onSlideOutBefore', [ me ]);

        me.$sidebar.append(template);

        // get all overlays
        $overlays = $(opts.overlaySelector);

        // flip background classes
        $overlays.toggleClass(opts.backSlideClass);

        $slide = $overlays.not('.' + opts.backSlideClass);

        $slide[me.slideFunction]({ 'left': me.opts.offcanvasWidth }, opts.animationSpeedOut, me.easingEffectOut, function () {
            $slide.remove();

            me.inProgress = false;

            $.publish('plugin/swSubCategoryNav/onSlideOut', [ me ]);
        });
    },

    slideIn: function (template) {
        var me = this,
            opts = me.opts,
            $overlays,
            $slide,
            $el;

        $.publish('plugin/swSubCategoryNav/onSlideInBefore', [ me ]);

        // hide main menu
        me.$sidebar.scrollTop(0);

        me.$sidebar.append(template);

        $overlays = $(opts.overlaySelector);

        $slide = $overlays.not('.' + opts.backSlideClass).css({
            'left': me.opts.offcanvasWidth,
            'display': 'block'
        });

        $slide[me.slideFunction]({ 'left': 0 }, opts.animationSpeedIn, me.easingEffectIn, function () {
            // remove background layer
            $overlays.each(function (i, el) {
                $el = $(el);

                if ($el.hasClass(opts.backSlideClass)) {
                    $el.remove();
                }
            });

            $slide.addClass(opts.backSlideClass);

            // hide main menu
            me.$sidebarWrapper.css('display', 'none');

            me.$navigation.hide().show(0);

            $slide.addClass(opts.backSlideClass);

            me.inProgress = false;

            $.publish('plugin/swSubCategoryNav/onSlideIn', [ me ]);
        });
    },

    slideToMainMenu: function () {
        var me = this,
            opts = me.opts,
            $overlay = $(opts.overlaySelector);

        $.publish('plugin/swSubCategoryNav/onSlideToMainMenuBefore', [ me ]);

        // make the main menu visible
        me.$sidebarWrapper.css('display', 'block');

        // fade in arrow icons
        me.$sidebarWrapper.find(me.opts.iconRightSelector).fadeIn('slow');

        $overlay[me.slideFunction]({ 'left': me.opts.offcanvasWidth }, opts.animationSpeedOut, me.easingEffectOut, function () {
            $overlay.remove();

            // enable scrolling on main menu
            me.$sidebar.removeClass(opts.disableScrollingClass);

            me.inProgress = false;

            $.publish('plugin/swSubCategoryNav/onSlideToMainMenu', [ me ]);
        });
    }
});

