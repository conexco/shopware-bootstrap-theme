/**
 * Extended Shopware Address Editor plugin
 */
$.overridePlugin('swAddressEditor', {

    defaults: {
        id: null,
        submitButtonSelector: '.address-form-submit',
        sessionKey: '',
        setDefaultBillingAddress: null,
        setDefaultShippingAddress: null,
        showSelectionOnClose: false
    },   

    open: function(addressId) {
        var me = this,
            sizing = me.opts.sizing,
            maxHeight = 0,
            requestData = {
                id: addressId || null,
                extraData: {
                    sessionKey: me.opts.sessionKey,
                    setDefaultBillingAddress: me.opts.setDefaultBillingAddress,
                    setDefaultShippingAddress: me.opts.setDefaultShippingAddress
                }
            };

        // hide other modals    
        $('.modal').modal('hide');    
            
        $('body').loader('show');

        $.publish('plugin/swAddressEditor/onBeforeOpen', [ me, requestData ]);

        // Ajax request to fetch available addresses
        $.ajax({
            'url': window.controller['ajax_address_editor'],
            'data': requestData,
            'success': function(data) {
                $('body').showModal(data, 'address-manager-modal', function(modal) {
                    $('body').loader('hide');
                    $(modal).attr('data-address-id', addressId);
                    me._registerPlugins();
                    me._bindButtonAction(modal);
                }, {backdrop: 'static'});

                $.publish('plugin/swAddressEditor/onAddressFetchSuccess', [ me, data ]);
            }
        });

        $.publish('plugin/swAddressEditor/onAfterOpen', [ me ]);
    },

    /**
     * Re-register plugins to enable them in the modal
     * @private
     */
    _registerPlugins: function() {
        window.StateManager.addPlugin('div[data-register="true"]', 'swRegister'); 

        $('body').swSelectboxReplacement();

        $.publish('plugin/swAddressEditor/onRegisterPlugins', [ this ]);
    },


    /**
     * Registers listeners for the click event on the "change address" buttons. The buttons contain the
     * needed data for the address selection. It then sends an ajax post request to the form
     * action
     *
     * @param $modal
     * @private
     */
    _bindButtonAction: function(modal) {
        var me = this,
            $modal = $(modal),
            $submitButtons = $modal.find(me.opts.submitButtonSelector),
            $actionInput = $modal.find('input[name=saveAction]');

        $.publish('plugin/swAddressEditor/onBeforeBindButtonAction', [ me, $modal ]);

        // hook into submit button click to eventually update the saveAction value bound to data-value
        $submitButtons.on('click', function(event) {
            var $elem = $(this);

            event.preventDefault();

            $actionInput.val($elem.attr('data-value'));
            $elem.closest('form').submit();
        });

        // submit form via ajax
        $modal.find('form').on('submit', function(event) {
            var $target = $(event.target),
                actionData = {
                    id: $modal.attr('data-address-id') || null
                };

            me._resetErrorMessage($modal);
            me._disableSubmitButtons($modal);

            event.preventDefault();

            $.each($target.serializeArray(), function() {
                actionData[this.name] = this.value;
            });

            $.publish('plugin/swAddressEditor/onBeforeSave', [ me, actionData ]);

            // send data to api endpoint
            $.ajax({
                url: $target.attr('action'),
                data: actionData,
                method: 'POST',
                success: function(response) {
                    me.onSave($modal, response);
                }
            });
        });

        $.publish('plugin/swAddressEditor/onAfterBindButtonAction', [ me, $modal ]);
    },

    onSave: function($modal, response) {
        var me = this;

        $.publish('plugin/swAddressEditor/onAfterSave', [ me, $modal, response ]);

        if (response.success === true) {
            if (me.opts.showSelectionOnClose) {
                // hide other modals    
                $('.modal').modal('hide');   
                $.addressSelection.openPrevious();
            } else {
                window.location.reload();
            }
        } else {
            me._highlightErrors($modal, response.errors);
            me._enableSubmitButtons($modal);
        }
    },

    _highlightErrors: function($modal, errors) {
        var fieldPrefix = $modal.find('[data-prefix]').attr('data-prefix') || 'address';

        $modal.find('.address-editor-errors').removeClass('d-none');

        $.each(errors, function(field) {
            $modal.find('[name="' + fieldPrefix + '[' + field + ']"]').addClass('has-error');
        });
    },

    _resetErrorMessage: function($modal) {
        $modal.find('.address-editor-errors').addClass('d-none');
    },

    _disableSubmitButtons: function($modal) {
        var me = this;
        $modal.find(me.opts.submitButtonSelector).attr('disabled', 'disabled');
    },

    _enableSubmitButtons: function($modal) {
        var me = this;

        $modal.find(me.opts.submitButtonSelector).removeAttr('disabled');
    }
});
