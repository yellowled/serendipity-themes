{foreach from=$plugindata item=item}
  {if $item.class == "serendipity_categories_plugin"}
    <div class="entry-info">
        <h2>{$item.title}</h2>
    </div>
  {elseif $item.class == "serendipity_plugin_freetag"}
    <div class="entry-info">
        <h2>{$item.title}</h2>
    </div>
  {elseif $item.title != ""}
    <h2>{$item.title}</h2>
  {/if}
  {if $item.class == "serendipity_categories_plugin"}
    <div class="entry-body">
    {$item.content}
    </div>
  {elseif $item.class == "serendipity_plugin_freetag"}
    <div class="entry-body">
    {$item.content}
    </div>
  {else}
    {$item.content}
  {/if}
{/foreach}
