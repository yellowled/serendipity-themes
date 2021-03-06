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
<div id="header">
<div id="breadcrumb">
    &bull; <a href="{$serendipityBaseURL}" id="bcBlog" title="Weblog (Start)">Blog</a>&nbsp;
    &bull; <a href="http://www.yellowled.de/" id="bcWebsite" title="Website (Start)">Website</a>&nbsp;
    &bull; <a href="http://www.yellowled.de/aboutme.html" id="bcAboutMe" title="About the author">About me</a>&nbsp;
    &bull; <a href="pages/emailme.html" id="bcEmail" title="E-Mail the author">E-Mail</a>&nbsp;
    &bull; <a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" id="bcRSS" title="RSS feed">RSS</a>&nbsp;/&nbsp;<a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" id="bcAtom" title="Atom feed">Atom</a>&nbsp;
</div>
<div id="serendipity_banner">
    <h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|@default:$blogTitle}</a></h1>
    <h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|@default:$blogDescription}</a></h2>
</div>
</div>
<div id="mainborder">
<table id="mainpane">
    <tr>
{if $leftSidebarElements > 0}
        <td id="serendipityLeftSideBar" valign="top">{serendipity_printSidebar side="left"}</td>
{/if}
        <td id="content" valign="top">{$CONTENT}</td>
{if $rightSidebarElements > 0}
        <td id="serendipityRightSideBar" valign="top">{serendipity_printSidebar side="right"}</td>
{/if}
    </tr>
</table>
</div>
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
