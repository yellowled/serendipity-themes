
<!-- plugin_faq_categories.tpl start -->
<div id="serendipityFAQnav">
<p><a href="{$serendipityBaseURL}">{$smarty.const.ADMIN_FRONTPAGE}</a> &gt; {$smarty.const.FAQ_CATEGORIES}</p>
</div>

<div class="serendipityFAQcats">
<h4 class="serendipity_date">{$smarty.const.FAQ_CATEGORIES}</h4>
</div>

{if is_array($faq_plugin.categories)}
<div class="serendipityFAQlist">
<ul>
{foreach from=$faq_plugin.categories item=cat}
{if $cat.depth == 0}
<li><a href="{$serendipityBaseURL}{$faq_plugin.plugin_url}/{$cat.id}">{$cat.category}</a></li>
{/if}
{/foreach}
</ul>
</div>
{/if}
<!-- plugin_faq_categories.tpl end -->
