{extends file="parent:b2bessentials/psregisterfinished.tpl"}

{* content *}
{block name='frontend_index_content'}

	{block name='business_essentials_confirm'}
		{block name='business_essentials_confirm_panel_header'}
			<h2>{s name="PrivateRegisterConfirmHeader" namespace="frontend/account/login"}{/s}</h2>
		{/block}

		{block name='business_essentials_confirm_panel_body'}
			{block name='business_essentials_confirm_message'}
				{include file="frontend/_includes/messages.tpl" type="info" content="{s name="PrivateRegisterConfirmMessage" namespace="frontend/account/login"}{/s}"}
			{/block}

			{block name='business_essentials_confirm_link'}
				<a href="{url controller='index' action='index'}" class="btn btn-secondary">
					{block name='business_essentials_confirm_link_icon'}
						{s name="AccountLogoutButton" namespace="frontend/account/ajax_logout"}Zurück{/s}
					{/block}
				</a>
			{/block}
		{/block}
	{/block}
{/block}

{* footer *}
{block name='frontend_index_footer'}
    {if !$privateRegister || $privateShoppingConfig['unlockAfterRegister']}
        {$smarty.block.parent}
    {else}
        {block name='frontend_index_register_footer'}
            {include file='frontend/index/footer.tpl'}
        {/block}
    {/if}
{/block}