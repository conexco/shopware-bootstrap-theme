{if $partnerId}
    {*Partner Statistic Menu Item*}
    <a href="{url controller="account" action="partnerStatistic"}" 
       class="list-group-item list-group-item-action">
        {s name="AccountLinkPartnerStatistic" namespace="frontend/account/sidebar"}{/s}
    </a>
{/if}