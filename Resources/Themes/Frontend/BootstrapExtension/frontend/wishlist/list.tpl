{namespace name="frontend/plugins/swag_advanced_cart/plugin"}

<div class="saved-lists-list-container sw5-plugin panel panel-default" data-is-active="{if $first}true{else}false{/if}">
    {block name="frontend_wishlist_index_list_row"}
        <div class="panel-heading">
            <a data-toggle="collapse" href="#wishlist-{$wishList.basketID}" aria-expanded="false" aria-controls="wishlist-{$wishList.basketID}" class="{if !$first}collapsed{/if}">
            {block name="frontend_wishlist_index_list_row_icon"}
                <span class="list-container-lock-icon-container mrs">
                    <i class="list-container-lock-icon sw5-plugin fa {if $wishList.published}fa-eye{else}fa-lock{/if} sw5-plugin"
                       title="{if $wishList.published}{s name='ListIsPublic'}Diese Liste ist öffentlich sichtbar{/s}{else}{s name='ListIsPrivate'}Diese Liste ist Privat{/s}{/if}"></i>
                </span>
            {/block}

            {block name="frontend_wishlist_index_list_row_text"}
                <span class="list-container-text">
                    {block name="frontend_wishlist_index_list_row_text_name"}
                        <span class="list-container-text-name sw5-plugin">{$wishList.name}</span>
                    {/block}

                    {block name="frontend_wishlist_index_list_row_text_count"}
                        <span class="list-container-text-count sw5-plugin">({$wishList.items|count} {s name='Article'}Artikel{/s})</span>
                    {/block}

                    {block name="frontend_wishlist_index_list_row_text_state"}
                        <span class="list-container-text-state sw5-plugin">
                            {if $wishList.published}
                                {s name='PublicList'}Öffentliche Wunschliste - Liste ist öffentlich sichtbar{/s}
                            {else}
                                {s name='PrivateList'}Private Wunschliste - Liste ist nicht öffentlich sichtbar{/s}
                            {/if}
                        </span>
                    {/block}
                </span>
            {/block}

            {block name="frontend_wishlist_index_list_row_collapse_icon"}
                <span class="list-container-icon-container float-right">
                    <i class="list-container-icon sw5-plugin fa fa-angle-down"></i>
                </span>
            {/block}
            </a>
        </div>
    {/block}

    {block name="frontend_wishlist_index_list_content"}
        <div class="collapse{if $first} in{/if}" id="wishlist-{$wishList.basketID}">
            <div class="panel-body">
                <div class="list-container-content sw5-plugin">
                    {block name="frontend_wishlist_index_list_content_hidden"}
                        <div class="list-container-name-hidden sw5-plugin">
                            <input id="name-field{$wishList.basketID}" type="text" name="list-container-name-input" class="list-container-name-input sw5-plugin" 
                                value="{$wishList.name}" data-list-id="{$wishList.basketID}">
                        </div>
                    {/block}
                    {block name="frontend_wishlist_index_list_content_header"}
                        <div class="list-container-header sw5-plugin">
                            {block name="frontend_wishlist_index_list_content_header_publish"}
                                <div class="header-publish-check checkbox mbm">
                                    <label for="list-container-publish-check-{$wishList.basketID}">
                                        <input data-list-id="{$wishList.basketID}" class="list-container-publish-check sw5-plugin" id="list-container-publish-check-{$wishList.basketID}" type="checkbox" {if $wishList.published}checked="checked"{/if}/>
                                        {s name='PrivacyText'}Öffentliche Wunschlisten können von allen eingesehen werden, jedoch nur solange diese Funktion aktiviert ist.{/s}
                                    </label>
                                </div>
                            {/block}
                            {block name="frontend_wishlist_index_list_content_header_share"}
                                <div class="header-sharing-container sw5-plugin mbl{if !$wishList.published} list-container-disabled sw5-plugin{/if}">
                                    <p>{s name='LinkToShare'}Link zum Teilen{/s}:</p>
                                    <div class="list-container-share-link-wrapper well well-sm mbm">
                                        {block name="frontend_wishlist_index_list_content_header_share_input"}
                                            <span class="list-container-share-link">{url controller=wishlist action=public id=$wishList.hash}</span>
                                        {/block}
                                    </div>

                                    {block name="frontend_wishlist_index_list_content_header_share_container"}
                                        <div class="cart-share-container">
                                            {block name="frontend_wishlist_index_share_container_facebook"}
                                                <a class="mhs select-item-facebook sw5-plugin select-social-media-item public-list-action-link sw5-plugin {if !$wishList.published}cart--disabled sw5-plugin{/if}" href="https://www.facebook.com/sharer/sharer.php?u={url controller=wishlist action=public id=$wishList.hash}">
                                                    <i class="fa fa-facebook"></i>
                                                </a>
                                            {/block}

                                            {block name="frontend_wishlist_index_share_container_twitter"}
                                                <a class="mhs select-item-twitter sw5-plugin select-social-media-item public-list-action-link sw5-plugin {if !$wishList.published}cart--disabled sw5-plugin{/if}" href="https://twitter.com/share?url={url controller=wishlist action=public id=$wishList.hash}">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            {/block}

                                            {block name="frontend_wishlist_index_share_container_gplus"}
                                                <a class="mhs select-item-google-plus sw5-plugin select-social-media-item public-list-action-link sw5-plugin {if !$wishList.published}cart--disabled sw5-plugin{/if}" href="https://plus.google.com/share?url={url controller=wishlist action=public id=$wishList.hash}">
                                                    <i class="fa fa-google-plus"></i>
                                                </a>
                                            {/block}

                                            {block name="frontend_wishlist_index_share_container_mail"}
                                                {if {config name=shareViaMail}}
                                                    <a class="mhs select-item-mail sw5-plugin select-social-media-item public-list-action-link sw5-plugin {if !$wishList.published}cart--disabled sw5-plugin{/if}" data-hash="{$wishList.hash}" href="">
                                                        <i class="fa fa-envelope"></i>
                                                    </a>
                                                {/if}
                                            {/block}
                                        </div>
                                    {/block}
                                </div>
                            {/block}
                        </div>
                    {/block}
                    {block name="frontend_wishlist_index_list_main"}
                        {block name="frontend_wishlist_index_list_articles_buttons"}
                            <div class="article-table-add-article sw5-plugin">
                                {block name="frontend_advanced_cart_alert_customizing"}
                                    <div class="add-article-wishlist-alert wishlist-alert-customizing">
                                        {include file="frontend/_includes/messages.tpl" type="error" content="{s name="CustomizedWarningContent" namespace="frontend/swag_advanced_cart/view/main"}Dieser Artikel kann nicht hinzugefügt werden, da er eine Kundenoptionen zulässt.{/s}"}
                                    </div>
                                {/block}

                                {block name="frontend_advanced_cart_alert_readded"}
                                    <div class="add-article-wishlist-alert wishlist-alert-readded sw5-plugin">
                                        {include file="frontend/_includes/messages.tpl" type="success" content="{s namespace="frontend/plugins/swag_advanced_cart/checkout" name="ArticleReAdded"}Der Artikel wurde erneut hinzugefügt{/s}"}
                                    </div>
                                {/block}

                                {block name="frontend_advanced_cart_alert_not_found"}
                                    <div class="add-article-wishlist-alert wishlist-alert-not-found sw5-plugin">
                                        {include file="frontend/_includes/messages.tpl" type="error" content="&nbsp;"}
                                    </div>
                                {/block}

                                <div class="row mbl">
                                    <div class="col-lg-6">
                                        <div class="input-group">
                                            {block name="frontend_wishlist_index_list_articles_buttons_autocomplete"}
                                                <input class="add-article-text-field sw5-plugin form-control" placeholder="{s name='ArticleNameOrOrdernumber'}Artikelname oder Bestellnummer..{/s}" type="text"/>
                                            {/block}
                                            {block name="frontend_wishlist_index_list_articles_buttons_add"}
                                                <span class="input-group-btn">
                                                    <button class="add-article-button sw5-plugin btn btn-secondary" type="button" title="{s name='Add'}Hinzufügen{/s}">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </span>
                                            {/block}
                                        </div>
                                    </div>
                                </div>

                                {block name="frontend_wishlist_index_list_articles_buttons_hidden"}
                                    <input class="add-article-hidden sw5-plugin" type="hidden" name="basketId"
                                           value="{$wishList.basketID}">
                                {/block}

                                <hr class="mtm">
                                <div class="article-table-add-cart sw5-plugin text-right{if $wishList.items|count < 1} hidden{/if}">
                                    <div class="row">
                                        <div class="col-12 col-sm-offset-6 col-sm-6 col-lg-offset-8 col-lg-4">
                                            {include file="frontend/wishlist/restore_button.tpl"}
                                        </div>
                                    </div>
                                </div>
                                <hr>

                            </div>
                        {/block}
                        {if $wishList.items|count > 0}
                            {include file="frontend/wishlist/article_table.tpl"}
                        {else}
                            <div class="cart-hide-container hidden">
                                {include file="frontend/wishlist/article_table.tpl"}
                            </div>
                        {/if}
                    {/block}


                    {block name="frontend_wishlist_index_list_main_buttons"}
                        <div class="list-container-manage-container">
                            <div class="list-container-manage-buttons sw5-plugin">
                                <div class="row">
                                    <div class="col-12 col-sm-8 mbm-sm mbm-xs">
                                        {block name="frontend_wishlist_index_manage_buttons"}
                                            <div class="cart-manage-container">
                                                {block name="frontend_wishlist_index_buttons_rename"}
                                                    <label for="name-field{$wishList.basketID}" class="manage-container-rename sw5-plugin btn btn-secondary" title="{s name='Rename'}Umbenennen{/s}">
                                                        {block name="frontend_wishlist_index_buttons_rename_icon"}
                                                            <i class="fa fa-pencil cart-rename-icon mrs"></i>
                                                        {/block}

                                                        {block name="frontend_wishlist_index_buttons_rename_text"}
                                                            <span class="rename-text">
                                                                {s name='Rename'}Umbenennen{/s}
                                                            </span>
                                                        {/block}
                                                    </label>
                                                {/block}

                                                {block name="frontend_wishlist_index_buttons_delete"}
                                                    <button data-name="{$wishList.name}" data-url="{url action='remove' id=$wishList.basketID}" class="manage-container-delete sw5-plugin btn btn-danger" title="{s name='Delete'}Löschen{/s}">
                                                        {block name="frontend_wishlist_index_buttons_delete_icon"}
                                                            <i class="fa fa-trash mrs"></i>
                                                        {/block}

                                                        {block name="frontend_wishlist_index_buttons_delete_text"}
                                                            <span class="delete-text">
                                                                {s name='Delete'}Löschen{/s}
                                                            </span>
                                                        {/block}
                                                    </button>
                                                {/block}
                                            </div>
                                        {/block}
                                    </div>
                                    <div class="col-12 col-sm-4">
                                        <div class="text-right">
                                            {include file="frontend/wishlist/restore_button.tpl"}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/block}
                </div>
            </div>
        </div>
    {/block}
</div>
