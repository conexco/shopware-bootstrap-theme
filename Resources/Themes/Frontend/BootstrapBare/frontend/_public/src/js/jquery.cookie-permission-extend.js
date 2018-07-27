;(function($, window) {
    'use strict';

    var $body = $('body');

    $.overridePlugin('swCookiePermission', {

        showElement: function() {
            if (window.cookieRemoval === 2) {
                this.$modal = $('[data-cookie-removal="true"]');

                if (this.$modal.length > 0) {
                    this.$modal.modal({
                        backdrop: 'static'
                    }).modal('show');
                }

                this.$acceptButton = $(this.opts.acceptButtonSelector);
                this.$closeButton = $(this.opts.closeButtonSelector);
                this._on(this.$acceptButton, 'click', $.proxy(this.onAcceptButtonClick, this));
                this._on(this.$closeButton, 'click', $.proxy(this.onCloseButtonClick, this));
            } else {
                this.$el.removeClass(this.opts.isHiddenClass);
                this.setPermissionHeight();
            }
        },

        hideElement: function() {
            this.$el.addClass(this.opts.isHiddenClass);
            $body.css('padding-bottom', 0);
            
            if (this.$modal) {
                this.$modal.modal('hide');
            }
        }
    });
}(jQuery, window));
