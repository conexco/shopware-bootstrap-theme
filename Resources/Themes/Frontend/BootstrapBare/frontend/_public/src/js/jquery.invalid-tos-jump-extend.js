/**
 * Extended Shopware swInvalidTosJump Plugin
 */
$.overridePlugin('swInvalidTosJump', {
    defaults: {
        jumpLabelSelector: 'label[for="sAGB"]',
        errorClass: 'text-danger'
    }
});
