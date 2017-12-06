{block name='frontend_checkout_premium_body'}
    {if $sPremiums|@count}
        <div class="panel panel-default">
            <div class="panel-body">
                {* Headline *}
                {block name='frontend_checkout_cart_premium_headline'}
                    <legend>{s name="sCartPremiumsHeadline"}Bitte w&auml;hlen Sie zwischen den folgenden Pr&auml;mien{/s}</legend>
                {/block}

                {* Premium articles *}
                {block name='frontend_checkout_premium_slider'}
                    <div class="row" data-equalheight="true">
                        {block name='frontend_checkout_premium_slider_container'}
                            {foreach from=$sPremiums item=premium key=key}
                                {block name='frontend_checkout_premium_slider_item'}
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="panel {if $premium.available}panel-primary{else}panel-default{/if}" data-ordernumber="{$premium.sArticle.ordernumber}">
                                            <div class="panel-body">
                                                <div class="item-wrapper" data-equal="item">
                                                    {* Product image *}
                                                    {block name='frontend_checkout_premium_image'}
                                                        <div class="image-wrapper" data-equal="image">
                                                            {block name='frontend_checkout_premium_bonus_price'}
                                                                <div class="label-container">
                                                                    {if $premium.available}
                                                                        <span class="label label-success img-label">{s name="PremiumInfoFreeProduct"}Gratis: Jetzt Pr&auml;mie sichern{/s}</span>
                                                                    {else}
                                                                        <span class="label label-default img-label">{s name="PremiumsInfoAtAmount"}{/s} {$premium.startprice|currency} {s name="PremiumsInfoDifference"}{/s} {$premium.sDifference|currency}</span>
                                                                    {/if}
                                                                </div>
                                                            {/block}
                                                            {block name='frontend_checkout_premium_image_element'}
                                                                {if $premium.sArticle.image.thumbnails}
                                                                    <img srcset="{$premium.sArticle.image.thumbnails[0].sourceSet}"
                                                                         class="img-fluid img-center"
                                                                         alt="{$premium.sArticle.articleName|escape}" />
                                                                {else}
                                                                    <img src="{link file='frontend/_public/src/img/no-picture.png'}"
                                                                         class="img-fluid img-center"
                                                                         alt="{"{s name="PremiumInfoNoPicture"}{/s}"|escape}">
                                                                {/if}
                                                            {/block}
                                                        </div>
                                                    {/block}

                                                    {block name='frontend_checkout_premium_article_name'}
                                                        <div class="title-wrapper mbs" data-equal="title">
                                                            <a href="{$premium.sArticle.linkDetails}" title="{$premium.sArticle.articleName}">{$premium.sArticle.articleName}</a>
                                                        </div>
                                                    {/block}

                                                    {if $premium.available}
                                                        {block name='frontend_checkout_premium_form'}
                                                            <form action="{url action='addPremium' sTargetAction=$sTargetAction}" method="post" id="sAddPremiumForm{$key}" name="sAddPremiumForm{$key}">
                                                                {block name='frontend_checkout_premium_select_article'}
                                                                    <div class="pseudo-wrapper" data-equal="pseudo">
                                                                        {if $premium.sVariants && $premium.sVariants|@count > 1}
                                                                            <select id="sAddPremium{$key}" name="sAddPremium" class="form-control">
                                                                                <option value="">{s name="PremiumInfoSelect"}{/s}</option>
                                                                                {foreach from=$premium.sVariants item=variant}
                                                                                    <option value="{$variant.ordernumber}">{$variant.additionaltext}</option>
                                                                                {/foreach}
                                                                            </select>
                                                                        {else}
                                                                            <input type="hidden" name="sAddPremium" value="{$premium.sArticle.ordernumber}"/>
                                                                        {/if}
                                                                    </div>
                                                                    <button type="submit" class="btn btn-primary btn-block mtm" title="{$premium.sArticle.articleName}">
                                                                        {s name='PremiumActionAdd'}{/s}
                                                                    </button>
                                                                {/block}
                                                            </form>
                                                        {/block}
                                                    {else}
                                                        <button type="submit" disabled="disabled" class="btn btn-primary btn-block mtm" title="{$premium.sArticle.articleName}">
                                                            {s name='PremiumActionAdd'}{/s}
                                                        </button>
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {/block}
                            {/foreach}
                        {/block}
                    </div>
                {/block}
            </div>
        </div>
    {/if}
{/block}