$.overridePlugin('swEmotionLoader', {
    defaults: {
        controllerUrl: null,
        availableDevices: null,
        deviceTypes: {
            'xl': '0',
            'l' : '1',
            'm' : '2',
            's' : '3',
            'xs': '4'
        },
        wrapperSelector: '.emotion-wrapper',
        loadingOverlaySelector: '.emotion-overlay',
        //custom
        contentContainerSelector: '.content-container'
    },

    loadEmotion: function(controllerUrl, deviceState) {
        var me = this,
            devices = me.availableDevices,
            types = me.opts.deviceTypes,
            url = controllerUrl || me.opts.controllerUrl,
            state = deviceState || StateManager.getCurrentState();

        me.$contentContainer = $(me.opts.contentContainerSelector);    
        me.$contentContainer.addClass('is-emotion');

        /**
         * Hide the emotion world if it is not defined for the current device.
         */
        if (devices.indexOf(types[state]) === -1) {
            me.hideEmotion();
            return;
        }

        /**
         * Return if the plugin is not configured correctly.
         */
        if (!devices.length || !state.length || !url.length) {
            me.hideEmotion();
            return;
        }

        /**
         * If the emotion world was already loaded show it.
         */
        if (me.$emotion && me.$emotion.length) {
            me.showEmotion();
            return;
        }

        /**
         * Show the loading indicator and load the emotion world.
         */
        me.showEmotion();

        if (me.isLoading) {
            return;
        }

        me.isLoading = true;
        me.$contentContainer.before(me.$overlay);
        me.$overlay.loader('show');

        $.ajax({
            url: url,
            method: 'GET',
            success: function (response) {

                me.isLoading = false;
                me.$overlay.remove();

                me.$contentContainer.addClass('loaded');

                $.publish('plugin/swEmotionLoader/onLoadEmotionLoaded', [ me ]);

                if (!response.length) {
                    me.hideEmotion();
                    return;
                }

                me.initEmotion(response);

                $.publish('plugin/swEmotionLoader/onLoadEmotionFinished', [ me ]);
            }
        });

        $.publish('plugin/swEmotionLoader/onLoadEmotion', [ me ]);
    }
});    

$.overridePlugin('swEmotion', {
    defaults: {
        gridMode: 'resize',
        baseWidth: 1160,
        fullscreen: false,
        columns: 4,
        cellHeight: 185,
        cellSpacing: 10,
        elementSelector: '.emotion-element',
        gridSizerSelector: '.emotion--sizer',
        bannerElSelector: '[data-coverImage="true"]',
        videoElSelector: '.emotion-video'
    },

    init: function() {
        var me = this;

        me.applyDataAttributes();

        me.bufferedCall = false;

        me.$contentMain = $('.content-main');
        me.$container = me.$el.parents('.content-emotions');
        me.$wrapper = me.$el.parents('.emotion-wrapper');

        me.$elements = me.$el.find(me.opts.elementSelector);
        me.$gridSizer = me.$el.find(me.opts.gridSizerSelector);

        me.$bannerElements = me.$elements.find(me.opts.bannerElSelector);
        me.$videoElements = me.$elements.find(me.opts.videoElSelector);

        me.remSpacing = ~~me.opts.cellSpacing / 16;

        me.currentState = window.StateManager.getCurrentState();

        if (me.opts.fullscreen) {
            me.initFullscreen();
        }

        me.initState(me.currentState);
        me.initMode(me.opts.gridMode);

        me.initElements();
        me.registerEvents();
    },

    initElements: function() {
        var me = this;

        if (me.opts.gridMode !== 'rows') {

            $.each(me.$bannerElements, function(index, item) {
                $(item).swEmotionBanner();
            });
        }

        $.each(me.$videoElements, function(index, item) {
            $(item).swEmotionVideo();
        });

        StateManager.updatePlugin('.slick:not(.slick-ready)', 'slickWrapper');
        me.$el.find('[data-equalheight="true"]:not([data-mode="ajax"])').equalHeight();
        StateManager.updatePlugin('*[data-add-article="true"]', 'swAddArticle');

        window.picturefill();

        $.publish('plugin/swEmotion/onInitElements', [ me ]);
    }
});

$.overridePlugin('swEmotionBanner', {
    defaults: {
        width: null,
        height: null,
        containerSelector: '.banner-content'
    }
});

$.overridePlugin('swEmotionVideo', {
    defaults: {
        mode: 'cover',
        scaleOriginX: 0,
        scaleOriginY: 0,
        scale: 1,
        playIconCls: 'fa-play',
        pauseIconCls: 'fa-pause',
        videoSelector: '.video-element',
        coverSelector: '.video-cover',
        playBtnSelector: '.video-play-btn',
        playIconSelector: '.video-play-icon'
    }
});
