{block name="frontend_index_cookie_consent_manager_group"}
    <div class='cookie-consent--group panel panel-default'>
        {block name="frontend_index_cookie_consent_manager_group_name_input"}
            <input type="hidden" class="cookie-consent--group-name" value="{$cookieGroup['name']}" />
        {/block}

        {block name="frontend_index_cookie_consent_manager_group_title"}
        <div class="panel-heading" role="tab">
            <div class="panel-title">
                <label class="cookie-consent--group-state cookie-consent--state-input{if $cookieGroup['required']} cookie-consent--required{/if}">
                    <input type="checkbox" name="{$cookieGroup['name']}-state" class="cookie-consent--group-state-input"{if $cookieGroup['required']} disabled="disabled" checked="checked"{/if}/>
                    <span class="cookie-consent--state-input-element"></span>
                </label>
                <a href="#cookie-consent--group-{$cookieGroup@key}" class='cookie-consent--group-title' role="button" data-toggle="collapse" data-parent="#cookie-consent--configuration-main">
                    <span class="cookie-consent--group-title-label cookie-consent--state-label">
                        {$cookieGroup['label']|truncate:25}
                    </span>
                    <i class="cookie-consent--group-state-icon fa fa-chevron-down"></i>
                </a>
            </div>
        </div>
        {/block}

        {if $cookieGroup['description'] || $cookieGroup['cookies']}
            {block name="frontend_index_cookie_consent_manager_group_container"}
                <div id="cookie-consent--group-{$cookieGroup@key}" class='cookie-consent--group-container panel-collapse collapse'>
                    <div class="panel-body">
                        {if {$cookieGroup['description']}}
                            {block name="frontend_index_cookie_consent_manager_group_description"}
                                <p class='cookie-consent--group-description text-muted'>
                                    {$cookieGroup['description']}
                                </p>
                            {/block}
                        {/if}

                        <ul class='cookie-consent--cookies-container list-group'>
                            {foreach $cookieGroup['cookies'] as $cookie}
                                <li class="list-group-item">
                                    {include file="frontend/index/cookie_consent/cookie.tpl"}
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            {/block}
        {/if}
    </div>
{/block}
