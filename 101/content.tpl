<!-- CONTENT START -->
{if $searchresult_tooShort}
    <dl class="searchbox">
       <dt>{$CONST.QUICKSEARCH}</dt>
       <dd>{$content_message}</dd>
    </dl>
{elseif $searchresult_error}
    <dl class="searchbox">
       <dt>{$CONST.QUICKSEARCH}</dt>
       <dd>{$content_message}</dd>
    </dl>
{elseif $searchresult_noEntries}
    <dl class="searchbox">
       <dt>{$CONST.QUICKSEARCH}</dt>
       <dd>{$content_message}</dd>
    </dl>
{elseif $searchresult_results}
    <dl class="searchbox">
       <dt>{$CONST.QUICKSEARCH}</dt>
       <dd>{$content_message}</dd>
    </dl>
{else}
    <p class="contentmessage">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
<!-- CONTENT END -->
