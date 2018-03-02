;(function ($) {
    'use strict';

    var $document = $(document),
        $window = $(window);

    /**
     * Bootstrap Popover Wrapper Plugin
     */
    $.plugin('popoverWrapper', {
        defaults: {
            // defaults from bootstrap popover
            animation: true,
            placement: 'bottom',
            selector: false,
            template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>',
            trigger: 'click',
            title: '',
            delay: 0,
            html: false,
            container: false,
            viewport: {
                selector: 'body',
                padding: 0
            },
            content: '',
            // custom popover options
            // ajax popover content url
            ajaxUrl: false,
            // use selected element as popover content
            contentselector: false,
            // additional class for the popover
            popoverclass: false,
            // is set on popover toggle if ajax popover is open
            ajaxPopoverOpenCls: 'popover-open',
            // is set on popover toggle if ajax popover is initialized
            ajaxPopoverReadyCls: 'popover-ready'
        },

        init: function () {
            var me = this;

            me.applyDataAttributes();

            me.popoverInitialized = false;
            me.closedOnBodyClick = false;

            // get popover content via ajax or selector or init it directly
            if (me.opts.ajaxUrl) {
                me.registerAjaxPopover();
            } else if (me.opts.contentselector) {
                me.getHtmlPopover();
            } else {
                me.initPopover();
            }

            $.publish('plugin/popoverWrapper/onInit', [ me ]);
        },

        registerPopoverEvents: function () {
            var me = this;

            // initialize special elements
            me.$el.on('inserted.bs.popover', function() {
                var $popover = $(this).data('bs.popover').tip();

                $popover.swSelectboxReplacement();
            });

            // hide popover on document click
            $document
                .off('click.popoverWrapper')
                .on('click.popoverWrapper', function(e) {
                    if ($(e.target).closest('[data-original-title]').length == 0 && !$(e.target).parents().is('.popover.in')) {
                        $('[data-original-title]').popover('hide');
                    }
                });

            // removes open class and fixes bootstrap popover bug, visit https://github.com/twbs/bootstrap/issues/16732 for more information    
            me.$el
                .off('hide.bs.popover.popoverWrapper')
                .on('hide.bs.popover.popoverWrapper', function (e) {
                    var $btn = $(e.target);
                    $btn.data('bs.popover').inState.click = false;
                    $btn.removeClass(me.opts.ajaxPopoverOpenCls);
                });

            // adds open class    
            me.$el
                .off('shown.bs.popover.popoverWrapper')
                .on('shown.bs.popover.popoverWrapper', function (e) {
                    $(e.target).addClass(me.opts.ajaxPopoverOpenCls);
                });

            // check if width or height really changed on resize event (fixes ios safari bug)    
            me.windowWidth = $window.width();
            me.windowHeight = $window.height();

            // repositioning of popover on resize    
            $window
                .off('resize.popoverWrapper')
                .on('resize.popoverWrapper', function() {
                    if (me.$el.hasClass(me.opts.ajaxPopoverOpenCls) && ($window.width() != me.windowWidth || $window.height() != me.windowHeight)) {
                        var $popover = me.$el.data('bs.popover').tip();

                        $popover.addClass('noTransition');
                        me.$el.popover('show');
                        $popover.removeClass('noTransition');

                        $.publish('plugin/popoverWrapper/onRegisterPopoverResizeEvent', [ me ]);
                    }
                });

            $.publish('plugin/popoverWrapper/onRegisterPopoverEvents', [ me ]);
        },

        initPopover: function () {
            var me = this,
                opts = me.opts;

            // apply popover class    
            if (me.opts.popoverclass) {
                var $template = $(me.opts.template).find('.popover').addBack('.popover').addClass(me.opts.popoverclass);
                me.opts.template = $template.wrap('<p/>').parent().html();
            }    

            $.publish('plugin/popoverWrapper/onBeforeInitPopover', [ me ]);

            // call bootstrap popover with custom options
            me.$el.popover(opts);

            me.registerPopoverEvents();
        },

        registerAjaxPopover: function() {
            var me = this;

            me._on(me.$el, me.opts.trigger, $.proxy(me.getAjaxPopover, me));
        },

        getAjaxPopover: function() {
            var me = this;

            if (me.popoverInitialized) {
                return;
            }

            // enables html in popovers    
            me.opts.html = true;

            me.$el.loader('show');    
                
            $.ajax({
                url: safeUrl(me.opts.ajaxUrl),
                dataType: 'jsonp'
            }).done(function(data) {
                // init popover
                me.opts.content = data;
                me.initPopover();
                me.popoverInitialized = true;

                picturefill();

                // opens popover
                me.$el.trigger(me.opts.trigger);
                me.$el.addClass(me.opts.ajaxPopoverReadyCls + ' ' + me.opts.ajaxPopoverOpenCls);

                me.$el.loader('hide');  

                $.publish('plugin/popoverWrapper/onAfterGetAjaxPopover', [ me ]);
            });
        },

        getHtmlPopover: function() {
            var me = this;

            // enables html in popovers    
            me.opts.html = true;

            // get element via selector and add html to popover options                               
            me.opts.content = $(me.opts.contentselector).clone(true, true);

            $.publish('plugin/popoverWrapper/onGetHtmlPopover', [ me ]);

            me.initPopover();
        },

        // destroys plugin and popover
        destroy: function () {
            var me = this;

            me.$el.removeClass(me.opts.ajaxPopoverReadyCls);
            me.$el.popover('destroy');

            me._destroy();
        }
    });
})(jQuery);