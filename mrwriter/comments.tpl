{foreach from=$comments item=comment name="comments"}
    <a id="c{$comment.id}"></a>

    <dl id="comment-{$comment.id}" class="acomment{if $entry.author == $comment.author} serendipity_comment_author_self{/if} {cycle values="commentodd, commenteven"}">
       <dt>{if $comment.email}<a href="mailto:{$comment.email}">{$comment.author|@default:$CONST.ANONYMOUS}</a>{else}{$comment.author|@default:$CONST.ANONYMOUS}{/if}</dt>
       <dd>{if $comment.body == 'COMMENT_DELETED'}{$CONST.COMMENT_IS_DELETED}{else}{$comment.body}{/if}</dd>
    {if $comment.url}
       <dd><a href="{$comment.url}" title="{$comment.url|@escape}">{$CONST.HOMEPAGE}</a></dd>
    {/if}
       <dd>{$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</dd>
    </dl>

    {if $entry.is_entry_owner}
    <p><a href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a></p>
    {/if}
{foreachelse}
    <p class="serendipity_center nocomments">{$CONST.NO_COMMENTS}</p>
{/foreach}
