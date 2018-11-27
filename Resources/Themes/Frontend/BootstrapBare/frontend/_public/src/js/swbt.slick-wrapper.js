;(function ($) {
    'use strict';

    /**
     * Slick Slider Wrapper Plugin
     */
    $.plugin('slickWrapper', {

        defaults: {
            // defaults from slick.js
            accessibility: true,
            adaptiveHeight: false,
            arrows: true,
            asNavFor: null,
            autoplay: false,
            autoplaySpeed: 3000,
            centerMode: false,
            centerPadding: '50px',
            cssEase: 'ease',
            dots: false,
            dotsClass: 'slick-dots',
            draggable: true,
            easing: 'linear',
            edgeFriction: 0.35,
            focusOnSelect: false,
            infinite: true,
            initialSlide: 0,
            lazyLoad: 'ondemand',
            mobileFirst: false,
            pauseOnHover: true,
            pauseOnFocus: true,
            pauseOnDotsHover: false,
            respondTo: 'window',
            responsive: null,
            rows: 1,
            rtl: false,
            slide: '',
            slidesPerRow: 1,
            slidesToShow: 1,
            slidesToScroll: 1,
            speed: 500,
            swipe: true,
            swipeToSlide: false,
            touchMove: true,
            touchThreshold: 5,
            useCSS: true,
            useTransform: true,
            variableWidth: false,
            vertical: false,
            verticalSwiping: false,
            waitForAnimate: true,
            //don't use fade option, because it generally works only with slidesToShow=1,
            // and because the fade animation isn't working correctly
            fade: false,
            // custom options used to generate responsive option
            md: {},
            hd: {},
            sm: {},
            xs: {},
            // selection of defaults from shopware slider
            // the mode for getting the items
            mode: 'local',
            // the controller url for ajax loading.
            ajaxCtrlUrl: null,
            // the category id for ajax loading.
            ajaxCategoryID: 3,
            // the maximum number of items to load via ajax.
            ajaxMaxShow: 30,
            lazyLoadingUrl: false
        },

        /**
         * Method for the plugin initialisation.
         * Merges the passed options with the data attribute configurations.
         * Creates and references all needed elements and properties.
         * Calls the registerEvents method afterwards.
         *
         * @public
         * @method init
         */
        init: function () {
            var me = this;

            me.applyDataAttributes();
            me.convertOptions();
            me.initSlider();
        },

        /**
         * Converts options from data atrributes to options the slick slider can handle.
         *
         * @public
         * @method convertOptions
         */
        convertOptions: function () {
            var me = this,
                opts = me.opts;

            //create boolean options and responsive options array
            var convertedOpts = {
                responsive: [
                    {
                        breakpoint: swfDefaultBreakpointMD+1,
                        settings: me.convertResponsiveSettings('md')
                    },
                    {
                        breakpoint: swfDefaultBreakpointHD+1,
                        settings: me.convertResponsiveSettings('hd')
                    },
                    {
                        breakpoint: swfDefaultBreakpointSM+1,
                        settings: me.convertResponsiveSettings('sm')
                    },
                    {
                        breakpoint: swfDefaultBreakpointXS+1,
                        settings: me.convertResponsiveSettings('xs')
                    }
                ],
                accessibility: opts.accessibility == 1 ? true : false,
                adaptiveHeight: opts.adaptiveHeight == 1 ? true : false,
                arrows: opts.arrows == 1 ? true : false,
                autoplay: opts.autoplay == 1 ? true : false,
                centerMode: opts.centerMode == 1 ? true : false,
                dots: opts.dots == 1 ? true : false,
                draggable: opts.draggable == 1 ? true : false,
                focusOnSelect: opts.focusOnSelect == 1 ? true : false,
                infinite: opts.infinite == 1 ? true : false,
                mobileFirst: opts.mobileFirst == 1 ? true : false,
                pauseOnHover: opts.pauseOnHover == 1 ? true : false,
                pauseOnFocus: opts.pauseOnFocus == 1 ? true : false,
                pauseOnDotsHover: opts.pauseOnDotsHover == 1 ? true : false,
                rtl: opts.rtl == 1 ? true : false,
                swipe: opts.swipe == 1 ? true : false,
                swipeToSlide: opts.swipeToSlide == 1 ? true : false,
                touchMove: opts.touchMove == 1 ? true : false,
                useCSS: opts.useCSS == 1 ? true : false,
                useTransform: opts.useTransform == 1 ? true : false,
                variableWidth: opts.variableWidth == 1 ? true : false,
                vertical: opts.vertical == 1 ? true : false,
                verticalSwiping: opts.verticalSwiping == 1 ? true : false,
                waitForAnimate: opts.waitForAnimate == 1 ? true : false,
                fade: opts.fade == 1 ? true : false
            };
            $.extend(opts, convertedOpts);
        },

        convertResponsiveSettings: function(breakpoint) {
            var opts = this.opts;

            return opts[breakpoint] != 'unslick' ? {
                arrows: opts[breakpoint].arrows == 1 ? true : false,
                dots: opts[breakpoint].dots == 1 ? true : false,
                vertical: opts[breakpoint].vertical == 1 ? true : false,
                slidesToShow: (opts[breakpoint].slidesToShow != undefined && opts[breakpoint].slidesToShow !== '0') ? parseInt(opts[breakpoint].slidesToShow) : 1,
                slidesToScroll: (opts[breakpoint].slidesToScroll != undefined && opts[breakpoint].slidesToScroll !== '0') ? parseInt(opts[breakpoint].slidesToScroll) : 1,
                centerMode: opts[breakpoint].centerMode == 1 ? true : false,
                centerPadding: opts[breakpoint].centerPadding,
                autoplay: opts[breakpoint].autoplay == 1 ? true : false,
                speed: opts[breakpoint].speed != undefined ? parseInt(opts[breakpoint].speed) : 500,
                adaptiveHeight: opts[breakpoint].adaptiveHeight == 1 ? true : false,
                infinite: opts[breakpoint].infinite == 1 ? true : false,
                swipeToSlide: opts[breakpoint].swipeToSlide == 1 ? true : false,
                variableWidth: opts[breakpoint].variableWidth == 1 ? true : false
            } : opts[breakpoint];
        },

        /**
         * Initializes all necessary slider configs.
         *
         * @public
         * @method initSlider
         */
        initSlider: function () {
            var me = this,
                opts = me.opts;

            me.trackItems();

            me.registerLazyLoad();

            if (me.itemsCount <= 0 && opts.mode === 'ajax') {
                me.loadItems(0, opts.ajaxMaxShow, $.proxy(me.initSlider, me));
                return;
            }

            me.$el.slick(opts);
            me.$el.addClass('slick-ready');

            if (opts.mode === 'ajax' && me.$el.attr('data-equalheight') && me.$el.is(':visible')) {
                me.$el.equalHeight();
            }
        },

        registerLazyLoad: function() {
            var me = this;

            if (!me.opts.lazyLoadingUrl) {
                return;
            }

            me.$el.on('afterChange', function(event, slick, currentSlide){

                // TODO: don't load new items if direction is left (infinite)?

                $.ajax({
                    url: safeUrl(me.opts.lazyLoadingUrl),
                    method: 'GET',
                    success: function (response) {
                        if (!response.data.markup) {
                            return;
                        }

                        // TODO: set new lazyLoadingUrl for the next 4 items

                        // TODO: consider equal height

                        me.$el.slick('slickAdd', response.data.markup);
                    }
                });
            });
        },

        /**
         * Loads new items via ajax.
         *
         * @public
         * @method loadItems
         * @param {Number} start
         * @param {Number} limit
         * @param {Function} callback
         */
        loadItems: function (start, limit, callback) {
            var me = this,
                data = {
                    'start': start,
                    'limit': limit
                };

            if (me.opts.ajaxCategoryID !== null) {
                data['category'] = me.opts.ajaxCategoryID
            }

            me.$el.loader('show', 'mvm', true);

            $.publish('plugin/slickWrapper/onLoadItemsBefore', [ me, data ]);

            $.ajax({
                url: me.opts.ajaxCtrlUrl,
                method: 'GET',
                data: data,
                success: function (response) {
                    me.$el.loader('hide');

                    if (!response) {
                        // Prevent infinite loop
                        return;
                    }

                    me.$el.append(response);
                    me.trackItems();

                    picturefill();

                    $.publish('plugin/slickWrapper/onLoadItemsSuccess', [ me, response ]);

                    if (typeof callback === 'function' && me.itemsCount > 0) {
                        callback.call(me, response);
                    }
                }
            });

            $.publish('plugin/slickWrapper/onLoadItems', [ me ]);
        },

        /**
         * Tracks the number of items the slider contains.
         *
         * @public
         * @method trackItems
         * @returns {Number}
         */
        trackItems: function () {
            var me = this;

            me.$items = me.$el.children();

            $.publish('plugin/slickWrapper/trackItems', me);
            return me.itemsCount = me.$items.length;
        },

        destroy: function () {
            var me = this;

            me.$el.slick('unslick');
            me._destroy();
        }
    });
})(jQuery);