/**
 * Extended Shopware Ajax Product navigation Plugin
 */
$.overridePlugin('swAjaxProductNavigation', {
    defaults: {
        arrowSlideClass: 'can-slide',
        productBoxSelector: '.product-box',
        productDetailsSelector: '.product-details',
        prevLinkSelector: '.product-navigation-prev',
        nextLinkSelector: '.product-navigation-next',
        breadcrumbButtonSelector: '.breadcrumb-back-btn',
        listingSelectors: [
            '.listing .product-box .image-wrapper',
            '.listing .product-box .title-wrapper'
        ]
    },

    /**
     * Initializes the plugin and registers event listeners depending on
     * whether we are on the listing- or detail page.
     *
     * @public
     * @method init
     */
    init: function () {
        var me = this,
            $el = me.$el,
            opts = me.opts,
            isListing = $el.hasClass('ctl_listing'),
            isDetail = $el.hasClass('ctl_detail'),
            params = me.parseQueryString(location.href);

        if (!(isListing || isDetail)) {
            return;
        }

        me.storage = StorageManager.getStorage('session');

        if (isListing) {
            me.registerListingEventListeners();
            return;
        }

        me.$prevButton = $el.find(opts.prevLinkSelector);
        me.$nextButton = $el.find(opts.nextLinkSelector);
        me.$backButton = $el.find(opts.breadcrumbButtonSelector);
        me.$productDetails = $el.find(opts.productDetailsSelector);

        me.categoryId = ~~(me.$productDetails.attr('data-category-id') || (params && params.c));
        me.orderNumber = me.$productDetails.attr('data-main-ordernumber');
        me.productState = me.getProductState();
        if (!me.categoryId) {
            return;
        }

        // Clear the product state if the order numbers are not identical
        if (!$.isEmptyObject(me.productState) && me.productState.ordernumber !== me.orderNumber) {
            me.clearProductState();
            me.productState = {};
        }

        me.registerDetailEventListeners();
        me.getProductNavigation();
    },

    checkPossibleSliding: function () {},

    /**
     * Sets the requested product navigation information into the DOM and displays the
     * prev and next arrow.
     *
     * @private
     * @method onProductNavigationLoaded
     * @param {Object} response - Server response
     */
    onProductNavigationLoaded: function (response) {
        var me = this,
            $prevBtn = me.$prevButton,
            $nextBtn = me.$nextButton,
            listing = response.currentListing,
            prevProduct = response.previousProduct,
            nextProduct = response.nextProduct;

        $.publish('plugin/swAjaxProductNavigation/onProductNavigationLoaded', [me, response]);

        if (listing && listing.href) {
            me.$backButton.attr('href', listing.href);
        }

        if (typeof prevProduct === 'object') {
            $prevBtn.attr('data-ordernumber', prevProduct.orderNumber);

            if (prevProduct.image) {
                $prevBtn.popoverWrapper({
                    html: true,
                    content: function() {
                        return $('<a href="'+prevProduct.href+'"><img src="'+prevProduct.image.thumbnails[0].source+'" alt="'+prevProduct.name+'" /></a>');
                    }
                });
            }

            $prevBtn.attr('href', prevProduct.href).attr('title', prevProduct.name);
        } else {
            $prevBtn.addClass('disabled');
        }

        if (typeof nextProduct === 'object') {
            $nextBtn.attr('data-ordernumber', nextProduct.orderNumber);

            if (nextProduct.image) {
                $nextBtn.popoverWrapper({
                    html: true,
                    content: function() {
                        return $('<a href="'+nextProduct.href+'"><img src="'+nextProduct.image.thumbnails[0].source+'" alt="'+nextProduct.name+'" /></a>');
                    }
                });
            }

            $nextBtn.attr('href', nextProduct.href).attr('title', nextProduct.name);
        } else {
            $nextBtn.addClass('disabled');
        }

        $.publish('plugin/swAjaxProductNavigation/onProductNavigationFinished', [me, response]);
    }
});
