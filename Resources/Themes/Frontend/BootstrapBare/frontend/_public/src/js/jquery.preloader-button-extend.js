/**
 * Extended Shopware Preloader Plugin
 */
$.overridePlugin('swPreloaderButton', {
    onShowPreloader: function() {
        var me = this;

        if(me.opts.checkFormIsValid) {
            var $form = $('#' + me.$el.attr('form'));

            if (!$form.length) {
                $form = me.$el.parents('form');
            }

            if (!$form.length || !$form[0].checkValidity()) {
                return;
            }
        }

        //... we have to use a timeout, otherwise the element will not be inserted in the page.
        window.setTimeout(function() {
            me.$el.attr('disabled', 'disabled').loader('show');

            $.publish('plugin/swPreloaderButton/onShowPreloader', [ me ]);
        }, 25);
    },

    reset: function() {
        var me = this;

        me.$el.removeAttr('disabled').loader('hide');
    }
});
