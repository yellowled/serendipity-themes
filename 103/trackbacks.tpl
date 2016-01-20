{if $entry.trackbacks == 0}
<p>{$CONST.NO_TRACKBACKS}</p>
{else}
<ul class="trackbacks plainList">
  {foreach from=$trackbacks item=trackback}
   <li id="c{$trackback.id}" class="clearfix {cycle values="odd, even"}"><span class="trackback-info"><cite>{$trackback.author|@default:$CONST.ANONYMOUS}: <a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a></cite> <span class="timestamp" title="{$CONST.ON} {$trackback.timestamp|@formatTime:'%d.%m.%Y'} {$CONST.AT} {$trackback.timestamp|@formatTime:'%H:%M'}">{$trackback.timestamp|@formatTime:'%d.%m.%y'}, {$trackback.timestamp|@formatTime:'%H:%M'}</span>:</span> <div class="trackback-body">{$trackback.body|@strip_tags|@escape:all}</div></li>
  {/foreach}
</ul>
{/if}