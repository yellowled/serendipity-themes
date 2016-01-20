{if $is_embedded != true}
{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
           "http://www.w3.org/TR/html4/loose.dtd">
{/if}

<html{if $is_xhtml} xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}"{/if}>
<head>
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
<!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="iefixes.css"}" />
<![endif]-->
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div id="bloginfo">
    <ul>
       <li class="home"><a href="{$serendipityBaseURL}" title="{$CONST.HOMEPAGE}">{$blogTitle}</a></li>
       <li class="navi"><a href="#plugins" title="Navigation">Navigation</a></li>
       <li class="mail"><a href="{$template_option.contact|escape}" title="Email">Email</a></li>
       <li class="feed"><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" title="RSS Feed"><img src="{$serendipityBaseURL}templates/{$template}/img/xml.gif" height="16" width="16" alt="RSS Feed" /></a></li>
       <li class="srch">
           <form action="{$serendipityBaseURL}" method="get">
               <input type="hidden" name="serendipity[action]" value="search" />
               <input id="sbox" alt="{$CONST.QUICKSEARCH}" type="text" name="serendipity[searchTerm]" value="" size="30" />
               <input id="sbut" type="submit" value="{$CONST.QUICKSEARCH}" alt="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]" title="{$CONST.GO}" />
           </form>
           {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
       </li>
</div><!-- /#bloginfo -->

<div id="content">
    {$CONTENT}
</div><!-- /#content -->

<div id="plugins">
{if $leftSidebarElements > 0}
    {serendipity_printSidebar side="left"}
{/if}
{if $rightSidebarElements > 0}
    {serendipity_printSidebar side="right"}
{/if}
</div><!-- /#plugins -->

<div id="credits">
    <p><span class="s9yp">Powered by <a href="http://www.s9y.org">Serendipity</a></span>
       &bull; <span class="tplt">Template by <a href="http://yellowled.de/s9y.html">YellowLed</a></span>
    </p>
</div><!-- /#credits -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
