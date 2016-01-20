{foreach from=$comments item=comment name="comments"}
    <dl id="c{$comment.id}" class="acomment {cycle values="odd, even"}{if $entry.author == $comment.author} self{/if}" style="margin-left: {$comment.depth*10}px">
       <dt>{if $comment.url}<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{/if}<cite>{$comment.author|@default:$CONST.ANONYMOUS}</cite>{if $comment.url}</a>{/if} ({$comment.timestamp|@formatTime:'%d.%m.%Y, %H:%M'}):</dt>
       <dd class="commentbody">{if $comment.body == 'COMMENT_DELETED'}{$CONST.COMMENT_IS_DELETED}{else}{if $comment.avatar}{$comment.avatar}{else}<img src="{$serendipityHTTPPath}templates/{$template}/img/noavatar.png" alt="Avatar für {$comment.author}" title="{$comment.author}" class="comment_avatar" />{/if} <q>{$comment.body}</q>{/if}</dd>
       <dd class="commentmeta"><span class="permalink"><a href="#c{$comment.id}">Permalink</a></span>{if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'} &bull; <span class="acom"><a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a></span><div id="serendipity_replyform_{$comment.id}"></div>{/if}</dd>
    </dl>
{foreachelse}
{/foreach}
