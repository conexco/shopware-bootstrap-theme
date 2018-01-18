;(function ($) {
    "use strict";

    $.plugin('mainNavigation', {
        defaults: {
            submenuSelector: '.megamenu'
        },

        init: function () {
            var me = this;

            me.$menuListitems = me.$el.find('li');

            me.applyDataAttributes();

            me.registerEvents();

            $.publish('plugin/mainNavigation/onInit', [ me ]);
        },

        registerEvents: function () {
            var me = this;

            me._on(me.$menuListitems, 'touchstart', $.proxy(me.preventLinking, me));
            me._on(me.$menuListitems.find('.main-nav-arrow'), 'click', $.proxy(me.toggleSubmenu, me));
        },

        preventLinking: function(e) {
            var me = this,
                $listItem = $(e.currentTarget);

            // don't prevent default behavior in offcanvas
            if (me.$el.hasClass('off-canvas')) {
                return;
            }

            // don't follow nav-link on touch if submenu/megamenu isn't open
            if (!$listItem.hasClass('open') && $listItem.children('ul, .megamenu').length) {
                e.preventDefault();
                $listItem.siblings('li').removeClass('open');
                $listItem.find('li').removeClass('open');
                $listItem.addClass('open');
            }    
        },

        toggleSubmenu: function(e) {
            var me = this,
                $arrow = $(e.currentTarget);

            $arrow.siblings(me.opts.submenuSelector)
                .slideToggle('fast')
                .toggleClass('open');
                
            $arrow.children('.main-nav-arrow').toggleClass('main-nav-rotate');

            $.publish('plugin/mainNavigation/onToggleSubmenu', [ me, $arrow ]);
        },

        destroy: function () {
            this._destroy();
        }
    });
}(jQuery));