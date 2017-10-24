{namespace name="frontend/detail/abo_commerce_detail"}

{* price separation popup arrow  *}
{block name='abo_commerce_price_separation_popup_arrow'}
	<a href="#" class="abo-delivery-info-icon mls sw5-plugin" data-trigger="hover" data-minwidth="300">
        <i class="fa fa-info-circle"></i>
	</a>
{/block}

{* price separation popup content *}
{block name='abo_commerce_price_separation_popup_inner'}
    {block name='abo_commerce_price_separation_popup_content'}
        <div class="abo-price-separation-popup hidden">
            <table>
                {block name='abo_commerce_price_separation_popup_table_head'}
                    <thead>
                        <tr>
                            {block name='abo_commerce_price_separation_popup_table_head_durationl'}
                                <th>{s name="AboCommercePriceSeparationDuration"}Laufzeit{/s}</th>
                            {/block}

                            {block name='abo_commerce_price_separation_popup_table_head_discount'}
                                <th>{s name="AboCommercePriceSeparationRebate"}Rabatt (in {'0'|currency|regex_replace:'/[0-9\,\.]/':''}){/s}</th>
                            {/block}
                        </tr>
                    </thead>
                {/block}

                {block name='abo_commerce_price_separation_popup_table_content'}
                    <tbody>
                        {foreach $aboCommerce.prices as $price}

                            {block name='abo_commerce_price_separation_popup_table_content_exclusion'}
                                {if $price@first === true && $price.discountAbsolute == 0}
                                    {continue}
                                {/if}
                            {/block}

                            {block name='abo_commerce_price_separation_popup_table_content_data_row'}
                                <tr>

                                    {block name='abo_commerce_price_separation_popup_table_content_data_row_duration'}
                                        <td>
                                            {s name="AboCommercePriceSeparationFrom"}ab{/s} {$price.duration}
                                            {if $aboCommerce.durationUnit == 'months'}
                                                {s name="AboCommercePriceSeparationMonths"}Monat(e){/s}
                                            {else}
                                                {s name="AboCommercePriceSeparationWeeks"}Woche(n){/s}
                                            {/if}
                                        </td>
                                    {/block}

                                    {block name='abo_commerce_price_separation_popup_table_content_data_row_discount'}
                                        <td>
                                            <strong>{$price.discountAbsolute|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}</strong>
                                        </td>
                                    {/block}
                                </tr>
                            {/block}
                        {/foreach}
                    </tbody>
                {/block}
            </table>
        </div>
    {/block}
{/block}