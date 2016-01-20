<!-- CONTENT START -->
{if $searchresult_tooShort}
    <dl class="serendipity_search serendipity_search_tooshort">
       <dt>{$CONST.QUICKSEARCH}</dt>
       <dd>{$content_message}</dd>
    </dl>
{elseif $searchresult_error}
    <dl class="serendipity_search serendipity_search_error">
       <dt>{$CONST.QUICKSEARCH}</dt>
       <dd>{$content_message}</dd>
    </dl>
{elseif $searchresult_noEntries}
    <dl class="serendipity_search serendipity_search_noentries">
       <dt>{$CONST.QUICKSEARCH}</dt>
       <dd>{$content_message}</dd>
    </dl>
{elseif $searchresult_results}
    <dl class="serendipity_search serendipity_search_results">
       <dt>{$CONST.QUICKSEARCH}</dt>
       <dd>{$content_message}</dd>
    </dl>
{else}
    <p class="serendipity_content_message">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
<!-- CONTENT END -->
