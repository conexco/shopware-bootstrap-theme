/**
 * Extended Shopware product Compare Plugin.
 *
 * The plugin controlls the topbar-navigation dropdown menu für product comparisons.
 */
$.overridePlugin('swProductCompareMenu', {
    defaults: {
        compareMenuSelector: '.compare-show',
        startCompareSelector: '.compare-start',
        deleteCompareSelector: '.compare-delete-all',
        deleteCompareItemSelector: '.compare-delete-item',
        modalSelector: '.compare-modal',
        modalContentInnerSelector: '.modal-dialog',
        compareEntriesSelector: '.popover-content .compare-list .compare-entry',
        compareEntrySelector: '.compare-entry',
        hiddenCls: 'd-none',
        // new swbt plugin options
        originalCompareListSelector: '.compare-popover-original',
        modalClass: 'compare-modal',
        fullwidthat: 6
    },

    /**
     * Opens the comparison modal by startCompareSelector.
     *
     * @public
     * @method onStartCompare
     */
    onStartCompare: function (event) {
        event.preventDefault();

        var me = this,
            $startCompareBtn = $(event.currentTarget),
            compareCount = me.$el.find(me.opts.compareEntrySelector).length,
            modalUrl = $startCompareBtn.attr('href');

        $startCompareBtn.loader('show');

        $.publish('plugin/swProductCompareMenu/onStartCompareBefore', me);

        // Load compare modal before opening modal box
        $.ajax({
            'url': modalUrl,
            'dataType': 'jsonp',
            'success': function(template) {
                $.publish('plugin/swProductCompareMenu/onStartCompareSuccess', [me, template]);

                $('body').showModal(template, me.opts.modalClass, function(){
                    $startCompareBtn.loader('hide');
                    picturefill();

                    var $modalDialog = $(me.opts.modalSelector).find(me.opts.modalContentInnerSelector);
                    // add fullscreen modal class
                    if (compareCount >= me.opts.fullwidthat)
                        $modalDialog.addClass('modal-full');
                });

                $startCompareBtn.loader('hide');

                $.publish('plugin/swProductCompareMenu/onStartCompareFinished', [me, template]);
            }
        });
    },

    /**
     * Cancel the compare
     *
     * @method onDeleteCompare
     */
    onDeleteCompare: function (event) {
        event.preventDefault();

        var me = this,
            $target = $(event.currentTarget),
            $deleteCompareBtn = me.$el.find(me.opts.deleteCompareSelector),
            $form = $deleteCompareBtn.closest('form'),
            $menu = $(me.opts.compareMenuSelector),
            $popover = $deleteCompareBtn.closest('.popover'),
            $menuBtn = $deleteCompareBtn.closest(me.opts.compareMenuSelector),
            $originalCompareList = $(me.opts.originalCompareListSelector),
            deleteUrl;

        // @deprecated: Don't use anchors for action links. Use forms with method="post" instead.
        if ($target.attr('href')) {
            deleteUrl = $target.attr('href');
        } else {
            deleteUrl = $form.attr('action');
        }

        // remove all products from original list
        $originalCompareList.find(me.opts.compareEntrySelector).remove();
        // close popover and hide btn
        $popover.popover('destroy');
        $menuBtn.addClass('d-none');

        $.ajax({
            'url': deleteUrl,
            'dataType': 'jsonp',
            'success': function () {
                $.publish('plugin/swProductCompareMenu/onDeleteCompareSuccess', me);
            }
        });

        $.publish('plugin/swProductCompareMenu/onDeleteCompare', me);
    },

    /**
     * Delete one product item from comparison
     *
     * @method onDeleteItem
     */
    onDeleteItem: function (event) {
        event.preventDefault();

        var me = this,
            $deleteBtn = $(event.currentTarget),
            $form = $deleteBtn.closest('form'),
            $popover = $deleteBtn.closest('.popover'),
            $menuBtn = $deleteBtn.closest(me.opts.compareMenuSelector),
            $rowElement = $deleteBtn.closest(me.opts.compareEntrySelector),
            rowNumber = $rowElement.data('compare-entry-nr'),
            $originalCompareList = $(me.opts.originalCompareListSelector),
            compareCount = $(me.opts.compareEntriesSelector).length,
            deleteUrl;

        // @deprecated: Don't use anchors for action links. Use forms with method="post" instead.
        if ($deleteBtn.attr('href')) {
            deleteUrl = $deleteBtn.attr('href');
        } else {
            deleteUrl = $form.attr('action');
        }

        // remove product from original list
        $originalCompareList.find('[data-compare-entry-nr="'+ rowNumber +'"]').remove();
        
        if(compareCount > 1) {
            // slide up and remove product from list in popover
            $rowElement.slideUp('fast', function() {
                $rowElement.remove();
            });

            // update compare counter
            $('.compare-quantity').html(compareCount - 1);
        } else {
            // close popover and hide btn
            $popover.popover('destroy');
            $menuBtn.addClass('d-none');
        }

        // remove product silent in the background
        $.ajax({
            'url': deleteUrl,
            'dataType': 'jsonp',
            'success': function (response) {
                $.publish('plugin/swProductCompareMenu/onDeleteItemSuccess', [me, response]);
            }
        });
    }
});