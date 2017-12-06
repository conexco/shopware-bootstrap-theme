{extends file="frontend/checkout/confirm.tpl"}

{* Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}

{* Hide shop navigation *}
{block name='frontend_index_shop_navigation'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
{/block}

{* Step box *}
{block name='frontend_index_navigation_categories_top'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
{/block}

{* Hide top bar *}
{block name='frontend_index_top_bar_container'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
{/block}

{* Footer *}
{block name='frontend_index_footer'}
    {if !$theme.checkoutFooter}
        {$smarty.block.parent}
    {else}
        {block name='frontend_index_checkout_finish_footer'}
            {include file="frontend/index/footer_minimal.tpl"}
        {/block}
    {/if}
{/block}

{* Hide steps *}
{block name='frontend_index_content_top'}{/block}

{* Hide sidebar left *}
{block name='frontend_index_content_left'}{/block}

{* Main content *}
{block name="frontend_index_content"}
    {* Finish teaser message *}
    {block name='frontend_checkout_finish_teaser'}
        <div class="hidden-print">
            <div class="panel panel-default">
                <div class="panel-body">
                    {block name='frontend_checkout_finish_teaser_title'}
                        <legend>{s name="FinishHeaderThankYou"}{/s} {$sShopname|escapeHtml}!</legend>
                    {/block}
                    {block name='frontend_checkout_finish_teaser_content'}
                        <p>{s name="FinishInfoConfirmationMail"}{/s}</p>
                        <p>{s name="FinishInfoPrintOrder"}{/s}</p>
                        {block name='frontend_checkout_finish_teaser_actions'}
                            {* Back to the shop button *}
                            <a href="{url controller='index'}" class="btn btn-primary mrm" title="{"{s name='FinishButtonBackToShop'}{/s}"|escape}">
                                {s name="FinishButtonBackToShop"}{/s}
                            </a>
                            {* Print button *}
                            <a href="#" class="btn btn-default mtm-xs" onclick="self.print()" title="{s name='FinishLinkPrint'}{/s}">
                                {s name="FinishLinkPrint"}{/s}
                            </a>
                        {/block}
                    {/block}
                </div>
            </div>
        </div>
    {/block}

    {block name='frontend_checkout_finish_info'}
        {block name='frontend_checkout_finish_information_wrapper'}
            <div class="row">
                {block name='frontend_checkout_finish_information_addresses'}

                    {if $sAddresses.equal}

                        {* Equal Billing & Shipping *}
                        {block name='frontend_checkout_finish_information_addresses_equal'}
                            <div class="col-lg-12">
                                {block name='frontend_checkout_finish_information_addresses_equal_panel'}
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            {block name='frontend_checkout_finish_information_addresses_equal_panel_title'}
                                                <legend>{s name='ConfirmAddressEqualTitle' namespace="frontend/checkout/confirm"}{/s}</legend>
                                            {/block}

                                            {block name='frontend_checkout_finish_information_addresses_equal_panel_body'}
                                                {block name='frontend_checkout_finish_information_addresses_equal_panel_billing'}
                                                    <address>
                                                        {if $sAddresses.billing.company}
                                                            <strong>{$sAddresses.billing.company|escapeHtml}{if $sAddresses.billing.department}<br />{$sAddresses.billing.department|escapeHtml}{/if}</strong>
                                                            <br />
                                                        {/if}

                                                        {$sAddresses.billing.salutation|salutation}
                                                        {if {config name="displayprofiletitle"}}
                                                            {$sAddresses.billing.title|escapeHtml}<br/>
                                                        {/if}
                                                        {$sAddresses.billing.firstname|escapeHtml} {$sAddresses.billing.lastname|escapeHtml}<br />
                                                        {$sAddresses.billing.street|escapeHtml}<br />
                                                        {if $sAddresses.billing.additional_address_line1}{$sAddresses.billing.additional_address_line1|escapeHtml}<br />{/if}
                                                        {if $sAddresses.billing.additional_address_line2}{$sAddresses.billing.additional_address_line2|escapeHtml}<br />{/if}
                                                        {if {config name=showZipBeforeCity}}{$sAddresses.billing.zipcode} {$sAddresses.billing.city|escapeHtml}{else}{$sAddresses.billing.city|escapeHtml} {$sAddresses.billing.zipcode|escapeHtml}{/if}<br />
                                                        {if $sAddresses.billing.state.name}{$sAddresses.billing.state.name|escapeHtml}<br />{/if}
                                                        {$sAddresses.billing.country.name|escapeHtml}
                                                    </address>
                                                {/block}
                                            {/block}
                                        </div>
                                    </div>
                                {/block}
                            </div>
                        {/block}

                    {else}

                        {* Separate Billing & Shipping *}
                        {block name='frontend_checkout_finish_information_addresses_billing'}
                            <div class="col-12 col-sm-6">
                                {* Billing address *}
                                {block name='frontend_checkout_finish_information_addresses_billing_panel'}
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            {* Headline *}
                                            {block name='frontend_checkout_confirm_information_addresses_billing_panel_title'}
                                                <legend>{s name="ConfirmHeaderBilling" namespace="frontend/checkout/confirm"}{/s}</legend>
                                            {/block}

                                            {* Content *}
                                            {block name='frontend_checkout_finish_information_addresses_billing_panel_body'}
                                                <address>
                                                    {if $sAddresses.billing.company}
                                                        <strong>{$sAddresses.billing.company|escapeHtml}{if $sAddresses.billing.department}<br />{$sAddresses.billing.department|escapeHtml}{/if}</strong>
                                                        <br />
                                                    {/if}

                                                    {$sAddresses.billing.salutation|salutation}
                                                    {if {config name="displayprofiletitle"}}
                                                        {$sAddresses.billing.title|escapeHtml}<br/>
                                                    {/if}
                                                    {$sAddresses.billing.firstname|escapeHtml} {$sAddresses.billing.lastname|escapeHtml}<br />
                                                    {$sAddresses.billing.street|escapeHtml}<br />
                                                    {if $sAddresses.billing.additional_address_line1}{$sAddresses.billing.additional_address_line1|escapeHtml}<br />{/if}
                                                    {if $sAddresses.billing.additional_address_line2}{$sAddresses.billing.additional_address_line2|escapeHtml}<br />{/if}
                                                    {if {config name=showZipBeforeCity}}{$sAddresses.billing.zipcode|escapeHtml} {$sAddresses.billing.city|escapeHtml}{else}{$sAddresses.billing.city|escapeHtml} {$sAddresses.billing.zipcode|escapeHtml}{/if}<br />
                                                    {if $sAddresses.billing.state.name}{$sAddresses.billing.state.name|escapeHtml}<br />{/if}
                                                    {$sAddresses.billing.country.name|escapeHtml}
                                                </address>
                                            {/block}
                                        </div>
                                    </div>
                                {/block}
                            </div>
                        {/block}

                        {block name='frontend_checkout_finish_information_addresses_shipping'}
                            <div class="col-12 col-sm-6">
                                {block name='frontend_checkout_finish_information_addresses_shipping_panel'}
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            {* Headline *}
                                            {block name='frontend_checkout_finish_information_addresses_shipping_panel_title'}
                                                <legend>{s name="ConfirmHeaderShipping" namespace="frontend/checkout/confirm"}{/s}</legend>
                                            {/block}

                                            {* Content *}
                                            {block name='frontend_checkout_finish_information_addresses_shipping_panel_body'}
                                                <address>
                                                    {if $sAddresses.shipping.company}
                                                        <strong>{$sAddresses.shipping.company|escapeHtml}{if $sAddresses.shipping.department}<br />{$sAddresses.shipping.department|escapeHtml}{/if}</strong>
                                                        <br />
                                                    {/if}

                                                    {$sAddresses.shipping.salutation|salutation}
                                                    {if {config name="displayprofiletitle"}}
                                                        {$sAddresses.shipping.title|escapeHtml}<br/>
                                                    {/if}
                                                    {$sAddresses.shipping.firstname|escapeHtml} {$sAddresses.shipping.lastname|escapeHtml}<br />
                                                    {$sAddresses.shipping.street|escapeHtml}<br />
                                                    {if $sAddresses.shipping.additional_address_line1}{$sAddresses.shipping.additional_address_line1|escapeHtml}<br />{/if}
                                                    {if $sAddresses.shipping.additional_address_line2}{$sAddresses.shipping.additional_address_line2|escapeHtml}<br />{/if}
                                                    {if {config name=showZipBeforeCity}}{$sAddresses.shipping.zipcode|escapeHtml} {$sAddresses.shipping.city|escapeHtml}{else}{$sAddresses.shipping.city|escapeHtml} {$sAddresses.shipping.zipcode|escapeHtml}{/if}<br />
                                                    {if $sAddresses.shipping.state.name}{$sAddresses.shipping.state.name|escapeHtml}<br />{/if}
                                                    {$sAddresses.shipping.country.name|escapeHtml}
                                                </address>
                                            {/block}
                                        </div>
                                    </div>
                                {/block}
                            </div>
                        {/block}
                    {/if}
                {/block}
            </div>
        {/block}

        {block name='frontend_checkout_finish_details'}
            <div class="panel panel-default">
                <div class="panel-body">
                    {block name='frontend_checkout_finish_details_title'}
                        <legend>{s name="FinishHeaderInformation"}{/s}</legend>
                    {/block}

                    {block name='frontend_checkout_finish_details_content'}
                        {* Invoice number *}
                        {block name='frontend_checkout_finish_invoice_number'}
                            {if $sOrderNumber}
                                <p><strong>{s name="FinishInfoId"}{/s}</strong> {$sOrderNumber}</p>
                            {/if}
                        {/block}

                        {* Transaction number *}
                        {block name='frontend_checkout_finish_transaction_number'}
                            {if $sTransactionumber}
                                <p><strong>{s name="FinishInfoTransaction"}{/s}</strong> {$sTransactionumber}</p>
                            {/if}
                        {/block}

                        {* Payment method *}
                        {block name='frontend_checkout_finish_payment_method'}
                            {if $sPayment.description}
                                <p><strong>{s name="ConfirmHeaderPayment" namespace="frontend/checkout/confirm"}{/s}:</strong> {$sPayment.description}</p>
                            {/if}
                        {/block}

                        {* Dispatch method *}
                        {block name='frontend_checkout_finish_dispatch_method'}
                            {if $sDispatch.name}
                                <p><strong>{s name="CheckoutDispatchHeadline" namespace="frontend/checkout/confirm_dispatch"}{/s}:</strong> {$sDispatch.name}</p>
                            {/if}
                        {/block}
                    {/block}
                </div>
            </div>
        {/block}
    {/block}

    {block name='frontend_checkout_finish_items'}
        {* Table header *}
        {block name='frontend_checkout_finish_table_header'}
            {include file="frontend/checkout/finish_header.tpl"}
        {/block}

        {* Article items *}
        {foreach name=basket from=$sBasket.content item=sBasketItem key=key}
            {block name='frontend_checkout_finish_item'}
                {include file='frontend/checkout/finish_item.tpl'}
            {/block}
        {/foreach}

        {* Table footer *}
        {block name='frontend_checkout_finish_table_footer'}
            {include file="frontend/checkout/finish_footer.tpl"}
        {/block}
    {/block}
{/block}
