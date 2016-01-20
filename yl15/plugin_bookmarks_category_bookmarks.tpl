
<!-- plugin_bookmarks_category_bookmarks.tpl start -->

<div id="serendipityBookmarktitle">
<h4 class="serendipity_date">{$smarty.const.BOOKMARK_NAME} :: {$bookmark_plugin.category}</h4>
</div>

<div id="serendipityBookmarknav">
<p><a href="{$serendipityBaseURL}">{$smarty.const.ADMIN_FRONTPAGE}</a> &gt; <a href="{$serendipityBaseURL}{$bookmark_plugin.plugin_url}">{$smarty.const.BOOKMARK_CATEGORIES}</a>

{foreach from=$cat_tree item=cat}
&gt; {if $cat.id != $bookmark_plugin.catid}
<a href="{$serendipityBaseURL}{$bookmark_plugin.plugin_url}/{$cat.id}">
{/if}
{$cat.category}
{if $cat.id != $bookmark_plugin.catid}
</a>
{/if}
{/foreach}
</p>
</div>

<div id="serendipityBookmarkintro">
{if $bookmark_plugin.introduction}<p>{$bookmark_plugin.introduction}</p>{/if}
</div>

{if is_array($bookmark_plugin.subcategories)}
<ul class="bmsubcats">
{foreach from=$bookmark_plugin.subcategories item=subcat}
<li><a href="{$serendipityBaseURL}{$bookmark_plugin.plugin_url}/{$subcat.id}">{$subcat.category}</a></li>
{/foreach}
</ul>
{/if}

{if is_array($bookmark_plugin.bookmarks)}
<div class="serendipityBookmarklist">
<ul>
{foreach from=$bookmark_plugin.bookmarks item=bookmark}
<li><a href="{$serendipityBaseURL}{$bookmark_plugin.plugin_url}/{$bookmark.cid}/{$bookmark.id}">{$bookmark.linkheadline}</a> <span class="bmstatus">{$bookmark.status}</span></li>
{/foreach}
</ul>
</div>
{/if}

<!-- plugin_bookmarks_category_bookmarks.tpl end -->
