{serendipity_hookPlugin hook="entries_header"}
{assign var="noentries" value=$CONST.NOENTRIES_102}
{assign var="joneentry" value=$CONST.JONEENTRY_102}
<h2 id="archhead">{$CONST.ARCHIVES}</h2>
{foreach from=$archives item="archive"}
<h3 class="ayear"><span class="date">{$archive.year}</span></h3>
<ul class="themonths">
   {foreach from=$archive.months item="month"}
   <li class="amonth">{if $month.entry_count != '0'}<a href="{$month.link_summary}">{/if}{$month.date|@formatTime:"%B"}{if $month.entry_count != '0'}</a>{/if}: {if $month.entry_count == '0'}{$noentries}{elseif $month.entry_count == '1'}{$joneentry}{else}{$month.entry_count} {$CONST.ENTRIES}{/if}</li>
   {/foreach}
</ul>
{/foreach}
<div class="pagination">
{serendipity_hookPlugin hook="entries_footer"}
</div>
