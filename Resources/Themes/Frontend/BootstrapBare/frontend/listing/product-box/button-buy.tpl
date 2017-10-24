{block name="frontend_listing_product_box_button_buy"}

    {block name="frontend_listing_product_box_button_buy_url"}
        {$url = {url controller=checkout action=addArticle} }
    {/block}

    {block name="frontend_listing_product_box_button_buy_form"}
        <form name="sAddToBasket"
              method="post"
              action="{$url}"
              class="buybox-form"
              data-add-article="true"
              data-eventName="submit"
              {if $theme.offcanvasCart}
                  data-showModal="false"
                  data-addArticleUrl="{url controller=checkout action=ajaxAddArticleCart}"
              {/if}>

            {block name="frontend_listing_product_box_button_buy_order_number"}
                <input type="hidden" name="sAdd" value="{$sArticle.ordernumber}"/>
            {/block}

            {block name="frontend_listing_product_box_button_buy_button"}
                <button class="mvm btn btn-primary btn-block buybox-button">
                    {block name="frontend_listing_product_box_button_buy_button_text"}
                        {s namespace="frontend/listing/box_article" name="ListingBuyActionAdd"}{/s}
                    {/block}
                </button>
            {/block}
        </form>
    {/block}
{/block}