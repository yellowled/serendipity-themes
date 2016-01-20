
<!-- plugin_bookmarks_categories.tpl start -->
<!-- debug: categories1 -->
<div id="serendipityBookmarktitle">
<h4 class="serendipity_date">{$smarty.const.BOOKMARK_NAME} :: {$smarty.const.BOOKMARK_CATEGORIES}</h4>
</div>

<div id="serendipityBookmarknav">
<p><a href="{$serendipityBaseURL}">{$smarty.const.ADMIN_FRONTPAGE}</a> &gt; {$smarty.const.BOOKMARK_NAME}</p>
</div>

{if is_array($bookmark_plugin.categories)}
<div class="serendipityBookmarklist">
{assign var="depth" value=0}
<ul>
{foreach from=$bookmark_plugin.categories item=cat}

{if $depth > $cat.depth}
{str_repeat string="</ul>" repeat=$depth}
{/if}

{if $depth < $cat.depth}
<ul class="bmsubcats">
{/if}
<li><a href="{$serendipityBaseURL}{$bookmark_plugin.plugin_url}/{$cat.id}">{$cat.category}</a></li>

{assign var="depth" value=$cat.depth}
{/foreach}
</ul>
</div>
{/if}

<!-- plugin_bookmarks_categories.tpl end -->
