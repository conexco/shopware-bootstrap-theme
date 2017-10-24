;(function($, window, document, undefined) {
    'use strict';

    $.overridePlugin('swSideView', {

        defaults: {
            autoScroll: false,
            bannerSelector: '.side-view-banner',
            viewSelector: '.side-view-element',
            triggerSelector: '.side-view-trigger',
            closerSelector: '.side-view-closer',
            sliderSelector: '.sideview-slider',
            activeCls: 'is-active'
        },

        init: function () {
            var me = this;

            me.superclass.init.apply(this, arguments);

            me.slider = me.$slider.data('plugin_slickWrapper');
        },    

        onClick: function(event) {
            var me = this;

            event.preventDefault();
            me.$view.toggleClass(me.opts.activeCls);

            if (me.$view.hasClass(me.opts.activeCls)) {
                me.$slider.slick('setPosition');
            }

            $.publish('plugin/swSideView/onClick', [ me ]);
        }
    });
})(jQuery, window, document);