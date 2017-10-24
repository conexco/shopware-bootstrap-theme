{namespace name="frontend/detail/abo_commerce_detail"}

{block name='abo_commerce_abo_selection_delivery_duration'}
	{block name='abo_commerce_abo_selection_delivery_duration_label'}
		<label for="duration-interval">{s name="AboCommerceIntervalSelectDuration"}Laufzeit:{/s}</label>
	{/block}
{/block}

{block name='abo_commerce_abo_selection_delivery_duration_select'}
	<div class="abo-duration-interval-select mbl">
		<select name="duration-interval" class="abo-duration-interval sw5-plugin">
			{for $durationInterval=$aboCommerce.minDuration to $aboCommerce.maxDuration}
				{block name="abo_commerce_abo_selection_delivery_duration_select_option"}
					<option value="{$durationInterval}">
						{$durationInterval}&nbsp;
						{if $aboCommerce.durationUnit == "weeks"}
							{s name="AboCommerceIntervalSelectWeeks"}Woche(n){/s}
						{else}
							{s name="AboCommerceIntervalSelectMonths"}Monat(e){/s}
						{/if}{/strip}
					</option>
				{/block}
			{/for}
		</select>
	</div>
{/block}