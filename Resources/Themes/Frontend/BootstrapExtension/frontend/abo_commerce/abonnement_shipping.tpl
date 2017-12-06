{block name="frontend_account_abonnement_shipping"}
    <tr>
        <h5>{s name="ShippingAddress" namespace="frontend/abo_commerce/orders"}Shipping address:{/s}</h5>
        {block name="frontend_account_abonnement_shipping_values"}
            {if !empty($order.shipping.company)}
                {$order.shipping.company}<br/><br/>
            {/if}

            {$order.shipping.firstName} {$order.shipping.lastName}<br/>
            {$order.shipping.street}<br/>
            {if !empty($order.shipping.additionalAddressLine1)}
                {$order.shipping.additionalAddressLine1}<br/>
            {/if}
            {if !empty($order.shipping.additionalAddressLine2)}
                {$order.shipping.additionalAddressLine2}<br/>
            {/if}
            {$order.shipping.zip} {$order.shipping.city}<br/>
            {$order.shipping.country}<br/>
            <a class="btn btn-secondary right mvm" href="{url controller=address action=edit id=$order.shipping.fallbackId orderId=$order.lastOrder.id}">{s name="ChangeShippingAddress" namespace="frontend/abo_commerce/index"}Change shipping address{/s}</a>
            <br>
        {/block}
    </tr>
{/block}