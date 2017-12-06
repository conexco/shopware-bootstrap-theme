{namespace name="frontend/account/order_item"}

{block name="frontend_account_order_item_details_row"}
    <tr>
        <td colspan="5" class="orders-table-details">
            <div id="order{$offerPosition.ordernumber}" class="collapse">
                {block name="frontend_account_order_item_detail_table"}
                    <div class="table-responsive mtm">
                        <table class="table table-bordered">
                            {block name='frontend_account_order_item_detail_table_head'}
                                <thead>
                                    <tr>
                                        {block name="frontend_account_order_item_detail_table_head_name"}
                                            <th>{s name="OrderItemColumnName"}{/s}</th>
                                        {/block}
                                        {block name="frontend_account_order_item_detail_table_head_quantity"}
                                            <th>{s name="OrderItemColumnQuantity"}{/s}</th>
                                        {/block}
                                        {block name="frontend_account_order_item_detail_table_head_price"}
                                            <th>{s name="OrderItemColumnPrice"}{/s}</th>
                                        {/block}
                                        {block name="frontend_account_order_item_detail_table_head_total"}
                                            <th>{s name="OrderItemColumnTotal"}{/s}</th>
                                        {/block}
                                    </tr>
                                </thead>
                            {/block}

                            {block name="frontend_account_order_item_detail_id"}
                                <input type="hidden" name="sAddAccessories" value="{$ordernumber|escape}"/>
                            {/block}

                            {block name="frontend_account_order_item_detail_table_rows"}
                                <tbody>
                                    {foreach from=$offerPosition.details item=article}
                                        {block name="frontend_account_order_item_detail_table_row"}
                                            <tr>
                                                <td>
                                                    {block name="frontend_account_order_item_info"}
                                                        {* Name *}
                                                        {block name='frontend_account_order_item_name'}
                                                            <p>
                                                                {* Mode 10 = Bundle Product *}
                                                                {if $article.modus == 10}
                                                                    {s name='OrderItemInfoBundle'}{/s}
                                                                {else}
                                                                    {$article.name}
                                                                {/if}
                                                            </p>
                                                        {/block}

                                                        {* Unit price *}
                                                        {block name='frontend_account_order_item_unitprice'}
                                                            {include file="frontend/listing/product-box/product-price-unit.tpl" sArticle=$article}
                                                        {/block}

                                                        {* Current price *}
                                                        {block name='frontend_account_order_item_currentprice'}
                                                            {if $article.currentPrice}
                                                                <p>
                                                                    <small>
                                                                        {block name="frontend_account_order_item_currentprice_label"}
                                                                            {s name="OrderItemInfoCurrentPrice"}{/s}:
                                                                        {/block}
                                                                        {block name="frontend_account_order_item_pseudo_price"}
                                                                            {block name="frontend_account_order_item_pseudo_price_before"}
                                                                                {s name="priceDiscountLabel" namespace="frontend/detail/data"}{/s}
                                                                            {/block}
                                                                            {if $article.currentPseudoprice}
                                                                                {s name="reducedPrice" namespace="frontend/listing/box_article"}{/s} {$article.currentPseudoprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                                                                            {/if}
                                                                            {block name="frontend_account_order_item_pseudo_price_after"}
                                                                                {s name="priceDiscountInfo" namespace="frontend/detail/data"}{/s}
                                                                            {/block}
                                                                        {/block}
                                                                        {block name="frontend_account_order_item_currentprice_value"}
                                                                            {$article.currentPrice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
                                                                        {/block}
                                                                    </small>
                                                                </p>
                                                            {/if}
                                                        {/block}

                                                        {* availability warning *}
                                                        {block name='frontend_account_order_item_availability'}
                                                            {if $article.modus == 0 && ($article.active == 0 || !$article.article.isAvailable)}
                                                                {* show warning if article is not active or not available *}
                                                                {include file="frontend/_includes/messages.tpl" type="error" content="{s name='OrderItemInfoNotAvailable'}{/s}"}
                                                            {/if}
                                                        {/block}

                                                        {* If ESD-Article *}
                                                        {block name='frontend_account_order_item_downloadlink'}
                                                            {if $article.esdarticle && $offerPosition.cleared|in_array:$sDownloadAvailablePaymentStatus}
                                                                <a href="{$article.esdLink}" class="btn btn-primary btn-xs">
                                                                    <i class="fa fa-cloud-download mrs"></i> {s name="OrderItemInfoInstantDownload"}{/s}
                                                                </a>
                                                            {/if}
                                                            {if $article.esdarticle && !$offerPosition.cleared|in_array:$sDownloadAvailablePaymentStatus}
                                                                <a href="#" class="btn btn-secondary btn-xs" disabled="disabled">
                                                                    <i class="fa fa-cloud-download fa-lg"></i> {s name="OrderItemInfoInstantDownload"}{/s}
                                                                </a>
                                                            {/if}
                                                        {/block}
                                                    {/block}
                                                </td>
                                                <td>
                                                    {* Order item quantity *}
                                                    {block name='frontend_account_order_item_quantity'}
                                                        {block name='frontend_account_order_item_quantity_label'}{/block}
                                                        {block name='frontend_account_order_item_quantity_value'}
                                                            {$article.quantity}
                                                        {/block}
                                                    {/block}
                                                </td>
                                                <td>
                                                    {* Order item price *}
                                                    {block name='frontend_account_order_item_price'}
                                                        {block name='frontend_account_order_item_price_label'}{/block}
                                                        {block name='frontend_account_order_item_price_value'}
                                                            {if $article.price}
                                                                {if $offerPosition.currency_position == "32"}
                                                                    {$offerPosition.currency_html} {$article.price} *
                                                                {else}
                                                                {$article.price} {$offerPosition.currency_html}*
                                                                {/if}
                                                            {else}
                                                                {s name="OrderItemInfoFree"}{/s}
                                                            {/if}
                                                        {/block}
                                                    {/block}
                                                </td>
                                                <td>
                                                    {* Order item total amount *}
                                                    {block name='frontend_account_order_item_amount'}
                                                        {block name='frontend_account_order_item_amount_label'}{/block}
                                                        {block name='frontend_account_order_item_amount_value'}
                                                            {if $article.amount}
                                                                {$article.amount} {$offerPosition.currency_html}*
                                                            {else}
                                                                {s name="OrderItemInfoFree"}{/s}
                                                            {/if}
                                                        {/block}
                                                    {/block}
                                                </td>
                                            </tr>
                                        {/block}
                                    {/foreach}
                                </tbody>
                            {/block}
                        </table>
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-5">
                            {block name="frontend_account_order_item_detail_info_data"}
                                <dl class="dl-horizontal">
                                    {* Order date *}
                                    {block name="frontend_account_order_item_label_date"}
                                        <dt>{s name="OrderItemColumnDate"}{/s}</dt>
                                    {/block}
                                    {block name='frontend_account_order_item_date'}
                                        <dd>{$offerPosition.datum|date}</dd>
                                    {/block}

                                    {* Order number *}
                                    {block name="frontend_account_order_item_label_ordernumber"}
                                        <dt>{s name="OrderItemColumnId"}{/s}</dt>
                                    {/block}
                                    {block name='frontend_account_order_item_ordernumber'}
                                        <dd>{$offerPosition.ordernumber}</dd>
                                    {/block}

                                    {* Shipping method *}
                                    {block name="frontend_account_order_item_label_dispatch"}
                                        {if $offerPosition.dispatch}
                                            <dt>{s name="OrderItemColumnDispatch"}{/s}</dt>
                                        {/if}
                                    {/block}
                                    {block name='frontend_account_order_item_dispatch'}
                                        {if $offerPosition.dispatch}
                                            <dd>{$offerPosition.dispatch.name}</dd>
                                        {/if}
                                    {/block}

                                    {* Package tracking code *}
                                    {block name="frontend_account_order_item_label_trackingcode"}
                                        {if $offerPosition.trackingcode}
                                            <dt>{s name="OrderItemColumnTracking"}{/s}</dt>
                                        {/if}
                                    {/block}
                                    {block name='frontend_account_order_item_trackingcode'}
                                        {if $offerPosition.trackingcode}
                                            {if $offerPosition.dispatch.status_link}
                                                <dd>
                                                    <a href="{$offerPosition.dispatch.status_link}"
                                                        title="{$offerPosition.dispatch.name}"
                                                        onclick="return !window.open(this.href, 'popup', 'width=500,height=600,left=20,top=20');"
                                                        target="_blank">{$offerPosition.trackingcode}
                                                    </a>
                                                </dd>
                                            {else}
                                                <dd>{$offerPosition.trackingcode}</dd>
                                            {/if}
                                        {/if}
                                    {/block}

                                    {block name="frontend_account_order_item_detail_summary_data"}
                                        {block name="frontend_account_order_item_detail_shipping_costs_label"}
                                            <dt>{s name="OrderItemShippingcosts"}{/s}</dt>
                                        {/block}

                                        {block name="frontend_account_order_item_shippingamount"}
                                            <dd>{$offerPosition.invoice_shipping} {$offerPosition.currency_html}</dd>
                                        {/block}

                                        {block name="frontend_account_order_item_detail_shipping_costs"}
                                            {if $offerPosition.taxfree}
                                                <dt>{s name="OrderItemNetTotal"}{/s}</dt>
                                            {else}
                                                <dt>{s name="OrderItemTotal"}{/s}</dt>
                                            {/if}
                                        {/block}

                                        {block name="frontend_acccount_order_item_amount"}
                                            {if $offerPosition.taxfree}
                                                <dd>{$offerPosition.invoice_amount_net} {$offerPosition.currency_html}</dd>
                                            {else}
                                                <dd>{$offerPosition.invoice_amount} {$offerPosition.currency_html}</dd>
                                            {/if}
                                        {/block}
                                    {/block}
                                </dl>
                            {/block}
                        </div>

                        {if $offerPosition.customercomment || $offerPosition.comment}
                            <div class="col-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">{s name="OrderCommentTitle"}Kommentare zur Bestellung{/s}</div>
                                    <div class="panel-body">
                        {/if}
                                    {* User comment *}
                                    {block name="frontend_account_order_item_user_comment"}
                                        {if $offerPosition.customercomment}
                                            <blockquote>
                                                {block name="frontend_account_order_item_user_comment_content"}
                                                    <p>{$offerPosition.customercomment}</p>
                                                {/block}
                                                {block name="frontend_account_order_item_user_comment_title"}
                                                    <small>{s name="OrderItemCustomerComment"}Ihr Kommentar{/s}</small>
                                                {/block}
                                            </blockquote>
                                        {/if}
                                    {/block}
                                    {* Shop comment *}
                                    {block name="frontend_account_order_item_shop_comment"}
                                        {if $offerPosition.comment}
                                            <blockquote>
                                                {block name="frontend_account_order_item_shop_comment_content"}
                                                    <p>{$offerPosition.comment}</p>
                                                {/block}
                                                {block name="frontend_account_order_item_shop_comment_title"}
                                                    <small>{s name="OrderItemComment"}Unser Kommentar{/s}</small>
                                                {/block}
                                            </blockquote>
                                        {/if}
                                    {/block}
                        {if $offerPosition.customercomment || $offerPosition.comment}
                                    </div>
                                </div>
                            </div>
                        {/if}
                    </div>
                {/block}
            </div>
        </td>
    </tr>
{/block}