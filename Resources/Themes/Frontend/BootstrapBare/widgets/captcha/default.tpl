{block name='frontend_widgets_captcha'}
    <div class="review-captcha">
        {block name='frontend_widgets_captcha_input_placeholder'}
            <div class="captcha-placeholder mb-3"><img src="data:image/png;base64,{$img}"/></div>
        {/block}

        {block name='frontend_widgets_captcha_input_label'}
            <strong class="captcha-notice">{s name="DetailCommentLabelCaptcha" namespace="frontend/detail/comment"}{/s}</strong>
        {/block}

        {block name='frontend_widgets_captcha_input_code'}
            <div class="captcha-code mt-2">
                <input type="text" name="sCaptcha" class="form-control review-field{if $sErrorFlag.sCaptcha} is-invalid{/if}" required="required" aria-required="true"/>
            </div>
        {/block}
    </div>
{/block}
