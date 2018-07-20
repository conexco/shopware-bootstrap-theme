// strips and returns controller url, safeUrl(controller,'/path')
function safeUrl(url,path){url=url.replace('http:','').replace('https:','');path=typeof path==='undefined'?'':path;return url+path;}

// Ajax cart amount display
function cartRefresh() {
    var ajaxCartRefresh = controller.ajax_cart_refresh,
        $cartAmount = $('.cart-amount'),
        $cartQuantity = $('.cart-quantity'),
        $cartBtn = $('[data-ajax-cart="true"]');

    if (!ajaxCartRefresh.length) {
        return;
    }

    $.ajax({
        url: ajaxCartRefresh,
        dataType: 'jsonp'
    }).done(function(response) {
        var cart = JSON.parse(response);

        if(!cart.amount || !cart.quantity) {
            return;
        }

        $cartQuantity.html(cart.quantity);
        $cartAmount.html(cart.amount);

        var cleanAmount = cart.amount.replace('.','');

        if (parseInt(cleanAmount) < 100) {
            $cartAmount.removeClass('d-none');
        } else {
            $cartAmount.addClass('d-none');
        }

        if (cart.quantity == 0) {
            $cartQuantity.addClass('d-none');
        } else {
            $cartQuantity.removeClass('d-none');
        }
    });
}

// plugin function to set the elements height to the highest of its siblings
$.fn.equalMaxHeight = function () {
    var maxHeight = 0,
        el = $(this);

    for (var i = 0; i < el.length; i++) {
        maxHeight = Math.max(typeof maxHeight != 'undefined' ? maxHeight : 0, $(el[i]).outerHeight(false));
    }
    el.height(maxHeight);
};


// plugin function to set the children of the element with the attribute data-equalheight to the same height
// children need to have a data-equal="xyz" attribute
$.fn.equalHeight = function () {
    var $container = $(this);

    // resets the calculated height of equalHeight so equalHeight can be updated
    $container.find('[data-equal]').height('auto');

    for (var i = 0; i < $container.length; i++) {
        (function (e) {
            var $el = $($container[e]),
                $children = $el.find('[data-equal]:not([data-equal="image"]):not([data-equal="item"])'),
                equals = [];

            for (var b = 0; b < $children.length; b++) {
                var inArray = false;

                for (var i = 0; i < equals.length; i++) {
                    if (equals[i] === $($children[b]).data('equal')) {
                        inArray = true;
                        break;
                    }
                }

                if (!inArray) {
                    equals.push($($children[b]).data('equal'));
                }
            }

            for (var j = 0; j < equals.length; j++) {
                $el.find('[data-equal="' + equals[j] + '"]').equalMaxHeight();
            }

            $el.imagesLoaded(function () {
                $el.find('[data-equal="image"]').height('auto').equalMaxHeight();
                $el.find('[data-equal="item"]').height('auto').equalMaxHeight();
            });
        })(i);
    }
};

// initializes selectboxit with custom options and provides shopware fallback
$.fn.swSelectboxReplacement = function () {
    // TODO: replace
    if (swfCustomSelects) {
        // $(this).find('select:not([data-no-custom-select="true"])').selectBoxIt(swfCustomSelectOptions);
    }
};

// move elements on specific viewports
// use like this:
// needs to have 'move-on' and viewports as classes
// <div class="move-on xs s m" data-move-to="#newDestination">Content to move</div>
// new destination needs to have selector in 'data-move-to' attribute
// <div id="newDestination"></div>
function applyMoveHelper() {

    var $elementsToMove = $('.move-on.' + StateManager.getCurrentState() + ':not(.moved)').addClass('moved'),
        $elementsToMoveBack = $('.moved.move-on:not(.' + StateManager.getCurrentState() + ')');

    // move elements to new destination
    $elementsToMove.each(function() {
        var $elementToMove = $(this),
        destination = $elementToMove.attr('data-move-to');

        // check if element was already moved
        if ($elementToMove.parent('[data-moved-to]').length == 0){ // wrap in container, because element needs to be moved back
            $elementToMove.wrap('<div data-moved-to="' + destination + '"></div>');
        }

        // always empty destination
        $(destination).children().remove();

        // move element to it's new destination
        $elementToMove.detach().appendTo(destination);
    });

    // move elements back to start
    $elementsToMoveBack.each(function(){
        var $elementToMoveBack = $(this),
            destination = $elementToMoveBack.attr('data-move-to');

        $elementToMoveBack.removeClass('moved').detach().appendTo('[data-moved-to="' + destination + '"]');
    });
}

// Expose methods for browser emulators
window.safeUrl = safeUrl;
window.cartRefresh = cartRefresh;
window.applyMoveHelper = applyMoveHelper;
