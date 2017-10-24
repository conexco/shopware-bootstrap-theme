;(function ($) {
    "use strict";

    $.plugin('passwordStrengthWrapper', {
        defaults: {
            stripped: false,
            active: true,
            slimBar: true,
            minLenght: 8,
            upperCase: 1,
            upperReg: "[A-Z]",
            lowerCase: 1,
            lowerReg: "[a-z]",
            numbers: 1,
            numberReg: "[0-9]",
            specialchars: 1,
            specialReg: "[!,%,&,@,#,$,^,*,?,_,~]",
            topMargin: "5px;",
            meterClasses: {
                weak: "progress-bar-danger",
                medium: "progress-bar-warning",
                good: "progress-bar-success"
            }
        },

        init: function () {
            var me = this;

            me.$el.bootstrapStrength(me.opts);

            me.$el.parents('form').find('.progress').addClass('pwd-progress');

            $.publish('plugin/passwordStrengthWrapper/onInit', [ me ]);
        }
    });
}(jQuery));