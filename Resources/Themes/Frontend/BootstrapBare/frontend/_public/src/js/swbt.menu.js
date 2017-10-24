/* menu plugin for default and mega menu
 * based on: http://codecanyon.net/item/web-slide-responsive-mega-menu-for-bootstrap-3/11068006 
 */
;(function ($) {
    "use strict";

    $.plugin('wsMenu', {
        defaults: {
            menuTriggerSelector: '.overlapblackbg, .slideLeft',
            menuContentSelector: '.wsmenucontent',
            menuToggleSelector: '#navToggle, .wsmenucontent',
            menuOpenCls: 'menuopen',
            menuClosedCls: 'menuclose',
            submenuSelector: '.wsmenu-submenu, .wsmenu-submenu-sub, .wsmenu-submenu-sub-sub, .megamenu',
            arrowTpl: '<span class="wsmenu-click"><i class="wsmenu-arrow fa fa-angle-down"></i></span>'
        },

        init: function () {
            var me = this;

            me.$menuTrigger = $(me.opts.menuTriggerSelector);
            me.$menuContent = $(me.opts.menuContentSelector);
            me.$menuListitems = me.$el.find('li');

            me.applyDataAttributes();
            me.initElements();
            me.registerEvents();

            $.publish('plugin/wsMenu/onInit', [ me ]);
        },

        initElements: function () {
            var me = this;

            // add menu arrows
            me.$menuListitems.has(me.opts.submenuSelector).prepend(me.opts.arrowTpl);

            // check if submenu is out of viewport and set new style
            me.$menuListitems.find('.wsmenu-submenu-sub').each(function() {
                var $submenu = $(this),
                    windowWidth = $(window).width(),
                    posOffset = $submenu.offset(),
                    elWidth = $submenu.width();

                if ((posOffset.left + elWidth) > windowWidth) {
                    $submenu.find('[class^="wsmenu-submenu-sub"]').andSelf().css({
                        right: '100%', 
                        left: 'auto'
                    });
                }
            });

            $.publish('plugin/wsMenu/onInitElements', [ me ]);
        },

        registerEvents: function () {
            var me = this;

            me._on($(me.opts.menuToggleSelector), 'click', $.proxy(me.toggleMenu, me));
            me._on(me.$menuListitems, 'touchstart', $.proxy(me.preventLinking, me));
            me._on(me.$menuListitems.find('.wsmenu-click'), 'click', $.proxy(me.toggleSubmenu, me));
        },

        toggleMenu: function(e) {
            var me = this;

            if (me.$menuContent.hasClass(me.opts.menuOpenCls)) {
                me.close();
            } else {
                me.open();
            }

            $.publish('plugin/wsMenu/onToggleMenu', [ me ]);
        },

        preventLinking: function(e) {
            var me = this,
                $listItem = $(e.currentTarget);

            // don't prevent default behavior on offcanvas
            if (me.$menuContent.hasClass(me.opts.menuOpenCls))
                return;

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

            $arrow.siblings(me.opts.submenuSelector).slideToggle('fast');
            $arrow.children('.wsmenu-arrow').toggleClass('wsmenu-rotate');

            $.publish('plugin/wsMenu/onToggleSubmenu', [ me, $arrow ]);
        },

        open: function() {
            var me = this;

            // publish event of swOffcanvasMenu plugin
            $.publish('plugin/swOffcanvasMenu/onBeforeOpenMenu');

            me.$menuTrigger.removeClass(me.opts.menuClosedCls).addClass(me.opts.menuOpenCls);
        },

        close: function() {
            var me = this;  

            me.$menuTrigger.removeClass(me.opts.menuOpenCls).addClass(me.opts.menuClosedCls);
            
            // publish event of swOffcanvasMenu plugin
            $.publish('plugin/swOffCanvasMenu/onCloseMenu');
        },

        destroy: function () {
            this._destroy();
        }
    });
}(jQuery));