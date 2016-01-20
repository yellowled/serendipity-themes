{foreach from=$comments item=comment name="comments"}
    <a id="c{$comment.id}"></a>
    <div id="comment_{$comment.id}" class="commentbox {cycle values="comment_oddbox, comment_evenbox"}" style="margin-left: {$comment.depth*10}px">
        <dl>
        {if $comment.body == 'COMMENT_DELETED'}
           <dt class="commentbody">{$CONST.COMMENT_IS_DELETED}</dt>
        {else}
           <dt class="commentbody{if $comment.id == ''} commentpreview{/if}">
           {if $comment.avatar}
               {$comment.avatar}
           {else}
               <img src="{$serendipityHTTPPath}templates/{$template}/img/noavatar.png" alt="avatar" title="{$comment.author}" class="comment_avatar" />
           {/if}
           {$comment.body}</dt>
        {/if}
           <dd class="commentsource">
               <ul>
                  <li class="commentsourceauthor">
                  {if $comment.email}
                      <a href="mailto:{$comment.email}" class="cauthorwithemail">{$comment.author|@default:$CONST.ANONYMOUS}</a>
                  {else}
                      <span class="cauthorwoutemail">{$comment.author|@default:$CONST.ANONYMOUS}</span>
                  {/if}
                  </li>
                  {if $comment.url}<li class="commentsourceurl"><a href="{$comment.url}" title="{$comment.url|@escape}" class="cauthorsuri">{$CONST.HOMEPAGE}</a></li>{/if}
                  <li class="commentsourcedate">{$CONST.ON} {$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</li>
                  <li><a class="commentsourcetrace" href="#c{$comment.id}">Permalink</a>{if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}<span class="replytocomment"> &bull; <a class="commentreply" href="#commentform" id="reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a></span><div id="replyform_{$comment.id}" class="replyformlink"></div>{/if}{if $entry.is_entry_owner} &bull; <a class="commentsourceownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>{/if}</li>
               </ul>
           </dd>
        </dl>
    </div>
{foreachelse}
    <p class="nocomments">{$CONST.NO_COMMENTS}</p>
{/foreach}
