;(function ($, window) {
    "use strict";

    var $window = $(window);

    $.plugin('scrollUp', {
        defaults: {
            startAt: 200,
            animationSpeed: 600
        },

        init: function () {
            var me = this;

            me.applyDataAttributes();
            me.registerEvents();

            $.publish('plugin/scrollUp/onInit', [ me ]);
        },

        registerEvents: function () {
            var me = this;

            me._on($window, 'scroll', $.proxy(me.toggleVisibility, me));
            me._on(me.$el, 'click', $.proxy(me.scrollUp, me));
        },

        toggleVisibility: function(e) {
            var me = this;

            if ($(e.currentTarget).scrollTop() > me.opts.startAt) {
                me.$el.fadeIn();
            }
            else {
                me.$el.fadeOut();
            }

            $.publish('plugin/scrollUp/onToggleVisibility', [ me ]);
        },

        scrollUp: function() {
            var me = this;

            $('html, body').animate({scrollTop: 0}, me.opts.animationSpeed);

            $.publish('plugin/scrollUp/onScrollUp', [ me ]);
            return false;
        },

        destroy: function() {
            this._destroy();
        }
    });
}(jQuery, window));