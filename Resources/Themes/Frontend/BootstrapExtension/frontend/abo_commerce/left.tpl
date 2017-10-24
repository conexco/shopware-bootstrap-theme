{namespace name="frontend/abo_commerce/left"}

{block name="frontend_abo_abo_commerce_left"}
	{block name="frontend_abo_abo_commerce_left_main"}
		<div class="panel panel-default abo-sidebar">

			{block name="frontend_abo_abo_commerce_left_main_headline"}
                <div class="panel-heading">
                    <h4 class="panel-title">{$aboCommerceSettings.sidebarHeadline}</h4>
                </div>
			{/block}

			{block name="frontend_abo_abo_commerce_left_main_text"}
                <div class="panel-body">
					{$aboCommerceSettings.sidebarText}
				</div>
			{/block}

			{block name="frontend_abo_abo_commerce_left_main_image"}{/block}
		</div>
	{/block}

	{block name="frontend_abo_abo_commerce_left_sharing"}
		{if $aboCommerceSettings.sharingGoogle || $aboCommerceSettings.sharingFacebook || $aboCommerceSettings.sharingTwitter || $aboCommerceSettings.sharingMail}
            <div class="panel panel-default abo-sidebar abo-share">
				{block name="frontend_abo_abo_commerce_left_sharing_headline"}
                    <div class="panel-heading">
                        <h4 class="panel-title">{s namespace="frontend/abo_commerce/right" name="AboCommerceSidebarShareWithFriends"}Mit Freunden teilen{/s}</h4>
                    </div>
				{/block}

				{block name="frontend_abo_abo_commerce_left_sharing_content"}
                    <div class="panel-body">
						{if $aboCommerceSettings.sharingGoogle}
							{block name="frontend_abo_abo_commerce_left_sharing_googleplus"}
								<a class="mrm" href="https://plus.google.com/share?url={"{url action='index'}"|escape:url}" target="_blank" rel="nofollow" title="{"{s name="AboCommerceSidebarShareGooglePlus"}Auf Google+ sharen{/s}"|escape}">
                                    <i class="fa fa-google-plus"></i>
                                </a>
							{/block}
						{/if}

						{if $aboCommerceSettings.sharingFacebook}
							{block name="frontend_abo_abo_commerce_left_sharing_facebook"}
								<a class="mrm" href="http://www.facebook.com/share.php?u={"{url action='index'}"|escape:url}" target="_blank" rel="nofollow" title="{"{s name="AboCommerceSidebarShareFacebook"}Auf Facebook sharen{/s}"|escape}">
                                    <i class="fa fa-facebook"></i>
                                </a>
							{/block}
						{/if}

						{if $aboCommerceSettings.sharingTwitter}
							{block name="frontend_abo_abo_commerce_right_sharing_twitter"}
								<a class="mrm" href="http://twitter.com/home?status={"{url action='index'}"|escape:url}" target="_blank" rel="nofollow" title="{"{s name="AboCommerceSidebarShareTwitter"}Auf Twitter sharen{/s}"|escape}">
                                    <i class="fa fa-twitter"></i>
                                </a>
							{/block}
						{/if}

						{if $aboCommerceSettings.sharingMail}
							{block name="frontend_abo_abo_commerce_right_sharing_Mail"}
								<a class="mrm" href="mailto:?subject={"{s namespace="frontend/abo_commerce/right" name='AboCommerceSidebarMailSubject'}Sparen mit Spar-Abo's{/s}"|escape:url}&body={"{url action='index'}"|escape:url}" title="{"{s namespace="frontend/abo_commerce/right" name="AboCommerceSidebarShareMail"}Per Mail verschicken{/s}"|escape}">
                                    <i class="fa fa-envelope"></i>
                                </a>
							{/block}
						{/if}
					</div>
				{/block}
			</div>
		{/if}
	{/block}
{/block}
