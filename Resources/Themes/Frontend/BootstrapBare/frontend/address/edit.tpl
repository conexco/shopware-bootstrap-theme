{extends file="frontend/address/index.tpl"}
{namespace name="frontend/address/index"}

{* Breadcrumb *}
{block name="frontend_index_start" append}
    {$sBreadcrumb[] = ["name"=>"{s name="AddressesTitleEdit"}Change address{/s}", "link"=>{url id=$formData.id}]}
{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div class="card mb-4 account-address-edit" data-register="true">

        {* Address headline *}
        {block name="frontend_address_form_headline"}
            <h1 class="card-header bg-transparent">{s name="AddressesTitleEdit"}{/s}</h1>
        {/block}

        {block name="frontend_address_form_content"}
            {if $sTarget}
                {$url={url controller=address action=edit id=$formData.id sTarget=$sTarget sTargetAction=$sTargetAction}}
            {else}
                {$url={url controller=address action=edit id=$formData.id}}
            {/if}
            <div class="card-body">
                <form name="frmAddresses" method="post" action="{$url}">
                    {include file="frontend/address/form.tpl" formAction="{$url}"}
                </form>
            </div>
        {/block}
    </div>
{/block}