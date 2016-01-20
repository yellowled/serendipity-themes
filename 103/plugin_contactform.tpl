{assign var="sendmail" value=$CONST.YL103_SEND_MAIL}

<div class="clearfix">
    <div class="entry-info">
        <h1 class="entry-title">{$plugin_contactform_pagetitle}</h1>
            
        <div class="preface">{$plugin_contactform_preface}</div>
     </div>

    <div class="entry-body">
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

        <div id="contactform" class="serendipityCommentForm">
            <a id="serendipity_CommentForm"></a>

            <form id="serendipity_comment" action="{$commentform_action}#feedback" method="post">
                <input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
                <input type="hidden" name="serendipity[commentform]" value="true" />

                <fieldset id="message">
                    <label class="block-label" for="serendipity_commentform_comment">{$plugin_contactform_message}</label>
                    <textarea class="flatform" rows="10" cols="50" id="serendipity_commentform_comment" name="serendipity[comment]">{$commentform_data}</textarea>
                </fieldset>

                <fieldset id="userdata">
                    <dl>
                       <dt><label for="serendipity_commentform_name">{$CONST.NAME}</label></dt>
                       <dd><input class="flatform" type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="30" /></dd>
                       <dt><label for="serendipity_commentform_email">{$CONST.EMAIL}</label></dt>
                       <dd><input class="flatform" type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" size="30" /></dd>
                       <dt><label for="serendipity_commentform_url">{$CONST.HOMEPAGE}</label></dt>
                       <dd><input class="flatform" type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" size="30" /></dd>
                    </dl>
                </fieldset>

                {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}

                <fieldset>
                    <input type="submit" id="serendipity_csubmit" name="serendipity[submit]" value="{$sendmail}" />
                </fieldset>
            </form>
        </div>
      {/if}
    </div>
</div>
