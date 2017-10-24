<h2>{s name="ExceptionHeader"}Ups! An error has occurred!{/s}</h2>
{if $exception}
    <p>{s name="ExceptionText"}The following hints should help you.{/s}</p>
    {include file="frontend/_includes/messages.tpl" type="danger" content="{$exception->getMessage()} in {$error_file} on line {$exception->getLine()}"}
    <h3>Stack trace:</h3>
    <pre>{$error_trace|escape}</pre>
{else}
    {include file="frontend/_includes/messages.tpl" type="warning" content="{s name='InformText'}Wir wurden bereits über das Problem informiert und arbeiten an einer Lösung, bitte versuchen Sie es in Kürze erneut.{/s}"}
{/if}
