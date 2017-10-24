{block name='frontend_liveshopping_charge_counter_inner'}
	{* Charge icon *}
	{block name='frontend_liveshopping_charge_counter_icon'}
        {if $liveShopping.type === 2}
            <span>-</span>
        {elseif $liveShopping.type === 3}
            <span>+</span>
        {/if}
	{/block}

	{* Charge price *}
	{block name='frontend_liveshopping_charge_counter_price'}
		<span>{$liveShopping.perMinute|currency}</span>
	{/block}

	{* Charge price spacer *}
	{block name='frontend_liveshopping_charge_counter_spacer'}
		<span>{s name='sLivePriceSpacer' namespace="frontend/live_shopping/main"}{/s}</span>
	{/block}

	{* Charge price seconds *}
	{block name='frontend_liveshopping_charge_counter_seconds'}
        <span class="liveshopping-seconds sw5-plugin">
			{$liveShopping.remaining.seconds}
		</span>
		<span>{s name="sLiveSecondsShort" namespace="frontend/live_shopping/main"}{/s}</span>
	{/block}
{/block}
