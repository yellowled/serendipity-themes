{foreach from=$trackbacks item=trackback}
    <a id="c{$trackback.id}"></a>
    <dl id="trackback-{$trackback.id}" class="atrackback">
       <dt><a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a></dt>
       <dd>{$trackback.body|@strip_tags|@escape:all}</dd>
       <dd><strong>Weblog:</strong> {$trackback.author|@default:$CONST.ANONYMOUS}</dd>
       <dd><strong>{$CONST.TRACKED}:</strong> {$trackback.timestamp|@formatTime:'%b %d, %H:%M'}</dd>
    </dl>
    {if $entry.is_entry_owner}
    <p><a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a></p>
    {/if}
{foreachelse}
    <p class="serendipity_center">{$CONST.NO_TRACKBACKS}</p>
{/foreach}
