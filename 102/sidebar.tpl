<ul class="sidebar">
{foreach from=$plugindata item=item}
{if $item.class == "serendipity_quicksearch_plugin"}
{else}
   <li{if $item.class != "serendipity_html_nugget_plugin" && $item.class != "serendipity_plugin_history"} id="{$item.class}"{/if} class="sbplugin{if $item.class == "serendipity_html_nugget_plugin"} {$item.class}_{counter}{/if}{if $item.title == "Vor einem Jahr"} {$item.class}_1{/if}{if $item.title == "Vor zwei Jahren"} {$item.class}_2{/if}">
      <div class="sbcontent">
      {if $item.title != ""}
          <h2>{$item.title}</h2>
      {/if}
          {$item.content}
      </div>
   </li>
{/if}
{/foreach}
</ul>
