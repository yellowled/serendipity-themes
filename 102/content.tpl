<!-- CONTENT START -->
{if $searchresult_tooShort or $searchresult_error or $searchresult_noEntries or $searchresult_results}
<dl class="serendipity_search">
   <dt>{$CONST.QUICKSEARCH}</dt>
   <dd>{$content_message}</dd>
</dl>
{elseif $content_message}
<p class="serendipity_content_message">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
<!-- CONTENT END -->
