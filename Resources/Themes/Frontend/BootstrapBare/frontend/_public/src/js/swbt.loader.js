// $('element').loader('my-loader-class');
// <div data-loader="my-loader-class" data-icon="fa fa-circle-o-notch"></div>
$.fn.loader = function (action, classname, insertBefore) {

    $.publish('plugin/swfLoader/onInit', [ this ]);

    var loader = $(this),
        loaderIcon = loader.data('icon') ? loader.data('icon') : 'fa fa-spinner fa-pulse fa-lg text-primary',
        addclass = (loader.data('loader')) ? loader.data('loader') : (classname) ? classname : '',
        fullscreen = false,
        speed = 75,
        replacement = $('[data-loader-replace]').html();

    if (loader[0] && loader[0].tagName === 'BODY') {
        fullscreen = true;
        speed = 200;
    }

    if (action == 'show' && loader.find('.loader-icon').length <= 0) {

        $.publish('plugin/swfLoader/beforeShow', [ loader ]);

        // insert before
        if (insertBefore) {
            // return if loader is already present
            if (loader.siblings('.temp-loader-wrapper').length > 0) {
                return;
            }
            loader.before('<div class="temp-loader-wrapper"></div>');
            loader = loader.siblings('.temp-loader-wrapper');
        }
        var content = loader.html(),
            btnLoader = false;

        if (!fullscreen && content) {

            if (loader.is('button') || loader.is('a')) {
                btnLoader = true;

                $.publish('plugin/swfLoader/onSetButtonLoader', [ loader ]);
            }

            // btn-loader on link needs parent with text-align: center
            if (loader.is('a')) {
                loader.css({'display': 'block', 'textAlign': 'center'});
            }

            contentWidth = loader.outerWidth();
            loader.data('content', loader.html());
        }
        $('<div>', {'class': 'loader'}).appendTo(loader);

        if (fullscreen) {
            $.overlay.open({closeOnClick: false});
            $('.loader').addClass('is-fullscreen');
        }

        if (btnLoader) {
            loader.css('width', contentWidth);
        } else {
            loader = $('.loader');
        }

        if (!replacement || btnLoader || insertBefore) {
            loader.html($('<i/>').addClass(loaderIcon + ' loader-icon ' + addclass).hide()).find('i.loader-icon').stop(true, true).fadeIn(speed);
        } else {
            loader.html(replacement).stop(true, true).fadeIn(speed);
        }

        $.publish('plugin/swfLoader/afterShow', [ loader ]);

    } else if (action == 'hide') {

        $.publish('plugin/swfLoader/beforeHide', [ loader ]);

        // inserted before
        if (loader.siblings('.temp-loader-wrapper').length > 0) {
            loader = loader.siblings('.temp-loader-wrapper');
        }
        if (fullscreen) {
            $.overlay.close();
            $('.loader').remove();
        } else {
            loader.find('i.loader-icon').stop(!0, !0).fadeOut(speed, function () {
                var $temploader = $(this).parents('.temp-loader-wrapper');
                if ($temploader.length > 0) {
                    $temploader.remove();
                } else {
                    $(this).remove();
                    loader.html(loader.data('content'));
                    // reset inline style width of button loader
                    if (loader.is('button') || loader.is('a')) {
                        if (loader.hasClass('btn-block')) {
                            loader.css('width', '100%');
                        } else {
                            loader.css('width', 'auto');
                        }
                    }
                }

                $.publish('plugin/swfLoader/afterFadeOut', [ loader ]);
            });
        }

        $.publish('plugin/swfLoader/afterHide', [ loader ]);
    }
};

// create shopware loader fallback to prevent js errors in shopware plugins
;(function($, window) {
    'use strict';

    $.loadingIndicator = {
        defaults: {},
        open: function() {
            $('body').loader('show');
        },
        close: function() {
            $('body').loader('hide');
        }
    };


})(jQuery, window);
