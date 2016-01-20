{serendipity_hookPlugin hook="entries_header"}

<h1>{$dateRange.0|@formatTime:"%B %Y"}</h1>

<dl id="summary" class="clearfix">
{foreach from=$entries item="entries"}
  {foreach from=$entries.entries item="entry"}
   <dt><a href="{$entry.link}" rel="bookmark">{$entry.title}</a></dt>
   <dd><span title="{$entry.timestamp|@formatTime:'%A, %d. %B %Y'} {$CONST.AT} {$entry.timestamp|@formatTime:'%H:%M'}">{$entry.timestamp|@formatTime:'%d.%m.%y'}</span></dd>
  {/foreach}
{/foreach}
</dl>

<div class="pagination">
{serendipity_hookPlugin hook="entries_footer"}
</div>
