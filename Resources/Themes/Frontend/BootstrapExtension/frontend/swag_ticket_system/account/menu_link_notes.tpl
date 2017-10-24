<a href="{url controller='ticket' action='listing'}" class="list-group-item{if {controllerName} == 'ticket' && ({controllerAction} == 'detail' || {controllerAction} == 'listing') }  active{/if}">
    {s name="sTicketSysSupportManagement"}Supportverwaltung{/s}
</a>

<a href="{url controller='ticket' action='request'}" class="list-group-item{if $sAction == 'request'} active{/if}">
    {s name='TicketLinkSupport'}Support-Anfrage{/s}
</a>