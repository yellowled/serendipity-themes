<div class="serendipity_entry">
<h1 class="serendipity_title">{$staticpage_headline|@escape}</h1>

{if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
        <p class="staticpagepassword">{$CONST.STATICPAGE_PASSWORD_NOTICE}</p>
        <form class="staticpagepasswordform" action="{$staticpage_form_url}" method="post">
            <input type="password" name="serendipity[pass]" value="" />
            <input type="submit" name="submit" value="{$CONST.GO}" />
        </form>
{else}
        <div class="staticpageprecontent">{$staticpage_precontent}</div>
        {if is_array($staticpage_childpages)}
        <ul id="staticpagechildpages">
            {foreach from=$staticpage_childpages item="childpage"}
            <li><a href="{$childpage.permalink|@escape}" title="{$childpage.pagetitle|@escape}">{$childpage.pagetitle|@escape}</a></li>
            {/foreach}
        </ul>
        {/if}
        <div class="staticpagecontent">{$staticpage_content}</div>
{/if}

{if $staticpage_author}
    <p class="staticpageauthor">{$staticpage_author|@escape}</p>
{/if}

    <p class="staticpagemetainfo">
{if $staticpage_lastchange}
    <span class="staticpagemetainfolastchange">{$staticpage_lastchange|date_format:"%Y-%m-%d"}</span>
{/if}
{if $staticpage_adminlink AND $staticpage_adminlink.page_user}
    | <a class="staticpagemetainfoeditlink" href="{$staticpage_adminlink.link_edit}">{$staticpage_adminlink.link_name|@escape}</a>
{/if}
    </p>
{if $staticpage_navigation AND $staticpage_shownavi}
    <ul class="staticpagenavigation">
      <li class="staticpagenavigationleft"><a href="{$staticpage_navigation.prev.link}" title="prev">{$staticpage_navigation.prev.name|@escape}</a></li>
      <li class="staticpagenavigationcenter"><a href="{$staticpage_navigation.top.link}" title="top">{$staticpage_navigation.top.name|@escape}</a></li>
      <li class="staticpagenavigationright"><a href="{$staticpage_navigation.next.link}" title="next">{$staticpage_navigation.next.name|@escape}</a></li>
    </ul>
    <ul class="staticpagenavigationcrumbs">
      {foreach name="crumbs" from=$staticpage_navigation.crumbs item="crumb"}
       <li>{if !$smarty.foreach.crumbs.first}&raquo;{/if}<a href="{$crumb.link}">{$crumb.name|@escape}</a></li>
      {/foreach}
    </ul>
{/if}
</div>