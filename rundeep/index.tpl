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
<div id="serendipity_banner">
<a id="topofpage"></a>
<h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|@default:$blogTitle|truncate:80:" ..."}</a></h1>
<h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|@default:$blogDescription}</a></h2>
</div>
<div id="breadcrumb">
&bull;	{if $head_version < 1.1}
				<a href="{$serendipityBaseURL}" id="bcBlog" title="Weblog (Start)">Blog</a>&nbsp;
			{else}
				<a href="{$template_option.navlink1url}" title="{$template_option.navlink1text}">{$template_option.navlink1text}</a>&nbsp;
			{/if}
&bull;	{if $head_version < 1.1}
				<a href="http://www.yellowled.de/" id="bcWebsite" title="Webseite (Start)">Webseite</a>&nbsp;
			{else}
				<a href="{$template_option.navlink2url}" title="{$template_option.navlink2text}">{$template_option.navlink2text}</a>&nbsp;
			{/if}
&bull;	{if $head_version < 1.1}
				<a href="http://www.yellowled.de/aboutme.html" id="bcAboutMe" title="About me">About me</a>&nbsp;
			{else}
				<a href="{$template_option.navlink3url}" title="{$template_option.navlink3text}">{$template_option.navlink3text}</a>&nbsp;
			{/if}
&bull;	{if $head_version < 1.1}
				<a href="{$serendipityBaseURL}pages/emailme.html" id="bcEmail" title="E-Mail (Kontakformular)">E-Mail</a>&nbsp;
			{else}
				<a href="{$template_option.navlink4url}" title="{$template_option.navlink4text}">{$template_option.navlink4text}</a>&nbsp;
			{/if}
&bull; <a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" id="bcRSS" title="RSS feed">RSS</a>&nbsp;/&nbsp;<a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" id="bcAtom" title="Atom feed">Atom</a>&nbsp;
&bull; <a href="{$serendipityBaseURL}admin/" id="adminLogin" title="Admin login">Login</a>
</div>
<div id="mainpane">
<div id="content" class="content {if $leftSidebarElements > 0} withLeftSideBar{/if} {if $rightSidebarElements > 0} withRightSideBar{/if}">{$CONTENT}</div>
{if $leftSidebarElements > 0}
<div id="serendipityLeftSideBar">{serendipity_printSidebar side="left"}</div>
{/if}
{if $rightSidebarElements > 0}
<div id="serendipityRightSideBar">{serendipity_printSidebar side="right"}</div>
{/if}
</div>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
<div id="footer">
<p>{$CONST.POWERED_BY}&nbsp;<a href="http://www.s9y.org">s9y</a> - Design by <a href="http://www.yellowled.de">YellowLed</a></p>
</div>
</body>
</html>
{/if}
