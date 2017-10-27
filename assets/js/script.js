/* Canvas animation */

if ($('#canvas').length) {

    var canvas = document.getElementById("canvas"),
        ctx = canvas.getContext("2d"),
        cw = canvas.width = window.innerWidth,
        cx = cw / 2,
        ch = canvas.height = window.innerHeight,
        cy = ch / 2;

    ctx.fillStyle = "#efefef";
    var linesNum = 8;
    var linesRy = [];
    var requestId = null;

    function Line(flag) {
        this.flag = flag;
        this.a = {};
        this.b = {};
        if (flag == "v") {
            this.a.y = 0;
            this.b.y = ch;
            this.a.x = randomIntFromInterval(0, ch);
            this.b.x = randomIntFromInterval(0, ch);
        } else if (flag == "h") {
            this.a.x = 0;
            this.b.x = cw;
            this.a.y = randomIntFromInterval(0, cw);
            this.b.y = randomIntFromInterval(0, cw);
        }
        this.va = randomIntFromInterval(25, 100) / 100;
        this.vb = randomIntFromInterval(25, 100) / 100;

        this.draw = function() {
            ctx.strokeStyle = "#efefef";
            ctx.beginPath();
            ctx.moveTo(this.a.x, this.a.y);
            ctx.lineTo(this.b.x, this.b.y);
            ctx.stroke();
        }

        this.update = function() {
            if (this.flag == "v") {
                this.a.x += this.va;
                this.b.x += this.vb;
            } else if (flag == "h") {
                this.a.y += this.va;
                this.b.y += this.vb;
            }
            this.edges();
        }

        this.edges = function() {
            if (this.flag == "v") {
                if (this.a.x < 0 || this.a.x > cw) {
                    this.va *= -1;
                }
                if (this.b.x < 0 || this.b.x > cw) {
                    this.vb *= -1;
                }
            } else if (this.flag == "h") {
                if (this.a.y < 0 || this.a.y > ch) {
                    this.va *= -1;
                }
                if (this.b.y < 0 || this.b.y > ch) {
                    this.vb *= -1;
                }
            }
        }
    }

    for (var i = 0; i < linesNum; i++) {
        var flag = i % 2 == 0 ? "h" : "v";
        var l = new Line(flag);
        linesRy.push(l);
    }

    function Draw() {
        requestId = window.requestAnimationFrame(Draw);
        ctx.clearRect(0, 0, cw, ch);

        for (var i = 0; i < linesRy.length; i++) {
            var l = linesRy[i];
            l.draw();
            l.update();
        }
        for (var i = 0; i < linesRy.length; i++) {
            var l = linesRy[i];
            for (var j = i + 1; j < linesRy.length; j++) {
                var l1 = linesRy[j]
                Intersect2lines(l, l1);
            }
        }
    }

    function Init() {
        linesRy.length = 0;
        for (var i = 0; i < linesNum; i++) {
            var flag = i % 2 == 0 ? "h" : "v";
            var l = new Line(flag);
            linesRy.push(l);
        }

        if (requestId) {
            window.cancelAnimationFrame(requestId);
            requestId = null;
        }

        cw = canvas.width = window.innerWidth,
        cx = cw / 2;
        ch = canvas.height = window.innerHeight,
        cy = ch / 2;

        Draw();
    };

    setTimeout(function() {
        Init();
        addEventListener('resize', Init, false);
    }, 15);

    function Intersect2lines(l1, l2) {
        var p1 = l1.a,
            p2 = l1.b,
            p3 = l2.a,
            p4 = l2.b;
        var denominator = (p4.y - p3.y) * (p2.x - p1.x) - (p4.x - p3.x) * (p2.y - p1.y);
        var ua = ((p4.x - p3.x) * (p1.y - p3.y) - (p4.y - p3.y) * (p1.x - p3.x)) / denominator;
        var ub = ((p2.x - p1.x) * (p1.y - p3.y) - (p2.y - p1.y) * (p1.x - p3.x)) / denominator;
        var x = p1.x + ua * (p2.x - p1.x);
        var y = p1.y + ua * (p2.y - p1.y);
        if (ua > 0 && ub > 0) {
            markPoint({
                x: x,
                y: y
            })
        }
    }

    function markPoint(p) {
        ctx.beginPath();
        ctx.arc(p.x, p.y, 0, 0, 0 * Math.PI);
        ctx.fill();
    }

    function randomIntFromInterval(mn, mx) {
        return ~~(Math.random() * (mx - mn + 1) + mn);
    }

}



/* Letter animation */

if ($('.word').length) {

    var words = document.getElementsByClassName('word');
    var wordArray = [];
    var currentWord = 0;

    words[currentWord].style.opacity = 1;
    for (var i = 0; i < words.length; i++) {
        splitLetters(words[i]);
    }

    function changeWord() {
        var cw = wordArray[currentWord];
        var nw = currentWord == words.length-1 ? wordArray[0] : wordArray[currentWord+1];
        for (var i = 0; i < cw.length; i++) {
            if (i != cw.length-1) {
                animateLetterOut(cw, i, 0);
            } else {
                animateLetterOut(cw, i, 1);
            }
        }
        for (var i = 0; i < nw.length; i++) {
            nw[0].parentElement.style.opacity = 1;
            if (i != nw.length-1) {
                nw[i].className = 'letter behind';
                animateLetterIn(nw, i, 0);
            } else {
                nw[i].className = 'letter behind last';
                animateLetterIn(nw, i, 1);
            }

        }
        currentWord = (currentWord == wordArray.length-1) ? 0 : currentWord+1;
    }

    function animateLetterOut(cw, i, l) {
        setTimeout(function() {
            if (l != 1) {
                cw[i].className = 'letter out';
            } else {
                cw[i].className = 'letter out last';
            }
        }, i*80);
    }

    function animateLetterIn(nw, i, l) {
        setTimeout(function() {
            if (l != 1) {
                nw[i].className = 'letter in';
            } else {
                nw[i].className = 'letter in last';
            }
        }, 340+(i*80));
    }

    function splitLetters(word) {
        var content = word.innerHTML;
        word.innerHTML = '';
        var letters = [];
        for (var i = 0; i < content.length; i++) {
            var letter = document.createElement('span');
            if (i != content.length-1) {
                letter.className = 'letter';
            } else {
                letter.className = 'letter last';
            }
            letter.innerHTML = content.charAt(i);
            word.appendChild(letter);
            letters.push(letter);
        }
        wordArray.push(letters);
    }

    setInterval(changeWord, 4000);

}



/* ========================================================================
 * Bootstrap: affix.js v3.3.6
 * http://getbootstrap.com/javascript/#affix
 * ========================================================================
 * Copyright 2011-2015 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */

+function ($) {
    'use strict';

    // AFFIX CLASS DEFINITION
    // ======================

    var Affix = function (element, options) {
        this.options = $.extend({}, Affix.DEFAULTS, options);

        this.$target = $(this.options.target)
            .on('scroll.bs.affix.data-api', $.proxy(this.checkPosition, this))
            .on('click.bs.affix.data-api',  $.proxy(this.checkPositionWithEventLoop, this));

        this.$element     = $(element);
        this.affixed      = null;
        this.unpin        = null;
        this.pinnedOffset = null;

        this.checkPosition();
    }

    Affix.VERSION  = '3.3.6';
    Affix.RESET    = 'affix affix-top affix-bottom';
    Affix.DEFAULTS = {
        offset: 0,
        target: window
    };

    Affix.prototype.getState = function (scrollHeight, height, offsetTop, offsetBottom) {
        var scrollTop    = this.$target.scrollTop();
        var position     = this.$element.offset();
        var targetHeight = this.$target.height();

        if (offsetTop != null && this.affixed == 'top') return scrollTop < offsetTop ? 'top' : false;

        if (this.affixed == 'bottom') {
            if (offsetTop != null) return (scrollTop + this.unpin <= position.top) ? false : 'bottom';
            return (scrollTop + targetHeight <= scrollHeight - offsetBottom) ? false : 'bottom';
        }

        var initializing   = this.affixed == null;
        var colliderTop    = initializing ? scrollTop : position.top;
        var colliderHeight = initializing ? targetHeight : height;

        if (offsetTop != null && scrollTop <= offsetTop) return 'top';
        if (offsetBottom != null && (colliderTop + colliderHeight >= scrollHeight - offsetBottom)) return 'bottom';

        return false;
    }

    Affix.prototype.getPinnedOffset = function () {
        if (this.pinnedOffset) return this.pinnedOffset;
        this.$element.removeClass(Affix.RESET).addClass('affix');
        var scrollTop = this.$target.scrollTop();
        var position  = this.$element.offset();
        return (this.pinnedOffset = position.top - scrollTop);
    }

    Affix.prototype.checkPositionWithEventLoop = function () {
        setTimeout($.proxy(this.checkPosition, this), 1);
    }

    Affix.prototype.checkPosition = function () {
        if (!this.$element.is(':visible')) return;

        var height       = this.$element.height();
        var offset       = this.options.offset;
        var offsetTop    = offset.top;
        var offsetBottom = offset.bottom;
        var scrollHeight = Math.max($(document).height(), $(document.body).height());

        if (typeof offset != 'object')         offsetBottom = offsetTop = offset;
        if (typeof offsetTop == 'function')    offsetTop    = offset.top(this.$element);
        if (typeof offsetBottom == 'function') offsetBottom = offset.bottom(this.$element);

        var affix = this.getState(scrollHeight, height, offsetTop, offsetBottom);

        if (this.affixed != affix) {
            if (this.unpin != null) this.$element.css('top', '');

            var affixType = 'affix' + (affix ? '-' + affix : '');
            var e         = $.Event(affixType + '.bs.affix');

            this.$element.trigger(e);

            if (e.isDefaultPrevented()) return;

            this.affixed = affix;
            this.unpin = affix == 'bottom' ? this.getPinnedOffset() : null;

            this.$element
                .removeClass(Affix.RESET)
                .addClass(affixType)
                .trigger(affixType.replace('affix', 'affixed') + '.bs.affix')
        };

        if (affix == 'bottom') {
            this.$element.offset({
                top: scrollHeight - height - offsetBottom
            });
        }
    }

    // AFFIX PLUGIN DEFINITION
    // =======================

    function Plugin(option) {
        return this.each(function () {
            var $this   = $(this);
            var data    = $this.data('bs.affix');
            var options = typeof option == 'object' && option;

            if (!data) $this.data('bs.affix', (data = new Affix(this, options)));
            if (typeof option == 'string') data[option]();
        });
    }

    var old = $.fn.affix;

    $.fn.affix             = Plugin;
    $.fn.affix.Constructor = Affix;

    // AFFIX NO CONFLICT
    // =================

    $.fn.affix.noConflict = function () {
        $.fn.affix = old;
        return this;
    }

    // AFFIX DATA-API
    // ==============

    $(window).on('load', function () {
        $('[data-spy="affix"]').each(function () {
            var $spy = $(this);
            var data = $spy.data();

            data.offset = data.offset || {};

            if (data.offsetBottom != null) data.offset.bottom = data.offsetBottom;
            if (data.offsetTop    != null) data.offset.top    = data.offsetTop;

            Plugin.call($spy, data)
        });
    });

}(jQuery);

$('#sidemenu').affix({
    offset:{
        top: $('header').outerHeight(),
        bottom: $('footer').outerHeight() + 50
    }
});



/* scrollWithEase */

/**
 * @licence MIT
 */
(function() {
    $.fn.scrollWithEase = function(options) {
        ! function() {
            function e() {
                var e = !1;
                e && c("keydown", r), v.keyboardSupport && !e && u("keydown", r)
            }

            function t() {
                if (document.body) {
                    var t = document.body,
                        o = document.documentElement,
                        n = window.innerHeight,
                        r = t.scrollHeight;
                    if (S = document.compatMode.indexOf("CSS") >= 0 ? o : t, w = t, e(), x = !0, top != self) y = !0;
                    else if (r > n && (t.offsetHeight <= n || o.offsetHeight <= n)) {
                        var a = !1,
                            i = function() {
                                a || o.scrollHeight == document.height || (a = !0, setTimeout(function() {
                                    o.style.height = document.height + "px", a = !1
                                }, 100))
                            };
                        if (o.style.height = "auto", setTimeout(i, 10), S.offsetHeight <= n) {
                            var l = document.createElement("div");
                            l.style.clear = "both", t.appendChild(l)
                        }
                    }
                    v.fixedBackground || b || (t.style.backgroundAttachment = "scroll", o.style.backgroundAttachment = "scroll")
                }
            }

            function o(e, t, o, n) {
                if (n || (n = 1e3), d(t, o), 1 != v.accelerationMax) {
                    var r = +new Date,
                        a = r - C;
                    if (a < v.accelerationDelta) {
                        var i = (1 + 30 / a) / 2;
                        i > 1 && (i = Math.min(i, v.accelerationMax), t *= i, o *= i)
                    }
                    C = +new Date
                }
                if (M.push({
                        x: t,
                        y: o,
                        lastX: 0 > t ? .99 : -.99,
                        lastY: 0 > o ? .99 : -.99,
                        start: +new Date
                    }), !T) {
                    var l = e === document.body,
                        u = function() {
                            for (var r = +new Date, a = 0, i = 0, c = 0; c < M.length; c++) {
                                var s = M[c],
                                    d = r - s.start,
                                    f = d >= v.animationTime,
                                    h = f ? 1 : d / v.animationTime;
                                v.pulseAlgorithm && (h = p(h));
                                var m = s.x * h - s.lastX >> 0,
                                    w = s.y * h - s.lastY >> 0;
                                a += m, i += w, s.lastX += m, s.lastY += w, f && (M.splice(c, 1), c--)
                            }
                            l ? window.scrollBy(a, i) : (a && (e.scrollLeft += a), i && (e.scrollTop += i)), t || o || (M = []), M.length ? E(u, e, n / v.frameRate + 1) : T = !1
                        };
                    E(u, e, 0), T = !0
                }
            }

            function n(e) {
                x || t();
                var n = e.target,
                    r = l(n);
                if (!r || e.defaultPrevented || s(w, "embed") || s(n, "embed") && /\.pdf/i.test(n.src)) return !0;
                var a = e.wheelDeltaX || 0,
                    i = e.wheelDeltaY || 0;
                return a || i || (i = e.wheelDelta || 0), !v.touchpadSupport && f(i) ? !0 : (Math.abs(a) > 1.2 && (a *= v.stepSize / 120), Math.abs(i) > 1.2 && (i *= v.stepSize / 120), o(r, -a, -i), void e.preventDefault())
            }

            function r(e) {
                var t = e.target,
                    n = e.ctrlKey || e.altKey || e.metaKey || e.shiftKey && e.keyCode !== H.spacebar;
                if (/input|textarea|select|embed/i.test(t.nodeName) || t.isContentEditable || e.defaultPrevented || n) return !0;
                if (s(t, "button") && e.keyCode === H.spacebar) return !0;
                var r, a = 0,
                    i = 0,
                    u = l(w),
                    c = u.clientHeight;
                switch (u == document.body && (c = window.innerHeight), e.keyCode) {
                    case H.up:
                        i = -v.arrowScroll;
                        break;
                    case H.down:
                        i = v.arrowScroll;
                        break;
                    case H.spacebar:
                        r = e.shiftKey ? 1 : -1, i = -r * c * .9;
                        break;
                    case H.pageup:
                        i = .9 * -c;
                        break;
                    case H.pagedown:
                        i = .9 * c;
                        break;
                    case H.home:
                        i = -u.scrollTop;
                        break;
                    case H.end:
                        var d = u.scrollHeight - u.scrollTop - c;
                        i = d > 0 ? d + 10 : 0;
                        break;
                    case H.left:
                        a = -v.arrowScroll;
                        break;
                    case H.right:
                        a = v.arrowScroll;
                        break;
                    default:
                        return !0
                }
                o(u, a, i), e.preventDefault()
            }

            function a(e) {
                w = e.target
            }

            function i(e, t) {
                for (var o = e.length; o--;) z[N(e[o])] = t;
                return t
            }

            function l(e) {
                var t = [],
                    o = S.scrollHeight;
                do {
                    var n = z[N(e)];
                    if (n) return i(t, n);
                    if (t.push(e), o === e.scrollHeight) {
                        if (!y || S.clientHeight + 10 < o) return i(t, document.body)
                    } else if (e.clientHeight + 10 < e.scrollHeight && (overflow = getComputedStyle(e, "").getPropertyValue("overflow-y"), "scroll" === overflow || "auto" === overflow)) return i(t, e)
                } while (e = e.parentNode)
            }

            function u(e, t, o) {
                window.addEventListener(e, t, o || !1)
            }

            function c(e, t, o) {
                window.removeEventListener(e, t, o || !1)
            }

            function s(e, t) {
                return (e.nodeName || "").toLowerCase() === t.toLowerCase()
            }

            function d(e, t) {
                e = e > 0 ? 1 : -1, t = t > 0 ? 1 : -1, (k.x !== e || k.y !== t) && (k.x = e, k.y = t, M = [], C = 0)
            }

            function f(e) {
                if (e) {
                    e = Math.abs(e), D.push(e), D.shift(), clearTimeout(A);
                    var t = D[0] == D[1] && D[1] == D[2],
                        o = h(D[0], 120) && h(D[1], 120) && h(D[2], 120);
                    return !(t || o)
                }
            }

            function h(e, t) {
                return Math.floor(e / t) == e / t
            }

            function m(e) {
                var t, o, n;
                return e *= v.pulseScale, 1 > e ? t = e - (1 - Math.exp(-e)) : (o = Math.exp(-1), e -= 1, n = 1 - Math.exp(-e), t = o + n * (1 - o)), t * v.pulseNormalize
            }

            function p(e) {
                return e >= 1 ? 1 : 0 >= e ? 0 : (1 == v.pulseNormalize && (v.pulseNormalize /= m(1)), m(e))
            }

            var settings = $.extend({
                // These are the defaults.
                frameRate: 60,
                animationTime: 1000,
                stepSize: 120,
                pulseAlgorithm: !0,
                pulseScale: 8,
                pulseNormalize: 1,
                accelerationDelta: 20,
                accelerationMax: 1,
                keyboardSupport: !0,
                arrowScroll: 50,
                touchpadSupport: !0,
                fixedBackground: !0
            }, options);

            var w, g = {
                    frameRate: settings.frameRate,
                    animationTime: settings.animationTime,
                    stepSize: settings.stepSize,
                    pulseAlgorithm: settings.pulseAlgorithm,
                    pulseScale: settings.pulseScale,
                    pulseNormalize: settings.pulseNormalize,
                    accelerationDelta: settings.accelerationDelta,
                    accelerationMax: settings.accelerationMax,
                    keyboardSupport: settings.keyboardSupport,
                    arrowScroll: settings.arrowScroll,
                    touchpadSupport: settings.touchpadSupport,
                    fixedBackground: settings.fixedBackground,
                    excluded: ""
                },
                v = g,
                b = !1,
                y = !1,
                k = {
                    x: 0,
                    y: 0
                },
                x = !1,
                S = document.documentElement,
                D = [120, 120, 120],
                H = {
                    left: 37,
                    up: 38,
                    right: 39,
                    down: 40,
                    spacebar: 32,
                    pageup: 33,
                    pagedown: 34,
                    end: 35,
                    home: 36
                },
                v = g,
                M = [],
                T = !1,
                C = +new Date,
                z = {};
            setInterval(function() {
                z = {}
            }, 1e4);
            var A, N = function() {
                    var e = 0;
                    return function(t) {
                        return t.uniqueID || (t.uniqueID = e++)
                    }
                }(),
                E = function() {
                    return window.requestAnimationFrame || window.webkitRequestAnimationFrame || function(e, t, o) {
                        window.setTimeout(e, o || 1e3 / 60)
                    }
                }(),
                K = /chrome|iPad/i.test(window.navigator.userAgent),
                L = "onmousewheel" in document;
            L && K && (u("mousedown", a), u("mousewheel", n), u("load", t))
        }();
    }
})();


$(document).ready(function() {
    $('html').scrollWithEase();
});



/* smooth scrolling */

$(document).on('click', 'a[href^="#"]', function (e) {
    e.preventDefault();

    $('html, body').animate({
        scrollTop: $($.attr(this, 'href')).offset().top - $('header').outerHeight(true) - 25
    }, 1000);
});



/* video player */

$(document).ready(function(){
    var $video = $('#vplay'),
        video = $video[0]

    video.removeAttribute("controls");

    $video.on('loadedmetadata', function() {
        $('.current').text(timeFormat(0));
        $('.duration').text(timeFormat(video.duration));

        setTimeout(startBuffer, 150);

        $('#video-player').hover(function() {
            $('.control').stop().fadeIn();
        }, function() {
            if (!timeDrag) {
                $('.control').stop().fadeOut();
            }
        }).on('touchstart click', function() {
            $(this).unbind('click touchstart');
            video.play();
        });
    });

    var startBuffer = function() {
        var currentBuffer = video.buffered.end(0);
        var maxduration = video.duration;
        var perc = 100 * currentBuffer / maxduration;
        $('.bufferBar').css('width', perc+'%');
        if (currentBuffer < maxduration) {
            setTimeout(startBuffer, 500);
        }
    };

    $video.on('timeupdate', function() {
        var currentPos = video.currentTime;
        var maxduration = video.duration;
        var perc = 100 * currentPos / maxduration;
        $('.timeBar').css('width', perc+'%');
        $('.current').text(timeFormat(currentPos));
    });

    $video.on('touchstart click', function() {
        playpause();
    });

    $('.btnPlay').on('touchstart click', function() {
        playpause();
    });

    var playpause = function() {
        if(video.paused || video.ended) {
            $('.btnPlay').addClass('paused');
            video.play();
        } else {
            $('.btnPlay').removeClass('paused');
            video.pause();
        }
    };

    $('.btnFullscreen').on('touchstart click', function() {
        if ($.isFunction(video.webkitEnterFullscreen)) {
            video.webkitEnterFullscreen();
        } else if ($.isFunction(video.mozRequestFullScreen)) {
            video.mozRequestFullScreen();
        } else {
            alert('Your browsers doesn\'t support fullscreen');
        }
    });

    $('.btnMute').click(function() {
        video.muted = !video.muted;
        $(this).toggleClass('muted');
    });

    $video.on('canplay', function() {
        $('.loading').fadeOut(100);
    });

    var completeloaded = false;
    $video.on('canplaythrough', function() {
        completeloaded = true;
    });

    $video.on('ended', function() {
        $('.btnPlay').removeClass('paused');
        video.pause();
    });

    $video.on('seeking', function() {
        if(!completeloaded) {
            $('.loading').fadeIn(200);
        }
    });

    $video.on('seeked', function() { });

    $video.on('waiting', function() {
        $('.loading').fadeIn(200);
    });

    var timeDrag = false;
    $('.progress').on('mousedown', function(e) {
        timeDrag = true;
        updatebar(e.pageX);
    });
    $(document).on('mouseup', function(e) {
        if (timeDrag) {
            timeDrag = false;
            updatebar(e.pageX);
        }
    });
    $(document).on('mousemove', function(e) {
        if(timeDrag) {
            updatebar(e.pageX);
        }
    });
    var updatebar = function(x) {
        var progress = $('.progress');
        var maxduration = video.duration;
        var position = x - progress.offset().left;
        var percentage = 100 * position / progress.width();
        if (percentage > 100) {
            percentage = 100;
        }
        if (percentage < 0) {
            percentage = 0;
        }
        $('.timeBar').css('width', percentage+'%');
        video.currentTime = maxduration * percentage / 100;
    };

    var timeFormat = function(seconds){
        var m = Math.floor(seconds/60)<10 ? "0"+Math.floor(seconds/60) : Math.floor(seconds/60);
        var s = Math.floor(seconds-(m*60))<10 ? "0"+Math.floor(seconds-(m*60)) : Math.floor(seconds-(m*60));
        return m+":"+s;
    };
});