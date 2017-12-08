/**
 * Extended Shopware Register plugin
 *
 * This plugin handles validation and addition logic for the registration form and its fields.
 */
$.overridePlugin('swRegister', {
    defaults: {
        hiddenClass: 'd-none',
        errorClass: 'has-error',
        formSelector: '.register-form',
        submitBtnSelector: '.register-submit, .address-form-submit',
        typeFieldSelector: '.register-customertype select, .address-customertype select, .address-customertype input',
        companyType: 'business',
        skipAccountSelector: '.register-check input',
        altShippingSelector: '.register-alt-shipping input',
        companyFieldSelector: '.register-company, .address-company',
        accountFieldSelector: '.register-account-information',
        shippingFieldSelector: '.register-shipping',
        paymentFieldSelector: '.payment-content',
        paymentInputSelector: '.payment-selection-input input',
        countryFieldSelector: '.select-country',
        stateContainerSelector: '.register-state-selection, .address-state-selection',
        paymentMethodSelector: '.payment-method',
        inputSelector: '.is-required',
        errorMessageClass: 'text-danger mtm',
        personalEmailSelector: '#register_personal_email',
        personalPasswordSelector: '#register_personal_password',
        personalEmailConfirmationSelector: '#register_personal_emailConfirmation',
        personalPasswordConfirmationSelector: '#register_personal_passwordConfirmation',
        personalGuestSelector: '#register_personal_skipLogin',
        // custom
        showCollapseClass: 'in'
    },

    init: function () {
        var me = this;

        //remove inputClass from selectboxit span so it's not validated later
        me.$el.find('.selectboxit').removeClass(me.opts.inputSelector.substr(1));

        me.superclass.init.apply(this, arguments);
    },

    checkType: function () {
        var me = this,
            opts = me.opts,
            $fieldSet = me.$companyFieldset,
            hideCompanyFields = (me.$typeSelection.length && me.$typeSelection.val() !== opts.companyType),
            requiredFields = $fieldSet.find(opts.inputSelector),
            requiredMethod = (!hideCompanyFields) ? me.setHtmlRequired : me.removeHtmlRequired,
            classMethod = (!hideCompanyFields) ? 'addClass' : 'removeClass',
            disabledMethod = (!hideCompanyFields) ? 'removeAttr' : 'attr';

        requiredMethod(requiredFields);
        $fieldSet[classMethod](opts.showCollapseClass);
        $fieldSet.find('input, select, textarea')[disabledMethod]('disabled', 'disabled');

        $.publish('plugin/swRegister/onCheckType', [me, hideCompanyFields]);
    },

    checkSkipAccount: function () {
        var me = this,
            opts = me.opts,
            $fieldSet = me.$accountFieldset,
            isChecked = me.$skipAccount.is(':checked'),
            requiredFields = $fieldSet.find(opts.inputSelector),
            requiredMethod = (!isChecked) ? me.setHtmlRequired : me.removeHtmlRequired,
            classMethod = (isChecked) ? 'removeClass' : 'addClass';

        requiredMethod(requiredFields);
        $fieldSet[classMethod](opts.showCollapseClass);

        $.publish('plugin/swRegister/onCheckSkipAccount', [me, isChecked]);
    },

    checkChangeShipping: function () {
        var me = this,
            opts = me.opts,
            $fieldSet = me.$shippingFieldset,
            isChecked = me.$alternativeShipping.is(':checked'),
            requiredFields = $fieldSet.find(opts.inputSelector),
            requiredMethod = (isChecked) ? me.setHtmlRequired : me.removeHtmlRequired,
            classMethod = (isChecked) ? 'addClass' : 'removeClass';

        requiredMethod(requiredFields);
        $fieldSet[classMethod](opts.showCollapseClass);

        $.publish('plugin/swRegister/onCheckChangeShipping', [me, isChecked]);
    },

    onCountryChanged: function (event) {                                                   
        var me = this,
            opts = me.opts,
            hiddenClass = opts.hiddenClass,
            $select = $(event.currentTarget),
            selectId = $select.attr('id'),
            val = $select.val(),
            $parent = $select.parents('fieldset'),
            stateSelect = $parent.find('#' + selectId + '_' + val + '_states'),
            stateContainer = $parent.find(me.opts.stateContainerSelector),
            selectBox = stateSelect.data("selectBox-selectBoxIt");

        $.publish('plugin/swRegister/onCountryChangedBefore', [me, event]);

        stateContainer.addClass(hiddenClass);
        if (selectBox)
            selectBox.disable();
        else
            stateSelect.prop('disabled', true);

        if (stateSelect.length) {
            stateSelect.closest('.form-group').removeClass(me.opts.hiddenClass);
            if (selectBox)
                selectBox.enable();
            else
                stateSelect.prop('disabled', false);
        }

        $.publish('plugin/swRegister/onCountryChanged', [me, event]);
    },

    setFieldAsError: function ($el) {
        var me = this;

        $el.closest('.form-group').addClass(me.opts.errorClass);

        $.publish('plugin/swRegister/onSetFieldAsError', [me, $el]);
    },

    setFieldAsSuccess: function ($el) {
        var me = this;

        $el.closest('.form-group').removeClass(me.opts.errorClass);

        $.publish('plugin/swRegister/onSetFieldAsSuccess', [me, $el]);
    },

    // Fix: prevent shopware register plugin from setting error class on form focusout on skipLogin checkbox
    onValidateInput: function (event) {
        var me = this,
            $el = $(event.target),
            id = $el.attr('id'),
            action,
            relatedTarget = event.relatedTarget || document.activeElement;

        me.$targetElement = $(relatedTarget);

        switch (id) {
            case 'register_personal_email':
            case 'register_personal_emailConfirmation':
                action = 'ajax_validate_email';
                break;
            case 'register_billing_ustid':
                action = 'ajax_validate_billing';
                break;
            case 'register_personal_password':
            case 'register_personal_passwordConfirmation':
                action = 'ajax_validate_password';
                break;
            default:
                break;
        }

        if (!$el.val() && $el.attr('required')) {
            me.setFieldAsError($el);
        } else if ($el.attr('type') === 'checkbox' && !$el.is(':checked') && id != 'register_personal_skipLogin' && id != 'register_billing_shippingAddress') { 
            me.setFieldAsError($el);
        } else if (action) {
            me.validateUsingAjax($el, action);
        } else {
            me.setFieldAsSuccess($el);
        }

        $.publish('plugin/swRegister/onValidateInput', [ me, event, action ]);
    },

    onValidateSuccess: function (action, $input, result) {
        var me = this,
            isError,
            errorMessages = [],
            skipEmailConfirmationError = me.$personalEmailConfirmation.length === 0 || (me.$targetElement.attr('name') == me.$personalEmailConfirmation.attr('name') && typeof me.$personalEmailConfirmation.val() === 'undefined'),
            skipPasswordConfirmationError = me.$personalPasswordConfirmation.length === 0 || (me.$targetElement.attr('name') == me.$personalPasswordConfirmation.attr('name') && typeof me.$personalPasswordConfirmation.val() === 'undefined');

        $('#' + action + '-message').remove();

        if (!result) {
            return;
        }

        if (skipEmailConfirmationError) {
            result['emailConfirmation'] = false;
        } else if (skipPasswordConfirmationError) {
            result['passwordConfirmation'] = false;
        }

        for (var key in result) {
            //fields with `false` are now valid
            isError = !!result[key];

            if (!isError) {
                continue;
            }

            if (key == 'emailConfirmation' && skipEmailConfirmationError) {
                result[key] = false;
                continue;
            } else if (key == 'passwordConfirmation' && skipPasswordConfirmationError) {
                result[key] = false;
                continue;
            }

            if ($input.attr('name') == me.$personalEmailConfirmation.attr('name') || $input.attr('name') == me.$personalGuest.attr('name')) {
                $input = me.$personalEmail;
            } else if ($input.attr('name') == me.$personalPasswordConfirmation.attr('name')) {
                $input = me.$personalPassword;
            }

            errorMessages.push(result[key]);
        }

        if (result) {
            me.updateFieldFlags(result);
        }

        if (errorMessages && errorMessages.length) {
            $('<p>', {
                'html': '<small>' + errorMessages.join('<br/>') + '</small>',
                'id': action + '-message',
                'class': me.opts.errorMessageClass
            }).insertAfter($input);

            me.setFieldAsError($input);
        }

        $.publish('plugin/swRegister/onValidateSuccess', [ me, $input ]);
    }
});