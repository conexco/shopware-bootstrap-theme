;(function ($) {
    "use strict";

    // delay for key events
    var delay = (function(){
        var timer = 0;
        return function(callback, ms){
            clearTimeout (timer);
            timer = setTimeout(callback, ms);
        };
    })();

    $.plugin('ajaxSearch', {
        defaults: {
            btnLoaderSelector: '.ajax-search-button',
            searchItemSelector: '.ajax-search-item',
            ajaxsearchkeys: {13:'enter', 16:'shift', 17:'ctrl', 18:'alt', 27:'esc', 37:'left', 38:'up', 39:'right', 40:'down', 224:'cmd'}
        },

        init: function () {
            var me = this;

            me.applyDataAttributes();
            me.registerEvents();

            $.publish('plugin/ajaxSearch/onInit', [ me ]);
        },

        registerEvents: function () {
            var me = this;
            
            me.$el.on(me.getEventName('keyup'), $.proxy(me.delayedSearch, me));
            me.$el.on(me.getEventName('keydown'), $.proxy(me.delayedSearchNavigation, me));
        },

        delayedSearch: function(e) {
            var me = this;

            delay(function(){
                me.onSearch(e);
            }, 300 );
        },

        delayedSearchNavigation: function(e) {
            var me = this;

            delay(function(){
                me.onSearchNavigation(e);
            }, 300 );
        },

        onSearch: function(e) {
            var me = this,
                $input = me.$el;

            if (e.keyCode in me.opts.ajaxsearchkeys) {
                if (me.opts.ajaxsearchkeys[e.keyCode] === 'up' || me.opts.ajaxsearchkeys[e.keyCode] === 'down') {
                    return;
                }    
                if (me.opts.ajaxsearchkeys[e.keyCode] === 'esc') {
                    $input.popover('hide');
                }  
                e.preventDefault();
                e.stopPropagation();
            } else {
                var $btnLoader = $input.closest('form').find(me.opts.btnLoaderSelector),
                    searchTerm = $input.val(),
                    url = safeUrl(controller.ajax_search) + '?sSearch=' + searchTerm;

                if ($input.val().length >= 3) {

                    $btnLoader.loader('show');

                    if (!$input.hasClass('popover-ready')) {
                        $input.popoverWrapper({
                            ajaxUrl: url
                        });

                        $input.on('shown.bs.popover',function(){                    
                            $input.closest('form').find(me.opts.btnLoaderSelector).loader('hide');
                        });
                        $input.trigger('click');
                    } else {
                        $.ajax({
                            url: url,
                            dataType: 'html',
                            type: 'GET'
                        }).done(function(data) {
                            var popoverData = $input.data('bs.popover'),
                                $popover = popoverData.tip();
                            
                            // set as html
                            $popover.find('.popover-content').html(data);
                            // set as plugin data
                            popoverData.options.content = data;

                            $input.closest('form').find(me.opts.btnLoaderSelector).loader('hide');

                            if (!$input.hasClass('popover-open')) {
                                $input.popover('show');
                            }

                            picturefill();

                            $.publish('plugin/ajaxSearch/onSearchResponse', [ me, searchTerm, data ]);
                        });
                    }
                } else {
                    if ($input.hasClass('popover-open')) {
                        $input.popover('hide');
                        $input.closest('form').find(me.opts.btnLoaderSelector).loader('hide');
                    }
                }

                $.publish('plugin/ajaxSearch/onSearch', [ me ]);
            }
        },

        onSearchNavigation: function (e) {
            var me = this,
                $input = me.$el;

            if ($input.hasClass('popover-open')) {
                var $popover = $input.data('bs.popover').tip(),
                    $items = $popover.find(me.opts.searchItemSelector),
                    $selectedItem = $items.filter('.active');

                if (me.opts.ajaxsearchkeys[e.keyCode] === 'up'){
                    if ($selectedItem.length === 0) {
                        $items.last().addClass('active');
                    } else {
                        if ($selectedItem.is(':first')){
                            $items.removeClass('active').last().addClass('active');
                        } else {
                            $selectedItem.removeClass('active').prev(me.opts.searchItemSelector).addClass('active');
                        }
                    }
                } else if (me.opts.ajaxsearchkeys[e.keyCode] === 'down'){
                    if ($selectedItem.length === 0) {
                        $items.first().addClass('active');
                    } else {
                        if ($selectedItem.is(':last')){
                            $items.removeClass('active').first().addClass('active');
                        } else {
                            $selectedItem.removeClass('active').next(me.opts.searchItemSelector).addClass('active');
                        }
                    }
                } else if (me.opts.ajaxsearchkeys[e.keyCode] === 'enter'){
                    if ($selectedItem.length > 0) {
                        $input.closest('form').on('submit', function(e){
                            e.preventDefault();
                        });
                        window.location.href = $selectedItem.attr('href');
                    }
                }

                $.publish('plugin/ajaxSearch/onSearchNavigation', [ me ]);
            }
        },

        destroy: function () {
            this._destroy();
        }
    });  
}(jQuery));