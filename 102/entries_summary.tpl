{serendipity_hookPlugin hook="entries_header"}
<h2>{$CONST.TOPICS_OF} {$dateRange.0|@formatTime:"%B %Y"}</h2>
<dl id="thesummary">
{foreach from=$entries item="entries"}
    {foreach from=$entries.entries item="entry"}
        <dt><a href="{$entry.link}" rel="bookmark">{$entry.title}</a></dt>
        <dd>{if $entry.categories}<span class="cats">{foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}</span>{/if} <span class="date">{if $dategroup.is_sticky}{$CONST.STICKY_POSTINGS}{else}{$entry.timestamp|@formatTime:'%d.%m.%Y'}, {$entry.timestamp|@formatTime:'%H:%M'}{/if}</span></dd>
    {/foreach}
{/foreach}
</dl>
<div class="pagination">
{serendipity_hookPlugin hook="entries_footer"}
</div>
