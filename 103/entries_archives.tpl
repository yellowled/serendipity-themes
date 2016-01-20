{serendipity_hookPlugin hook="entries_header"}

<h1>{$CONST.ARCHIVES}</h1>

<div id="bycats" class="clearfix">
{serendipity_showPlugin class="serendipity_categories_plugin"}
</div>
<div id="bytags" class="clearfix">
{serendipity_showPlugin class="serendipity_plugin_freetag"}
</div>

<div id="bydate" class="clearfix">
    <div class="entry-info">
        <h2>{$CONST.DATE}</h2>
    </div>

    <div class="entry-body">
  {foreach from=$archives item="archive"}
    <h3>{$archive.year}</h3>

    <ul class="ayear plainList clearfix">
    {foreach from=$archive.months item="month"}
       <li class="amonth">{if $month.entry_count != '0'}<a href="{$month.link_summary}">{/if}{$month.date|@formatTime:"%B"}{if $month.entry_count != '0'}</a>{/if}: {$month.entry_count} {$CONST.ENTRIES}</li>
    {/foreach}
    </ul>
{/foreach}
    </div>
</div>

<div class="pagination">
{serendipity_hookPlugin hook="entries_footer"}
</div>
