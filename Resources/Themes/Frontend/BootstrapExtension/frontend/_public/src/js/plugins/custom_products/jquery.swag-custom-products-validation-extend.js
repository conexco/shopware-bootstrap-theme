$.overridePlugin('swagCustomProductsOptionManager', {

    /** @object Default plugin configuration */
    defaults: {
        formSelector: '.custom-products--form',

        optionSelector: '.custom-products-option',
        requiredSelector: '[data-swag-custom-products-required="true"]',

        singleFieldSelector: '[data-validate="true"]',
        groupFieldSelector: '[data-validate-group="true"]',
        parentSelector: '.custom-product-option-wrapper',
        parentSelectorWizard: '.custom-product-option-wrapper-wizard',
        labelSelector: '.custom-products-label',
        labelTextName: 'data-label',
        messageAttribute: 'data-validate-message',
        labelErrorClass: 'has-validation-error',    

        resetOptionSelector: '[data-custom-products-reset="true"]',
        quantityBoxSelector: '#sQuantity',
        resetConfigurationSelector: '.custom-products-global-reset',

        nextButtonSelector: '.basketform .buybox-button',
        displayContainerSelector: '.custom-products-global-calculation-overview',
        tplSelector: '#overview-template',
        requestBuffer: 350,
        errorOverviewSelector: '.custom-products-global-error-overview',
        errorOverviewLinkSelector: '.custom-products-error-list a',
        scrollOffset: 115,
        errorContainerSelector: '.is-error',

        configuratorFormSelector: '.configurator-form',   
        articleDetailSelector: '.product-details',

        wysiwygEditorClass: 'trumbowyg-textarea',
        datePickerClass: 'picker__input',

        errorTpl: [
            '<div class="alert alert-danger is-error">',
                '{{message}}',
            '</div>'
        ].join(''),

        errorOverviewTpl: [
            '<div class="alert alert-danger is-error">',
                '<ul class="custom-products-error-list list-unstyled">',
                    '{{#each messages}}',
                        '<li class="error-list-item"><a href="{{id}}" class="text-danger">{{#if optionName}}{{optionName}} - {{/if}}{{errorMessage}}</a></li>',
                    '{{/each}}',
                '</ul>',
            '</div>'
        ].join('')
    }
});