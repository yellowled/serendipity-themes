{if $is_embedded != true}
{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
{/if}

<html>
<head>
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
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

<!-- MAINPANE -->
<div id="mainpane">
<!-- NAVBAR -->
<div id="navbar">
  <ul>
     <!-- These navbar links should usually work out of the box. If you have assigned  -->
     <!-- a different permalink to the contactform, you should insert it below instead -->
     <!-- of the default 'contactform.html'.                                           -->
     <!--                                                                              -->
     <li><a href="{$serendipityBaseURL}" id="navIndex" title="Index page">Index</a></li>
     <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}pages/contactform.html" id="navMail" title="Email">Email</a></li>
     <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" id="navRSS" title="RSS 2.0 Feed">RSS</a></li>
     <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}admin/" id="navAdmin" title="Admin login">Login</a></li>
  </ul>
</div>

<div id="serendipity_banner">
<a id="topofpage"></a>
<h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|@default:$blogDescription}</a></h2>
<h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|@default:$blogTitle|truncate:60:" ..."}</a></h1>
</div>

<!-- CONTENT  -->
<div id="content">{$CONTENT}</div>
<!-- SIDEBARS -->
<div id="sidebar">
{serendipity_printSidebar side="left"}
{serendipity_printSidebar side="right"}
</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
<div id="footer">
<p>{$CONST.POWERED_BY} <a href="http://www.s9y.org">s9y</a> - Template by <a href="http://www.yellowled.de">YellowLed</a></p>
</div>
</div><!-- closes #mainpane -->
<!-- END MAINPANE -->
</body>
</html>
{/if}
