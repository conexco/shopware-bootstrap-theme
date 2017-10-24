$.overridePlugin('swagCustomProductsSwAddArticle', {

    /** @object Default plugin configuration */
    defaults: {
        swAddArticlePluginObjectSelector: '*[data-add-article="true"]',
        errorOverviewSelector: '.custom-products--global-error-overview',
        buyFormSelector: '.basketform',
        hashInputSelector: 'input[name=customProductsHash]',
        customProductFormSelector: '.custom-products--form',
        templateIdAttr: 'data-templateId',
        overviewNumberAttr: 'data-overview-number',
        customUrlAttr: 'data-custom-url',
        hashInputName: 'customProductsHash',
        optionManagerPluginName: 'plugin_optionManager',
        swAddArticlePluginName: 'plugin_swAddArticle',
        buyButtonSelector: '.buybox-button'
    },

    /**
     * Initializes the plugin, sets up the necessary elements,
     * registers the event listener.
     */
    init: function() {
        var me = this;

        me.applyDataAttributes();

        // swAddArticlePlugin not available on first initialization because SwagCustomProducts doesn't add the plugin via the StateManager
        if (!$(me.opts.swAddArticlePluginObjectSelector).data(me.opts.swAddArticlePluginName)) {
            return;
        } else {
            me.superclass.init.apply(this, arguments);
        }
    },

    sendSerializedForm: function(event) {
        var me = this,
            $customProductsForm = $(me.opts.customProductFormSelector),
            parentArguments = arguments,
            optionManager = $customProductsForm.data(me.opts.optionManagerPluginName),
            hiddenInput = $customProductsForm.find(me.opts.hashInputSelector),
            formData;

        event.preventDefault();

        if (me.$buyBoxButton.find(me.opts.buyButtonSelector).hasClass('disabled')) {
            return;
        }

        /**
         * Fires an ajax call to save the configuration as a hash value. It is necessary to do this because
         * the default add-to-basket-request is a jsonp request which can't send enough data caused by it's property
         * to send a GET request.
         */
        if ($customProductsForm.length) {
            $.each(optionManager.getAllOptions(), function() {
                this.validate();
            });

            if (!optionManager.checkValidity()) {
                optionManager.displayErrorOverview();
                $('body, html').css({
                    scrollTop: $(me.opts.errorOverviewSelector).offset().top
                });
                return;
            }
            optionManager.removeErrorOverview();

            formData = optionManager.getFormData();
            formData.append('templateId', $customProductsForm.attr(me.opts.templateIdAttr));
            formData.append('number', $customProductsForm.attr(me.opts.overviewNumberAttr));

            $.ajax({
                'type': 'POST',
                'url': optionManager.generateProtocolRelativeUrl($customProductsForm.attr(me.opts.customUrlAttr)),
                'data': formData,
                'processData': false,
                'contentType': false
            }).done(function(result) {
                window.location.hash = result.hash;

                if (hiddenInput) {
                    hiddenInput.remove();
                }

                $(me.opts.buyFormSelector).append(
                    [
                        '<input type="hidden" name="',
                        me.opts.hashInputName,
                        '" value="',
                        result.hash,
                        '" />'
                    ].join('')
                );
                me.originalFunction.apply(me, parentArguments);
            });
        } else {
            me.originalFunction.apply(me, parentArguments);
        }
    },

    destroy: function() {
        var me = this;

        if(!me.swAddArticlePlugin) {
            me._destroy();
        } else {
            me.superclass.destroy.apply(this, arguments);
        }
    }
});

// Plugin starter
$(function() {
    if ($('*[data-add-article="true"]').data('plugin_swagCustomProductsSwAddArticle')) {
        $('*[data-add-article="true"]').data('plugin_swagCustomProductsSwAddArticle').destroy();
        StateManager.addPlugin('*[data-add-article="true"]', 'swagCustomProductsSwAddArticle');
    }
});
