{namespace name='frontend/plugins/swag_advanced_cart/public_list'}

{block name="frontend_wishlist_public"}
    {if $wishlist}
        {block name="frontend_wishlist_public_header"}
            <div class="public-list-header mtl">
                <div class="row">
                    <div class="col-12 col-lg-6">
                        {block name="frontend_wishlist_public_header_info"}
                            <div class="public-list-info">
                                {block name="frontend_wishlist_public_header_info_name"}
                                    <h2 class="mtn">{$wishlist.name}</h2>
                                {/block}
                                {block name="frontend_wishlist_public_header_info_date"}
                                    <p>
                                        {s name='By'}von{/s}
                                        <strong>{$wishlist.user_firstname} {$wishlist.user_lastname}</strong>
                                        {if $wishlist.modified|date:'DATE_MEDIUM'}
                                            - {s name='LastTimeEdited'}zuletzt geändert{/s}
                                            {if $wishlist.modified|date:'DATE_MEDIUM' == $smarty.now|date:'DATE_MEDIUM'}
                                                {s name='Today'}heute{/s},
                                            {elseif $wishlist.modified|date:'DATE_MEDIUM' == {"yesterday"|strtotime|date:'DATE_MEDIUM'}}
                                                {s name='Yesterday'}gestern{/s},
                                            {else}
                                                {s name='OnDate'}am{/s} {$wishlist.modified|date:'DATE_MEDIUM'},
                                            {/if}
                                            {s name='AtTime'}um{/s} {$wishlist.modified|date:'TIME_SHORT'}
                                        {/if}
                                    </p>
                                {/block}
                            </div>
                        {/block}
                    </div>
                    <div class="col-12 col-lg-6 text-right">
                        {block name="frontend_wishlist_public_header_actions"}
                            <div class="public-list-action">
                                {block name="frontend_wishlist_public_header_actions_like"}
                                    {if {config name=facebookLikes}}
                                        <div class="public-list-action-link sw5-plugin mrm">
                                            <div class="public-list-action-like fb-like"
                                                 data-href="{url controller=wishlist action=public id=$wishlist.hash}"
                                                 data-layout="button_count" data-action="like" data-show-faces="false"
                                                 data-share="false">&nbsp;</div>
                                        </div>
                                    {/if}
                                {/block}

                                {block name="frontend_wishlist_public_header_actions_facebook"}
                                    <a class="phs select-item-facebook sw5-plugin" href="https://www.facebook.com/sharer/sharer.php?u={url controller=wishlist action=public id=$wishlist.hash}">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                {/block}

                                {block name="frontend_wishlist_public_header_actions_twitter"}
                                    <a class="phs select-item-twitter sw5-plugin" href="https://twitter.com/share?url={url controller=wishlist action=public id=$wishlist.hash}">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                {/block}

                                {block name="frontend_wishlist_public_header_actions_google"}
                                    <a class="phs select-item-google-plus sw5-plugin" href="https://plus.google.com/share?url={url controller=wishlist action=public id=$wishlist.hash}">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                {/block}

                                {block name="frontend_wishlist_public_header_actions_add"}
                                    <div class="public-list-action-add mlm">
                                        <form action="{url controller=wishlist action=restore id={$wishlist.basketID}}">
                                            <button type="submit" class="public-list-action-btn btn btn-primary">
                                                {s name='InsertWishlistIntoCart'}Wunschliste in den Warenkorb{/s}
                                            </button>
                                        </form>
                                    </div>
                                {/block}
                            </div>
                        {/block}
                    </div>
                </div>

            </div>
        {/block}

        {block name="frontend_wishlist_public_content"}
            <div class="public-list-content" data-compare-ajax="true">
                {block name="frontend_wishlist_public_content_table_header"}
                    {if $wishlist.items}
                        <div class="article-table-header sw5-plugin">
                            <div class="row">
                                <div class="d-none d-sm-block col-sm-6 col-lg-9">
                                    {block name="frontend_wishlist_public_content_table_header_article"}
                                        <h4>{s name='Article' namespace="frontend/plugins/swag_advanced_cart/plugin"}Artikel{/s}</h4>
                                    {/block}
                                </div>
                                <div class="d-none d-sm-block col-sm-6 col-lg-3">
                                    {block name="frontend_wishlist_public_content_table_header_price"}
                                        <h4>{s name='Price' namespace="frontend/plugins/swag_advanced_cart/plugin"}Preis{/s}</h4>
                                    {/block}
                                </div>
                            </div>
                        </div>
                    {/if}    
                {/block}

                {foreach from=$wishlist.items item=item name=itemIteration}
                    <input type="hidden" name="sAdd" value="{$item.article.ordernumber}">
                    {include file="frontend/wishlist/item.tpl" item=$item sBasketItem=$item.article hideDelete=true}
                {/foreach}
            </div>
        {/block}

        {block name="frontend_wishlist_public_content_comments"}
            {if {config name=facebookComments}}
                <div class="public-list-facebook-comments">
                    {block name="frontend_wishlist_public_content_comments_count"}
                        <div class="facebook-comments-table-head">
                            <span>
                                <div class="fb-like" data-href="{url controller=wishlist action=public id=$wishlist.hash}" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>
                            </span>
                        </div>
                    {/block}

                    {block name="frontend_wishlist_public_content_comments_main"}
                        <div class="facebook-comments-table-row">
                            <div class="fb-comments" data-href="{url controller=wishlist action=public id=$wishlist.hash}"
                                 data-numposts="5" data-colorscheme="light" data-mobile="false"></div>
                        </div>
                    {/block}
                </div>
            {/if}
        {/block}
    {else}
        {block name="frontend_wishlist_public_notfound"}
            <div id="public-list-not-found">
                {* Headline *}
                {block name="frontend_wishlist_public_notfound_headline"}
                    <h2>{s namespace="frontend/plugins/swag_advanced_cart/public_list_notfound" name='Error404'}Fehler 404{/s}</h2>
                {/block}

                {block name="frontend_wishlist_public_notfound_text"}
                    <p>{s namespace="frontend/plugins/swag_advanced_cart/public_list_notfound" name='DoesntExistsOrDeleted'}Die Wunschliste existiert nicht oder wurde bereits entfernt.{/s}</p>
                {/block}
            </div>
        {/block}
    {/if}
{/block}
