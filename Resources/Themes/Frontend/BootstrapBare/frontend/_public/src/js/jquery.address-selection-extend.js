;(function($, window) {
    "use strict";

    $.addressSelection = {

        _name: 'addressSelection',
        _previousOptions: {},
        defaults: {
            formSelector: '.address-manager-selection-form',
            sessionKey: '',
            setDefaultBillingAddress: null,
            setDefaultShippingAddress: null
        },

        /**
         * add namespace for events
         * @param event
         * @returns {string}
         */
        getEventName: function(event) {
            return event + '.' + this._name;
        },

        /**
         * Open the selection with the previous options
         */
        openPrevious: function () {
            this.open(this._previousOptions);
        },

        /**
         * open function for opening the selection modal. The available addresses will be
         * fetched as html from the api
         */
        open: function (options) {
            var me = this,
                extraData,
                maxHeight = 0;

            me.opts = $.extend({}, me.defaults, options);

            extraData = {
                sessionKey: me.opts.sessionKey,
                setDefaultBillingAddress: me.opts.setDefaultBillingAddress,
                setDefaultShippingAddress: me.opts.setDefaultShippingAddress
            };

            me._previousOptions = Object.create(me.opts);

            $('body').loader('show');

            $.publish('plugin/swAddressSelection/onBeforeAddressFetch', [ me ]);

            // Ajax request to fetch available addresses
            $.ajax({
                'url': window.controller['ajax_address_selection'],
                'data': {
                    id: me.opts.id,
                    extraData: extraData
                },
                'success': function(data) {
                    $('body').showModal(data, 'address-manager-selection', function(modal) {
                        $('body').loader('hide');
                        $(modal).find('[data-equalheight="true"]').equalHeight();
                        me._registerPlugins();
                        me._bindButtonAction(modal);
                    });

                    $.publish('plugin/swAddressSelection/onAddressFetchSuccess', [ me, data ]);
                }
            });
        },

        /**
         * Re-register plugins to enable them in the modal
         * @private
         */
        _registerPlugins: function() {
            window.StateManager.addPlugin('*[data-address-editor="true"]', 'swAddressEditor');

            $.publish('plugin/swAddressSelection/onRegisterPlugins', [ this ]);
        },

        /**
         * Registers listeners for the click event on the "select address" buttons. The buttons contain the
         * needed data for the address selection. It then sends an ajax post request to the provided
         * action
         *
         * @param $modal
         * @private
         */
        _bindButtonAction: function(modal) {
            var me = this,
                $modal = $(modal),
                $forms = $modal.find(me.opts.formSelector);    

            $.publish('plugin/swAddressSelection/onBeforeBindButtonAction', [ me, $modal ]);

            $forms.find('[type="submit"]').on('click', function() {
                $(this).loader('show');
            });

            $forms.on('submit', function(event) {
                var $target = $(event.target);

                event.preventDefault();

                $.publish('plugin/swAddressSelection/onBeforeSave', [ me, $target ]);

                // send data to api endpoint
                $.ajax({
                    method: $target.attr('method'),
                    url: $target.attr('action'),
                    data: $target.serialize(),
                    success: function(response) {
                        me.onSave($modal, response);
                    }
                });
            });

            $.publish('plugin/swAddressSelection/onAfterBindButtonAction', [ me, $modal ]);
        },

        /**
         * Callback after the API has been called successfully
         */
        onSave: function($modal, response) {
            var me = this;

            $.publish('plugin/swAddressSelection/onAfterSave', [ me, $modal, response ]);

            window.location.reload();
        }
    };

})(jQuery, window);
