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
{foreach name="field" from=$commentform_dynamicfields item="field"}
{if $field.type == "hidden"}
<input type="hidden" name="serendipity[{$field.id}]" value="{$field.default}" />
{/if}
{/foreach}
<fieldset>
<legend>{$plugin_contactform_pagetitle}</legend>
<dl>
{foreach name="field" from=$commentform_dynamicfields item="field"}
{if $field.type != "hidden"}
   <dt class="cflabel">{if $field.required}<sup>*</sup>{/if}<label for="serendipity_commentform_{$field.id}">{$field.name}</label></dt>
   <dd class="cfvalue">
{if $field.type == "checkbox"}
   <input type="checkbox" name="{$field.id}" id="{$field.id}" {$field.default} />
   <label for="{$field.id}">{$field.message}</label>
{elseif $field.type == "radio"}
{foreach name="radio_option" from=$field.options item="option"}
   <input type="radio" name="{$field.id}" id="{$field.id}.{$option.id}" value="{$option.value}" {$option.default} />
   <label for="{$field.id}.{$option.id}">{$option.name}</label>
{/foreach}
{elseif $field.type == "select"}
   <select name="{$field.id}">
{foreach name="radio_option" from=$field.options item="option"}
       <option name="{$field.id}" id="{$field.id}.{$option.id}" value="{$option.value}" {$option.default} >{$option.name}</option>
{/foreach}
   </select>
{elseif $field.type == "password"}
   <input type="password" id="serendipity_commentform_{$field.id}" name="serendipity[{$field.id}]" value="{$field.default}" size="35" />
{elseif $field.type == "textarea"}
   <textarea class="frm" rows="10" cols="40" id="serendipity_commentform_{$field.id}" name="serendipity[{$field.id}]">{$field.default}</textarea>
{else}
   <input type="text" id="serendipity_commentform_{$field.id}" name="serendipity[{$field.id}]" value="{$field.default}" size="35" />
{/if}
   </dd>
{/if}
{/foreach}
   <dt>&#160;</dt>
   <dd>
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
