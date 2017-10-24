/**
 * Extended Shopware Range Slider Plugin.
 *
 * The plugin adds a Range Slider.
 */
$.overridePlugin('swRangeSlider', {
    defaults: {
        sliderContainerCls: 'range-slider-container',
        rangeBarCls: 'range-slider-range-bar',
        handleCls: 'range-slider-handle',
        handleMinCls: 'is-min',
        handleMaxCls: 'is-max',
        activeDraggingCls: 'is-dragging',
        minInputElSelector: '*[data-range-input="min"]',
        maxInputElSelector: '*[data-range-input="max"]',
        minLabelElSelector: '*[data-range-label="min"]',
        maxLabelElSelector: '*[data-range-label="max"]',
        labelFormat: '',
        suffix: '',
        roundPretty: false,
        startMin: 20,
        startMax: 80,
        rangeMin: 0,
        rangeMax: 100,
        stepCount: 100,
        digits: 2,
        stepCurve: 'linear'
    }
});