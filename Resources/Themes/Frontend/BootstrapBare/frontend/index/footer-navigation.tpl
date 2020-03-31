{namespace name="frontend/index/menu_footer"}

{block name="frontend_index_menu_footer"}
    {* Footer menu *}
    <div class="row">
        {block name="frontend_index_menu_footer_inner"}
            {block name="frontend_index_footer_column_service_hotline"}
                {block name="frontend_index_menu_footer_service_line"}
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        {block name="frontend_index_menu_footer_service_line_inner"}
                            {block name="frontend_index_footer_column_service_hotline_headline"}
                                <p class="lead">{s name="sFooterServiceHotlineHead"}Service Hotline{/s}</p>
                            {/block}
                            {block name="frontend_index_footer_column_service_hotline_content"}
                                <p>{s name="sFooterServiceHotline"}Telefonische Unterst&uuml;tzung und Beratung unter:<br/><br/><strong>0180 - 000000</strong><br/>Mo-Fr, 09:00 - 17:00 Uhr{/s}</p>
                            {/block}
                        {/block}
                    </div>
                {/block}
            {/block}
            {block name="frontend_index_footer_column_service_menu"}
                {block name="frontend_index_menu_footer_shop_service"}
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        {block name="frontend_index_menu_footer_shop_service_inner"}
                            {block name="frontend_index_footer_column_service_menu_headline"}
                                <p class="lead">{s name="sFooterShopNavi1"}Shop Service{/s}</p>
                            {/block}
                            {block name="frontend_index_footer_column_service_menu_content"}
                                <ul class="list-unstyled">
                                    {block name="frontend_index_footer_column_service_menu_before"}{/block}
                                    {foreach from=$sMenu.gBottom item=item  key=key name="counter"}
                                        {block name="frontend_index_footer_column_service_menu_entry"}
                                            <li>
                                                <a href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description}" {if $item.target}target="{$item.target}"{/if}>
                                                    {$item.description}
                                                </a>
                                            </li>
                                        {/block}
                                    {/foreach}
                                    {block name="frontend_index_footer_column_service_menu_after"}{/block}
                                </ul>
                            {/block}
                        {/block}
                    </div>
                {/block}
            {/block}
            {block name="frontend_index_footer_column_information_menu"}
                {block name="frontend_index_menu_footer_information"}
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        {block name="frontend_index_menu_footer_information_inner"}
                            {block name="frontend_index_footer_column_information_menu_headline"}
                                <p class="lead">{s name="sFooterShopNavi2"}Informationen{/s}</p>
                            {/block}
                            {block name="frontend_index_footer_column_information_menu_content"}
                                <ul class="list-unstyled">
                                    {block name="frontend_index_footer_column_information_menu_before"}{/block}
                                    {foreach from=$sMenu.gBottom2 item=item key=key name="counter"}
                                        {block name="frontend_index_footer_column_information_menu_entry"}
                                            <li>
                                                <a href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description}" {if $item.target}target="{$item.target}"{/if}>
                                                    {$item.description}
                                                </a>
                                            </li>
                                        {/block}
                                    {/foreach}
                                    {block name="frontend_index_footer_column_information_menu_after"}{/block}
                                </ul>
                            {/block}
                        {/block}
                    </div>
                {/block}
            {/block}
            {block name="frontend_index_footer_column_newsletter"}
                {block name="frontend_index_menu_footer_newsletter"}
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        {block name="frontend_index_menu_footer_newsletter_inner"}
                            {block name="frontend_index_footer_column_newsletter_headline"}
                                <p class="lead">{s name="sFooterNewsletterHead"}Newsletter{/s}</p>
                            {/block}
                            {block name="frontend_index_footer_column_newsletter_content"}
                                <p>{s name="sFooterNewsletter"}Abonnieren Sie den kostenlosen DemoShop Newsletter und verpassen Sie keine Neuigkeit oder Aktion mehr aus dem DemoShop.{/s}</p>
                                {block name="frontend_index_footer_column_newsletter_form"}
                                    <form action="{url controller='newsletter'}" method="post">
                                        <input type="hidden" value="1" name="subscribeToNewsletter"/>
                                        {block name="frontend_index_footer_column_newsletter_form_field"}
                                            <div class="input-group">
                                                <input type="email" class="form-control" name="newsletter" aria-label="{s name='sFooterNewsletterHead'}{/s}" placeholder="{s name="IndexFooterNewsletterValue"}Ihre E-Mail Adresse{/s}"/>
                                                {if {config name="newsletterCaptcha"} !== "nocaptcha"}
                                                    <input type="hidden" name="redirect">
                                                {/if}
                                                {block name="frontend_index_footer_column_newsletter_form_submit"}
                                                    <span class="input-group-btn">
                                                        <button type="submit" class="btn btn-primary" aria-label="{s name='IndexFooterNewsletterSubmit'}{/s}">
                                                            <i class="fa fa-envelope"></i>
                                                        </button>
                                                    </span>
                                                {/block}
                                            </div>
                                            {* Data protection information *}
                                            {block name="frontend_index_footer_column_newsletter_privacy"}
                                                {if {config name=ACTDPRTEXT} || {config name=ACTDPRCHECK}}
                                                    {$hideCheckbox=false}

                                                    {* If a captcha is active, the user has to accept the privacy statement on the newsletter page *}
                                                    {if {config name=newsletterCaptcha} !== "nocaptcha"}
                                                        {$hideCheckbox=true}
                                                    {/if}

                                                    {include file="frontend/_includes/privacy.tpl" hideCheckbox=$hideCheckbox}
                                                {/if}
                                            {/block}
                                        {/block}
                                    </form>
                                 {/block}
                             {/block}
                        {/block}
                    </div>
                {/block}
            {/block}
        {/block}
    </div>
{/block}
