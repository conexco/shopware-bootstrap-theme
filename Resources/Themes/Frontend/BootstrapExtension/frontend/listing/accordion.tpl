{block name="frontend_bonus_accordion"}
    <div class="panel panel-default mtl d-none d-md-block">
        {block name="frontend_bonus_accordion_header"}
            <div class="panel-heading">
                <h4 class="panel-title">{s name="BonusArticles" namespace="frontend/plugins/bonus_system/index"}Bonusartikel{/s}</h4>
            </div>
        {/block}

        {block name="frontend_bonus_accordion_block"}
            <div class="list-group">
                {foreach $sBonusSystem.accordion as $item}
                    {block name="frontend_bonus_accordion_block_item"}
                        <div class="list-group-item">
                            <div class="row">
                                {block name="frontend_bonus_accordion_block_item_image"}
                                    <div class="col-xs-4">
                                        <a href="{$item.linkDetails}" title="{$item.articleName|escape}">
                                            {if $item.image.source}
                                                <img class="img-responsive img-center" src="{$item.image.source}" alt="{$item.articleName|escape}" />
                                            {else}
                                                <img class="img-responsive img-center" src="{link file='frontend/_public/src/img/no-picture.png'}" alt="{s namespace="frontend/plugins/index/topseller" name='WidgetsTopsellerNoPicture'}{/s}"/>
                                            {/if}
                                        </a>
                                    </div>
                                {/block}
                                {block name="frontend_bonus_accordion_block_item_detail"}
                                    <div class="col-xs-8">
                                        {block name="frontend_bonus_accordion_block_item_detail_name"}
                                            <a href="{$item.linkDetails}" title="{$item.articleName|escape}">
                                                {$item.articleName|truncate:25:"...":true}
                                            </a>
                                        {/block}
                                        {block name="frontend_bonus_accordion_block_item_detail_points"}
                                            <div>
                                                <span class="fa-stack bonussystem-info-orb">
                                                    <i class="fa fa-circle fa-stack-2x"></i>
                                                    <strong class="fa-stack-1x bonussystem-info-orb-text">P</strong>
                                                </span>
                                                {s name="for" namespace="frontend/plugins/bonus_system/index"}f&uuml;{/s}
                                                <strong>{$item.required_points}</strong>
                                                {s name="points" namespace="frontend/plugins/bonus_system/index"}Punkte{/s}
                                            </div>
                                        {/block}
                                    </div>
                                {/block}
                            </div>
                        </div>
                    {/block}
                {/foreach}
            </div>
        {/block}

        {block name="frontend_bonus_accordion_footer"}
            <div class="panel-footer text-center">
                {block name="frontend_bonus_accordion_footer_link"}
                    <a class="accordion-container--footer-link" title="{"{s namespace="frontend/plugins/bonus_system/index" name="DisplayAllBonusArticleLink"}{/s}"|escape}" href="{url controller=BonusSystem forceSecure}">
                        {s namespace="frontend/plugins/bonus_system/index" name="DisplayAllBonusArticleLink"}{/s}
                    </a>
                {/block}
            </div>
        {/block}
    </div>
{/block}