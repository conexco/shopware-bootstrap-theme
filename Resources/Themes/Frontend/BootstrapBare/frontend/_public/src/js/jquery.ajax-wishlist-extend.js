/**
 * Extended Shopware AJAX wishlist plugin
 */
$.overridePlugin('swAjaxWishlist', {
    defaults: {
        counterSelector: '.notes-quantity',
        wishlistSelector: '.entry-notepad',
        iconCls: 'fa fa-check',
        savedCls: 'js-is-saved',
        text: 'Gemerkt'
    },

    /**
     * Registers the necessary event listeners for the plugin
     */
    registerEvents: function() {
        var me = this;

        me.$el.on(me.getEventName('click'), '.link-notepad', $.proxy(me.triggerRequest, me));

        $.publish('plugin/swAjaxWishlist/onRegisterEvents', me);
    },

    /**
     * Animates the element when the AJAX request was successful.
     *
     * @param {object} $target - The associated element
     */
    animateElement: function($target) {
        var me = this,
            $icon = $target.find('i.action-icon'),
            originalIcon = $icon[0].className,
            $text = $target.find('.action-text');

        me.$counter.removeClass('hidden');
        $target.addClass(me.opts.savedCls);
        $text.html($target.attr('data-text') || me.opts.text);
        $icon.removeClass(originalIcon).addClass(me.opts.iconCls);

        $.publish('plugin/swAjaxWishlist/onAnimateElement', [me, $target]);
    }
});