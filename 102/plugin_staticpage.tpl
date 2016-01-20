<div class="entry">
    <h2 id="sp_{$staticpage_pagetitle|@makeFilename|lower}">{$staticpage_headline|@escape}</h2>

{if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
    <p class="staticpage_password">{$CONST.STATICPAGE_PASSWORD_NOTICE}</p>

    <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
        <input type="password" name="serendipity[pass]" value="" />
        <input type="submit" name="submit" value="{$CONST.GO}" />
    </form>
{else}
    <div class="staticpage_precontent">{$staticpage_precontent}</div>

    {if is_array($staticpage_childpages)}
    <ul id="staticpage_childpages">
    {foreach from=$staticpage_childpages item="childpage"}
       <li><a href="{$childpage.permalink|@escape}" title="{$childpage.pagetitle|@escape}">{$childpage.pagetitle|@escape}</a></li>
    {/foreach}
    </ul>
    {/if}

    <div class="staticpage_content">{$staticpage_content}</div>
{/if}

    <p class="staticpagemeta"><span class="date">{$staticpage_lastchange|date_format:"%d.%m.%Y"}</span>
{if $staticpage_adminlink AND $staticpage_adminlink.page_user}
    <span class="edit"><a href="{$staticpage_adminlink.link_edit}">{$staticpage_adminlink.link_name|@escape}</a></span>
{/if}
    </p>
</div>