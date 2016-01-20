<div id="contactsection">
{if $is_contactform_error}
   <p class="important msg">{$plugin_contactform_error}</p>
   <!-- Needed for Captchas -->
   {foreach from=$comments_messagestack item="message"}
   <p class="msg">{$message}</p>
   {/foreach}
{/if}
{if (empty($is_contactform_sent))}
   <p id="cformpreface">{$plugin_contactform_preface}</p>
{/if}
{if $is_contactform_sent}
   <p class="notice msg">{$plugin_contactform_sent}</p>
{else}

<!-- This whole commentform style, including field names is needed -->
<!-- for Captchas. The spamblock plugin relies on the field names  -->
<!-- [name], [email], [url], [comment]!                            -->

<div id="cform">
<a id="commentform"></a>
<form action="{$commentform_action}#feedback" method="post">
<input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
<input type="hidden" name="serendipity[commentform]" value="true" />
<fieldset>
<legend>{$plugin_contactform_pagetitle}</legend>
<dl>
   <dt class="cflabel"><label for="cfname">{$CONST.NAME}</label></dt>
   <dd class="cfvalue"><input type="text" id="cfname" name="serendipity[name]" value="{$commentform_name}" size="35" /></dd>
   <dt class="cflabel"><label for="cfemail">{$CONST.EMAIL}</label></dt>
   <dd class="cfvalue"><input type="text" id="cfemail" name="serendipity[email]" value="{$commentform_email}" size="35" /></dd>
   <dt class="cflabel"><label for="cfurl">{$CONST.HOMEPAGE}</label></dt>
   <dd class="cfvalue"><input type="text" id="cfurl" name="serendipity[url]" value="{$commentform_url}" size="35"/></dd>
   <dt class="cflabel"><label for="cfcomment">{$plugin_contactform_message}</label></dt>
   <dd class="cfvalue"><textarea rows="10" cols="40" id="cfcomment" name="serendipity[comment]">{$commentform_data}</textarea>
<!-- This is where the spamblock/Captcha plugin is called -->
   {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
   </dd>
   <dt>&#160;</dt>
   <dd><input type="submit" id="submitcomment" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" /></dd>
</dl>
</fieldset>
</form>
</div><!-- closes #cform -->
{/if}
</div><!-- closes #contactsection -->
