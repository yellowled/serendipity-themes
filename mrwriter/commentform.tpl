<div id="serendipityCommentFormC" class="serendipityCommentForm">
    <a id="serendipity_CommentForm"></a>
    <form id="serendipity_comment" action="{$commentform_action}#feedback" method="post">
        <input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}" />
        <dl>
           <dt><label for="serendipity_commentform_name">{$CONST.NAME}</label></dt>
           <dd><input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="30" /></dd>
           <dt><label for="serendipity_commentform_email">{$CONST.EMAIL}</label></dt>
           <dd><input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="30" /></dd>
           <dt><label for="serendipity_commentform_url">{$CONST.HOMEPAGE}</label></dt>
           <dd><input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="30" /></dd>
           <dt><label for="serendipity_commentform_comment">{$CONST.COMMENT}</label></dt>
           <dd>
               <textarea rows="10" cols="60" id="serendipity_commentform_comment" name="serendipity[comment]">{$commentform_data}</textarea>
               <br />
               {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
           </dd>
        </dl>
{if $is_commentform_showToolbar}
        <ul>
           <li><input id="checkbox_remember" type="checkbox" name="serendipity[remember]" {$commentform_remember} /><label for="checkbox_remember">{$CONST.REMEMBER_INFO}</label></li>
    {if $is_allowSubscriptions}
           <li><input id="checkbox_subscribe" type="checkbox" name="serendipity[subscribe]" {$commentform_subscribe} /><label for="checkbox_subscribe">{$CONST.SUBSCRIBE_TO_THIS_ENTRY}</label></li>
    {/if}
        </ul>
{/if}
{if $is_moderate_comments}
        <p class="serendipity_msg_important">{$CONST.COMMENTS_WILL_BE_MODERATED}</p>
{/if}
        <p><input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" /></p>
    </form>
</div>
