<!-- support for cocomment -->
{if $template_option.cocommentactive == 'active'}
<script type="text/javascript">
// this ensures coComment gets the correct values
coco =
{ldelim}
     tool          : "Serendipity",
     siteurl       : "{$serendipityBaseURL|@escape:javascript}",
     sitetitle     : "{$blogTitle|@escape:javascript}",
     pageurl       : "{$commentform_entry.rdf_ident|@escape:javascript}",
     pagetitle     : "{$commentform_entry.title|@escape:javascript}",
     author        : "{$commentform_name}",
     authorID      : "serendipity[name]",
     formID        : "serendipity_comment",
     textareaID    : "serendipity[comment]",
     buttonID      : "serendipity[submit]"
{rdelim}
</script>
<script id="cocomment-fetchlet" src="http://www.cocomment.com/js/enabler.js" type="text/javascript">
// this activates coComment
</script>
{/if}
<!-- cocomment end -->
<div id="cform">
<a id="commentform"></a>
<!-- The actual form -->
<form action="{$commentform_action}#feedback" method="post">
<fieldset>
<legend>{$CONST.ADD_COMMENT}</legend>
<input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}" />
<dl>
  <dt class="cflabel"><label for="cfname">{$CONST.NAME}</label></dt>
  <dd class="cfvalue"><input type="text" id="cfname" name="serendipity[name]" value="{$commentform_name}" size="35" /></dd>
  <dt class="cflabel"><label for="cfemail">{$CONST.EMAIL}</label></dt>
  <dd class="cfvalue"><input type="text" id="cfemail" name="serendipity[email]" value="{$commentform_email}" size="35" /></dd>
  <dt class="cflabel"><label for="cfurl">{$CONST.HOMEPAGE}</label></dt>
  <dd class="cfvalue"><input type="text" id="cfurl" name="serendipity[url]" value="{$commentform_url}" size="35" /></dd>
  <dt class="cflabel"><label for="serendipity_replyTo">{$CONST.IN_REPLY_TO}</label></dt>
  <dd class="cfvalue">{$commentform_replyTo}</dd>
  <dt class="cflabel"><label for="cfcomment">{$CONST.COMMENT}</label></dt>
  <dd class="cfvalue"><textarea rows="10" cols="40" id="cfcomment" name="serendipity[comment]">{$commentform_data}</textarea>{serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}</dd>
    		
  {if $is_commentform_showToolbar}
    <dt>&#160;</dt>
    <dd class="cflabel">
    <span class="checkbox"><input id="checkboxremember" type="checkbox" name="serendipity[remember]" {$commentform_remember} />&#160;<label for="checkboxremember">{$CONST.REMEMBER_INFO}</label></span>
    {if $is_allowSubscriptions}
    <span class="checkbox"><input id="checkboxsubscribe" type="checkbox" name="serendipity[subscribe]" {$commentform_subscribe} />&#160;<label for="checkboxsubscribe">{$CONST.SUBSCRIBE_TO_THIS_ENTRY}</label></span>
    {/if}
  </dd>
  {/if}
    	
  {if $is_moderate_comments}
    <dt class="cfvalue important msg">{$CONST.COMMENTS_WILL_BE_MODERATED}</dt>
    <dd>&#160;</dd>
  {/if}
  <dt>&#160;</dt><dd class="cflabel">
    <input type="submit" id="submitcomment" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" />
    <input type="submit" id="serendipity_preview" name="serendipity[preview]" value="{$CONST.PREVIEW}" /></dd>
</dl>
</fieldset>
</form>
</div><!-- closes #cform -->
