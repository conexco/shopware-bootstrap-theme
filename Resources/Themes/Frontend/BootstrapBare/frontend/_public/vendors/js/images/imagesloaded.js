/**
 * https://gist.github.com/aFarkas/15de1cea3acd6602a71e
 * How to:
 * $('div.container').imagesLoaded(function(){console.log('all images loaded in .container');});
 * In case you need to support IE8, you need to use HTML5shiv **and** need to modify jQuery the following way:
 * https://github.com/jquery/jquery/commit/a9533893b9e5e9a248139f5794c5d6099382cf14
 */
(function($){
    'use strict';
    $.fn.imagesLoaded = (function(){
        var imageLoaded = function (img, cb, delay){
            var timer;
            var isReponsive = false;
            var  $parent = $(img).parent();
            var $img = $('<img />');
            var srcset = $(img).attr('srcset');
            var src = $(img).attr('src');
            var onload = function(){
                $img.off('load error', onload);
                clearTimeout(timer);
                cb();
            };

            if(delay){
                timer = setTimeout(onload, delay);
            }

            $img.on('load error', onload);

            if($parent.is('picture')){
                $parent = $parent.clone();
                $parent.find('img').remove().end();
                $parent.append($img);
                isReponsive = true;
            }

            if(srcset){
                $img.attr('srcset', srcset);
                if(!isReponsive){
                    $img.appendTo(document.createElement('div'));
                }
                isReponsive = true;
            } else if(src){
                $img.attr('src', src);
            }

            if(isReponsive && !window.HTMLPictureElement){
                if(window.respimage){
                    window.respimage({elements: [$img[0]]});
                } else if(window.picturefill){
                    window.picturefill({elements: [$img[0]]});
                } else if(src){
                    $img.attr('src', src);
                }
            }
        };

        return function(cb){
            var i = 0;
            var $imgs = $('img', this).add(this.filter('img'));
            var ready = function(){
                i++;
                if(i >= $imgs.length){
                    cb();
                }
            };
            $imgs.each(function(){
                imageLoaded(this, ready);
            });
            return this;
        };
    })();
})(jQuery);