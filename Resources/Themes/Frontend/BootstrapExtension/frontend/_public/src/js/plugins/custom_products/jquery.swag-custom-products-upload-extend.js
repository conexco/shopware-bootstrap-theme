$.overridePlugin('swagCustomProductsUpload', {

    defaults: {
        advancedCls: 'is-advanced-upload',
        dragCls: 'is-dragover',
        mode: 'file',
        fileIconCls: 'fa fa-paperclip mrs',
        previewContainerSelector: '.custom-products-upload-list',
        deleteFileBtnSelector: '.upload-btn-delete',
        uploadBtnSelector: '.upload-btn-send-request',
        uploadURL: '',
        templateId: -1,
        optionId: -1,
        uploadingCls: 'is-uploading',
        hiddenCls: 'is--hidden',
        maxFiles: -1,
        maxFileSize: -1,
        allowedMimeTypes: [],
        failureCls: 'is-failure',
        failureMessageSelector: '.custom-products-uploading-failure',
        failureMessageMaxFilesSelector: '.too-much-files',
        failureMessageMaxFileSizeSelector: '.max-file-size',
        failureMessageDuplicateNameSelector: '.duplicate-name',
        failureMessageNotAllowedMimeType: '.not-allowed-mime-type',
        successCls: 'is-success',
        successMessageSelector: '.custom-products-uploading-success',
        uploadingMessageSelector: '.custom-products-uploading-information',
        parentSelector: '.custom-product-option-wrapper',
        parentSelectorWizard: '.custom-product-option-wrapper-wizard',
        wizardWrapperSelector: '.custom-products--wizard-container',
        messageTimeout: 4000,

        fileTpl: [
            '<ul class="upload--list mtm list-unstyled">',
                '{{#each files}}',
                    '{{#if error}}',
                        '<li class="upload-item mbs has-error">',
                    '{{else}}',
                        '<li class="upload-item mbs">',
                    '{{/if}}',
                        '<i class="{{../iconCls}}"></i>',
                        '<span class="upload-title">{{title}}</span>',
                        '{{#if isUploaded}}',
                            '<i class="fa fa-check is-uploaded pull-right text-success"></i>',
                        '{{else}}',
                            '<a class="upload-btn-delete pull-right" href="#" data-index="{{index}}">',
                                '<i class="fa fa-trash-o"></i>',
                            '</a>',
                        '{{/if}}',
                    '</li>',
                '{{/each}}',
            '</ul>'
        ].join(''),

        imageTpl: [
            '<ul class="upload--list mtm list-unstyled">',
                '{{#each files}}',
                    '{{#if error}}',
                        '<li class="upload-item mbs has-error">',
                    '{{else}}',
                        '<li class="upload-item mbs">',
                    '{{/if}}',
                        '<img src="{{path}}" title="{{title}}" class="upload-preview-image is--hidden" />',
                        '<span class="upload-title">{{title}}</span>',
                        '{{#if isUploaded}}',
                                '<i class="fa fa-check is-uploaded pull-right text-success"></i>',
                        '{{else}}',
                            '<a class="upload-btn-delete pull-right" href="#" data-index="{{index}}">',
                                '<i class="fa fa-trash-o"></i>',
                            '</a>',
                        '{{/if}}',
                    '</li>',
                '{{/each}}',
            '</ul>'
        ].join('')
    },

    addUploadedFiles: function(files) {
        var me = this,
            form = $('.custom-products--form');

        $.each(files, function () {
            var file = this;

            file._uploaded = true;
            me._files.push(file);

            me.$uploadInput.data('data-uploadResponse', JSON.stringify(files));

            $.publish('plugin/swagCustomProductsUpload/addUploadedFiles', [ me, files ]);

            //Fire form change event
            form.change();

            //Trigger the wizard change event
            if (me.$parent.hasClass('custom-product--option-wrapper-wizard')) {
                me.$parent.trigger('change');
            }

            me.previewFiles();
        });
    },

    onUploadFiles: function(event) {
        var me = this,
            formData = new window.FormData(),
            name = me.$uploadInput.attr('name'),
            form = $('.custom-products--form'),
            optionManager = form.data('plugin_optionManager'),
            jsonFiles;

        event.preventDefault();

        $.each(optionManager._data, function(key, val) {
            formData.append(key, val);
        });

        // Add files to formData
        $.each(me._files, function() {
            var file = this;
            if (file._uploaded) {
                return;
            }
            formData.append(name, file);
        });

        formData.append('mode', me.opts.mode);
        formData.append('templateId', me.opts.templateId);
        formData.append('optionId', me.opts.optionId);

        me.$uploadBtn.attr('disabled', 'disabled').addClass(me.opts.uploadingCls);
        me.$el.addClass(me.opts.uploadingCls);
        me.$errorContainer.addClass('is--hidden');

        me.toggleUploadingMessage(true);

        $.publish('plugin/swagCustomProductsUpload/onUploadFiles/beforeUpload', [ me, formData, name ]);

        $.ajax({
            url: optionManager.generateProtocolRelativeUrl(me.opts.uploadURL),
            type: 'post',
            data: formData,
            dataType: 'json',
            cache: false,
            contentType: false,
            processData: false,
            complete: function() {
                me.toggleUploadButton();
                me.toggleUploadingMessage(false);
                me.$uploadBtn.removeClass(me.opts.uploadingCls);
                me.$el.removeClass(me.opts.uploadingCls)
                    .removeClass(me.opts.successCls)
                    .removeClass(me.opts.failureCls);

                $.publish('plugin/swagCustomProductsUpload/onUploadFiles/afterUpload/complete', [ me, formData, name ]);
            },
            success: function(response) {
                if (!response.success) {
                    me.$errorContainer.find('.alert-content').html(response.message);
                    me.$errorContainer.removeClass('is--hidden');

                    //Set error flags for every invalid file
                    $.each(response.errorFiles, function () {
                        var fileName = this;

                        $.each(me._files, function () {
                            if (this.name == fileName) {
                                this.error = true;
                            }
                        });
                    });

                    me.previewFiles();

                    $.publish('plugin/swagCustomProductsUpload/onUploadFiles/afterUpload/success/onFail', [ me, formData, name ]);

                    return;
                }

                $.each(me._files, function () {
                    var file = this;
                    file._uploaded = true;
                });

                jsonFiles = me.addFilesToDataInputJson(response.files);
                me.$uploadInput.data('data-uploadResponse', jsonFiles);

                optionManager.setHashToHistory(response.hash);

                //Fire form change event
                form.change();

                //Trigger the wizard change event
                if ($(me.opts.wizardWrapperSelector)) {
                    $(me.opts.wizardWrapperSelector).trigger('change');
                }

                $.publish('plugin/swagCustomProductsUpload/onUploadFiles/afterUpload/success/onSuccess', [ me, formData, name, me._files ]);
                me.previewFiles();
            },
            error: function(response) {
                if (response.message) {
                    me.$errorContainer.find('.alert-content').html(response.message);
                }
                me.$errorContainer.removeClass('is--hidden');

                $.publish('plugin/swagCustomProductsUpload/onUploadFiles/afterUpload/error', [ me, formData, name, me._files ]);
            }
        });
    },

    reset: function(val) {
        var me = this;

        $.publish('plugin/swagCustomProductsUpload/reset', [ me ]);

        if (!val) {
            me._files = new Array(0);
            me.$uploadInput.data('data-uploadResponse', '');
        } else {
            me.addUploadedFiles(JSON.parse(val));
        }

        if (me.$parent.hasClass('custom-product-option-wrapper-wizard')) {
            me.$parent.trigger('change');
        }

        me.previewFiles();
    }
});
