$.overridePlugin('swAdvancedCart', {
    defaults: {
        openAddWishListSelector: '*[data-open-wishlist-modal=true]',
        saveCartSelector: '.save-cart--button',
        openWishListDataSelector: '.list-container-row',
        changePublicStateSelector: '.list-container-publish-check',
        openConfirmModalSelector: '.manage-container-delete',
        renameListSelector: '.manage-container-rename',
        nameFieldSelector: '.list-container-name-input',
        selectFacebookSelector: '.select-item-facebook',
        selectTwitterSelector: '.select-item-twitter',
        selectGooglePlusSelector: '.select-item-google-plus',
        selectMailSelector: '.select-item-mail',
        addArticleButtonSelector: '.add-article-button',
        confirmDeleteButtonSelector: '.modal-content .modal-btn-container-btn',
        submitAddToWishListSelector: '.modal-content .add-wishlist-button',
        addToWishListInputSelector: '.add-wishlist-name',
        saveWishListButtonSelector: '.save-wishlist-button',
        saveWishListInputSelector: '.save-wishlist-input',
        listSelectSelector: '.load-wishlist-select',
        shareMailButtonSelector: '.cart-modal-share-btn',
        cartQuantitySelector: '.advancedCartQuantity',
        cartProductRemoveSelector: '.note-delete',
        quickViewActiveSelector: '.quick-view.is--active',
        quickViewContainerSelector: '.quick-view--view',
        defaultUrlSuffixRegEx: /\/[0-9]+$/,
        productSearchFieldSelector: '.add-article-text-field',
        listContainerSelector: '.list-container-content',
        bundleMessageSelector: '.cart--header-info-bundle'
    },

    // override SW initSlider
    initSlider: function () {
    },

    callAjax: function (url, parameter, callback, scope, errorCallback, extraParams) {
        var me = this,
            parameter = parameter || {},
            callback = callback || $.noop,
            scope = scope || me,
            errorCallback = errorCallback || $.noop,
            extraParams = extraParams || null;

        if (!url) {
            throw 'Cannot call ajax request without url';
        }

        if (!CSRF.checkToken()) {
            $.subscribe(
                'plugin/swCsrfProtection/init',
                $.proxy(me.csrfAfterInit, me, url, parameter, callback, scope, errorCallback, extraParams)
            );
            CSRF.requestToken();
            return;
        }

        $.ajax({
            type: "POST",
            url: me.prepareUrl(url),
            data: parameter
        }).done(function (response) {
            callback.call(scope, response, extraParams);
        }).error(function () {
            errorCallback.call(scope, extraParams);
        });
    },

    /**
     * This event is triggered when the user wants to create a new list from the current cart
     *
     * @param event
     */
    onCreateNewList: function (event) {
        var me = this,
            $el = $(event.currentTarget),
            parent = $el.parents('.save-wishlist-button-container'),
            container = $el.parents('.cart-option-wrapper'),
            $input = parent.find(me.opts.saveWishListInputSelector),
            cartName = $input.val(),
            url = jsUrlObject.saveWishList,
            parameter = { name: cartName, published: 0 };

        $.loadingIndicator.open();

        me.callAjax(url, parameter, me.afterCreateNewList, me, $.noop, { input: $input, container: container });
    },

    /**
     * Helper method to send the ajax-call for adding an article and then even insert a new article into the template
     * @param $el
     */
    addArticle: function ($el) {

        var me = this,
            contentCt = $el.parents(me.opts.listContainerSelector),
            $lastRow = $el.parents('.article-table-add-article'),
            $textField = $lastRow.find(me.opts.productSearchFieldSelector),
            productName = $textField.val(),
            basketId = $lastRow.find('.add-article-hidden').val(),
            url = jsUrlObject.getArticle,
            parameter = { basketId: basketId, articleName: productName },
            extraParams = {
                el: $el,
                textField: $textField,
                contentCt: contentCt,
                lastRow: $lastRow
            };

        if (!productName) {
            return;
        }

        $el.attr("disabled", true);
        $el.html(jsSnippetObject.pleaseWait);

        me.callAjax(url, parameter, me.afterAddArticle, me, $.noop, extraParams);

    },

    afterAddArticle: function (response, extraParams) {
        var me = this,
            productTable = extraParams.contentCt.find('.article-table-header'),
            status = $.parseJSON(response),
            alertContainer, alert, $template;

        // Clear Input
        extraParams.textField.val('');

        if (status.success == true) {
            extraParams.contentCt.find('.hidden').removeClass('hidden');

            // Article was added already
            if (status.type === 'readded') {
                me.slideOutList(extraParams.lastRow.find('.wishlist-alert-readded'), extraParams.el);
            }
            // Normal success
            else if (status.type === 'added') {
                $template = $(status.template);
                productTable.after($template);

                $template.find('.advancedCartQuantity').swSelectboxReplacement();
                window.picturefill();
            }
        } else {
            // Failed, because the product couldn't be found
            if (status.type !== 'notfound') {
                return;
            }

            alertContainer = extraParams.lastRow.find('.wishlist-alert-not-found');
            alertContainer.find('.alert-content').html(status.message);

            me.slideOutList(alertContainer, extraParams.el);
        }

        extraParams.el.attr("disabled", false);
        extraParams.el.html(jsSnippetObject.add);

        window.StateManager.updatePlugin('*[data-add-article="true"]', 'swAddArticle');
    },

    afterSubmitAddToWishList: function (response) {
        var me = this,
            status = $.parseJSON(response),
            successCt;

        $.loadingIndicator.close();
        if (status.success == true && status.lists == null) {
            successCt = $('.modal-body .wishlist-alert-min-one');
        } else if (status.success == true) {
            me.$modal.modal('hide');
            successCt = $('.wishlist-alert-add-success');
        } else {
            successCt = $('.modal-body .wishlist-alert-add-error');
        }

        successCt.slideDown('slow').delay(2000).slideUp('slow');
    },

    /**
     * We need this event, so the name-change is triggered by clicking out of the text-box
     * @param event
     */
    onFocusOut: function (event) {
        var me = this,
            $el = $(event.currentTarget),
            listContainer = $el.parents('.saved-lists-list-container'),
            id = $el.attr('data-list-id'),
            val;

        // strip html tags
        $el.val($el.val().replace(/(<([^>]+)>)/ig, ''));

        val = $el.val();

        $el.parent().hide();
        listContainer.find('.list-container-text-name').html(val);
        listContainer.find('.list-container-text-name, .list-container-text-count, .list-container-text-state').show();
        $(me.opts.openConfirmModalSelector).attr('data-name', val);

        // Change list name
        me.callAjax(jsUrlObject.changeName, { newName: val, basketId: id });

        $.publish('plugin/swAdvancedCart/onFocusOut');

        /** @deprecated changed to 'sw' prefixed version */
        $.publish('plugin/advancedCart/onFocusOut');
    },

    /**
     * This method is called when the user clicks on the "rename"-entry.
     * It will display the hidden text-box and sets the focus on it
     * @param event
     */
    onRenameList: function (event) {
        event.preventDefault();
        var me = this,
            $el = $(event.currentTarget),
            parentContainer = $el.parents(me.opts.listContainerSelector),
            inputContainer = parentContainer.find('.list-container-name-hidden'),
            listContainer = parentContainer.parents('.saved-lists-list-container');

        // display the input over the name-div
        inputContainer.show();
        // set focus, so the "focus-out" is triggered for sure when the user clicks anywhere else
        inputContainer.find('input').focus();

        // The name-change-input is just an overlay over the row.
        // Long names cause the information (e.g. "Public list") to be displayed next to the overlay input, so we better hide it.
        listContainer.find('.list-container-text-name, .list-container-text-count, .list-container-text-state').hide();

        $.publish('plugin/swAdvancedCart/onRenameList');

        /** @deprecated changed to 'sw' prefixed version */
        $.publish('plugin/advancedCart/onRenameList');
    },

    afterDeleteProduct: function (response, extraParams) {
        var me = this,
            $parent = extraParams.el.parents('.table-row'),
            $cart = extraParams.el.closest('.list-container-article-table'),
            $cartButton = extraParams.el.parents().find('.article-table-add-cart'),
            $cartButtonBottom = extraParams.el.parents().find('.list-container-manage-buttons a'),
            result = $.parseJSON(response);

        $parent.remove();

        if (result.count <= 0) {
            $cart.addClass('hidden');
            $cartButton.addClass('hidden');
            $cartButtonBottom.addClass('hidden');
        }

        $.publish('plugin/swAdvancedCart/onAfterRemoveArticle', [me, extraParams.event]);

        /** @deprecated changed to 'sw' prefixed version */
        $.publish('plugin/advancedCart/afterRemoveArticle', [me, extraParams.event]);
    },

    /**
     * This method gets called every time the state of the "Public"-Checkbox is changed
     * @param event
     */
    onChangePublicState: function (event) {
        var me = this,
            target = $(event.currentTarget),
            id = target.attr('data-list-id'),
            parent = target.parents('.saved-lists-list-container'),
            publicIcon = parent.find('.list-container-lock-icon'),
            linkArea = target.parents('.list-container-header').find('.header-sharing-container'),
            publicText = parent.find('.list-container-text-state'),
            actionLinks = parent.find('.public-list-action-link');

        // If the value of the checkbox changed from private to public

        if (target.is(':checked')) {
            linkArea.removeClass('list-container-disabled');
            publicIcon.removeClass('fa-lock').addClass('fa-eye').attr('title', jsSnippetObject.listIsPublic);
            publicText.html(jsSnippetObject.publicListText);
            actionLinks.removeClass('cart-disabled');

            me.callAjax(jsUrlObject.changePublished, { basketId: id, newState: 1 });

        } else {
            linkArea.addClass('list-container-disabled');
            publicIcon.removeClass('fa-eye').addClass('fa-lock').attr('title', jsSnippetObject.listIsPrivate);
            publicText.html(jsSnippetObject.privateListText);
            actionLinks.addClass('cart-disabled');

            me.callAjax(jsUrlObject.changePublished, { basketId: id, newState: 0 });
        }

        $.publish('plugin/swAdvancedCart/onChangePublicState');

        /** @deprecated changed to 'sw' prefixed version */
        $.publish('plugin/advancedCart/onChangePublicState');
    },

    /**
     * This method slides the list-content up or down
     * @param event
     */
    onClickListContainer: function (event) {
        var me = this,
            $currentTarget = $(event.currentTarget).parent(),
            isActive = $currentTarget.attr('data-is-active') === 'true',
            $currentIcon = $currentTarget.find('.list-container-icon');

        $currentTarget.find(me.opts.listContainerSelector).slideToggle();

        // Is needed to toggle the arrow
        if (isActive) {
            $currentIcon.removeClass('fa-angle-up').addClass('fa-angle-down');
            $currentTarget.attr('data-is-active', false);
        } else {
            $currentIcon.removeClass('fa-angle-down').addClass('fa-angle-up');
            $currentTarget.attr('data-is-active', true);
        }

        $.publish('plugin/swAdvancedCart/onClickListContainer');

        /** @deprecated changed to 'sw' prefixed version */
        $.publish('plugin/advancedCart/onClickListContainer');
    },

    /**
     * It is called when an article should be added to a wish-list.
     * It simply opens the modal-window, which displays the possible lists.
     * @param event
     * @returns {boolean}
     */
    onOpenDetailModal: function (event) {
        var me = this,
            id = $(me).attr('id'),
            target = $(event.currentTarget),
            qty = $('#sQuantity').val(),
            customizedClass = $('.customizing--data-wrapper'),
            customized = 1,
            parameter = {
                orderNumber: target.attr('data-ordernumber'),
                quantity: qty || 1,
                customized: customized
            };

        event.preventDefault();

        // No customizing-article
        if (!customizedClass || !customizedClass.length) {
            parameter.customized = 0;
        }

        me.callAjax(jsUrlObject.detailModal, parameter, me.openDetailModal, me);

        $.publish('plugin/swAdvancedCart/onDetailAddToWishList');

        /** @deprecated changed to 'sw' prefixed version */
        $.publish('plugin/advancedCart/onDetailAddToWishList');
        return false;
    },

    /**
     * This opens the modal-window containing the advanced-cart content.
     * @param {string} content
     */
    openModal: function (content) {
        var me = this,
            sizing = 'content';

        if (StateManager.isCurrentState('xs')) {
            sizing = 'auto';
        }

        $('body').showModal(content, 'wishlist-detail', function (modal) {
            me.$modal = $(modal);
            $('body').loader('hide');
        });
    },

    /**
     * This method is called after the user decided to add an article to a special wish-list
     * and after he clicked the submit-button on the modal-window
     * @param event
     * @returns {boolean}
     */
    onSubmitAddToWishList: function (event) {
        var me = this,
            data,
            successCt;
        event.preventDefault();

        data = $('.modal-content .cart-form-add-article').serialize();

        $.loadingIndicator.open({
            openOverlay: false
        });

        me.callAjax(
            jsUrlObject.addToWishList,
            data,
            me.afterSubmitAddToWishList,
            me,
            me.onSubmitAddToWishListError
        );

        $.publish('plugin/swAdvancedCart/onSubmitAddToWishList');

        /** @deprecated changed to 'sw' prefixed version */
        $.publish('plugin/advancedCart/onSubmitAddToWishList');
        return false;
    },

    afterCreateNewList: function (response, data) {
        var me = this,
            status = $.parseJSON(response),
            messageContainerSelector = '.cart-header-alert',
            errorMessageContainerSelector = '.cart-header-error';

        $.loadingIndicator.close();

        if (!status.success) {
            messageContainerSelector = errorMessageContainerSelector;
            if (status.error.length > 0) {
                alertCt = me.prepareErrorMessage(data, status.error, errorMessageContainerSelector);
            }
        }

        if (status.success) {
            data.input.val('');
        }

        $(messageContainerSelector).slideDown("slow")
            .delay(5000)
            .slideUp('slow');

        me.requireBundleMessage(status.requireBundleMessage);

        $.publish('plugin/swAdvancedCart/afterCreateNewList', [ me, response, data ]);
    },

    prepareErrorMessage: function (data, errorArray, errorMessageContainerSelector) {
        var message,
            errorMessageContentSelector = '.alert-danger [class*="col-"]',
            errorCode = errorArray[0],
            messageContainer = $(errorMessageContainerSelector),
            contentContainer = messageContainer.find(errorMessageContentSelector);

        switch (errorCode) {
            case 110: // name is empty
                message = messageContainer.attr('data-noName');
                contentContainer.html(message);
                break;
            case 120: // name already exists
                message = messageContainer.attr('data-nameExists');
                contentContainer.html(message);
                break;
        }
    },

    requireBundleMessage: function (requireMessage) {
        var me = this;

        if (requireMessage) {
            $(me.opts.bundleMessageSelector).slideDown('slow').delay(3000).slideUp('slow');
        }
    }
});
