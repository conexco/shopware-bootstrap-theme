{if $sBonusSystem.settings.bonus_articles_active && $sBonusSystem.settings.display_article_slider==1}
	{block name="frontend_home_index_bonus_slider"}
        {block name="frontend_home_index_bonus_slider_title"}
            <div class="page-header">
                <h3>{s namespace="frontend/plugins/bonus_system/index" name="BonusArticles"}{/s}</h3>
            </div>
        {/block}
        {block name="frontend_home_index_bonus_slider_body"}
            <div class="slick" id="bonus-slider"
                 data-equalheight="true"
                 data-infinite="1"
                 data-autoplay="1"
                 data-pauseOnHover="1"
                 data-dots="0"
                 data-arrows="1"
                 data-slidesToShow="4"
                 data-slidesToScroll="4"
                 data-md='{ldelim}
                    "arrows": "1",
                    "dots": "0",
                    "slidesToShow": "3",
                    "slidesToScroll": "3"
                {rdelim}'
                 data-hd='{ldelim}
                    "arrows": "1",
                    "dots": "0",
                    "slidesToShow": "3",
                    "slidesToScroll": "3"
                {rdelim}'
                 data-sm='{ldelim}
                    "arrows": "1",
                    "dots": "0",
                    "slidesToShow": "2",
                    "slidesToScroll": "2"
                {rdelim}'
                 data-xs='{ldelim}
                    "arrows": "1",
                    "dots": "0",
                    "slidesToShow": "1",
                    "slidesToScroll": "1"
                {rdelim}'>
                {action controller=BonusSystem action=slider}
            </div>
        {/block}
	{/block}
{/if}