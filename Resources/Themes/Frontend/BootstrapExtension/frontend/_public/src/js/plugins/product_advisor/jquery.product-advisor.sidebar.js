$.overridePlugin('swProductAdvisorSidebar', {

    defaults: {

        /**
         * This contains the number of answers that must be given before
         * the submit-button on the sidebar mode becomes enabled.
         * @type int
         */
        minQuestions: 0,

        /**
         * This is the selector for the container, that has to be clicked to toggle the collapsing
         * of the question ct.
         * @type string
         */
        collapsibleCtSelector: '.question-name',

        /**
         * This selector will find all radio-inputs from any non-price question.
         * It will be used to listen for a change and to find checked radio-inputs.
         * @type string
         */
        defaultRadioSelector: '.filter-advisor-radio',

        /**
         * This selector will find all checkbox-inputs from any question.
         * It will be used to listen for a change and to find checked checkbox-inputs.
         * @type string
         */
        checkBoxSelector: '.filter-advisor-checkbox',

        /**
         * This selector will find all non-price select-inputs itself, it won't select the options.
         * It is used for listening to a change and to find the selected option afterwards.
         * @type string
         */
        defaultComboBoxSelector: '.advisor-combobox',

        /**
         * This selector is used to find the hidden input from a price range-slider,
         * which contains the minimal selected price.
         * It is used to listen for a change on the sliders.
         * @type string
         */
        priceMinInputSelector: '.advisor-price-min',

        /**
         * This selector is used to find the hidden input from a price range-slider,
         * which contains the maximum selected price.
         * It is used to listen for a change on the sliders.
         * @type string
         */
        priceMaxInputSelector: '.advisor-price-max',

        /**
         * This selector is nearly equal to the radio-input selector 'defaultRadioSelector',
         * but will only find radio-inputs being part of a price-question.
         * This is used to listen for a change on the inputs and to find the checked radio-input afterwards.
         * @type string
         */
        priceRadioSelector: '.filter-advisor-price-radio',

        /**
         * This selector is nearly equal to the select-input selector 'defaultComboBoxSelector',
         * but will only find select-inputs being part of a price-question.
         * This is used to listen for a change on the inputs and to find the selected option afterwards.
         * @type string
         */
        priceComboBoxSelector: '.advisor-price-combobox',

        /**
         * This is the selector of the container, which contains the arrow-icon.
         * This container will turn around for 180 degrees if it also has the class from the
         * "questionArrowCtSelector"-option.
         * @type string
         */
        questionArrowCtSelector: '.question-name-arrow',

        /**
         * This is the class to turn around the arrow upon toggling the collapse of the question-container.
         * @type string
         */
        turnArrowClass: 'advisor-turn-arrow',

        /**
         * This is the selector for the container to be collapsed.
         * @type string
         */
        questionAnswerCtSelector: '.question-answer',

        /**
         * This is the selector for the search-button in the sidebar of the sidebar-mode.
         * @type string
         */
        sidebarSearchButtonSelector: '.advisor-submit-btn',

        /**
         * This is the selector for the advisor reset-button in the sidebar of the sidebar-mode.
         * @type string
         */
        sidebarResetButtonSelector: '.advisor-reset-advisor-btn',

        /**
         * This is the selector for the reset-button for a question in the sidebar.
         * @type string
         */
        resetQuestionButtonSelector: '.advisor-reset-btn',

        /**
         * This is the selector for the form wrapping around all questions in the sidebar.
         * @type string
         */
        sideBarFormSelector: '.sidebar-questions-form',

        /**
         * This is the selector for all the required checkboxes in the sidebar.
         * @type string
         */
        requiredCheckboxesSelector: '.answers-checkbox-wrapper.required',

        /**
         * The class for the disabled-state of the reset-button.
         * @type string
         */
        resetButtonDisabledClass: 'is--disabled',

        /**
         * The selector for the sidebar-question-container.
         * @type string
         */
        sidebarQuestionCtSelector: '.advisor-question',

        /**
         * The selector for the container which wraps around the "minimum-answers necessary"-warning.
         * @type string
         */
        minimumAnswersCtSelector: '.sidebar-buttons-warning',

        /**
         * This is the selector for the minimum-answer warning itself.
         * @type string
         */
        minimumAnswersWarningSelector: '.sidebar-buttons-minimum-answers',

        /**
         * The selector for the anchor to be scrolled to when opening the result in a smaller viewport.
         * Should be an id, as it needs to be unique.
         * @type string
         */
        listingAnchorSelector: '#advisor-listing-container',

        /**
         * The default scroll-speed for the scroll-animation in smaller viewports.
         * @type number
         */
        defaultScrollSpeed: 750,

        /**
         * The timeout until the scroll-animation in smaller viewports begins.
         * @type number
         */
        scrollTimeout: 750
    }
});