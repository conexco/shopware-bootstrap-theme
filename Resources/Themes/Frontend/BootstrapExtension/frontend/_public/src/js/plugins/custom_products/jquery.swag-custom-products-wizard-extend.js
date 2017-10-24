$.overridePlugin('swagCustomProductsWizard', {

    defaults: {
        isHiddenClass: 'is--hidden',
        isActiveClass: 'is-active',

        formCls: '.custom-products--form',

        optionManagerSelector: '*[data-swag-custom-products-option-manager="true"]',
        optionManagerPluginName: 'plugin_swagCustomProductsOptionManager',

        fancySelectPluginName: 'selectBox-selectBoxIt',

        containerClass: '.custom-products--wizard-container',
        optionClass: '.custom-products-option',

        navLeftButtonClass: '.custom-products-navigation-btn-left',
        navRightButtonClass: '.custom-products-navigation-btn-right',
        navSelectClass: '.navigation-select',
        assumeButtonCls: '.take-configuration'
    },

    init: function () {
        var me = this;

        me.applyDataAttributes();
        me.getExternalPlugins();
        me.createJQueryElements();
        me.subscribeEvents();

        me.$prevButton.prop("disabled", true);
        me.$assumeButton.prop("disabled", true);
    },

    onAssume: function () {
        var me = this,
            $customProductsForm = $(me.opts.formCls);

        $customProductsForm.data('plugin_optionManager', me.optionManagerPlugin.optionManager);
    },

    onOpenWizard: function () {
        var me = this;

        // Call onOptionChange for en / disable initial the button;
        me.onOptionChange();

        // Overwrite the shouldShowOverview because we want to force show the price overview..
        me.optionManagerPlugin.optionManager.__proto__.shouldShowOverview = function () {
            return true;
        };

        me.optionManagerPlugin.optionManager.triggerRequest();

        $.publish('plugin/swagCustomProductsModal/onOpenWizard', [ me ]);
    },

    activateNextOption: function (source, direction) {
        var me = this,
            nextIndex;

        me.onOptionChange();

        for (var i = 0; i < me.$wizardoptions.length; i++) {
            if (me.$wizardoptions[ i ].$el.hasClass(me.opts.isActiveClass)) {
                if (source == me.sources.button) {
                    nextIndex = direction ? me.getNextIndex(i) : me.getPrevIndex(i);
                    // use selectboxit api
                    me.selectNavPlugin.selectOption(nextIndex);
                    me.enDisAbleButtons(nextIndex, direction);
                } else {
                    nextIndex = me.$navSelect.val();
                    me.enDisAbleButtons(nextIndex, direction, true);
                }

                me.handleOptionView(i, nextIndex);
                break;
            }
        }

        $.publish('plugin/swagCustomProductsModal/activateNextOption', [ me, source, direction, me.$wizardoptions ]);
    }
});
