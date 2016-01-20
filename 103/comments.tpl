{if $entry.comments == 0}
<p>{$CONST.NO_COMMENTS}</p>
{else}
<ul class="comments plainList">
  {foreach from=$comments item=comment name="comments"}
   <li id="c{$comment.id}" class="clearfix {cycle values="odd, even"}"><span class="comment-info"><cite>{if $comment.avatar}{$comment.avatar}{/if} {if $comment.url}<a href="{$comment.url}" title="{$comment.url|@escape}">{/if}{$comment.author|@default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}</cite> <span class="timestamp" title="{$CONST.ON} {$comment.timestamp|@formatTime:'%d.%m.%Y'} {$CONST.AT} {$comment.timestamp|@formatTime:'%H:%M'}">{$comment.timestamp|@formatTime:'%d.%m.%y'}, {$comment.timestamp|@formatTime:'%H:%M'}</span>:</span> <div class="comment-body">{if $comment.body == 'COMMENT_DELETED'}({$CONST.COMMENT_IS_DELETED}){else}{$comment.body}{/if}</div></li>
  {/foreach}
</ul>
{/if}