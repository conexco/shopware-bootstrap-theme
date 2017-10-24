{namespace name="frontend/detail/option"}

{literal}
    <script id="overview-template" type="text/x-handlebars-template">
        <div class="panel panel-default custom-products-surcharges mtl">
            <div class="panel-body">
                <div class="panel-header mbs">
                    <strong>{/literal}{s name="detail/overview/surcharge_price"}{/s}{literal}</strong>
                </div>
                <div class="row custom-products-overview-list custom-products-list-surcharges mbm">
                    <div class="col-xs-7">{/literal}{s name="detail/overview/base_price"}{/s}{literal}</div>
                    <div class="col-xs-5 text-right custom-products-overview-price">{{formatPrice basePrice}}</div>

                    {{#surcharges}}
                        {{#if hasParent}}
                            &emsp;
                        {{/if}}
                        <div class="col-xs-7 custom-products-overview-name">{{name}}</div>
                        <div class="col-xs-5 text-right custom-products-overview-price">{{formatPrice price}}</div>
                    {{/surcharges}}

                    <div class="col-xs-7">{/literal}{s name="detail/overview/total_surcharges"}{/s}{literal}</div>
                    <div class="col-xs-5 text-right custom-products-overview-price"><strong>{{formatPrice totalUnitPrice}}</strong></div>
                </div>

                <div class="panel-header mbs">
                    <strong>{/literal}{s name="detail/overview/once_price"}{/s}{literal}</strong>
                </div>
                <div class="row custom-products-overview-list custom-products-list-once mbm">
                    {{#onceprices}}
                        {{#if hasParent}}
                            &emsp;
                        {{/if}}
                        <div class="col-xs-7 custom-products-overview-name">{{name}}</div>
                        <div class="col-xs-5 text-right custom-products-overview-price">{{formatPrice price}}</div>
                    {{/onceprices}}

                    <div class="col-xs-7">{/literal}{s name="detail/overview/total_once"}{/s}{literal}</div>
                    <div class="col-xs-5 text-right custom-products-overview-price"><strong>{{formatPrice totalPriceOnce}}</strong></div>
                </div>

                <div class="panel-header mbs">
                    <strong>{/literal}{s name="detail/overview/price_total"}{/s}{literal}</strong>
                </div>
                <div class="row custom-products-overview-list custom-products-list-once">
                    <div class="col-xs-7">{/literal}{s name="detail/overview/total_price"}{/s}{literal}</div>
                    <div class="col-xs-5 text-right custom-products-overview-price"><strong>{{formatPrice total}}</strong></div>
                </div>
            </div>    
        </div>
    </script>
{/literal}
