{block name="frontend_checkout_cart_bonus_slider"}
    <div class="panel panel-default">
        <div class="panel-body">
            {block name="frontend_checkout_cart_bonus_slider_title"}
                <legend>{s namespace="frontend/plugins/bonus_system/index" name="BonusArticles"}{/s}</legend>
            {/block}

            {block name="frontend_checkout_cart_bonus_slider_body"}
                <div class="row">
                    {block name='frontend_checkout_premium_slider_container'}
                        <div class="slick"
                             data-equalheight="true"
                             data-infinite="1"
                             data-speed="300"
                             data-autoplay="1"
                             data-pauseOnHover="1"
                             data-arrows="1"
                             data-dots="0"
                             data-slidesToShow="3"
                             data-slidesToScroll="3"
                             data-md='{ldelim}
                            "slidesToShow": "3",
                            "arrows": "1",
                            "dots": "0",
                            "slidesToScroll": "3"
                        {rdelim}'
                             data-hd='{ldelim}
                            "slidesToShow": "3",
                            "arrows": "1",
                            "dots": "0",
                            "slidesToScroll": "3"
                        {rdelim}'
                             data-sm='{ldelim}
                            "slidesToShow": "2",
                            "arrows": "1",
                            "dots": "0",
                            "slidesToScroll": "2"
                        {rdelim}'
                             data-xs='{ldelim}
                            "slidesToShow": "1",
                            "arrows": "1",
                            "dots": "0",
                            "slidesToScroll": "1"
                        {rdelim}'>
                            {action controller=BonusSystem action=slider}
                        </div>
                    {/block}
                </div>
            {/block}
        </div>
    </div>
{/block}