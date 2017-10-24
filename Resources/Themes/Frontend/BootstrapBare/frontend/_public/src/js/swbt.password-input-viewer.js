;(function ($) {
    "use strict";

    $.plugin('passwordInputViewer', {
        defaults: {
            wrapperTemplate: '<div class="input-group"></div>',
            toggleBtnTemplate: '<div class="input-group-btn"><button type="button" class="btn btn-default btn-pw"></button></div>',
            iconShow: '<i class="fa fa-eye" data-show="true"></i>',
            iconHide: '<i class="fa fa-eye-slash hidden" data-show="false"></i>',
            elementClass: 'pwd-show-hide'
        },

        init: function () {
            var me = this,
                opts = me.opts;

            me.applyDataAttributes();

            me.addToggleBtn();
            me.registerEvents();

            $.publish('plugin/passwordInputViewer/onInit', [ me ]);
        },

        addToggleBtn: function () {
            var me = this,
                opts = me.opts;
                
            // add Btn to input field(s)
            me.$el
                .addClass(opts.elementClass)
                .wrap(opts.wrapperTemplate)
                .after(opts.toggleBtnTemplate);

            me.$iconShowHideBtn = me.$el.parent().find('button');

            // add icons
            me.$iconShowHideBtn.append(opts.iconShow).append(opts.iconHide);

            $.publish('plugin/passwordInputViewer/onAddToggleBtn', [ me ]);
        },
 
        registerEvents: function () {
            var me = this;

            // on click on btn
            me._on(me.$iconShowHideBtn, 'click', $.proxy(me.togglePwdVisibility, me));

            $.publish('plugin/passwordInputViewer/onRegisterEvents', [ me ]);
        },

        togglePwdVisibility: function () {
            var me = this,
                opts = me.opts;

            if (me.$el.attr('type') == 'text') {
                me.$el.attr('type', 'password');
            }
            else {
                me.$el.attr('type', 'text');
            }

            me.$iconShowHideBtn.find('i').toggleClass('hidden');

            $.publish('plugin/passwordInputViewer/onTogglePwdVisibility', [ me ]);
        }
    });
}(jQuery));