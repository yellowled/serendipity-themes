{foreach from=$plugindata item=item}
{if $item.class == "serendipity_quicksearch_plugin"}
{else}
<div class="serendipitySideBarItem container_{$item.class}">
    <div class="serendipitySideBarTitle {$item.class}">
        <div class="sidebartitlecontent">{$item.title}</div>
    </div>
    <div class="serendipitySideBarContent">
        <div class="sidebarbodycontent">{$item.content}</div>
    </div>
</div>
{/if}
{/foreach}
