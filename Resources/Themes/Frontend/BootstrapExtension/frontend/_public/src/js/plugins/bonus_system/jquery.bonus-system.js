$.overridePlugin('swBonusSystem', {
    defaults: {
        quantitySelector: '#sQuantity',
        radioSelector: '.bonussystem-radio-item',
        bonusVoucherBtnSelector: '.bonussystem-redeem-points'
    },

    /**
     * Plugin constructor
     */
    init: function () {
        var me = this;
        
        me.applyDataAttributes();
        me.initDetailPage();

        me.priceNormal = $('.price-content').text();
        me.$blockPricesBody = $('.block-prices .block-prices-body');
        me.$blockPricesBodyRow = me.$blockPricesBody.find('.block-prices-row');
        me.priceBlock = me.$blockPricesBody.find('.block-prices-row:first td:last').text();
        me.quantities = [];
        me.prices = [];
        me.priceHolder = $('.price-holder');
        me.$body = me.$el;
        me.isUserLoggedIn = me.$body.hasClass('is-user');
        me.$quantity = $(me.opts.quantitySelector);
        me.$radio = $(me.opts.radioSelector);

        me.registerEvents();

        // bugfix: check also if #bonus--maintenance element itself is available
        if ((!$('#bonus--maintenance').length || $('#bonus--maintenance').attr('data-is-maintenance') == 0) && me.isUserLoggedIn) {
            me.getUserPoints();
        }
    },

    /**
     * Helper method to init the detail-page and e.g. display the earned bonus-points.
     */
    initDetailPage: function() {
        var me = this,
            isDetail = me.$el.hasClass('ctl_detail');

        me.buyBox = me.$el.find('.product-buybox');
        me.buyFor = me.buyBox.find('.bonussystem--buyfor');
        me.pointCt = me.buyBox.find('.bonussystem-info');
        me.liveArticle = me.buyBox.find('.liveshopping-details');
        me.url = me.pointCt.attr('data-detail-url');
        me.radioUrl = me.buyFor.attr('data-radio-url');
        me.articleId = me.pointCt.attr('data-article-id');
        me.quantity = me.buyBox.find('#sQuantity').val();
        me.isBonusArticle = me.pointCt.attr('data-is-bonus-article');
        me.isLiveShopping = me.liveArticle.attr('data-live-shopping');
        me.productPrice = me.getProductPrice();

        if (isDetail) {
            me.getDetailPoints();
            me.getRadioButtons();
        }
    },

    /**
     * Helper method to read out the bonus-detail-data.
     */
    getDetailPoints: function() {
        var me  = this;
        $.ajax({
            type: "POST",
            url: me.url,
            dataType: "json",
            data: {
                articleId: me.articleId,
                quantity: me.quantity,
                isBonusArticle: me.isBonusArticle,
                isLiveShopping: me.isLiveShopping,
                price: me.productPrice
            }
        }).done(function(data) {
            var result = data;

            if(result.success == true && result.isBonusSystemActive == true) {
                me.data = result.data;
                me.setDetailPoints();
            }
        });
    },

    getUserPoints: function() {
        var headerPoints = $('.top-bar-bonuspoints'),
            url = headerPoints.attr('data-points-url');

        //It's possible that the widget is not being displayed on the current page, that means that the url becomes "null".
        //If so, the response would be HTML instead of JSON.
        if (!url) {
            return;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: url
        }).done(function(data) {
            var result = data;

            if (result.success == true) {
                headerPoints.removeClass('hidden');
                if (result.data.bonus_articles == 1) {
                    $('.sidebar-bonus-menu').removeClass('hidden');
                }
                $('.bonussystem-navigation').html(result.data.points);
                $('.header-entry-points').html(result.data.points);
                $('.bonus-header-points').html(result.data.points);
                $('.bonussystem-sidebar').removeClass('hidden');
            }
        });
    },

    /**
     * Helper method to insert the earned-bonus-points by reading out the article-price
     */
    setPrice: function () {
        var me = this,
            earningDisplayField = $('.bonussystem-earning');

        if (!earningDisplayField.length) {
            return;
        }

        //Decides between normal and block-prices
        if (me.priceNormal && me.priceNormal.length) {
            me.priceHolder.html(me.priceNormal);
        } else if (me.priceBlock.length) {
            me.priceHolder.html(me.priceBlock);
            $.each(me.$blockPricesBodyRow, function (index, element) {
                var quantityHtml = $(element).find('td:first').clone(),
                    priceHtml = $(element).find('td:last').text();

                priceHtml = $.trim(priceHtml);
                me.prices.push(priceHtml);
                me.quantities.push(~~quantityHtml.find('.block-prices-quantity').text());
            });
            me.quantities.reverse();
            me.prices.reverse();
        }
    },

    /**
     * Method to handle the self-built radio-buttons
     *
     * @param event
     */
    onClickRadio: function (event) {
        var me = this,
            $el = $(event.currentTarget);

        $('.bonussystem-radio-container').removeClass('js-radio-is-active');
        $el.find('.bonussystem-radio-container').addClass('js-radio-is-active');
        me.setPoints();
    },

    /**
     * Helper function to always correctly set the points
     */
    setPoints: function ()
    {
        var me = this,
            earningCt = me.pointCt.find('.bonussystem-earning'),
            activeRadio = me.buyBox.find('.js-radio-is-active').parents(me.opts.radioSelector);

        if (activeRadio.attr('data-is-bonus') === 'true') {
            earningCt.html(0);
        } else {
            earningCt.html(me.data.points);
        }

        $.publish('plugin/swBonusSystem/onSetPoints', [ me ]);
    },

    /**
     * Method, which is called when the user wants to add a bonus-voucher to the cart.
     *
     * @param event
     */
    addPointVoucher: function (event) {
        var me = this,
            $el = $(event.currentTarget),
            form = $el.prev('.bonussystem-inner-content').find('form');

        form.submit();
    }
});

$(document).ready(function (){
    // destroy old swBonusSystem Js Plugin and call it again with overriden functions
    var oldBonusPlugin = $('body').data('plugin_swBonusSystem');
    if (oldBonusPlugin) {
        oldBonusPlugin.destroy();
        $('body').swBonusSystem();
    }
});