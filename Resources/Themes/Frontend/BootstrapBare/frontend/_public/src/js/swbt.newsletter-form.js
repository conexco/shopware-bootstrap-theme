;(function ($) {
    "use strict";

    $.plugin('newsletterForm', {
        defaults: {
            checkMailSelector: '.newsletter-checkmail',
            additionalFormSelector: '.newsletter-additional-form'
        },

        init: function () {
            var me = this;

            me.$checkMail = me.$el.find(me.opts.checkMailSelector);
            me.$additionalForm = me.$el.find(me.opts.additionalFormSelector);

            me._on(me.$checkMail, 'change', $.proxy(me.refreshAction, me));
            me.$checkMail.trigger('change');
        },

        refreshAction: function (event) {
            var me = this,
                $el = $(event.currentTarget),
                val = $el.val();

            if (val == -1)
                me.$additionalForm.hide();
            else
                me.$additionalForm.show();
        },

        destroy: function () {
            this._destroy();
        }
    });
}(jQuery));