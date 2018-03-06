{extends file='frontend/account/index.tpl'}

{block name="frontend_index_header_javascript_jquery"}
    {$smarty.block.parent}
    {* Configuration of the partner chart *}
    jQuery.partnerChart =  {ldelim}
        'timeUnit': '{s name='PartnerStatisticLabelTimeUnit'}{/s}',
        'netAmountLabel': '{s name='PartnerStatisticLabelNetTurnover'}{/s}'
    {rdelim};

    jQuery.datePickerRegional = {ldelim}
        closeText: "{s name='PartnerDatePickerCloseText'}{/s}",
        prevText: "{s name='PartnerDatePickerPrevText'}{/s}",
        nextText: "{s name='PartnerDatePickerNextText'}{/s}",
        currentText: "{s name='PartnerDatePickerCurrentText'}{/s}",
        monthNames: [{s name='PartnerDatePickerMonthNames'}{/s}],
        monthNamesShort: [{s name='PartnerDatePickerMonthShortNames'}{/s}],
        dayNames: [{s name='PartnerDatePickerDayNames'}{/s}],
        dayNamesShort: [{s name='PartnerDatePickerDayShortNames'}{/s}],
        dayNamesMin: [{s name='PartnerDatePickerDayMinNames'}{/s}],
        weekHeader: "{s name='PartnerDatePickerWeekHeader'}{/s}",
        dateFormat: "{s name='PartnerDatePickerDateFormat'}{/s}",
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: "",
        showOn: "button",
        buttonText:"",
        onSelect: function (dateText, inst) {ldelim}
            $(this).parents('form').submit();
        {rdelim}
    {rdelim};

    $('*[data-datepicker="true"]').datepicker(jQuery.datePickerRegional);
{/block}

{block name="frontend_index_header_javascript_jquery_lib"}
    {$smarty.block.parent}
    <script type="text/javascript" src="{link file='frontend/_public/vendors/js/raphael/raphael.js'}"></script>
    <script type="text/javascript" src="{link file='frontend/_public/vendors/js/raphael/popup.js'}"></script>
    <script type="text/javascript" src="{link file='frontend/_public/vendors/js/raphael/analytics.js'}"></script>
{/block}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {$smarty.block.parent}
    {$sBreadcrumb[] = ['name' => "{s name='Provisions'}{/s}", 'link' => {url}]}
{/block}

{* Main content *}
{block name='frontend_index_content'}

    {* Welcome text *}
    {block name="frontend_account_orders_welcome"}
        {block name="frontend_account_orders_welcome_headline"}
            <h1>{s name="PartnerStatisticHeader"}{/s}</h1>
        {/block}
    {/block}

    {block name='frontend_account_partner_statistic_listing_actions_top'}
        {block name="frontend_account_partner_statistic_listing_date"}
            <form class="form-horizontal" method="post" action="{url controller='account' action='partnerStatistic'}" role="form">
                <div class="form-group">
                    <label for="datePickerFrom" class="col-md-1 control-label">{s name='PartnerStatisticLabelFromDate'}{/s}</label>

                    <div class="col-md-3">
                        <div class="input-group">
                            <input id="datePickerFrom" data-datepicker="true" class="datePicker form-control" name="fromDate" type="text" value="{$partnerStatisticFromDate}"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="datePickerTo" class="col-md-1 control-label">{s name='PartnerStatisticLabelToDate'}{/s}</label>

                    <div class="col-md-3">
                        <div class="input-group">
                            <input id="datePickerTo" data-datepicker="true" class="datePicker form-control" name="toDate" type="text" value="{$partnerStatisticToDate}"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-1 col-md-1">
                        <button type="submit" class="btn btn-default">{s name="PartnerStatisticSubmitFilter"}{/s}</button>
                    </div>
                </div>
            </form>
        {/block}
    {/block}

    {if !$sPartnerOrders}
        {block name="frontend_account_partner_statistic_info_empty"}
            {include file="frontend/_includes/messages.tpl" type="info" content="{s name='PartnerStatisticInfoEmpty'}{/s}"}
        {/block}
    {else}
        <table class="table" id="data">
            <tbody>
            <tr>
                {foreach from=$sPartnerOrderChartData item=chartItem}
                    <td>{$chartItem.netTurnOver}</td>
                {/foreach}
            </tr>
            </tbody>
            <tfoot>
            <tr>
                {foreach from=$sPartnerOrderChartData item=chartItem}
                    <th>{$chartItem.timeScale}</th>
                {/foreach}
            </tr>
            </tfoot>
        </table>
        <div id="holder" class="hidden-xs"></div>
        {block name="frontend_account_statistic_overview_table"}
            <div class="partner_statistic_overview_active">
                <div class="table-responsive">
                    <table class="table table-hover">
                        {block name="frontend_account_partner_statistic_table_head"}
                            <th>
                                {s name="PartnerStatisticColumnDate"}{/s}
                            </th>
                            <th>
                                {s name="PartnerStatisticColumnId"}Bestellnr.{/s}
                            </th>
                            <th class="text-right">
                                {s name="PartnerStatisticColumnNetAmount"}{/s}
                            </th>
                            <th class="text-right">
                                {s name="PartnerStatisticColumnProvision"}{/s}
                            </th>
                        {/block}
                        {foreach name=partnerStatisticList from=$sPartnerOrders item=partnerOrder}
                            {if $smarty.foreach.partnerStatisticList.last}
                                {assign var=lastitem value=1}
                            {else}
                                {assign var=lastitem value=0}
                            {/if}
                            {include file="frontend/account/partner_statistic_item.tpl" lastitem=$lastitem}
                        {/foreach}
                    </table>
                </div>
            </div>
        {/block}
    {/if}
{/block}