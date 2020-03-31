; (function ($) {
    "use strict";

    var $body = $('body');

    // create shopware modal fallback to prevent js errors in shopware plugins
    $.modal = {
        /**
         * The complete template wrapped in jQuery.
         *
         * @private
         * @property _$modalBox
         * @type {jQuery}
         */
        _$modalBox: null,

        /**
         * Container for the title wrapped in jQuery.
         *
         * @private
         * @property _$header
         * @type {jQuery}
         */
        _$header: null,

        /**
         * The title element wrapped in jQuery.
         *
         * @private
         * @property _$title
         * @type {jQuery}
         */
        _$title: null,

        /**
         * The content element wrapped in jQuery.
         *
         * @private
         * @property _$content
         * @type {jQuery}
         */
        _$content: null,

        /**
         * The close button wrapped in jQuery.
         *
         * @private
         * @property _$closeButton
         * @type {jQuery}
         */
        _$closeButton: null,

        /**
         * Default options of a opening session.
         *
         * @public
         * @property defaults
         * @type {jQuery}
         */
        defaults: {
            /**
             * The mode in which the lightbox should be showing.
             *
             * 'local':
             *
             * The given content is either text or HTML.
             *
             * 'ajax':
             *
             * The given content is the URL from what it should load the HTML.
             *
             * 'iframe':
             *
             * The given content is the source URL of the iframe.
             *
             * @type {String}
             */
            mode: 'local',

            /**
             * Sizing mode of the modal box.
             *
             * 'auto':
             *
             * Will set the given width as max-width so the container can shrink.
             * Fullscreen mode on small mobile devices.
             *
             * 'fixed':
             *
             * Will use the width and height as static sizes and will not change to fullscreen mode.
             *
             * 'content':
             *
             * Will use the height of its content instead of a given height.
             * The 'height' option will be ignored when set.
             *
             * 'full':
             *
             * Will set the modalbox to fullscreen.
             *
             * @type {String}
             */
            sizing: 'modal-lg',

            /**
             * The width of the modal box window.
             * NOT used for bsmodal!
             *
             * @type {Number}
             */
            width: false,

            /**
             * The height of the modal box window.
             * NOT used for bsmodal!
             *
             * @type {Number}
             */
            height: false,

            /**
             * The max height if sizing is set to `content`.
             * NOT used for bsmodal!
             *
             * @type {Number}
             */
            maxHeight: false,

            /**
             * Whether or not the overlay should be shown.
             * NOT used for bsmodal! It always has an overlay!
             *
             * @type {Boolean}
             */
            overlay: true,

            /**
             * Whether or not the modal box should be closed when the user clicks on the overlay.
             * NOT used for bsmodal!
             *
             * @type {Boolean}
             */
            closeOnOverlay: true,

            /**
             * Whether or not the closing button should be shown.
             * Not used for bsmodal!
             *
             * @type {Boolean}
             */
            showCloseButton: true,

            /**
             * Speed for every CSS transition animation.
             * NOT used for bsmodal!
             *
             * @type {Number}
             */
            animationSpeed: 500,

            /**
             * The window title of the modal box.
             * If empty, the header will be hidden.
             *
             * @type {String}
             */
            title: '',

            /**
             * Will be overridden by the current URL when the mode is 'ajax' or 'iframe'.
             * Can be accessed by the options object.
             * NOT used for bsmodal!
             *
             * @type {String}
             */
            src: '',

            /**
             * Array of key codes the modal box can be closed.
             *
             * @type {Array}
             */
            closeKeys: [27],

            /**
             * Whether or not it is possible to close the modal box by the keyboard.
             *
             * @type {Boolean}
             */
            keyboardClosing: true,

            /**
             * Function which will be called when the modal box is closing.
             *
             * @type {Function}
             */
            onClose: function () {},

            /**
             * Whether or not the picturefill function will be called when setting content.
             * NOT used for bsmodal!
             *
             * @type {Boolean}
             */
            updateImages: false,

            /**
             * Class that will be added to the modalbox.
             *
             * @type {String}
             */
            additionalClass: '',
            footer: null,
            id: null,
        },

        /**
         * The current merged options of the last .open() call.
         *
         * @public
         * @property options
         * @type {Object}
         */
        options: {},

        /**
         * Opens the modal box.
         * Sets the given content and applies the given options to the current session.
         * If given, the overlay options will be passed in its .open() call.
         *
         * @public
         * @method open
         * @param {String|jQuery|HTMLElement} content
         * @param {Object} options
         */
        open: function (content, options) {
            var me = this,
                $modalBox = me._$modalBox,
                opts;

            me.options = opts = $.extend({}, me.defaults, options);

            // Bootstrap Modal start:
            $('body').createModal(content, opts.sizing, opts.additionalClass + ' fade', opts.title, opts.footer, function(){}, opts);
            // Bootstrap Modal end:

            $.publish('plugin/swModal/onOpen', [ me ]);
            return me;
        },

        /**
         * Closes the modal box and the overlay if its enabled.
         * if the fading is completed, the content will be removed.
         *
         * @public
         * @method close
         */
        close: function () {
            var me = this,
                opts = me.options,
                $modalBox = me._$modalBox;

            // TODO: Expected to work, but undefined:
            // me.$el.modal('hide');
            // Workaround:
            $(".modal").modal('hide');

            $.publish('plugin/swModal/onClose', [ me ]);

            return me;
        },

        /**
         * Sets the transition of the modal box.
         *
         * @public
         * @method setTransition
         * @param {Object} css
         * @param {Number} duration
         * @param {String} animation
         * @param {Function} callback
         */
        setTransition: function (css, duration, animation, callback) {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:

            var me = this,
                // $modalBox = me._$modalBox,
                opts = $.extend({
                    animation: 'ease',
                    duration: me.options.animationSpeed
                }, {
                    animation: animation,
                    duration: duration
                });

            // if (!$.support.transition) {
            //     $modalBox.stop(true).animate(css, opts.duration, opts.animation, callback);
            //     return;
            // }

            // $modalBox.stop(true).transition(css, opts.duration, opts.animation, callback);

            $.publish('plugin/swModal/onSetTransition', [ me, css, opts ]);
        },

        /**
         * Sets the title of the modal box.
         *
         * @public
         * @method setTitle
         * @param {String} title
         */
        setTitle: function (title) {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:
            var me = this;

            // me._$title.html(title);

            $.publish('plugin/swModal/onSetTitle', [ me, title ]);
        },

        /**
         * Sets the content of the modal box.
         *
         * @public
         * @method setContent
         * @param {String|jQuery|HTMLElement} content
         */
        setContent: function (content) {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:

            var me = this,
                opts = me.options;

            // me._$content.html(content);

            // if (opts.sizing === 'content') {
            //     // initial centering
            //     me.center();

            //     // centering again to fix some styling/positioning issues
            //     window.setTimeout(me.center.bind(me), 25);
            // }

            // if (opts.updateImages) {
            //     picturefill();
            // }

            $.publish('plugin/swModal/onSetContent', [ me ]);
        },

        /**
         * Sets the width of the modal box.
         * If a string was passed containing a only number, it will be parsed as a pixel value.
         *
         * @public
         * @method setWidth
         * @param {Number|String} width
         */
        setWidth: function (width) {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:
            var me = this;

            // me._$modalBox.css('width', (typeof width === 'string' && !(/^\d+$/.test(width))) ? width : parseInt(width, 10));

            $.publish('plugin/swModal/onSetWidth', [ me ]);
        },

        /**
         * Sets the height of the modal box.
         * If a string was passed containing a only number, it will be parsed as a pixel value.
         *
         * @public
         * @method setHeight
         * @param {Number|String} height
         */
        setHeight: function (height) {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:
            var me = this,
                hasTitle = me._$title.text().length > 0,
                headerHeight;

            // height = (typeof height === 'string' && !(/^\d+$/.test(height))) ? height : window.parseInt(height, 10);

            // if (hasTitle) {
            //     headerHeight = window.parseInt(me._$header.css('height'), 10);
            //     me._$content.css('height', (height - headerHeight));
            // } else {
            //     me._$content.css('height', '100%');
            // }

            // me._$modalBox.css('height', height);
            $.publish('plugin/swModal/onSetHeight', [ me ]);
        },

        /**
         * Sets the max height of the modal box if the provided value is not empty or greater than 0.
         * If a string was passed containing a only number, it will be parsed as a pixel value.
         *
         * @public
         * @method setMaxHeight
         * @param {Number|String} height
         */
        setMaxHeight: function (height) {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:
            var me = this;

            // if (!height) {
            //     return;
            // }

            // height = (typeof height === 'string' && !(/^\d+$/.test(height))) ? height : window.parseInt(height, 10);

            // me._$modalBox.css('max-height', height);
            $.publish('plugin/swModal/onSetMaxHeight', [ me ]);
        },

        /**
         * Creates the modal box and all its elements.
         * Appends it to the body.
         *
         * @public
         * @method initModalBox
         */
        initModalBox: function () {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:
            var me = this;

            // me._$modalBox = $('<div>', {
            //     'class': 'js--modal'
            // });

            // me._$header = $('<div>', {
            //     'class': 'header'
            // }).appendTo(me._$modalBox);

            // me._$title = $('<div>', {
            //     'class': 'title'
            // }).appendTo(me._$header);

            // me._$content = $('<div>', {
            //     'class': 'content'
            // }).appendTo(me._$modalBox);

            // me._$closeButton = $('<div>', {
            //     'class': 'btn icon--cross is--small btn--grey modal--close'
            // }).appendTo(me._$modalBox);

            // $('body').append(me._$modalBox);

            $.publish('plugin/swModal/onInit', [ me ]);
        },

        /**
         * Registers all needed event listeners.
         *
         * @public
         * @method registerEvents
         */
        registerEvents: function () {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:
            var me = this,
                $window = $(window);

            // me._$closeButton.on('click.modal touchstart.modal', $.proxy(me.close, me));

            // $window.on('keydown.modal', $.proxy(me.onKeyDown, me));
            // StateManager.on('resize', me.onWindowResize, me);

            // StateManager.registerListener({
            //     state: 'xs',
            //     enter: function() {
            //         me._$modalBox.addClass('is--fullscreen');
            //     },
            //     exit: function () {
            //         me._$modalBox.removeClass('is--fullscreen');
            //     }
            // });

            $.publish('plugin/swModal/onRegisterEvents', [ me ]);
        },

        /**
         * Called when a key was pressed.
         * Closes the modal box when the keyCode is mapped to a close key.
         *
         * @public
         * @method onKeyDown
         */
        onKeyDown: function (event) {

            var me = this,
                keyCode = event.which,
                keys = me.options.closeKeys,
                len = keys.length,
                i = 0;

            if (!me.options.keyboardClosing) {
                return;
            }

            for (; i < len; i++) {
                if (keys[i] === keyCode) {
                    me.close();
                }
            }

            $.publish('plugin/swModal/onKeyDown', [ me, event, keyCode ]);
        },

        /**
         * Called when the window was resized.
         * Centers the modal box when the sizing is set to 'content'.
         *
         * @public
         * @method onWindowResize
         */
        onWindowResize: function (event) {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:
            var me = this;

            // if (me.options.sizing === 'content') {
            //     me.center();
            // }

            $.publish('plugin/swModal/onWindowResize', [ me, event ]);
        },

        /**
         * Sets the top position of the modal box to center it to the screen
         *
         * @public
         * @method centerModalBox
         */
        center: function () {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:
            var me = this,
                $modalBox = me._$modalBox,
                windowHeight = window.innerHeight || $(window).height();

            // $modalBox.css('top', (windowHeight - $modalBox.height()) / 2);

            $.publish('plugin/swModal/onCenter', [ me ]);
        },

        /**
         * Called when the overlay was clicked.
         * Closes the modalbox when the 'closeOnOverlay' option is active.
         *
         * @public
         * @method onOverlayClose
         */
        onOverlayClose: function () {
            var me = this;

            if (!me.options.closeOnOverlay) {
                return;
            }

            me.close();

            $.publish('plugin/swModal/onOverlayClick', [ me ]);
        },

        /**
         * Removes the current modalbox element from the DOM and destroys its items.
         * Also clears the options.
         *
         * @public
         * @method destroy
         */
        destroy: function () {
            // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
            // Original Responsive Theme Code:
            var me = this,
                p;

            // me._$modalBox.remove();

            // me._$modalBox = null;
            // me._$header = null;
            // me._$title = null;
            // me._$content = null;
            // me._$closeButton = null;

            // for (p in me.options) {
            //     if (!me.options.hasOwnProperty(p)) {
            //         continue;
            //     }
            //     delete me.options[p];
            // }

            // StateManager.off('resize', me.onWindowResize, [ me ]);
        }
    };

    $.plugin('swModalbox', {
        // TODO: NO YET IMPLEMENTED FOR Bootstrap Theme!
        init: function () {
            console.error('This pluigin function is not yet implemented in swbt theme!');
        },
        open: function() {
            console.error('This pluigin function is not yet implemented in swbt theme!');
        },
        close: function() {
            console.error('This pluigin function is not yet implemented in swbt theme!');
        },
    });

    $.plugin('imgModal', {
        defaults: {
            responsiveImgClass: 'img-responsive img-center',
            imgModalSelector: 'img-modal',
            imgModalGallerySelector: 'img-modal-gallery',
            detailGallery: '#gallery',
            detailModalAttr: '-modal',
            detailThumbs: '#thumbs',
            href: false,
            title: '',
            'modal-size': 'modal-lg', // modal-sm | modal-md | modal-lg | modal-full
            'modal-gallery-url': false
        },

        init: function () {
            var me = this;

            me.modalBody = '';
            me.modalSelector = me.opts.imgModalSelector;

            me.applyDataAttributes();
            me.registerEvents();

            $.publish('plugin/imgModal/onInit', [me]);
        },

        registerEvents: function () {
            var me = this;

            me._on(me.$el, 'click', $.proxy(me.openModal, me));

            $.publish('plugin/imgModal/onRegisterEvents', [me]);
        },

        setSliderAttributes: function ($slider) {
            var opts = $slider.attr('data-modal-gallery-opts');

            if (opts) {
                $.each($.parseJSON(opts), function (key, value) {
                    $slider.attr('data-' + key, JSON.stringify(value));
                });
            }
        },

        openModal: function (event) {
            event.preventDefault();
            var me = this,
                imgSrc = me.opts.href || me.$el.attr("href");

            if (!imgSrc) {
                return;
            }

            if (!me.opts['modal-gallery-url']) {
                me.modalBody = '<a href="" data-dismiss="modal"><img src="' + imgSrc + '" class="' + me.opts.responsiveImgClass + '"></a>';
                $('body').createModal(me.modalBody, me.opts['modal-size'], me.opts.imgModalSelector + ' fade', me.opts.title);
            } else {
                $body.loader('show');
                $.publish('plugin/imgModal/beforeOpenModal', [me]);

                $.ajax({
                    url: safeUrl(me.opts['modal-gallery-url']),
                    type: 'GET',
                    dataType: 'html',
                    success: function (result) {
                        var $detail = $(result),
                            $gallery = $detail.find(me.opts.detailGallery),
                            $thumbs = $detail.find(me.opts.detailThumbs);

                        // id's need to be me made unique again
                        $gallery.attr('id', $gallery.attr('id') + me.opts.detailModalAttr);
                        $thumbs.attr('id', $thumbs.attr('id') + me.opts.detailModalAttr);

                        // asnavfor data attribute needs to be updated with the new id's
                        $gallery.attr('data-asnavfor', '#' + $thumbs.attr('id'));
                        $thumbs.attr('data-asnavfor', '#' + $gallery.attr('id'));

                        // remove data-toggle="img-modal"
                        $gallery.find('[data-toggle="img-modal"]').attr('data-toggle', false).attr('href', '#');

                        // set slider options
                        me.setSliderAttributes($thumbs);
                        me.setSliderAttributes($gallery);

                        if ($gallery[0] && $thumbs[0]) {
                            $body.createModal($gallery[0].outerHTML + $thumbs[0].outerHTML, me.opts['modal-size'], me.opts.imgModalGallerySelector + ' fade', me.opts.title, false, function (modal) {
                                picturefill();
                                $(modal).find('.slick').slickWrapper();
                                $body.loader('hide');
                            });
                        } else {
                            $body.loader('hide');
                        }

                        $.publish('plugin/imgModal/afterOpenModal', [me]);
                    }
                });
            }

            $.publish('plugin/imgModal/onOpenModal', [me]);
        }
    });

    $.plugin('ajaxModal', {

        defaults: {
            customModalClass: 'custom-page-modal',
            'modal-class': '',
            modalWrapperClassSelector: '.modal-dialog',
            modalSelector: 'modal',
            href: false,
            'modal-size': 'modal-md' // modal-sm | modal-md | modal-lg | modal-full
        },

        init: function () {
            var me = this;

            me.applyDataAttributes();
            me.registerEvents();

            $.publish('plugin/ajaxModal/onInit', [me]);
        },

        registerEvents: function () {
            var me = this;

            me._on(me.$el, 'click', $.proxy(me.openModal, me));

            $.publish('plugin/ajaxModal/onRegisterEvents', [me]);
        },

        openModal: function (event) {
            event.preventDefault();
            var me = this,
                link = me.opts.href || me.$el.attr("href");

            if (!link) {
                return;
            }

            $body.loader('show');
            $.publish('plugin/ajaxModal/beforeOpenModal', [me]);

            $.ajax(safeUrl(link), {
                data: {
                    isXHR: 1
                },
                success: function (data) {

                    me.modalData = data;

                    $.publish('plugin/ajaxModal/beforeCreateModal', [me]);

                    $body.showModal(me.modalData, me.opts.customModalClass + ' ' + me.opts['modal-class'], function (modal) {
                        $body.loader('hide');

                        var $modal = $(modal);

                        // add modal size classes
                        $modal.find(me.opts.modalWrapperClassSelector).addClass(me.opts['modal-size']);
                        if (me.opts['modal-size'] == 'modal-full') {
                            $modal.addClass('fullscreen');
                        }

                        $modal.swSelectboxReplacement();

                        picturefill();

                        me.$modal = $modal;

                        $.publish('plugin/ajaxModal/afterCreateModal', [me]);
                    });

                    $.publish('plugin/ajaxModal/afterOpenModal', [me]);
                }
            });

            $.publish('plugin/ajaxModal/onOpenModal', [me]);
        }
    });

    $.plugin('notifyModal', {
        defaults: {
            notifyModalSelector: '.notify-modal-alert',
            articleNotificationSelector: '#article_notification',
            modalAlertSelector: '.alert-info, .alert-success',
            notifyModalFormSelector: '.notify-modal-form',
            notifyModalIdSelector: '[id*="notifyModal"]',
            notifyModalClassSelector: '.modal[id^=notifyModal-]'
        },

        init: function () {
            var me = this;

            me.applyDataAttributes();
            me.registerEvents();

            $.publish('plugin/notifyModal/onInit', [me]);
        },

        registerEvents: function () {
            var me = this;

            me._on(me.$el, 'click', $.proxy(me.openModal, me));

            // reset notify modal content
            $(me.opts.notifyModalClassSelector).on('show.bs.modal', function () {
                $(me.opts.notifyModalFormSelector).removeClass('hidden');
                $(me.opts.notifyModalSelector).html('');
            });

            $.publish('plugin/notifyModal/onRegisterEvents', [me]);
        },

        openModal: function (event) {
            event.preventDefault();
            var me = this,
                $form = me.$el.closest('form');

            me.$el.loader('show');
            $.publish('plugin/notifyModal/beforeOpenModal', [me]);

            $.ajax({
                type: 'POST',
                url: safeUrl($form.attr('action')),
                data: $form.serialize(),
                beforeSend: function (xhr) { // change header, complete template needs to be loaded
                    xhr.setRequestHeader('X-Requested-With', {
                        toString: function () {
                            return '';
                        }
                    }
                    );
                }
            }).done(function (response) {
                var $alertContainer = $(me.opts.notifyModalSelector);

                $alertContainer.html($(response).find(me.opts.articleNotificationSelector).html());

                if ($alertContainer.find(me.opts.modalAlertSelector).length > 0) {
                    me.$el.parents(me.opts.notifyModalIdSelector).find('form').addClass('hidden');
                }

                me.$el.loader('hide');

                $.publish('plugin/notifyModal/afterOpenModal', [me]);
            });

            $.publish('plugin/notifyModal/onOpenModal', [me]);
        },
    });


    // creates a new modal out of an existing html structure (e.g. the result of an ajax request)
    $.fn.showModal = function (content, additionalClass, onShownCallback, options) {
        var options = options || {},
            id = options.id || ('modal' + Math.floor(Math.random() * 1000) + 1),
            selector = selector || 'default',
            callback = callback || function () { },
            mergedOptions = $.extend({ show: true }, options),
            modal = '<div id="' + id + '" class="' + additionalClass + ' modal swbt-modal">' + content + '</div>',
            $modal,
            showExisting = false;

        // If content already IS a swbt-modal, don't build it, just show it instead.
        if($(content).is('.modal.swbt-modal')){
            $modal = $(body);
            showExisting = true;
        } else {
            // Append new modal:
            $(this).append(modal);
            $modal = $('#' + id);

            // Ensure removal on close:
            $modal.on('hidden.bs.modal', function () {
                $modal.remove();
            });
        }

        // Register callbacks:
        if(onShownCallback){
            $modal.on('shown.bs.modal', function () {
                 onShownCallback(this);
             });
         }
         if(options.onCloseCallback){
             $modal.on('hide.bs.modal', function () {
                 options.onCloseCallback(this);
             });
         }

        $modal.modal(mergedOptions);

        return $modal;
    };

    // creates a new modal on the fly (the delivered content is wrapped in the standard bootstrap modal html structure)
    $.fn.createModal = function (body, size, additionalClass, header, footer, onShownCallback, options) {
        var modalTemplate = {
                start: '<div class="modal-dialog"><div class="modal-content">',
                headerstart: '<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button><h4 class="modal-title">',
                headerend: '</h4></div>',
                bodystart: '<div class="modal-body">',
                bodyend: '</div>',
                footerstart: '<div class="modal-footer">',
                footerend: '</div>',
                end: '</div></div>',
                error: '<span class="text-danger">Modal konnte nicht geladen werden</span>'
            },
            options = options || {},
            $modal,
            id = options.id || ('modal' + Math.floor(Math.random() * 1000) + 1),
            callback = callback || function () { },
            modal = '<div id="' + id + '" class="' + additionalClass + ' modal swbt-modal">' + modalTemplate.start;

        if (header)
            modal = modal + modalTemplate.headerstart + header + modalTemplate.headerend;
        if (body)
            modal = modal + modalTemplate.bodystart + body + modalTemplate.bodyend;
        if (footer)
            modal = modal + modalTemplate.footerstart + footer + modalTemplate.footerend;
        if (!header && !body && !footer){
            modal = modal + modalTemplate.headerstart + modalTemplate.error + modalTemplate.headerend;
        }
        modal = modal + modalTemplate.end + '</div>';

        // If body already IS a swbt-modal, don't build it, just show it instead.
        if($(body).is('.modal.swbt-modal')){
            $modal = $(body);
            $modal.modal('show');
        } else {
            // Create modal:
            $(this).append(modal);
            $modal = $('#' + id);

            // Ensure removal on close:
            $modal.on('hidden.bs.modal', function () {
                $modal.remove();
            });
        }


        if (size) {
            switch (size) {
                case 'modal-sm':
                    size = 'modal-sm';
                    break;
                case 'modal-md':
                    size = 'modal-md';
                    break;
                case 'modal-lg':
                case 'modal-full':
                // Map SW sizes:
                case 'auto':
                case 'fixed':
                case 'content':
                case 'full':
                    size = 'modal-lg';
                    break;
                default:
                    break;
            }

            $modal.find('.modal-dialog').addClass(size);

            // add modal size classes
            if (size == 'modal-full') {
                $modal.addClass('fullscreen');
            }
        }

        // Register callbacks:
        if(onShownCallback){
           $modal.on('shown.bs.modal', function () {
                onShownCallback(this);
            });
        }
        if(options.onCloseCallback){
            $modal.on('hide.bs.modal', function () {
                options.onCloseCallback(this);
            });
        }

        // Show!
        $modal.modal('show');

        return $modal;
    };

    // escape close
    $(document).on('keydown', function (e) {
        if (e.keyCode === 27) $(".swbt-modal").modal('hide');
    });

}(jQuery));
