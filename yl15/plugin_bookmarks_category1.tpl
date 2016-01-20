
<!-- plugin_bookmarks_category1.tpl start -->
<!-- debug: category1 -->
<div id="serendipityBookmarktitle">
<h4 class="serendipity_date">{$smarty.const.BOOKMARK_NAME} :: {$category.category}</h4>
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

{if is_array($bookmarks)}
<div id="serendipityBookmarkcontent">
{foreach from=$bookmarks item=bookmark}
<h4 class="serendipity_title">{$bookmark.linkheadline}</h4>
<p><b>{$smarty.const.BOOKMARK_LINK}:</b> <a href="{$bookmark.link}">{$bookmark.link}</a></p>
<p><b>{$smarty.const.BOOKMARK_DESCRIPTION}:</b> {$bookmark.description}</p>
{/foreach}
</div>
{/if}

<!-- plugin_bookmarks_category1.tpl end -->
