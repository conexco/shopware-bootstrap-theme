/**
 * Extended Shopware Last Seen Products Plugin
 *
 * This plugin creates a list of collected articles.
 * Those articles will be collected, when the user opens a detail page.
 * The created list will be showed as a product slider.
 */
$.overridePlugin('swLastSeenProducts', {
    defaults: {
        productLimit: 20,
        baseUrl: '/',
        shopId: 1,
        currentArticle: {},
        containerSelector: '.last-seen-products-container',
        itemCls: 'last-seen-products-item thumbnail',
        titleCls: 'last-seen-products-title',
        imageCls: 'last-seen-products-image',
        noPicture: '',
        template: 'col-lg-3 col-md-4 col-xs-6'
    },

    /**
     * Initializes all necessary elements and collects the current
     * article when we are on the detail page.
     *
     * @public
     * @method init
     */
    init: function () {
        var me = this;

        me.applyDataAttributes();

        me.$container = me.$el.find(me.opts.containerSelector);
        me.storage = StorageManager.getLocalStorage();

        if ($('body').hasClass('ctl_detail')) {
            me.collectProduct(me.opts.currentArticle);
            $.subscribe(me.getEventName('plugin/swAjaxVariant/onRequestData'), $.proxy(me.onAjaxVariantChange, me));
        }

        me.createProductList();
    },

    /**
     * Creates a list of all collected articles
     *
     * @public
     * @method createProductList
     */
    createProductList: function () {
        var me = this,
            opts = me.opts,
            itemKey = 'lastSeenProducts-' + opts.shopId + '-' + opts.baseUrl,
            productsJson = me.storage.getItem(itemKey),
            products = productsJson ? JSON.parse(productsJson) : [],
            len = Math.min(opts.productLimit, products.length);

        if (len > 1) {
            me.$el.removeClass('d-none');
        }

        $.each(products, function(i, product) {
            if (product.articleId === opts.currentArticle.articleId) {
                return;
            }

            me.$container.append(me.createTemplate(product));
        });

        me.$el.equalHeight();

        $.publish('plugin/swLastSeenProducts/onCreateProductList', me);
    },

    /**
     * Creates a product slider item template.
     *
     * @public
     * @method createTemplate
     * @param {Object} article
     */
    createTemplate: function (article) {
        var me = this,
            $template = $('<div>', {'class': me.opts.template}).append(
                $('<div>', {
                    'class': me.opts.itemCls,
                    'html': [
                        me.createProductImage(article),
                        me.createProductTitle(article)
                    ],
                    'data-ordernumber': article.orderNumber
                })
            );

        $.publish('plugin/swLastSeenProducts/onCreateTemplate', [me, $template, article]);

        return $template;
    },

    /**
     * Creates the product name title by the provided article data
     *
     * @public
     * @method createProductTitle
     * @param {Object} data
     */
    createProductTitle: function (data) {
        var me = this,
            $title = $('<div>', {
                'class': 'title-wrapper',
                'data-equal': 'title'
            }).append(
                $('<p>', {'class': 'text-center'}).append(
                    $('<a>', {
                        'rel': 'nofollow',
                        'class': me.opts.titleCls,
                        'title': data.articleName,
                        'href': data.linkDetailsRewritten,
                        'html': data.articleName
                    })
                )
            );

        $.publish('plugin/swLastSeenProducts/onCreateProductTitle', [me, $title, data]);

        return $title;
    },

    /**
     * Creates a product image with all media queries for the
     * picturefill plugin
     *
     * @public
     * @method createProductImage
     * @param {Object} data
     */
    createProductImage: function (data) {
        var me = this,
            image = data.images[0],
            element,
            imageEl,
            srcSet;

        element = $('<a>', {
            'class': me.opts.imageCls,
            'href': data.linkDetailsRewritten,
            'title': data.articleName
        });

        imageEl = $('<div>', {
            'class': 'image-wrapper',
            'data-equal': 'image'
        }).appendTo(element);

        if (image) {
            srcSet = image.sourceSet;
        } else {
            srcSet = me.opts.noPicture;
        }

        $('<img>', {
            'class': 'img-responsive img-center',
            'srcset': srcSet,
            'alt': data.imageTitle || data.articleName,
            'title': data.imageTitle || data.articleName
        }).appendTo(imageEl);

        picturefill();

        $.publish('plugin/swLastSeenProducts/onCreateProductImage', [me, element, data]);

        return element;
    }
});
