{if $partnerId}
    {*Partner Statistic Menu Item*}
    <a href="{url controller="account" action="partnerStatistic"}" class="list-group-item">
        {s name="AccountLinkPartnerStatistic" namespace="frontend/account/sidebar"}{/s}
    </a>
{/if}