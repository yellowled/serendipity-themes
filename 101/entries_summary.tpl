{serendipity_hookPlugin hook="entries_header"}
<div class="archives">
<h1 class="serendipity_title">{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B, %Y"}</h1>
{foreach from=$entries item="entries"}
    {foreach from=$entries.entries item="entry"}
    <dl class="entrysummary">
       <dt><a href="{$entry.link}">{$entry.title}</a></dt>
       <dd>{$CONST.POSTED_BY} {$entry.author} {$CONST.ON} {$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY}</dd>
    </dl>
    {/foreach}
{/foreach}
</div>
<div class="pagination">
{serendipity_hookPlugin hook="entries_footer"}
</div>
