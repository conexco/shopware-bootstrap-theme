<strong>
	{$sBasketItem.articlename}
	{if $sBasketItem.required_points}
		{s namespace="frontend/checkout/cart" name="CartTitleForBonusPoints"}f&uuml;r {$sBasketItem.required_points} Punkte{/s}
	{/if}
</strong>