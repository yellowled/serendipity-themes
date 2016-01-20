
<!-- plugin_faq_category_faqs.tpl start -->
<div id="serendipityFAQnav">
<p><a href="{$serendipityBaseURL}">{$smarty.const.ADMIN_FRONTPAGE}</a> &gt; <a href="{$serendipityBaseURL}{$faq_plugin.plugin_url}">{$smarty.const.FAQ_CATEGORIES}</a>

{foreach from=$cat_tree item=cat}
&gt; {if $cat.id != $faq_plugin.catid}
<a href="{$serendipityBaseURL}{$faq_plugin.plugin_url}/{$cat.id}">
{/if}
{$cat.category}
{if $cat.id != $faq_plugin.catid}
</a>
{/if}
{/foreach}
</p>
</div>

<div class="serendipityFAQcats">
<h4 class="serendipity_date">{$faq_plugin.category}</h4>
{if $faq_plugin.introduction}<p>{$faq_plugin.introduction}</p>{/if}

{if is_array($faq_plugin.subcategories)}
<ul class="subcats">
{foreach from=$faq_plugin.subcategories item=subcat}
<li><a href="{$serendipityBaseURL}{$faq_plugin.plugin_url}/{$subcat.id}">{$subcat.category}</a></li>
{/foreach}
</ul>
{/if}
</div>

{if is_array($faq_plugin.faqs)}
<ul class="cats">
{foreach from=$faq_plugin.faqs item=faq}
<li><a href="{$serendipityBaseURL}{$faq_plugin.plugin_url}/{$faq.cid}/{$faq.id}">{$faq.question}</a> <span class="faqstatus">{$faq.status}</span></li>
{/foreach}
</ul>
{/if}

<!-- plugin_faq_category_faqs.tpl end -->
