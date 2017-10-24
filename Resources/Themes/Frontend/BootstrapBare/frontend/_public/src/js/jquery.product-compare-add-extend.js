/**
 * Extended Shopware Article Compare Add Plugin.
 *
 * The plugin handles the compare add button on every product box.
 */
$.overridePlugin('swProductCompareAdd', {
    defaults: {
        compareMenuSelector: '.compare-show',
        hiddenCls: 'hidden'
    },
    /**
     * onAddArticleCompare function for adding articles to
     * the compare menu, which will be refreshed by ajax request.
     *
     * @method onAddArticleCompare
     */
    onAddArticleCompare: function (event) {
        var me = this,
            $target = $(event.target),
            $form = $target.closest('form'),
            addArticleUrl;

        event.preventDefault();

        // @deprecated: Don't use anchors for action links. Use forms with method="post" instead.
        if ($target.attr('href')) {
            addArticleUrl = $target.attr('href');
        } else {
            addArticleUrl = $form.attr('action');
        }

        if(!addArticleUrl) {
            return;
        }

        $('body').loader('show');

        $.publish('plugin/swProductCompareAdd/onAddArticleCompareBefore', [me, event]);

        // Ajax request for adding article to compare list
        $.ajax({
            'url': addArticleUrl,
            'dataType': 'jsonp',
            'success': function(data) {
                var compareMenu = $(me.opts.compareMenuSelector);

                if (compareMenu.hasClass(me.opts.hiddenCls))
                    compareMenu.removeClass(me.opts.hiddenCls);

                // Check if error thrown
                if (data.indexOf('data-max-reached="true"') !== -1) {
                    $('body').showModal(data, 'compare-max-reached-modal', function() {
                        $('body').loader('hide');
                    });
                } else {
                    compareMenu.html(data);
                    compareMenu.find('[data-product-compare-menu="true"]').swProductCompareMenu();
                    compareMenu.find('[data-toggle="popover"]').popoverWrapper();

                    $('body').loader('hide');
                    $('html,body').animate({
                        scrollTop: 0
                    },'slow');
                }

                $.publish('plugin/swProductCompareAdd/onAddArticleCompareSuccess', [me, event, data, compareMenu]);
            }
        });

        $.publish('plugin/swProductCompareAdd/onAddArticleCompare', [me, event]);
    }
});