/**
 * Extended Shopware Auto Submit Plugin
 */
$.overridePlugin('swAutoSubmit', {
    onChangeSelection: function () {
        var me = this;

        if(me.opts.loadingindicator) {
            $('body').loader('show');
        }

        me.$form.submit();
    }
});