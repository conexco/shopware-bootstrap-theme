$.overridePlugin('swBundle', {

    /**
     * Initializes the plugin
     *
     * @returns {Plugin}
     */
    init: function () {
        var me = this;

        //Applies HTML data attributes to the current options
        me.applyDataAttributes();

        // elements for checkBundleStock()
        me.basketButton = me.$el.find('.content-cart-button'); // the basket button
        me.articlesSelector = me.$el.find('.products-content .bundle-wrapper-article'); // the article selector

        // elements for handleCheckboxEvent()
        me.bundleArticles = me.$el.find('.products-content .detail-wrapper[data-bundleId=' + me.opts.bundleId +']'); // bundle articles
        me.bundlePrice = me.$el.find('.price-value-bundle-price[data-bundleId=' + me.opts.bundleId +']'); // the bundle price
        me.bundleRegularPrice = me.$el.find('.price-value-regular-price[data-bundleId=' + me.opts.bundleId +'] .regular-price-total'); // the sum of regular article prices

        // elements for handle handleShowBundleEvent()
        me.productsContent = me.$el.find('.products-content');
        me.productsHeader = me.$el.find('.products-header[data-bundleId=' + me.opts.bundleId +']');
        me.productsFooter = me.$el.find('.products-footer[data-bundleId=' + me.opts.bundleId +']');

        // check Bundle Stock
        me.checkBundleStock();

        // hide bundle products if mobile device
        me.setBundleProductsStatus();

        // init the product slider and its configurations
        me.initProductSlider();

        // Will be automatically removed when destroy() is called.
        me._on('.bundle-article-configuration .configuration-selector select', 'change', $.proxy(me.handleConfigurationSelectionEvent, me));
        me._on('.bundle-article-configuration-add', 'click', $.proxy(me.handleConfigurationEvent, me));
        me._on('.bundle-article-checkbox[data-bundleId='+ me.opts.bundleId +']', 'click', $.proxy(me.handleCheckboxEvent, me));
        me._on(me.productsHeader, 'click', $.proxy(me.handleShowBundleEvent, me));
        me._on(me.productsFooter, 'click', $.proxy(me.handleShowBundleEvent, me));
    },

    /**
     * Check if the Bundle is buyable or not
     */
    checkBundleStock: function () {
        var me = this,
            buyable = true;

        $.each(me.bundleArticles.find('.bundle-wrapper-article'), function (index, article) {
            article = $(article);

            if (article.hasClass('not-buyable') && !article.hasClass('js-skip')) {
                buyable = false;
            }
        });

        if (!buyable) {
            me.basketButton.attr("disabled", 'disabled');
        } else {
            me.basketButton.removeAttr("disabled");
        }
    },

    /**
     * Set the bundle products status
     *
     * On mobile devices the products must be hidden on all other devices they must be shown,
     * also the header and footer for the products must be shown or hide
     */
    setBundleProductsStatus: function () {
        var me = this;

        // if smartphone hide bundle products and footer otherwise hide header and footer
        if ('xs' == StateManager.getCurrentState()) {
            me.productsHeader.removeClass('d-none');
            me.productsContent.removeClass('mtm')
                .addClass('mtm')
                .addClass('d-none');
        } else {
            me.productsHeader.addClass('d-none');
            me.productsContent.addClass('mtm').removeClass('d-none');
            me.productsFooter.addClass('d-none');
        }

        // always hide footer, will be shown when needed
        me.productsFooter.addClass('d-none');
    },

    /**
     * Init the product slider
     */
    initProductSlider: function () {
        var me = this,
            el = '*[data-bundleProductSlider="true"]',
            $el = $(el);

        // add plugin
        $el.slickWrapper();

        // hide plus icon of last active slide
        $el.find('.slick-active:last').find('i').hide();
        $el.on('afterChange setPosition', function(event, slick, currentSlide, nextSlide){
            slick.$slides.find('i').show();
            slick.$slider.find('.slick-active:last').find('i').hide();
            slick.$slides.not('.slick-active').find('i').hide();
        });

        me.plugin = $el.data('plugin_slickWrapper');
    },

    /**
     * Handle the show bundle event
     *
     * If show bundle is clicked the bundle products must be shown
     */
    handleShowBundleEvent: function (event) {
        var me = this;

        if ($(event.currentTarget).hasClass('products-header')) {
            me.productsHeader.addClass('d-none');
            me.productsFooter.removeClass('d-none');
        }

        if ($(event.currentTarget).hasClass('products-footer')) {
            me.productsFooter.addClass('d-none');
            me.productsHeader.removeClass('d-none');
            $('body').scrollTop($(me.$el.find('.bundle-panel-header')).offset().top); // scroll to top in bundle when bundle get closed
        }

        me.productsContent.toggleClass('d-none');
    },

    /**
     * Check if the configuration options are changed or not
     *
     * If the configuration options are changed and are not the default options the basket button is enabled
     * otherwise it will be disabled
     */
    handleConfigurationSelectionEvent: function () {
        var me = this;

        // iterate over all articles and get all configuration selection fields
        me.bundleArticles.each(function (index, item) {

            // define variables
            var article = $(item),
                articleConfiguration = article.find('.bundle-article-configuration'),
                configurationButton = article.find('.bundle-article-configuration-add'),
                optionDefaultValues = [],
                selectedValues = [];

            // if the article is not configurable continue
            if (!articleConfiguration.length)  {
                return;
            }

            // iterate over all configuration options
            articleConfiguration.find('.configuration-selector').each(function(index, option) {

                // get default and selected options
                optionDefaultValues[index] = $(option).find('select').attr('data-defaultvalue');
                selectedValues[index] = $(option).find('select :selected').val();

                // compare the arrays and enable or disable the button
                if (!me.compareArray(optionDefaultValues, selectedValues)) {
                    configurationButton.removeAttr('disabled');
                } else {
                    configurationButton.attr('disabled', 'disabled');
                }
            });
        });
    },

    /**
     *
     * Handle the variant configuration for a bundle article.
     * Will be fired when the save configuration button is pressed
     *
     * @param event
     */
    handleConfigurationEvent: function (event) {
        event.preventDefault();
        var me = this,
            $element = $(event.currentTarget),
            mainBundleConfiguration = $element.parents('.products-content').find("[data-bundlearticleid='0']").find('.bundle-article-configuration'),
            selectedBundleConfiguration = $element.parents('.detail-wrapper').find('.bundle-article-configuration'),
            bundleArticleId = $element.parents('.detail-wrapper').attr('data-bundlearticleid'),
            requestUrl = $element.parents('.detail-wrapper').attr('data-configurationrequesturl'),
            params = {'bundleArticleId': bundleArticleId},
            mainBundleParams = {'bundleArticleId': 0};

        // Build params array for the main bundle
        mainBundleConfiguration.find('select').each(function (index, item) {
            var $item = $(item);
            var key = $item.attr('name');
            mainBundleParams[key] = $item.val();
        });

        // If the main bundle variant selection was changed, we can just reload
        if (bundleArticleId == 0) {
            me.reloadPageWithGroups(me.getGroupParams(mainBundleParams));
            return;
        }

        // Build params for the selected bundle article
        selectedBundleConfiguration.find('select').each(function (index, item) {
            var $item = $(item);
            var key = $item.attr('name');
            params[key] = $item.val();
        });

        $.ajax({
            'url': requestUrl,
            'data': params,
            'dataType': 'html',
            'type': 'POST',
            success: function () {
                me.reloadPageWithGroups(me.getGroupParams(mainBundleParams));
            }
        });
    },

    /**
     * checkbox event for selection and deselection of bundle article when selective bundle is set
     */
    handleCheckboxEvent: function (event) {
        var me = this,
            selectedAmount = 0, // amount of selected article
            totalAmount = 0, // total amount
            discount = 0, // the discount
            slider = me.$el.find('[data-bundleProductSlider="true"]'),
            slides = slider.find('.slick-slide');

        // iterates over articles
        me.bundleArticles.each(function (index, item) {
            var article = $(item),
                articleCheckbox = article.find('.bundle-article-checkbox input'),
                articleIsChecked = (articleCheckbox.is(':checked') || index === 0),
                price = article.attr('data-articlePrice') * 1,
                // Get the id of the bundleArticle and find the corresponding image with this
                id = article.attr('data-bundlearticleid'),
                image = me.$el.find("[data-bundleImageArticleId='" + id + "']"),
                imageContainer = image.parent(),
                articleIsSlide = slides.index(imageContainer),
                removedSlides = slider.data('removed-slides') || [];

            totalAmount += price;
            if (articleIsChecked) {
                if (imageContainer.length == 0) {
                    // Find article in removed slides and add it to the slider
                    var indexOfRemoved = 0;
                    $(removedSlides).each(function(index, removedSlide){
                        if (removedSlide) {
                            var removedSlideId = removedSlide.find("[data-bundleImageArticleId]").data('bundleimagearticleid');
                                    
                            if (removedSlideId == id) {
                                slides.each(function(i, slide){
                                    if ($(slide).data('original-index') > index) {
                                        slider.slick('slickAdd', removedSlide, i - 1);
                                        return false;
                                    }
                                    else if (slides.length-1 == i) {
                                        slider.slick('slickAdd', removedSlide, slides.length-1);
                                    }
                                });
                                indexOfRemoved = index;
                                return false;
                            }
                        }
                    });
                    // Remove article which was added to the slider
                    if (indexOfRemoved > 0) {
                        removedSlides[indexOfRemoved] = false;
                        slider.data('removed-slides', removedSlides);
                    }
                }
                // Sum price
                selectedAmount += price;
            // Check if article is in slider and remove it
            } else if (articleIsSlide > 0) {
                if (slides.length > 2 ) {
                    var slideIndex = $(slides[articleIsSlide]).data('original-index');

                    // Save the removed slides in the slider data on the slick-index position to retrieve them later
                    removedSlides[slideIndex] = imageContainer;
                    slider.data('removed-slides', removedSlides);
                    // Remove the slide with the slick function
                    slider.slick('slickRemove', articleIsSlide);
                } else {
                    // prevent user from removing last bundle article
                    $(event.target).prop('checked', true);
                }
            }
        });

        if (me.opts.discountType === 'abs') {
            return true;
        }

        discount = selectedAmount / 100 * (me.$el.attr('data-discountpercentage').replace(',', '.') * 1);
        var price = selectedAmount - discount;

        price = me.formatValue(price, me.opts.currencyHelper);
        selectedAmount = me.formatValue(selectedAmount, me.opts.currencyHelper);

        me.bundlePrice.text(price);
        me.bundleRegularPrice.text(selectedAmount);

        me.checkBundleStock();

        $(event.currentTarget).parents('.detail-wrapper').toggleClass('js-unchecked-item');
    },
});

/**
 * Init the Plugin
 */
$(document).ready(function () {
    StateManager.addPlugin('#bundle-offcanvas-btn[data-offcanvas="true"]', 'swOffcanvasMenu', ['xs']);
});