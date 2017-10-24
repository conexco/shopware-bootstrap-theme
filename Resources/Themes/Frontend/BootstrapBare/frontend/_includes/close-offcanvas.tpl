{block name='frontend_detail_description_buttons_offcanvas'}
    <div class="buttons-off-canvas{if $class} {$class}{else} offcanvas-default{/if}">
        {block name='frontend_detail_description_buttons_offcanvas_inner'}
            <a href="#" title="{"{s name="OffcanvasCloseMenuLink"}Menü schließen{/s}"|escape}" class="close-off-canvas sw5-plugin">
                <i class="fa fa-angle-left"></i>
                {s name="OffcanvasCloseMenuLink"}{/s}
            </a>
        {/block}
    </div>
{/block}