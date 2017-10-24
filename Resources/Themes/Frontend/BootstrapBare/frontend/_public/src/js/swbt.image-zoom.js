;(function ($) {
    "use strict";

    $.plugin('imageZoom', {
        defaults: {
            // elevate zoom defaults
            lensSize: 200,
            zoomWindowFadeIn: false,
            zoomWindowFadeOut: false,
            zoomWindowWidth: 400,
            zoomWindowHeight: 400,
            zoomWindowOffetx: 0,
            zoomWindowOffety: 0,
            lensFadeIn: false,
            lensFadeOut: false,
            borderSize: 2,
            borderColour: "#888",
            lensBorderSize: 1,
            lensBorderColour: "#000",
            zoomType: 'lens', // 'lens' | 'window'
            lensShape: 'square', // 'square' | 'round'
            // selectors
            zoomContainerSelector: '.zoomContainer',
            zoomImageSelector: 'img[data-zoom-image]',
            zoomActiveClass: 'zoom-active',
            zoomActiveImageSelector: '.slick-active img[data-zoom-image]'
        },

        init: function () {
            var me = this;

            me.deactivateZoom = swfDeactivateZoom || 767;
            me.$images = me.$el.find(me.opts.zoomImageSelector);

            me.applyDataAttributes();

            if ($(window).width() >= me.deactivateZoom)
                me.registerEvents();
        },

        registerEvents: function () {
            var me = this,
                opts = me.opts,
                $zoomImage = me.$images;

            if (me.$images.length > 1)
                me.$el.parent().addClass('pal');

            me.$el.mouseover(function() {
                if (me.$images.length > 1)
                    $zoomImage = me.$el.find(opts.zoomActiveImageSelector);

                if ($zoomImage.hasClass(opts.zoomActiveClass))
                    return;
                $zoomImage.addClass(opts.zoomActiveClass);

                // elevate zoom plugin call
                $zoomImage.elevateZoom({
                    lensSize: parseInt(opts.lensSize),
                    zoomWindowFadeIn: opts.zoomWindowFadeIn === false ? false : parseInt(opts.zoomWindowFadeIn),
                    zoomWindowFadeOut: opts.zoomWindowFadeOut === false ? false : parseInt(opts.zoomWindowFadeOut),
                    zoomWindowWidth: parseInt(opts.zoomWindowWidth),
                    zoomWindowHeight: parseInt(opts.zoomWindowHeight),
                    zoomWindowOffetx: parseInt(opts.zoomWindowOffetx),
                    zoomWindowOffety: parseInt(opts.zoomWindowOffety),
                    lensFadeIn: opts.lensFadeIn === false ? false : parseInt(opts.lensFadeIn),
                    lensFadeOut: opts.lensFadeOut === false ? false : parseInt(opts.lensFadeOut),
                    borderSize: parseInt(opts.borderSize),
                    borderColour: opts.borderColour,
                    lensBorderSize: parseInt(opts.lensBorderSize),
                    lensBorderColour: opts.lensBorderColour,
                    zoomType: opts.zoomType,
                    lensShape: opts.lensShape,
                    containLensZoom: true,
                    constrainType: 'height'
                });
            });

            if (me.$images.length > 1) {
                $(document).on('click', function () {
                    me.removeZoom();
                });
            }
        },

        removeZoom: function () {
            var me = this,
                opts = me.opts,
                $zoomContainer = $(opts.zoomContainerSelector);

            if ($zoomContainer.length > 0) {
                me.$images.removeClass(opts.zoomActiveClass);
                me.$images.each(function () {
                    $.removeData(this, 'elevateZoom');
                });
                $zoomContainer.remove();
            }
        },

        destroy: function () {
            var me = this;

            me.removeZoom();
        }
    });
}(jQuery));
