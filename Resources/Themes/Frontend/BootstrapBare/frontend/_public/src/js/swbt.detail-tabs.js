;(function ($) {
    "use strict";

    $.plugin('detailTabs', {
        defaults: {
            showTabCommentsSelector: '.showtabcomments',
            tabCommentsSelector: '#tabcomments',
            formErrorSelector: '.has-error'
        },

        init: function () {
            var me = this,
                param = decodeURI((RegExp('action=(.+?)(&|$)').exec(location.search) || [, null])[1]);

            me.registerEvents();

            if (param === 'rating') {
                me.jumpToTab(me.opts.tabCommentsSelector);
            }

            me.commentError();
        },

        registerEvents: function () {
            var me = this;

            // opens comment tab
            me.$el.find(me.opts.showTabCommentsSelector).on('click', function(){
                return $(me.opts.tabCommentsSelector).tab('show');
            });

            // on bootstrap tab change
            me.$el.find('a[data-toggle="tab"]').on('shown.bs.tab', function (event) {
                var $targetTab = $($(event.target).attr('href')),
                    $slider = $targetTab.find('.slick'); 

                if ($slider.length > 0) {
                    $slider[0].slick.refresh();
                }

                $targetTab.find('[data-equalheight="true"]').equalHeight();
            });
        },

        jumpToTab: function (jumpTo) {
            if (!jumpTo || !jumpTo.length) return;

            $('html, body').animate({
                scrollTop: $(jumpTo).offset().top
            }, 1000);
        },

        commentError: function () {
            var me = this;

            // opens the rating offcanvas on mobile if there are missing data
            var offcanvasPlugin = me.$el.find('[data-offcanvas="true"]' + me.opts.formErrorSelector).data('plugin_swOffcanvasMenu');

            if (offcanvasPlugin) {
                offcanvasPlugin.openMenu();
            }
        }
    });
}(jQuery));