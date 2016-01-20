{foreach from=$trackbacks item=trackback}
    <dl id="c{$trackback.id}" class="atrackback {cycle values="odd, even"}">
       <dt><strong><cite>{$trackback.author|@default:$CONST.ANONYMOUS}</cite>:</strong> <a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.title}</a> ({$trackback.timestamp|@formatTime:'%d.%m.%Y, %H:%M'}):</dt>
       <dd><q>{$trackback.body|@strip_tags|@escape:all}</q></dd>
    </dl>
{foreachelse}
{/foreach}
