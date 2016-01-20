    <h1>{$plugin_contactform_pagetitle}</h1>
            
    <div class="contactform_preface">{$plugin_contactform_preface}</div>

{if $is_contactform_sent}
    <p class="serendipity_center serendipity_msg_notice">{$plugin_contactform_sent}</p>
{else}
{if $is_contactform_error}
    <p class="serendipity_center serendipity_msg_important">{$plugin_contactform_error}</p>

    <!-- Needed for Captchas -->
    {foreach from=$comments_messagestack item="message"}
    <p class="serendipity_center serendipity_msg_important">{$message}</p>
    {/foreach}
    {/if}

    <!-- This whole commentform style, including field names is needed for Captchas. -->
    <!-- The spamblock plugin relies on the field names [name], [email], [url], [comment]! -->

<div class="serendipityCommentForm">
    <a id="serendipity_CommentForm"></a>
    <form id="serendipity_comment" action="{$commentform_action}#feedback" method="post">
        <div>
            <input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
            <input type="hidden" name="serendipity[commentform]" value="true" />
        </div>

        <dl>
           <dt><label for="serendipity_commentform_name">{$CONST.NAME}</label></dt>
           <dd><input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="30" /></dd>
           <dt><label for="serendipity_commentform_email">{$CONST.EMAIL}</label></dt>
           <dd><input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="30" /></dd>
           <dt><label for="serendipity_commentform_url">{$CONST.HOMEPAGE}</label></dt>
           <dd><input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="30" /></dd>
           <dt><label for="serendipity_commentform_comment">{$CONST.COMMENT}</label></dt>
           <dd>
               <textarea rows="10" cols="40" id="serendipity_commentform_comment" name="serendipity[comment]">{$commentform_data}</textarea>
               <br />
               {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
           </dd>
        </dl>

        <p><input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" /></p>
    </form>
</div>
{/if}
