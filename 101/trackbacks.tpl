{foreach from=$trackbacks item=trackback}
    <a id="c{$trackback.id}"></a>
    <dl>
       <dt><a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a></dt>
       <dd class="trackbackbody">{$trackback.body|@strip_tags|@escape:all}</dd>
       <dd class="trackbackblog"><strong>Weblog:</strong> {$trackback.author|@default:$CONST.ANONYMOUS}</dd>
       <dd class="trackbacktime"><strong>{$CONST.TRACKED}:</strong> {$trackback.timestamp|@formatTime:'%b %d, %H:%M'}</dd>
    </dl>
    <p class="trackbackdelete">{if $entry.is_entry_owner}<a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>{/if}</p>
{foreachelse}
    <p class="nocomments">{$CONST.NO_TRACKBACKS}</p>
{/foreach}
