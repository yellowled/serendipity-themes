
<!-- plugin_bookmarks_categories.tpl start -->

<div id="serendipityBookmarktitle">
<h4 class="serendipity_date">{$smarty.const.BOOKMARK_NAME} :: {$smarty.const.BOOKMARK_CATEGORIES}</h4>
</div>

<div id="serendipityBookmarknav">
<p><a href="{$serendipityBaseURL}">{$smarty.const.ADMIN_FRONTPAGE}</a> &gt; {$smarty.const.BOOKMARK_NAME}</p>
</div>

{if is_array($bookmark_plugin.categories)}
<div class="serendipityBookmarklist">
<ul>
{foreach from=$bookmark_plugin.categories item=cat}
{if $cat.depth == 0}
<li><a href="{$serendipityBaseURL}{$bookmark_plugin.plugin_url}/{$cat.id}">{$cat.category}</a></li>
{/if}
{/foreach}
</ul>
</div>
{/if}

<!-- plugin_bookmarks_categories.tpl end -->
