<header class="p-3 border-bottom">

	{* Hide top bar navigation *}
	{block name='frontend_index_top_bar_container'}{/block}
	<div class="container">
		{* Logo container *}
		{block name='frontend_index_logo_container'}
			<div class="row">

				{* Main shop logo *}
				{block name='frontend_index_logo'}
					<div class="col-6 col-md-3 pl-0">
						<a href="{url controller='index'}" title="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}">
	                        <img src="{link file=$theme.desktopLogo}" alt="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}" class="img-fluid d-none d-md-block"/>
	                        <img src="{link file=$theme.mobileLogo}" alt="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}" class="img-fluid d-md-none mx-auto mbm"/>
	                    </a>
					</div>
				{/block}

				{*<div class="col-12 col-sm-9 col-lg-10">*}
					{*<div class="row">*}
						<div class="col-md-6 d-none d-md-block">
							{* Support Info *}
							{block name='frontend_index_logo_supportinfo'}
								{s name='RegisterSupportInfo' namespace='frontend/register/index'}{/s}
							{/block}
						</div>
						<div class="col-6 col-md-3 text-right pr-0 d-flex align-items-center flex-row justify-content-end">
							{* Trusted Shops *}
							{block name='frontend_index_logo_trusted_shops'}
								{if $theme.checkoutHeader}
							        <a href="{url controller='index'}"
							           class="btn btn-outline-secondary btn-sm text-right"
							           title="{"{s name='FinishButtonBackToShop' namespace='frontend/checkout/finish'}{/s}"|escape}">
							            {s name="FinishButtonBackToShop" namespace="frontend/checkout/finish"}{/s}
							        </a>
							    {/if}
							{/block}
						</div>
					{*</div>*}
				{*</div>*}
			</div>
		{/block}

		{* Hide Shop navigation *}
		{block name='frontend_index_shop_navigation'}{/block}
	</div>
</header>

{* Hide Maincategories navigation top *}
{block name='frontend_index_navigation_categories_top'}{/block}
