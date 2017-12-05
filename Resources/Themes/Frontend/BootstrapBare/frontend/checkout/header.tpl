<header class="header-main">

	{* Hide top bar navigation *}
	{block name='frontend_index_top_bar_container'}{/block}
	<div class="container container-hd-height header-mini-border">
		{* Logo container *}
		{block name='frontend_index_logo_container'}
			<div class="row row-hd-height">

				{* Main shop logo *}
				{block name='frontend_index_logo'}
					<div class="col-xs-12 col-hd-3 col-md-3 col-lg-2 col-hd-height col-middle">
						<a href="{url controller='index'}" title="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}">
	                        <img src="{link file=$theme.desktopLogo}" alt="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}" class="img-responsive hidden-xs hidden-sm"/>
	                        <img src="{link file=$theme.mobileLogo}" alt="{"{config name=shopName}"|escapeHtml} - {"{s name='IndexLinkDefault'}{/s}"|escape}" class="img-responsive d-block d-sm-none d-md-none center-block mbm"/>
	                    </a>
					</div>
				{/block}

				<div class="col-xs-12 col-hd-9 col-md-9 col-lg-10 col-hd-height col-middle">
					<div class="row">
						<div class="col-hd-8 col-md-offset-2 col-md-6 col-lg-offset-3 hidden-xs hidden-sm">
							{* Support Info *}
							{block name='frontend_index_logo_supportinfo'}
								{s name='RegisterSupportInfo' namespace='frontend/register/index'}{/s}
							{/block}
						</div>
						<div class="col-hd-4 col-lg-3 text-right">
							{* Trusted Shops *}
							{block name='frontend_index_logo_trusted_shops'}
								{if $theme.checkoutHeader}
							        <a href="{url controller='index'}"
							           class="btn btn-default btn-sm"
							           title="{"{s name='FinishButtonBackToShop' namespace='frontend/checkout/finish'}{/s}"|escape}">
							            {s name="FinishButtonBackToShop" namespace="frontend/checkout/finish"}{/s}
							        </a>
							    {/if}
							{/block}
						</div>
					</div>
				</div>
			</div>
		{/block}

		{* Hide Shop navigation *}
		{block name='frontend_index_shop_navigation'}{/block}
	</div>
</header>

{* Hide Maincategories navigation top *}
{block name='frontend_index_navigation_categories_top'}{/block}
