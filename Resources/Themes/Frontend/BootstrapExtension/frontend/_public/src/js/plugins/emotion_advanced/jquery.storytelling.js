;(function ($, window, document, StateManager, undefined) {
    'use strict';

      // private vars
      var $window = $(window),
          $document = $(document),
          $html = $('html'),
          $body = $('body'),
          transitionProperty = StateManager.getVendorProperty('transition', true),
          transformProperty = StateManager.getVendorProperty('transform', true),
          mouseWheelEvent = (/Firefox/i.test(navigator.userAgent)) ? 'MozMousePixelScroll' : 'mousewheel';

      // helper    
      function clamp(value, min, max) {
          return Math.max(min, Math.min(max, value));
      }
      function matrixToArray(transformationString) {
          return transformationString.match(/(-?[0-9\.]+)/g); // eslint-disable-line
      }
      function delay(callback, delay) {
          var me = this,
              time = delay || 1;

          window.setTimeout($.proxy(callback, me), time);
      }    

      $.overridePlugin('swStoryTelling', {

            defaults: {
                  rowsPerSection: 4,
                  pageWrapSelector: '.page-wrap',
                  elementSelector: '.emotion-element',
                  sectionNavLinkSelector: '.section-nav-link',
                  horizontalSliderSelector: '[data-orientation="horizontal"], .slick',
                  verticalSliderSelector: '[data-orientation="vertical"], [data-view="main"]',
                  storyTellingCls: 'is-storytelling',
                  hardwareAccelerationCls: 'is-hardware-accelerated',
                  prevLinkCls: 'section-nav-link link--prev',
                  nextLinkCls: 'section-nav-link link--next',
                  startLinkCls: 'section-nav-link link--start',
                  sectionLinkCls: 'section-nav-link link--section',
                  iconPrev: '<i class="fa fa-angle-up"></i>',
                  iconNext: '<i class="fa fa-angle-down"></i>',
                  iconStart: '<i class="fa fa-home"></i>',
                  iconSection: '<i class="fa fa-circle-o"></i>',
                  urlHashPrefix: '#emotion-',
                  swipeTolerance: 10,
                  animationSpeed: 800,
                  transition: 'all 0.8s cubic-bezier(0.19, 1, 0.22, 1)'
            },

            init: function () {                                               
                  var me = this,
                      opts = me.opts;

                  me.applyDataAttributes();

                  me.$pageWrap = $(opts.pageWrapSelector);

                  me.$elements = me.$el.find(opts.elementSelector);

                  me.$bannerElements = me.$el.find('[data-coverImage="true"]');
                  me.$videoElements = me.$el.find('.emotion-video');

                  me.$header = $('.header-main, .navigation-main');
                  me.$footer = $('.footer-main');
                  me.$advancedMenu = $('.advanced-menu');

                  me.bufferedCall = false;
                  me.isAnimating = false;
                  me.isOffCanvas = false;
                  me.isQuickView = false;
                  me.isAdvancedMenu = false;
                  me.touchMove = false;
                  me.activeIndex = 0;
                  me.scrollTop = 0;
                  me.clientY = 0;

                  me.initStorytelling();
                  me.checkUrlHash();
                  me.registerEvents();

                  $.publish('plugin/swStoryTelling/onInit', [me]);
            },

            initStorytelling: function () {
                  var me = this;

                  /**
                   * Reset the normal window scroll position to null.
                   */
                  me.resetWindowScroll();

                  /**
                   * Getting the viewport height from window object for correct height in iOS browsers.
                   */
                  me.viewportHeight = window.innerHeight;

                  /**
                   * Setting the html and body height manually for iOS browsers.
                   */
                  $html.height(me.viewportHeight);
                  $body.height(me.viewportHeight);

                  /**
                   * Add necessary classes for storytelling
                   */
                  $html.addClass(me.opts.storyTellingCls); 
                  $body.addClass(me.opts.storyTellingCls)
                      .addClass(me.opts.hardwareAccelerationCls);

                  /**
                  * Set the necessary style on the pageWrap element.
                  */
                  me.$pageWrap.css(transformProperty, 'translateY(0)');
                  me.$pageWrap.css(transitionProperty, me.opts.transition);

                  me.trackElements();

                  me.scrollTop = me.getScrollTop();

                  me.offsetTop = me.$el.offset().top + me.scrollTop;
                  me.offsetBottom = me.$pageWrap.height() - me.viewportHeight;

                  me.createNavigation();

                  me.$bannerElements.trigger('emotionResize');
                  me.$videoElements.trigger('emotionResize');

                  window.picturefill();

                  $.publish('plugin/swStoryTelling/onInitStorytelling', [me]);
            },

            // chrome fix: call addEventListener on window instead of document
            // document is only working in shopware theme, reason unknown
            registerEvents: function () {
                var me = this;

                $body.on(me.getEventName('click'), me.opts.sectionNavLinkSelector, $.proxy(me.onLinkClick, me));

                me._on(me.$pageWrap, 'touchstart', $.proxy(me.onTouchStart, me));
                me._on(me.$pageWrap, 'touchmove', $.proxy(me.onTouchMove, me));
                me._on(me.$pageWrap, 'touchend', $.proxy(me.onTouchEnd, me));

                me._on($document, 'keydown', $.proxy(me.onKeyPress, me));
                me._on($document, 'mousedown', $.proxy(me.onMouseDown, me));

                me._on($window, 'resize', $.proxy(me.buffer, me, me.update, 800));

                if (window.addEventListener) {
                    me.mouseWheelListener = $.proxy(me.onMouseWheel, me);
                    window.addEventListener(mouseWheelEvent, me.mouseWheelListener);
                }

                $.subscribe(me.getEventName('plugin/swAdvancedMenu/onOpenMenu'), $.proxy(me.onOpenAdvancedMenu, me));
                $.subscribe(me.getEventName('plugin/swAdvancedMenu/onCloseMenu'), $.proxy(me.onCloseAdvancedMenu, me));
                $.subscribe(me.getEventName('plugin/swAdvancedMenu/onCloseWithButton'), $.proxy(me.onCloseAdvancedMenu, me));

                $.subscribe(me.getEventName('plugin/swOffcanvasMenu/onBeforeOpenMenu'), $.proxy(me.onOpenOffCanvas, me));
                $.subscribe(me.getEventName('plugin/swOffcanvasMenu/onCloseMenu'), $.proxy(me.onCloseOffCanvas, me));

                $.subscribe(me.getEventName('plugin/swQuickview/onShowQuickView'), $.proxy(me.onOpenQuickView, me));
                $.subscribe(me.getEventName('plugin/swQuickview/onHideQuickView'), $.proxy(me.onCloseQuickView, me));

                $.subscribe(me.getEventName('plugin/swCollapsePanel/onOpen'), $.proxy(me.onFooterPanel, me));
                $.subscribe(me.getEventName('plugin/swCollapsePanel/onClose'), $.proxy(me.onFooterPanel, me));

                $.publish('plugin/swStoryTelling/onRegisterEvents', [me]);
            },

            onOpenOffCanvas: function (event, offCanvas) {
                  var me = this;

                  me.isOffCanvas = true;

                  $body.removeClass(me.opts.hardwareAccelerationCls);
                  me.$pageWrap.removeAttr('style').css('height', me.viewportHeight);
            },

            onTouchMove: function (event) {
                  var me = this;

                  if (me.isOffCanvas) {
                      return;
                  }

                  if (me.isQuickView) {
                      event.preventDefault();
                      return;
                  }

                  var $target = $(event.target),
                      clientY = event.targetTouches[0].clientY,
                      clientX = event.targetTouches[0].clientX,
                      deltaY = me.clientY - clientY,
                      deltaX = me.clientX - clientX,
                      newScrollTop = clamp(me.scrollTop + deltaY, 0, me.offsetBottom);

                  if (me.touchMove === false) {
                      me.touchMove = (Math.abs(deltaX) > Math.abs(deltaY) && !me.touchMove) ? 'X' : 'Y';
                  }

                  if ($target.hasParent(me.opts.horizontalSliderSelector) && me.touchMove !== 'Y') {
                      return;
                  }

                  if ($target.hasParent(me.opts.verticalSliderSelector) && me.touchMove !== 'X') {
                      return;
                  }

                  // HTML element with scrollbars handling
                  if ($target.parents('.html-content').height() != null || $target[0].className === 'html-content') {
                      var scrollMax = $target.parents('.emotion-html')[0].scrollHeight;
                      var scrollBottomOffset = $target.parents('.emotion-html').scrollTop() + $target.parents('.emotion-html').height();

                      // Scroll shopping world if reached bottom of the html element
                      if (scrollBottomOffset === scrollMax && deltaY > 0) {
                          event.preventDefault();
                          if (me.touchMove === 'Y') {
                              me.transform(me.$pageWrap, 'translateY(' + -newScrollTop + 'px)');
                          }
                      } else if (scrollBottomOffset === scrollMax && deltaY < 0) {
                          return;
                          // (NEXT else if) Scroll shopping world if reached top of the html element
                      } else if (scrollBottomOffset === $target.parents('.emotion-html').height() && deltaY < 0) {
                          if (me.touchMove === 'Y') {
                              me.transform(me.$pageWrap, 'translateY(' + -newScrollTop + 'px)');
                          }
                      } else {
                          return;
                      }
                  }

                  event.preventDefault();

                  if (me.touchMove === 'Y') {
                      me.transform(me.$pageWrap, 'translateY(' + -newScrollTop + 'px)');
                  }
            },

            scroll: function (position, noAnimation) {
                  var me = this,
                  scroll = position || 0,
                  scrollTop = me.getScrollTop(),
                  $offcanvasToggle = $('#navToggle');
                  
                  me.superclass.scroll.apply(this, arguments);

                  // hide or show offcanvasToggle
                  if (scroll === scrollTop) {
                      return;
                  } else if (scrollTop == 0) {
                      $offcanvasToggle.addClass('d-none');
                  } else if (scroll == 0) {
                      $offcanvasToggle.removeClass('d-none');
                  }
            },

            createNavigation: function () {
                  var me = this,
                      i = 1;

                  if (me.$sectionNav) {
                      me.$sectionNav.remove();
                  }

                  me.$sectionNav = $('<div>', {
                      'class': 'emotion-section-nav'
                  });

                  $('<a>', {
                      'href': '#prev',
                      'class': me.opts.prevLinkCls,
                      'html': me.opts.iconPrev
                  }).appendTo(me.$sectionNav);

                  $('<a>', {
                      'href': '#start',
                      'class': me.opts.startLinkCls,
                      'html': me.opts.iconStart
                  }).appendTo(me.$sectionNav);

                  for (i; i <= me.sections; i++) {
                      $('<a>', {
                          'href': '#section--' + i,
                          'class': me.opts.sectionLinkCls + ' link--' + i,
                          'html': me.opts.iconSection
                      }).appendTo(me.$sectionNav);
                  }

                  $('<a>', {
                      'href': '#next',
                      'class': me.opts.nextLinkCls,
                      'html': me.opts.iconNext
                  }).appendTo(me.$sectionNav);

                  me.$sectionNav.appendTo($body);
                  me.$navLinks = $(me.opts.sectionNavLinkSelector);

                  $.publish('plugin/swStoryTelling/onCreateNavigation', [me]);
            }
      });
})(jQuery, window, document, StateManager);
