{block name="frontend_detail_buy"}
    <form name="sAddToBasket" method="post" action="{url controller=checkout action=addArticle}" class="basketform" data-add-article="true" data-eventName="submit"{if $theme.detailOffcanvasCart} data-showModal="false" data-addArticleUrl="{url controller=checkout action=ajaxAddArticleCart}" data-displayMode="offcanvas"{/if}>
        {block name="frontend_detail_buy_configurator_inputs"}
    		{if $sArticle.sConfigurator&&$sArticle.sConfiguratorSettings.type==3}
    			{foreach from=$sArticle.sConfigurator item=group}
    				<input type="hidden" name="group[{$group.groupID}]" value="{$group.selected_value}" />
    	    	{/foreach}
    		{/if}
        {/block}

        <input type="hidden" name="sActionIdentifier" value="{$sUniqueRand}" />
        <input type="hidden" name="sAddAccessories" id="sAddAccessories" value="" />

        {* @deprecated - Product variants block *}
        {block name='frontend_detail_buy_variant'}{/block}

        <input type="hidden" name="sAdd" value="{$sArticle.ordernumber}" />

        {* Article accessories *}
        {block name="frontend_detail_buy_accessories_outer"}
            {if $sArticle.sAccessories}
                {block name='frontend_detail_buy_accessories'}
                    <div class="accessory_container">
                    {foreach from=$sArticle.sAccessories item=sAccessory}
                        {* Group name *}
                        <h2 class="headingbox">{$sAccessory.groupname}</h2>
                        <div class="accessory_group">
                            {* Group description *}
                            <p class="groupdescription">
                                {$sAccessory.groupdescription}
                            </p>

                            {foreach from=$sAccessory.childs item=sAccessoryChild}
                                <input type="checkbox" class="sValueChanger chkbox" name="sValueChange" id="CHECK{$sAccessoryChild.ordernumber}" value="{$sAccessoryChild.ordernumber}" />
                                <label for="CHECK{$sAccessoryChild.ordernumber}">{$sAccessoryChild.optionname|truncate:35}
                                    ({s name="DetailBuyLabelSurcharge"}{/s}: {$sAccessoryChild.price} {$sConfig.sCURRENCYHTML})
                                </label>

                                <div id="DIV{$sAccessoryChild.ordernumber}" class="accessory_overlay">
                                    {include file="frontend/detail/accessory.tpl" sArticle=$sAccessoryChild.sArticle}
                                </div>
                            {/foreach}
                        </div>
                    {/foreach}
                    </div>
                {/block}
            {/if}
        {/block}

        {$sCountConfigurator=$sArticle.sConfigurator|@count}

        {block name="frontend_detail_buy_button_container_outer"}
            {if (!isset($sArticle.active) || $sArticle.active)}
                {if $sArticle.isAvailable}
                    {block name="frontend_detail_buy_button_container"}
                        <div id="detailCartButton" {if $NotifyHideBasket && $sArticle.notification && $sArticle.instock < $sArticle.minstock}class="hidden"{/if}>
                            {* Quantity selection *}
                            {block name='frontend_detail_buy_quantity'}
                                {$maxQuantity=$sArticle.maxpurchase+1}
                                {if $sArticle.laststock && $sArticle.instock < $sArticle.maxpurchase}
                                    {$maxQuantity=$sArticle.instock+1}
                                {/if}

                                {block name='frontend_detail_buy_quantity_select'}
                                    <select id="sQuantity" name="sQuantity" class="form-control">
                                        {section name="i" start=$sArticle.minpurchase loop=$maxQuantity step=$sArticle.purchasesteps}
                                            <option value="{$smarty.section.i.index}">{$smarty.section.i.index}{if $sArticle.packunit} {$sArticle.packunit}{/if}</option>
                                        {/section}
                                    </select>
                                {/block}
                            {/block}

                            {* "Buy now" button *}
                            {block name='frontend_detail_buy_button'}
                                {if $sArticle.sConfigurator && !$activeConfiguratorSelection}
                                    <button class="mtm btn btn-primary btn-block buybox-button" 
                                            title="{s name="DetailBuySelectConfig"}Bitte wählen Sie eine Ausführung{/s}" 
                                            name="{s name="DetailBuyActionAddName"}{/s}" 
                                            disabled="disabled">{s name="DetailBuySelectConfig"}Bitte wählen Sie eine Ausführung{/s}</button>
                                {else}
                                    <button class="mtm btn btn-primary btn-block buybox-button" 
                                            title="{$sArticle.articleName|htmlentities} {s name='DetailBuyActionAddName'}{/s}"
                                            name="{s name="DetailBuyActionAddName"}{/s}">
                                        {s name="DetailBuyActionAdd"}{/s}
                                    </button>
                                {/if}
                            {/block}
                        </div>
                    {/block}
                {/if}
            {/if}
        {/block}
	</form>
{/block}