<div class="price-wrapper mbs mts" data-equal="price">
    <div{if $leftPoints} class="text-danger"{/if}>
            <span class="fa-stack bonussystem-info-orb">
                <i class="fa fa-circle fa-stack-2x"></i>
                <strong class="fa-stack-1x bonussystem-info-orb-text">P</strong>
            </span>
        {s name="for" namespace="frontend/plugins/bonus_system/index"}für{/s}
        <strong>{$sArticle.required_points}</strong>
        {s name="points" namespace="frontend/plugins/bonus_system/index"}Punkte{/s}
    </div>
    {if $leftPoints}
        <div class="text-right text-danger">
            ({s namespace="frontend/plugins/bonus_system/index" name="still"}noch{/s}
            {$missingPoints}
            {if $pointsPlural}
                {s namespace="frontend/plugins/bonus_system/index" name="points"}Punkte{/s}
            {else}
                {s namespace="frontend/plugins/bonus_system/index" name="point"}Punkt{/s}
            {/if})
        </div>
    {/if}
</div>
