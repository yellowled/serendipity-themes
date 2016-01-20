<div id="serendipityCommentFormC" class="serendipityCommentForm">
    <a id="serendipity_CommentForm"></a>

    <form id="serendipity_comment" action="{$commentform_action}#feedback" method="post">
        <input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}" />
        <input type="hidden" name="serendipity[replyTo]" value="0" />

        <div id="theform">
        <fieldset id="message">
            <label class="block-label" for="serendipity_commentform_comment">{$CONST.COMMENT}</label>
            <textarea class="flatform" rows="10" cols="45" id="serendipity_commentform_comment" name="serendipity[comment]">{$commentform_data}</textarea>
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

    {if $is_commentform_showToolbar}
        <fieldset id="toolbar">
            <ul class="plainList">
               <li><input id="checkbox_remember" type="checkbox" name="serendipity[remember]" {$commentform_remember} /><label for="checkbox_remember">{$CONST.REMEMBER_INFO}</label></li>
            {if $is_allowSubscriptions}
               <li><input id="checkbox_subscribe" type="checkbox" name="serendipity[subscribe]" {$commentform_subscribe} /><label for="checkbox_subscribe">{$CONST.SUBSCRIBE_TO_THIS_ENTRY}</label></li>
            {/if}
            </ul>
        </fieldset>
    {/if}
        </div>
        
        <div id="directions">
          {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}

          <p>{if $lang == "de"}<strong>Hinweis:</strong> Kommentare, die mindestens einen Link enthalten, werden moderiert. Kommentare, die mindestens 3 Links enthalten, werden abgewiesen. Sorry &ndash; Spamschutz.{else}<strong>Hint:</strong> Comments including at least one link will be moderated. Comments including at least three links will be blocked. Sorry &ndash; spam protection.{/if}</p>

          <p>{if $lang == "de"}<strong>Hinweis:</strong> Bei Emoticons mitten in Sätzen idealerweise keine Nasen einsetzen &ndash; :), ;) <abbr title="und so weiter">usw.</abbr> &ndash;, da es ansonsten im Zusammenspiel mit Textile zu Merkwürdigkeiten kommen kann.{else}<strong>Hint:</strong> Using noses in emoticons might lead to unexpected results in conjunction with Textile, especially in the middle of a sentence &ndash; please use :) or ;) <abbr title="et cetera">etc.</abbr> instead.{/if}</p>

        {if $is_moderate_comments}
          <p class="serendipity_msg_important">{$CONST.COMMENTS_WILL_BE_MODERATED}</p>
        {/if}
        </div>

        <fieldset id="buttons">
            <input type="submit" id="serendipity_csubmit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" />
            <input type="submit" id="serendipity_preview" name="serendipity[preview]" value="{$CONST.PREVIEW}" />
        </fieldset>
    </form>
</div>
