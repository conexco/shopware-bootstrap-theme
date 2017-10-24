$.overridePlugin('swagCustomProductsOptionChange', {
    defaults: {
        fieldSelector: '*[data-field="true"]',
        wysiwygSelector: '.trumbowyg-editor',
        fieldContainerSelector: 'custom-product-option-wrapper-wizard',
        dateFieldSelector: 'custom-products-date',
        numberFieldSelector: 'custom-products-numberfield',
        textAreaSelector: 'custom-products-textarea',
        textFieldSelector: 'custom-products-textfield',
        timeFieldSelector: 'custom-products-time',
        wysiwygFieldSelector: 'custom-products-wysiwyg',
        triggerDelay: '250'
    }
});