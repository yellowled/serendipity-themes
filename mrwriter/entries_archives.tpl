{serendipity_hookPlugin hook="entries_header"}

<h1>{$CONST.ARCHIVES}</h1>
{foreach from=$archives item="archive"}
<h2>{$archive.year}</h2>
{foreach from=$archive.months item="month"}
<dl class="archives_row">
   <dt class="archives_date">{$month.date|@formatTime:"%B"}: {$month.entry_count} {$CONST.ENTRIES}</dt>
   <dd class="archives_count_link">{if $month.entry_count}<a href="{$month.link}">{/if}{$CONST.VIEW_FULL}{if $month.entry_count}</a>{/if}</dd>
   <dd class="archives_link">{if $month.entry_count}<a href="{$month.link_summary}">{/if}{$CONST.VIEW_TOPICS}{if $month.entry_count}</a>{/if}</dd>
</dl>
{/foreach}
{/foreach}

<div class="serendipity_pageFooter" style="text-align: center">
{serendipity_hookPlugin hook="entries_footer"}
</div>
