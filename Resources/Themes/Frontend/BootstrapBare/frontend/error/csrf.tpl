{block name="frontend_csrf_error"}
    {block name="frontend_csrf_error_head"}<h2>{s name="ExceptionHeaderCsrf"}Invalid form token!{/s}</h2>{/block}

    {block name="frontend_csrf_error_message"}
        <p>{s name="CsrfExceptionReason"}The action could not be completed due to a missing form token.<br>A new form token has been generated.{/s}</p>
    {/block}

    {block name="frontend_csrf_error_help"}
        <p><strong>{s name="CsrfExceptionHelp"}Please return to the previous page in your browser and try again.{/s}</strong></p>
    {/block}

    {block name="frontend_csrf_error_back_url"}
        {if $backUrl}
            <a href="{$backUrl}" class="btn btn-primary">{s name="CsrfExceptionBack"}Go back to the previous page{/s}</a>
        {/if}
    {/block}
{/block}