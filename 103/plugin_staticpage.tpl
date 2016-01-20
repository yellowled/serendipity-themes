<div id="static_{$staticpage_pagetitle|@makeFilename|lower}" class="clearfix">
    <div class="entry-info">
        <h1 class="entry-title">{$staticpage_headline|@escape}</h1>

      {if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
        <p class="staticpage_password">{$CONST.STATICPAGE_PASSWORD_NOTICE}</p>
      {else}
        {if $staticpage_precontent}
        <div class="preface">{$staticpage_precontent}</div>
        {/if}

        {if is_array($staticpage_childpages)}
        <ul id="staticpage_childpages">
        {foreach from=$staticpage_childpages item="childpage"}
           <li><a href="{$childpage.permalink|@escape}" title="{$childpage.pagetitle|@escape}">{$childpage.pagetitle|@escape}</a></li>
        {/foreach}
        </ul>
        {/if}
      {/if}
    </div>

    <div class="entry-body">
      {if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
        <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
            <input type="password" name="serendipity[pass]" value="" />
            <input type="submit" name="submit" value="{$CONST.GO}" />
        </form>
      {else}
        {$staticpage_content}
      {/if}
    </div>    
</div>
