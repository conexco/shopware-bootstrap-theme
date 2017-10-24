{if $Data.bannerMapping}
    <div class="banner-mapping {$Data.bannerPosition}">
        {foreach $Data.bannerMapping as $mapping}
            <a href="{$mapping.link}"
               class="banner-mapping-link"
               style="width:{({$mapping.width} / ({$Data.fileInfo.width} / 100))|round:3}%;
                   height:{({$mapping.height} / ({$Data.fileInfo.height} / 100))|round:3}%;
                   left:{({$mapping.x} / ({$Data.fileInfo.width} / 100))|round:3}%;
                   top:{({$mapping.y} / ({$Data.fileInfo.height} / 100))|round:3}%"
                {if $mapping.as_tooltip && $mapping.title} title="{$mapping.title|escape}"{/if}
                {if $mapping.linkLocation eq "external"} target="_blank"{/if}
                {if $mapping.ordernumber}data-ordernumber="{$mapping.ordernumber}"{/if}>

                {if $mapping.as_icon}
                    <span class="banner-mapping-icon">
                      <i class="fa fa-plus"></i>
                    </span>
                {/if}
            </a>
        {/foreach}
    </div>
{elseif $Data.link}
    <a href="{$Data.link}" class="banner-link"{if $Data.title} title="{$Data.title|escape}"{/if}></a>
{/if}
