$.overridePlugin('swProductAdvisorResult', {

    defaults: {
        /**
         * This is the selector for the "others"-title in between the product-boxes.
         * It is NOT the title on the top of the page.
         * @type string
         */
        othersTitleSelector: '.advisor-others-title',

        /**
         * This is the selector for the "others" title on top of the page.
         * It gets replaced when the title appears in between the product-boxes.
         * @type string
         */
        mainTitleOthersSelector: '.main-title-others',

        /**
         * This is the selector for the "remaining"-title on top of the page.
         * @type string
         */
        mainTitleFilteredSelector: '.main-title-filtered'
    }
});