{serendipity_hookPlugin hook="entries_header"}
{assign var="fullmonth" value=$CONST.FULLMONTH_101}
{assign var="onlyheads" value=$CONST.ONLYHEADS_101}
{assign var="entrysing" value=$CONST.ENTRY_101}
<div class="archives">
<h1 class="serendipity_title">{$CONST.ARCHIVES}</h1>
{foreach from=$archives item="archive"}
    <h2 class="archivesheader">{$archive.year}</h2>
    {foreach from=$archive.months item="month"}
    <dl class="archivesrow">
       <dt class="archivesdate"><span class="archdate">{$month.date|@formatTime:"%B"}</span>: {$month.entry_count} {if $month.entry_count == '1'}{$entrysing}{else}{$CONST.ENTRIES}{/if}</dt>
    {if $month.entry_count == '0'}
       <dd class="archivesnoentry">({$CONST.NO_ENTRIES_TO_PRINT})</dd>
    {else}
       <dd class="archivescountlink">{if $month.entry_count}<span class="archgo"><a href="{$month.link}">{$fullmonth}</a></span>{else}&ndash;{/if}</dd>
       <dd class="archiveslink">{if $month.entry_count}<span class="archmag"><a href="{$month.link_summary}">{$onlyheads}</a></span>{else}&ndash;{/if}</dd>
    {/if}
    </dl>
    {/foreach}
{/foreach}
</div>
<div id="pagination">
{serendipity_hookPlugin hook="entries_footer"}
</div>
