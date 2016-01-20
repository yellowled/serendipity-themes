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
    <link rel="shortcut icon" href="{$serendipityBaseURL}favicon.ico" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}
{if $head_version < 1.1}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="yl.css"}" />
{else}
{if $template_option.colorset == 'YL'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="yl.css"}" />
{elseif $template_option.colorset == 'RL'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="rl.css"}" />
{elseif $template_option.colorset == 'TM'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="tm.css"}" />
{elseif $template_option.colorset == 'PI'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="pi.css"}" />
{elseif $template_option.colorset == 'MC'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="mc.css"}" />
{/if}
    <!--[if lt IE 6]>
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="ie.css"}" />
    <![endif]-->
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}

<div id="mainpane">
<div id="serendipity_banner">
<div id="rounded_TL">
<div id="rounded_TR">
<h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|@default:$blogTitle|truncate:60:" ..."}</a></h1>
<h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|@default:$blogDescription}</a></h2>
</div><!-- closes #rounded_TR -->
</div><!-- closes #rounded_TL -->
</div><!-- closes #serendipity_banner -->

<div id="skiplinks">
<a id="topnav" name="topnav"></a>
<a href="#slnavbar" class="skip" title="Zur Navigation">Zur Navigation</a>
<a href="#slcontent" class="skip" title="Zum Inhalt">Zum Inhalt</a>
</div>

<div id="navbar">
  <a id="slnavbar" name="slnavbar"></a>
  <ul>
  {if $head_version < 1.1}
  <!-- ****** Change navbar links here ****** -->
     <li><a href="{$serendipityBaseURL}" id="bcBlog" title="Weblog (Start)">Blog</a></li>
     <li><a href="http://www.yellowled.de/" id="bcWebsite" title="Webseite (Start)">Webseite</a></li>
     <li><a href="http://www.yellowled.de/aboutme.html" id="bcAboutMe" title="About me">About me</a></li>
     <li><a href="{$serendipityBaseURL}pages/emailme.html" id="bcEmail" title="E-Mail (Kontakformular)">E-Mail</a></li>
     <li><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" id="bcRSS" title="RSS feed">RSS</a>&nbsp;/&nbsp;<a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" id="bcAtom" title="Atom feed">Atom</a></li>
     <li><a href="{$serendipityBaseURL}admin/" id="adminLogin" title="Admin login">Login</a></li>
  {else}
     {foreach from=$navlinks item="navlink"}
     <li><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
     {/foreach}
  {/if}
  </ul>
</div><!-- closes #navbar -->

{if $leftSidebarElements > 0 && $rightSidebarElements > 0}
<!-- Case 1: 3 columns -->
<a id="slcontent" name="slcontent"></a>
<div id="serendipityLeftSideBar" class="threecolsleft">{serendipity_printSidebar side="left"}</div>
<div id="content" class="doublebar">{$CONTENT}</div>
<div id="serendipityRightSideBar" class="threecolsright">{serendipity_printSidebar side="right"}</div>
<!-- end of content -->
{/if}

{if $leftSidebarElements > 0 && $rightSidebarElements == 0}
<!-- Case 2: 2 columns, sidebar left -->
<a id="slcontent" name="slcontent"></a>
<div id="serendipityLeftSideBar" class="twocols">{serendipity_printSidebar side="left"}</div>
<div id="content" class="singlebar">{$CONTENT}</div>
<!-- end of content -->
{/if}

{if $leftSidebarElements == 0 && $rightSidebarElements > 0}
<!-- Case 3: 2 columns, sidebar right -->
<a id="slcontent" name="slcontent"></a>
<div id="content" class="singlebar">{$CONTENT}</div>
<div id="serendipityRightSideBar" class="twocols">{serendipity_printSidebar side="right"}</div>
<!-- end of content -->
{/if}

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
<div id="footer">
<div id="rounded_BL">
<div id="rounded_BR">
<p>{$CONST.POWERED_BY} <a href="http://www.s9y.org">s9y</a> - Template by <a href="http://www.yellowled.de">YellowLed</a>
{if $template_option.footer_text_toggle == 'true'}
<br />{$template_option.footer_text}</p>
{elseif $template_option.footer_text_toggle == 'false'}
</p>
{/if}
{if $head_version < 1.1}
</p>
{/if}
{if $template_option.counter_code_toggle == 'true'}
<div class="counter_code">{$template_option.counter_code}</div>
{elseif $template_option.counter_code_toggle == 'false'}
{/if}
</div><!-- closes #rounded_BR -->
</div><!-- closes #rounded_BL -->
</div><!-- closes #footer -->
</div><!-- closes #mainpane -->
</body>
</html>
{/if}
