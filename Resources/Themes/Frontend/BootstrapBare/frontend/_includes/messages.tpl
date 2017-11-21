{**
 *	Global messages template
 *
 *	The template provides an easy way to display messages in the storefront. The following types are supported:
 *	   * error/danger (red)
 *	   * success (green)
 *	   * warning (yellow)
 *	   * info (blue)
 *	The component requires at least the parameters ```content``` and ```type``` to display the message correctly.
 *
 *	```
 *	   {include file="frontend/_includes/messages.tpl" type="error" content="Your content"}
 *	```
 *
 *	Customized icons can be passed using the icon font to the component using the parameter ```icon```:
 *	```
 *	   {include file="frontend/_includes/messages.tpl" type="error" content="Your content" icon="icon--shopware"}
 *	```
 *
 * If you need to display a bunch of messages (for example error messages in the registration), you can pass an array
 * of messages to the template using the parameter ```list```:
 *
 * ```
 *    {include file="frontend/_includes/messages.tpl" type="error" list=$error_messages}
 * ```
 *
 * If you need to insert the message into the DOM but don't want to display it, you can use the parameter ```visible```
 * to hide the message on startup. By default the parameter is set to ```true```.
 *
 * ```
 *    {include file="frontend/_includes/messages.tpl" type="error" content="Your content" visible=false}
 * ```
 *}

{* Icon classes *}
{block name="frontend_global_messages_icon_class"}
    {if $icon}
        {$iconCls = 'fa-check-circle'}
        {if is_string($icon)}
            {* Support for customized icons *}
            {$iconCls=$icon}
        {elseif $type == 'error' || $type == 'danger'}
    		{$iconCls = 'fa-times-circle'}
    	{elseif $type == 'success'}
    		{$iconCls= 'fa-check-circle'}
    	{elseif $type == 'warning'}
    		{$iconCls = 'fa-exclamation-circle'}
    	{else}
    		{$iconCls = 'fa-info-circle'}
    	{/if}
    {/if}
{/block}

{* Support for hiding the message on startup *}
{block name="frontend_global_messages_visible"}
    {$isVisible=true}
    {if isset($visible)}
        {$isVisible=$visible}
    {/if}
{/block}

{* Messages container *}
{block name="frontend_global_messages_container"}
	<div class="alerts{if $isVisible === false} hidden{/if}">
		{* Content column *}
		{block name="frontend_global_messages_content"}
            <div class="alert alert-{if $type == 'error'}danger{else}{$type}{/if}">
                <div class="row">
                    {block name="frontend_global_messages_icon"}
                        {if $iconCls}
                            <div class="hidden-xs col-sm-1">
                                <i class="fa fa-lg {$iconCls}"></i>
                            </div>
                        {/if}
                    {/block}

                    {block name="frontend_global_messages_text"}
                        <div class="col-xs-12{if $iconCls} col-sm-11{/if}">
                            {if $content && !$list}
                                {$content}
                            {elseif $list|@count === 1}
                                {$list[0]}
                            {else}
                                <ul>
                                    {foreach $list as $entry}
                                        {if $entry != ''}
                                            <li>
                                                {$entry}
                                            </li>
                                        {/if}
                                    {/foreach}
                                </ul>
                            {/if}
                            {if $dismiss}
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                            {/if}
                        </div>
                    {/block}
                </div>
            </div>
        {/block}
	</div>
{/block}