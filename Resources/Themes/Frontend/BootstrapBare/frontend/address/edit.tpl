{extends file="frontend/address/index.tpl"}
{namespace name="frontend/address/index"}

{* Breadcrumb *}
{block name="frontend_index_start"}
    {$smarty.block.parent}
    {$sBreadcrumb[] = ["name" => "{s name="AddressesTitleEdit"}Change address{/s}", "link" => {url id=$formData.id}]}
{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div class="account-address-edit" data-register="true">

        {* Address headline *}
        {block name="frontend_address_form_headline"}
            <h1>{s name="AddressesTitleEdit"}{/s}</h1>
        {/block}

        {block name="frontend_address_form_content"}
            {if $sTarget}
                {$url={url controller=address action=edit id=$formData.id sTarget=$sTarget sTargetAction=$sTargetAction}}
            {else}
                {$url={url controller=address action=edit id=$formData.id}}
            {/if}
            <form name="frmAddresses" method="post" action="{$url}">
                {include file="frontend/address/form.tpl" formAction="{$url}"}
            </form>
        {/block}
    </div>
{/block}