{block name="frontend_account_order_item_overview_row"}
    <tr class="{if $offerPosition.status==0 || $offerPosition.status==1}info{elseif $offerPosition.status==3 || $offerPosition.status==5 || $offerPosition.status==6 || $offerPosition.status==8}warning{elseif $offerPosition.status==2 || $offerPosition.status==7}success{elseif $offerPosition.status==4}error{/if}">
        {* Order date *}
        {block name="frontend_account_order_item_date"}
            <td>
                {block name="frontend_account_order_item_date_label"}{/block}
                {block name="frontend_account_order_item_date_value"}
                    {$offerPosition.datum|date}
                {/block}
            </td>
        {/block}

        {* Order id *}
        {block name="frontend_account_order_item_number"}
            <td class="d-none d-sm-block">
                {block name="frontend_account_order_item_number_label"}{/block}
                {block name="frontend_account_order_item_number_value"}
                    {$offerPosition.ordernumber}
                {/block}
            </td>
        {/block}

        {* Dispatch type *}
        {block name="frontend_account_order_item_dispatch"}
            <td>
                {block name="frontend_account_order_item_dispatch_label"}{/block}
                {block name="frontend_account_order_item_dispatch_value"}
                    {if $offerPosition.dispatch.name}
                        {$offerPosition.dispatch.name}
                    {else}
                        {s name="OrderInfoNoDispatch"}{/s}
                    {/if}
                {/block}
            </td>
        {/block}

        {* Order status *}
        {block name="frontend_account_order_item_status"}
            <td>
                {block name="frontend_account_order_item_status_label"}{/block}
                {block name="frontend_account_order_item_status_value"}
                    {if $offerPosition.status==0}
                        {s name="OrderItemInfoNotProcessed"}{/s}
                    {elseif $offerPosition.status==1}
                        {s name="OrderItemInfoInProgress"}{/s}
                    {elseif $offerPosition.status==2}
                        {s name="OrderItemInfoCompleted"}{/s}
                    {elseif $offerPosition.status==3}
                        {s name="OrderItemInfoPartiallyCompleted"}{/s}
                    {elseif $offerPosition.status==4}
                        {s name="OrderItemInfoCanceled"}{/s}
                    {elseif $offerPosition.status==5}
                        {s name="OrderItemInfoReadyForShipping"}{/s}
                    {elseif $offerPosition.status==6}
                        {s name="OrderItemInfoPartiallyShipped"}{/s}
                    {elseif $offerPosition.status==7}
                        {s name="OrderItemInfoShipped"}{/s}
                    {elseif $offerPosition.status==8}
                        {s name="OrderItemInfoClarificationNeeded"}{/s}
                    {/if}
                {/block}
            </td>
        {/block}

        {* Order actions *}
        {block name="frontend_account_order_item_actions"}
            <td>
                <div class="d-none d-sm-block">
                    <a class="btn btn-xs btn-outline-secondary btn-block mbs" title="{s name='OrderActionSlide'}{/s} {$offerPosition.ordernumber}" data-toggle="collapse" data-target="#order{$offerPosition.ordernumber}">{s name="OrderActionSlide"}{/s}</a>
                </div>
                <div class="d-sm-none">
                    <a class="btn btn-xs btn-outline-secondary btn-block mbs" title="{s name='OrderActionSlide'}{/s} {$offerPosition.ordernumber}" data-toggle="collapse" data-target="#order{$offerPosition.ordernumber}">{s name="OrderActionSlide"}{/s}</a>
                </div>
                {* Repeat order *}
                {block name="frontend_account_order_item_repeat_order"}
                    <form method="post" action="{url controller='checkout' action='add_accessories'}">
                        {foreach from=$offerPosition.details item=article}{if $article.modus == 0}
                            <input name="sAddAccessories[]" type="hidden" value="{$article.articleordernumber|escape}"/>
                            <input name="sAddAccessoriesQuantity[]" type="hidden" value="{$article.quantity|escape}"/>
                        {/if}{/foreach}

                        {block name="frontend_account_order_item_repeat_button"}
                            <div class="d-none d-sm-block">
                                <input type="submit" class="btn btn-xs btn-primary btn-block" value="{s name='OrderLinkRepeat'}{/s}"/>
                            </div>
                            <div class="d-sm-none">
                                <input type="submit" class="btn btn-xs btn-primary btn-block" value="{s name='OrderLinkRepeat'}{/s}" style="white-space:normal !important; word-wrap:break-word;"/>
                            </div>
                        {/block}
                    </form>
                {/block}
            </td>
        {/block}
    </tr>
{/block}

{* Order details *}
{block name="frontend_account_order_item_detail"}
    {include file="frontend/account/order_item_details.tpl"}
{/block}
