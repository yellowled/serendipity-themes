<dl class="staticpage_results">
   <dt>{$CONST.STATICPAGE_SEARCHRESULTS|sprintf:$staticpage_searchresults}</dt>
  {foreach from=$staticpage_results item="result"}
   <dd><a href="{$result.permalink|@escape}" title="{$result.pagetitle|@escape}">{$result.headline}</a> ({$result.realname}</dd>
  {/foreach}
</dl>
