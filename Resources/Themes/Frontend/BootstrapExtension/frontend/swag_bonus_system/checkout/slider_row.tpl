{* This ist the bonus system voucher slider component, which allows the user to convert the bonus points into a voucher *}
{block name="frontend_checkout_bonussystem_slider_container"}
    <div class="well well-sm bonus-basket-slider sw5-plugin">
		{block name="frontend_checkout_bonussystem_slider_container_headline"}
            <h4>{s namespace="frontend/plugins/bonus_system/slider" name="BasketBonusVoucherHeadline"}{/s}</h4>
		{/block}

		{block name="frontend_checkout_bonussystem_slider_container_content"}
            <div class="bonussystem-inner-content sw5-plugin">
                {* User points *}
                {block name="frontend_checkout_bonussystem_slider_container_points"}
                    {block name="frontend_checkout_bonussystem_slider_container_current_points"}
                        {block name="frontend_checkout_bonussystem_slider_container_coin"}{/block}
                        <p class="text-warning">
                            {block name="frontend_checkout_bonussystem_slider_container_segments"}
                                {block name="frontend_checkout_bonussystem_slider_container_segments_points"}
                                    {block name="frontend_checkout_bonussystem_slider_container_segments_top"}
                                        <span>{s namespace="widgets/index/shop_menu" name="YouOwn"}Sie besitzen{/s}</span>
                                    {/block}

                                    {block name="frontend_checkout_bonussystem_slider_container_segments_earning"}
                                        <strong>
                                            {action module=widgets controller=SwagBonusSystem action=returnPoints}
                                        </strong>
                                    {/block}

                                    {block name="frontend_checkout_bonussystem_slider_container_segments_current"}
                                        <span>{s name="BonusPoints" namespace="frontend/account/content_right"}Bonuspunkte{/s}</span>
                                    {/block}
                                {/block}
                            {/block}
                        </p>
                    {/block}
                    {block name="frontend_checkout_bonussystem_slider_container_segments_conversion"}
                        <p>
                            {s namespace="frontend/plugins/bonus_system/slider" name="BasketMaxConversion"}
                            {$sBonusSystem.settings.bonus_voucher_conversion_factor|intval} Bonuspunkte = {"1"|currency} | Maximal {$sBonusSystem.settings.sliderMaxInEuro|currency} m&ouml;glich
                            {/s}
                        </p>
                    {/block}
                {/block}

                {block name="frontend_checkout_bonussystem_slider_container_confirm"}
                    <form method="post" class="bonussystem-add-voucher-form prl pll" action="{url controller='BonusSystem' action='addVoucher' sTargetAction=$sTargetAction forceSecure}">
                        {block name="frontend_checkout_bonussystem_slider_input_currency"}
                            <input type="hidden" id="currency_display" value="{"0"|currency}" />
                        {/block}

                        {block name="frontend_checkout_bonussystem_slider_input_slider_max"}
                            <input type="hidden" id="bonus-slider-max" value="{$sBonusSystem.settings.sliderMaxInPoints}" />
                        {/block}

                        {block name="frontend_checkout_bonussystem_slider_input_conversion"}
                            <input type="hidden" id="bonus-conversion-factor" value="{$sBonusSystem.settings.bonus_voucher_conversion_factor}" />
                        {/block}

                        {block name="frontend_checkout_bonussystem_slider__input_slider_max_euro"}
                            <input type="hidden" name="voucherMaxInEuro" value="{$sBonusSystem.settings.sliderMaxInEuro}" />
                        {/block}

                        {block name="frontend_checkout_bonussystem_slider_input_points"}
                            <input type="hidden" id="bonus-voucher-points" name="points" value="1" readonly="readonly" />
                        {/block}

                        {block name="frontend_checkout_bonussystem_slider_input_value"}
                            <input type="hidden" id="bonus-voucher-value" name="value" value="" readonly="readonly" />
                        {/block}

                        {block name="frontend_checkout_bonussystem_slider_container_slider"}
                            <div class="slider" data-addVoucherText="{s name="AddVoucherText" namespace="frontend/checkout/cart"}Bonuspunkte einlösen{/s}" data-sliderRangeMax="{$sBonusSystem.settings.sliderMaxInPoints}" data-basket-slider="true"></div>
                        {/block}
                    </form>
                {/block}
            </div>
        {/block}

        {block name="frontend_checkout_bonussystem_slider_redeem_container"}
            <div class="btn btn-primary mtl bonussystem-redeem-points">
                {s name="AddVoucherText" namespace="frontend/checkout/cart"}{/s}
            </div>
        {/block}
    </div>
{/block}

