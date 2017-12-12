/*
* Extended Shopware Listing Actions Plugin
*/
$.overridePlugin('swListingActions', {
    defaults: {
        filterFormSelector: '*[data-filter-form="true"]',
        filterComponentSelector: '*[data-filter-type]',
        filterTriggerSelector: '*[data-filter-trigger="true"]',
        filterTriggerIconSelector: '.action-collapse-icon',
        filterContainerSelector: '.action-filter-options',
        filterInnerContainerSelector: '.filter-container',
        actionFormSelector: '*[data-action-form="true"]',
        actionLinkSelector: '*[data-action-link="true"]',
        activeFilterContSelector: '.filter-active-container',
        applyFilterBtnSelector: '.filter-btn-apply',
        activeFilterCls: 'active-filter',
        activeFilterIconCls: 'fa fa-times prs',
        collapsedCls: 'in',
        hasActiveFilterCls: 'is-active-filter',
        disabledCls: 'is--disabled',
        filterCountSelector: '.filter-count',
        loadingClass: 'is-loading',
        propertyPrefixChar: '__',
        bufferTime: 850,
        animationSpeed: 400,
        instantFilterActiveCls: '', // not needed
        listingSelector: '.listing-container > .listing ul.thumbnails',
        paginationSelector: '.listing-paging',
        infiniteScrollingAttribute: 'data-infinite-scrolling',
        paginationBarPerPageSelector: '.per-page-field.action-field',
        pageInputSelector: 'input[name=p]',
        sortInputSelector: 'input[name=o]',
        perPageInputSelector: 'input[name=n]',
        sortActionFormSelector: '.action-sort',
        perPageActionFormSelector: '.action-per-page',
        listingWrapperSelector: '.listing-wrapper',
        loadingIndSelector: '.listing-wrapper',
        noResultContainerSelector: '.listing-no-filter-result .alerts',
        isLoadingCls: 'is-loading',
        loadingIndConfig: {
            theme: 'light',
            animationSpeed: 100,
            closeOnClick: false
        },
        filterCloseBtnSelector: '.sidebar-offcanvas-close',
        closeFilterOffCanvasBtnIcon: '',
        // .headline--product-count => snippet: SearchHeadline frontend/search/fuzzy
        searchHeadlineProductCountSelector: '.search-headline .headline--product-count',
        filterFacetContainerSelector: '.filter-panel-container',
        filterActionButtonBottomSelector: '.filter-actions.filter-actions-bottom',
        sidebarLoadingIndicatorParentSelector: '.content-main'
    },

    init: function () {
        this.superclass.init.apply(this, arguments);

        var me = this;
        
        me.listingUrl = safeUrl(me.listingUrl);
    },

    // original plugin function overwrite
    initStateHandling: function () {
    },
    onBodyClick: function () {
    },

    /**
     * Registers all necessary events.
     */
    registerEvents: function () {
        // don't close bootstrap filter dropdown on click
        $('.filter-panel .dropdown-menu').click(function (e) {
            e.stopPropagation();
        });

        this.superclass.registerEvents.apply(this, arguments);
    },

    /**
     * Called by event listener on clicking an active filter label.
     * It removes the clicked filter param form the set of active filters
     * and updates the specific component.
     *
     * @param event
     */
    onActiveFilterClick: function (event) {
        var me = this,
            $activeFilter = $(event.currentTarget),
            param = $activeFilter.attr('data-filter-param');

        if (param === 'reset') {

            // Reset all facets
            $.each(me.activeFilterElements, function (key) {
                me.removeActiveFilter(key);
                me.resetFilterProperty(key);
            });

            // Reset all options inside the facets
            $.each(me.$filterComponents, function (i, component) {
                var $component = $(component),
                    componentPlugin = $component.data('plugin_swFilterComponent');

                if (componentPlugin.$inputs) {
                    $.each(componentPlugin.$inputs, function(i, item) {
                        componentPlugin.disable($(item), false);
                        componentPlugin.disableComponent(false);
                    });
                }

                $component
                    .removeClass(me.opts.disabledCls)
                    .find('.' + me.opts.disabledCls)
                    .removeClass(me.opts.disabledCls);
            });

            if (!me.$filterCont.hasClass(me.opts.collapsedCls)) {
                me.applyCategoryParams();
            }
        } else if (!me.$activeFilterCont.hasClass(me.opts.disabledCls)) {
            me.removeActiveFilter(param);
            me.resetFilterProperty(param);
        }

        $.publish('plugin/swListingActions/onActiveFilterClick', [me, event]);
    },

    /**
     * Gets the counted result of found products
     * with the current applied category parameters.
     * Updates the filter submit button on success.
     *
     * @param {string} urlParams
     * @param {boolean} loadFacets
     * @param {boolean} loadProducts
     */

    getFilterResult: function (urlParams, loadFacets, loadProducts) {
        var me = this,
            params = urlParams || me.urlParams;

        me.resetBuffer();

        if (me.showInstantFilterResult) {
            var $offcanvas = me.$filterForm.parents('.off-canvas.is-open');

            if ($offcanvas.length > 0) {
                me.$filterForm.loader('show', '', true);
            } else {
                $('body').loader('show');
            }
        }

        // send ajax request to load products and facets
        me.sendListingRequest(params, loadFacets, loadProducts, function (response) {

            if (!loadProducts) {
                me.$applyFilterBtn.removeClass(me.opts.loadingClass);
                me.updateFilterButton(response.totalCount);
            }

            me.updateListing(response);

            if (me.showInstantFilterResult) {
                $(me.opts.listingSelector).equalHeight();

                if ($offcanvas.length > 0) {
                    me.$filterForm.loader('hide');
                } else {
                    $('body').loader('hide');
                }
            }

            // publish finish event to update filter panels
            $.publish('plugin/swListingActions/onGetFilterResultFinished', [me, response, params]);
        });
    },

    /**
     * Creates the DOM element for an active filter label.
     *
     * @param param
     * @param label
     */
    createActiveFilterElement: function (param, label) {
        var btnType = 'btn-default';

        if (param === 'reset') {
            btnType = 'btn-primary';
        }

        this.activeFilterElements[param] = $('<span>', {
            'class': this.opts.activeFilterCls + ' ' + btnType + ' btn btn-xs mrm mbs mts',
            'html': this.getLabelIcon() + label,
            'data-filter-param': param
        }).appendTo(this.opts.activeFilterContSelector);

        $.publish('plugin/swListingActions/onCreateActiveFilterElement', [this, param, label]);
    },

    /**
     *
     * @param {int} totalCount
     */
    updateNoResultContainer: function (totalCount) {
        if (totalCount > 0) {
            if (!this.$noFilterResultContainer.hasClass('d-none')) {
                this.$noFilterResultContainer.addClass('d-none');
            }
            return;
        }
        if (this.$noFilterResultContainer.hasClass('d-none')) {
            this.$noFilterResultContainer.removeClass('d-none');
        }
    }
});
