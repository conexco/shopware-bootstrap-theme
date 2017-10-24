{* Delivery informations *}
{block name='frontend_widgets_delivery_infos'}
    {if $sArticle.shippingfree}
        <p class="text-success">
            <strong><i class="fa fa-check"></i> {s name="DetailDataInfoShippingfree"}{/s}</strong>
        </p>
    {/if}
    {if isset($sArticle.active)&&!$sArticle.active}
        <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
        <p class="text-warning">
            <small>{s name="DetailDataInfoNotAvailable"}{/s}</small>
        </p>
    {elseif $sArticle.sReleaseDate && $sArticle.sReleaseDate|date_format:"%Y%m%d" > $smarty.now|date_format:"%Y%m%d"}
        <link itemprop="availability" href="http://schema.org/PreOrder" />
        <p class="text-warning">
            <small>{s name="DetailDataInfoShipping"}{/s} {$sArticle.sReleaseDate|date:'date_long'}</small>
        </p>
    {elseif $sArticle.esd}
        <link itemprop="availability" href="http://schema.org/InStock" />
        <p class="text-success">
            <small>{s name="DetailDataInfoInstantDownload"}{/s}</small>
        </p>
    {elseif {config name="instockinfo"} && $sArticle.modus == 0 && $sArticle.instock > 0 && $sArticle.quantity > $sArticle.instock}
        <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
        <p class="text-info">
            <small>{s name="DetailDataInfoPartialStock"}{/s}</small>
        </p>
    {elseif $sArticle.instock >= $sArticle.minpurchase}
        <link itemprop="availability" href="http://schema.org/InStock" />
        <p class="text-success">
            <small>{s name="DetailDataInfoInstock"}{/s}</small>
        </p>
    {elseif $sArticle.shippingtime}
        <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
        <p class="text-warning">
            <small>{s name="DetailDataShippingtime"}{/s} {$sArticle.shippingtime} {s name="DetailDataShippingDays"}{/s}</small>
        </p>
    {else}
        <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
        <p class="text-danger">
            <small>{s name="DetailDataNotAvailable"}{config name=notavailable}{/s}</small>
        </p>
    {/if}
{/block}
