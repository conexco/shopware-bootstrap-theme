{block name='frontend_compare_modal'}
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close modal-close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{s name="CompareInfoHeaderItem" namespace="frontend/compare/index"}{/s}</h4>
            </div>
            <div class="modal-body">
                {block name='frontend_compare_modal_products'}
                    <table class="table table-striped table-responsive">
                        <tr>
                            <td>
                                {block name='frontend_article_picture'}
                                    <strong>{s name="CompareColumnPicture" namespace="frontend/compare/col_description"}{/s}</strong>
                                {/block}
                            </td>
                            {foreach from=$sComparisonsList.articles item=sArticle key=key name="counter"}
                                <td>
                                    {block name="frontend_compare_article_picture"}
                                        {include file="frontend/listing/product-box/product-image.tpl"}
                                    {/block}
                                </td>
                            {/foreach}
                        </tr>

                        <tr>
                            <td>
                                {block name='frontend_compare_article_name'}
                                    <strong> {s name="CompareColumnName" namespace="frontend/compare/col_description"}{/s}</strong>
                                {/block}
                            </td>

                            {foreach from=$sComparisonsList.articles item=sArticle key=key name="counter"}
                                <td>
                                    {block name='frontend_compare_article_name'}
                                        <a href="{$sArticle.linkDetails}" title="{$sArticle.articleName}">{$sArticle.articleName|truncate:47}</a>
                                        <br>
                                    {* More informations button *}
                                        <a href="{$sArticle.linkDetails}" title="{$sArticle.articleName}" class="mtm btn btn-primary btn-xs">{s name='ListingBoxLinkDetails' namespace="frontend/listing/box_article"}{/s}</a>
                                    {/block}
                                </td>
                            {/foreach}
                        </tr>

                        <tr>
                            <td>
                                {block name='frontend_compare_votings'}
                                    <strong> {s name="CompareColumnRating" namespace="frontend/compare/col_description"}{/s}</strong>
                                {/block}
                            </td>
                            {foreach from=$sComparisonsList.articles item=sArticle key=key name="counter"}
                                <td>
                                    {block name='frontend_compare_votings'}
                                        {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" count=$sArticle.sVoteAverage.count}
                                    {/block}
                                </td>
                            {/foreach}
                        </tr>

                        <tr>
                            <td>
                                {block name='frontend_compare_description'}
                                    <strong>  {s name="CompareColumnDescription" namespace="frontend/compare/col_description"}{/s}</strong>
                                {/block}
                            </td>
                            {foreach from=$sComparisonsList.articles item=sArticle key=key name="counter"}
                                <td>
                                    {block name='frontend_compare_description'}
                                        <p>
                                            {$sArticle.description_long|truncate:150}
                                        </p>
                                    {/block}

                                </td>
                            {/foreach}
                        </tr>

                        <tr>
                            <td>
                                {block name='frontend_compare_price'}
                                    <strong>  {s name="CompareColumnPrice" namespace="frontend/compare/col_description"}{/s}</strong>
                                {/block}
                            </td>
                            {foreach from=$sComparisonsList.articles item=sArticle key=key name="counter"}
                                <td>
                                    {block name='frontend_compare_price'}
                                        {if $sArticle.pseudoprice}
                                            {block name='frontend_compare_price_pseudoprice_before'}
                                                {s name="priceDiscountLabel" namespace="frontend/detail/data"}{/s}
                                            {/block}
                                        {/if}
                                        <p {if $sArticle.pseudoprice} class="article-price2" {else} class="article-price"{/if}>
                                            {if $sArticle.pseudoprice}
                                                <s>{s name="reducedPrice" namespace="frontend/listing/box_article"}{/s} {$sArticle.pseudoprice|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}</s>
                                                <br/>
                                            {/if}
                                            <strong>{if $sArticle.priceStartingFrom}ab {/if}{$sArticle.price|currency}</strong>*
                                        </p>
                                        {if $sArticle.pseudoprice}
                                            {block name='frontend_compare_price_pseudoprice_after'}
                                                {s name="priceDiscountInfo" namespace="frontend/detail/data"}{/s}
                                            {/block}
                                        {/if}
                                    {/block}

                                    {block name='frontend_compare_unitprice'}
                                        {include file="frontend/listing/product-box/product-price-unit.tpl"}
                                    {/block}
                                </td>
                            {/foreach}
                        </tr>

                        {foreach from=$sComparisonsList.properties item=property name="prop_counter_aussen"}
                            {block name='frontend_compare_properties'}
                                <tr>
                                    <td>
                                        {if $property}<strong>{$property}</strong>{/if}
                                    </td>
                                    {foreach from=$sComparisonsList.articles item=sArticle key=key name="prop_counter_innen"}
                                        {foreach from=$sArticle.sProperties item=property name="property"}
                                            {if $smarty.foreach.prop_counter_aussen.iteration eq $smarty.foreach.property.iteration}
                                                {block name='frontend_compare_properties'}
                                                    <td>
                                                        {if $property.value}{$property.value}{else}-{/if}
                                                    </td>
                                                {/block}
                                            {/if}
                                        {/foreach}
                                    {/foreach}
                                </tr>
                            {/block}
                        {/foreach}
                    </table>
                {/block}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{s name="CompareModalClose"}Schließen{/s}</button>
            </div>
        </div>
    </div>
{/block}
