{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach from=$plugindata item=item}
    {if $item.class == "serendipity_quicksearch_plugin"}
    {else}
    <div id="{$item.class}" class="pluginbox">
        {if $item.title != ""}<div class="plugintitle">{$item.title}</div>{/if}
        <div class="plugincontent">{$item.content}</div>
    </div>
    {/if}
{/foreach}
{if $is_raw_mode}
</div>
{/if}
