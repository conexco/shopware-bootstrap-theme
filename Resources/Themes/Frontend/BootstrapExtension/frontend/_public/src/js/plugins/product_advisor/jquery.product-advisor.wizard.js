$.overridePlugin('swProductAdvisorWizard', {

    defaults: {

        /**
         * This is the selector for the label of a non-image radio-question.
         * @type string
         */
        questionRadioLabelSelector: '.question-radio .question-label',

        /**
         * This is the selector for the label of an image radio-question.
         * @type string
         */
        questionImageRadioLabelSelector: '.question-radio-image.question-label',

        /**
         * The selector for the wizard-question-wrapper.
         * @type string
         */
        questionWrapperSelector: '.advisor-wizard-question',

        /**
         * The selector for a checkbox inside of the wizard-question-wrapper.
         * @type string
         */
        questionWrapperCheckboxSelector: '.advisor-wizard-question :checkbox',

        /**
         * The name of the data-attribute to display a wizard-question as "required"
         * @type string
         */
        requiredDataAttribute: 'data-advisor-required',

        /**
         * The selector for the next-button in the wizard.
         * @type string
         */
        nextButtonSelector: '.next-button--btn',

        /**
         * The selector for the skip-select to skip to a question.
         * @type string
         */
        skipSelectSelector: '.wizard-actions-question-select'
    }
});