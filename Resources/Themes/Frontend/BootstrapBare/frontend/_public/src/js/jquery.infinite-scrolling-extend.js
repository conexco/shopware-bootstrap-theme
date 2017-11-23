/**
 * Extended Shopware Infinite Scrolling Plugin
 */
$.overridePlugin('swInfiniteScrolling', {
    defaults: {
        'enabled': true,
        'eventName': 'scroll',
        'categoryId': 0,
        'pagingSelector': '.listing-paging',
        'productBoxSelector': '.product-box',
        'defaultPerPageSelector': '.action-per-page',
        'threshold': 3,
        'loadMoreCls': 'load-more',
        'loadPreviousCls': 'load-previous',
        'loadBtnCls': 'btn btn-primary',
        'loadMoreSnippet': 'Weitere Artikel laden',
        'loadPreviousSnippet': 'Vorherige Artikel laden',
        'listingContainerSelector': '.listing-container',
        'pagingBottomSelector': '.listing-paging',
        'listingActionsWrapper': 'infinite-actions text-center mbl',
        delegateConSelector: '.listing-wrapper',
        addArticleSelector: '*[data-add-article="true"]',
        // custom
        'indicatorClass': 'infinite-li',
        ajaxUrl: window.controller.ajax_listing || null
    },

    generateButton: function(buttonType) {
        var me = this,
            type = buttonType || 'next',
            cls = (type == 'previous') ? me.opts.loadPreviousCls : me.opts.loadMoreCls,
            snippet = (type == 'previous') ? me.opts.loadPreviousSnippet : me.opts.loadMoreSnippet,
            $button = $('<a>', {
                'class': me.opts.loadBtnCls + ' ' + cls,
                'html': snippet
            });

        $.publish('plugin/swInfiniteScrolling/onLoadMore', [me, $button, buttonType]);

        return $button;
    },

    openLoadingIndicator: function(type) {
        var me = this,
            $indicator = $('<div>', {
                'class': me.opts.indicatorClass
            });

        if(!type) {
            me.$el.after($indicator);
        } else {
            me.$el.before($indicator);
        }

        me.$el.siblings('.'+me.opts.indicatorClass).loader('show');

        $.publish('plugin/swInfiniteScrolling/onOpenLoadingIndicator', [me, $indicator]);
    },

    closeLoadingIndicator: function() {
        var me = this,
            $indicator = me.$el.siblings('.'+me.opts.indicatorClass);

        me.$el.equalHeight();

        lazyLoadImages();

        $indicator.remove();

        $.publish('plugin/swInfiniteScrolling/onCloseLoadingIndicator', me);
    }
});


