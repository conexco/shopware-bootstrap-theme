{block name='frontend_liveshopping_counter_inner'}
    <div class="text-center">
        {* Days *}
        {block name="frontend_liveshopping_counter_day"}
            <span class="liveshopping-days sw5-plugin">{$liveShopping.remaining.days}</span>
            <span>{s name="sLiveDaysShort" namespace="frontend/live_shopping/main"}{/s}</span>
        {/block}

        {* Hours *}
        {block name="frontend_liveshopping_counter_hour"}
            <span class="liveshopping-hours sw5-plugin">{$liveShopping.remaining.hours}</span>
            <span>{s name="sLiveHoursShort" namespace="frontend/live_shopping/main"}{/s}</span>
        {/block}

        {* Minutes *}
        {block name="frontend_liveshopping_counter_min"}
            <span class="liveshopping-minutes sw5-plugin">{$liveShopping.remaining.minutes}</span>
            <span>{s name="sLiveMinutesShort" namespace="frontend/live_shopping/main"}{/s}</span>
        {/block}

        {* Seconds *}
        {block name="frontend_liveshopping_content_number"}
            <span class="liveshopping-seconds sw5-plugin">{$liveShopping.remaining.seconds}</span>
            <span>{s name="sLiveSecondsShort" namespace="frontend/live_shopping/main"}{/s}</span>
        {/block}
    </div>
{/block}
