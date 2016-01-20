{assign var="submitemail" value=$CONST.SUBMEMAIL_102}
<div class="entry">
    <h2 id="mailhead">{$plugin_contactform_pagetitle}</h2>
            
    <div id="contactpreface">{$plugin_contactform_preface}</div>

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

    <div class="serendipityCommentForm">
        <a id="serendipity_CommentForm"></a>
        <form id="serendipity_comment" action="{$commentform_action}#feedback" method="post">
            <input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
            <input type="hidden" name="serendipity[commentform]" value="true" />
            <fieldset id="thecontactform">
                <dl>
                   <dt><label for="serendipity_commentform_name">{$CONST.NAME}</label></dt>
                   <dd><input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="30" /></dd>
                   <dt><label for="serendipity_commentform_email">{$CONST.EMAIL}</label></dt>
                   <dd><input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="30" /></dd>
                   <dt><label for="serendipity_commentform_url">{$CONST.HOMEPAGE}</label></dt>
                   <dd><input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="30" /></dd>
                   <dt><label for="serendipity_commentform_comment">{$plugin_contactform_message}</label></dt>
                   <dd><textarea rows="10" cols="60" id="serendipity_commentform_comment" name="serendipity[comment]">{$commentform_data}</textarea></dd>
                </dl>
            </fieldset>

            {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}

            <fieldset id="thebuttons">
                <input type="submit" id="serendipity_csubmit" name="serendipity[submit]" value="{$submitemail}" />
            </fieldset>
        </form>
    </div>
{/if}
</div>