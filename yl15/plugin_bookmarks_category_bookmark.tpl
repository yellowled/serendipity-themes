
<!-- plugin_bookmarks_category_bookmark.tpl start -->

<div id="serendipityBookmarktitle">
<h4 class="serendipity_date">{$smarty.const.BOOKMARK_NAME} :: {$bookmark_plugin.this_bookmark.linkheadline}</h4>
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

<div id="serendipityBookmarkcontent">
<h4 class="serendipity_title">{$bookmark_plugin.this_bookmark.linkheadline}</h4>
<p><b>{$smarty.const.BOOKMARK_LINK}:</b> <a href="{$bookmark_plugin.this_bookmark.link}">{$bookmark_plugin.this_bookmark.link}</a></p>
<p><b>{$smarty.const.BOOKMARK_DESCRIPTION}:</b> {$bookmark_plugin.this_bookmark.description}</p>

{if $bookmark_plugin.prev_bookmark.bookmarkid}
<p>{$smarty.const.BOOKMARK_PREVOUS}: <a href="{$serendipityBaseURL}{$bookmark_plugin.plugin_url}/{$bookmark_plugin.prev_bookmark.categoryid}/{$bookmark_plugin.prev_bookmark.bookmarkid}">{$bookmark_plugin.prev_bookmark.linkheadline}</a></p>
{/if}
{if $bookmark_plugin.next_bookmark.bookmarkid}
<p>{$smarty.const.BOOKMARK_NEXT}: <a href="{$serendipityBaseURL}{$bookmark_plugin.plugin_url}/{$bookmark_plugin.next_bookmark.categoryid}/{$bookmark_plugin.next_bookmark.bookmarkid}">{$bookmark_plugin.next_bookmark.linkheadline}</a></p>
{/if}
</div>

<!-- plugin_faq_category_faq.tpl end -->
