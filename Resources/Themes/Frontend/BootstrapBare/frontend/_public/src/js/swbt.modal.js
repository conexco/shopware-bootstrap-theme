;(function ($) {
    "use strict";

    var $body = $('body');

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

            $.publish('plugin/imgModal/onInit', [ me ]);
        },

        registerEvents: function () {
            var me = this;

            me._on(me.$el, 'click', $.proxy(me.openModal, me));

            $.publish('plugin/imgModal/onRegisterEvents', [ me ]);
        },

        setSliderAttributes: function($slider) {
            var opts = $slider.attr('data-modal-gallery-opts');

            if (opts) {
                $.each($.parseJSON(opts), function(key, value) {
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
                $.publish('plugin/imgModal/beforeOpenModal', [ me ]);

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
                            $body.createModal($gallery[0].outerHTML + $thumbs[0].outerHTML, me.opts['modal-size'], me.opts.imgModalGallerySelector + ' fade', me.opts.title, false, function(modal){
                                picturefill();
                                $(modal).find('.slick').slickWrapper();
                                $body.loader('hide');
                            });
                        } else {
                            $body.loader('hide');
                        }

                        $.publish('plugin/imgModal/afterOpenModal', [ me ]);
                    }
                });
            }

            $.publish('plugin/imgModal/onOpenModal', [ me ]);
        }
    });

    $.plugin('ajaxModal', {

        defaults: {
            customModalClass: 'custom-page-modal',
            'modal-class': '',
            modalWrapperClassSelector :'.modal-dialog',
            modalSelector: 'modal',
            href: false,
            'modal-size': 'modal-md' // modal-sm | modal-md | modal-lg | modal-full
        },

        init: function () {
            var me = this;

            me.applyDataAttributes();
            me.registerEvents();

            $.publish('plugin/ajaxModal/onInit', [ me ]);
        },

        registerEvents: function () {
            var me = this;

            me._on(me.$el, 'click', $.proxy(me.openModal, me));

            $.publish('plugin/ajaxModal/onRegisterEvents', [ me ]);
        },

        openModal: function (event) {
            event.preventDefault();
            var me = this,
                link = me.opts.href || me.$el.attr("href");

            if (!link) {
                return;
            }

            $body.loader('show');
            $.publish('plugin/ajaxModal/beforeOpenModal', [ me ]);

            $.ajax(safeUrl(link), {
                data: {
                    isXHR: 1
                },
                success: function (data) {

                    me.modalData = data;

                    $.publish('plugin/ajaxModal/beforeCreateModal', [ me ]);

                    $body.showModal(me.modalData, me.opts.customModalClass + ' ' + me.opts['modal-class'], function(modal){
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

                        $.publish('plugin/ajaxModal/afterCreateModal', [ me ]);
                    });

                    $.publish('plugin/ajaxModal/afterOpenModal', [ me ]);
                }
            });

            $.publish('plugin/ajaxModal/onOpenModal', [ me ]);
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

            $.publish('plugin/notifyModal/onInit', [ me ]);
        },

        registerEvents: function () {
            var me = this;

            me._on(me.$el, 'click', $.proxy(me.openModal, me));

            // reset notify modal content
            $(me.opts.notifyModalClassSelector).on('show.bs.modal', function () {
                $(me.opts.notifyModalFormSelector).removeClass('hidden');
                $(me.opts.notifyModalSelector).html('');
            });

            $.publish('plugin/notifyModal/onRegisterEvents', [ me ]);
        },

        openModal: function (event) {
            event.preventDefault();
            var me = this,
                $form = me.$el.closest('form');

            me.$el.loader('show');
            $.publish('plugin/notifyModal/beforeOpenModal', [ me ]);

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
            }).done(function(response) {
                var $alertContainer = $(me.opts.notifyModalSelector);

                $alertContainer.html($(response).find(me.opts.articleNotificationSelector).html());

                if ($alertContainer.find(me.opts.modalAlertSelector).length > 0) {
                    me.$el.parents(me.opts.notifyModalIdSelector).find('form').addClass('hidden');
                }

                me.$el.loader('hide');

                $.publish('plugin/notifyModal/afterOpenModal', [ me ]);
            });

            $.publish('plugin/notifyModal/onOpenModal', [ me ]);
        }
    });
}(jQuery));

// creates a new modal out of an existing html structure (e.g. the result of an ajax request)
$.fn.showModal = function(content, selector, callback, options) {
    var id = Math.floor(Math.random()*1000)+1,
        selector = selector || 'default',
        callback = callback || function(){},
        options = options || {},
        mergedOptions = $.extend({show:true}, options),
        modal = '<div id="modal' + id + '" class="' + selector + ' modal">' + content + '</div>';

    $(this).append(modal);
    var $modal = $('#modal'+id);

    $modal.on('shown.bs.modal',function (){
        callback(this);
    });
    $modal.on('hidden.bs.modal',function (){
        $modal.remove();
    });
    $modal.modal(mergedOptions);

    return $modal;
};

// creates a new modal on the fly (the delivered content is wrapped in the standard bootstrap modal html structure)
$.fn.createModal = function(body, size, selector, header, footer, callback){
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
    };

    var id = Math.floor(Math.random()*1000)+1,
        callback = callback || function(){},
        modal = '<div id="modal'+id+'" class="'+selector+' modal">'+modalTemplate.start;

    if (header)
        modal = modal + modalTemplate.headerstart + header + modalTemplate.headerend;
    if (body)
        modal = modal + modalTemplate.bodystart + body + modalTemplate.bodyend;
    if (footer)
        modal = modal + modalTemplate.footerstart + footer + modalTemplate.footerend;
    if (!header&&!body&&!footer)
        modal = modal + modalTemplate.headerstart + modalTemplate.error + modalTemplate.headerend;

    modal = modal + modalTemplate.end + '</div>';
    $(this).append(modal);
    var $modal = $('#modal'+id);

    if (size) {
        $modal.find('.modal-dialog').addClass(size);

        // add modal size classes
        if (size == 'modal-full') {
            $modal.addClass('fullscreen');
        }
    }

    $modal.on('shown.bs.modal',function (){
        callback(this);
    });
    $modal.on('hidden.bs.modal',function (){
        $modal.remove();
    });
    $modal.modal('show');

    return $modal;
};

// escape close
$(document).on('keydown',function(e){
    if(e.keyCode === 27) $("[id^=modal]").modal('hide');
});

// create shopware modal fallback to prevent js errors in shopware plugins
;(function($, window) {
    'use strict';

    $.modal = {
        open: function(content) {
            $('body').showModal(
                content,
                false,
                function() {
                    $('body').loader('hide');
                }
            );
        }
    };

    $.plugin('swModalbox', {
        init: function () {}
    });

})(jQuery, window);
