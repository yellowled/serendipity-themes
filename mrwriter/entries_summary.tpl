{serendipity_hookPlugin hook="entries_header"}

<h1>{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B %Y"}</h1>

<dl>
{foreach from=$entries item="entries"}
{foreach from=$entries.entries item="entry"}
   <dt><a href="{$entry.link}">{$entry.title}</a></dt>
   <dd>{$CONST.POSTED_BY} {$entry.author} {$CONST.ON} {$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</dd>
{/foreach}
{/foreach}
</dl>

<div class="serendipity_entryFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>
