{if $is_embedded != true}
{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
           "http://www.w3.org/TR/html4/loose.dtd">
{/if}

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}">
<head>
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
{if $template_option.feedburner != ''}
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$template_option.feedburner|escape}" />
{else}
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{/if}
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" media="screen" />
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="print.css"}" media="print" />
<!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="iefixes.css"}" />
<![endif]-->
{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<p id="skip" lang="en"><a href="#content" accesskey="S" title="Skip to content - accesskey S">Skip to content</a></p>

<div id="wrapper">
    <div id="serendipity_banner">
        <div id="top">
        <div id="rssfeeds">
            <dl>
               <dt>RSS Feeds:</dt>
               <dd><a href="{if $template_option.feedburner != ''}{$template_option.feedburner|escape}{else}{$serendipityBaseURL}feeds/index.rss2{/if}">{$CONST.ENTRIES}</a></dd>
               <dd id="right"><a href="{$serendipityBaseURL}feeds/comments.rss2">{$CONST.COMMENTS}</a></dd>
            </dl>
        </div><!-- closes #rssfeeds -->

        <div id="search">
            <form action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
                <div>
                <input type="hidden" name="serendipity[action]" value="search" />
                <input id="searchbox" alt="{$CONST.QUICKSEARCH}" type="text" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH}..." onfocus="if(this.value=='{$CONST.QUICKSEARCH}...')value=''" onblur="if(this.value=='')value='{$CONST.QUICKSEARCH} ...';" />
                <input id="searchbutton" type="submit" value="{$CONST.QUICKSEARCH}" alt="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]" title="{$CONST.GO}" />
                </div>
            </form>
        </div><!-- closes #searchbox -->
        </div><!-- closes #top -->

        <div id="bloginfo">
            <dl>
               <dt>{$blogTitle}</dt>
               <dd>{$blogDescription}</dd>
            </dl>
        </div><!-- closes #bloginfo -->

        <div id="navigation">
            <ul>
{foreach from=$navlinks item="navlink" name=navbar}
               <li><a href="{$navlink.href}" accesskey="{$navlink.akey}" title="{$navlink.title} - access key {$navlink.akey}"{if $currpage==$navlink.href} class="currentpage"{/if}>{$navlink.title}</a></li>
{/foreach}
            </ul>
        </div><!-- closes #navigation -->
    </div><!-- closes #serendipity_banner -->

    <div id="mainpane">
        <div id="content">
            {$CONTENT}
        </div><!-- closes #content -->

        <div id="serendipityLeftSideBar">
{if $leftSidebarElements > 0}
            {serendipity_printSidebar side="left"}
{/if}
        </div><!-- closes #serendipityLeftSideBar -->
    </div><!-- closes #mainpane -->

    <div id="footer">
{if $rightSidebarElements > 0}
        <div id="serendipityRightSideBar">
        {serendipity_printSidebar side="right"}
        </div><!-- closes #serendipityRightSideBar -->
{/if}
        <p id="footercredits">
{if $rightSidebarElements > 0}
            <a id="backtotop" href="#top" title="Back to top"><img src="{$serendipityBaseURL}templates/{$template}/img/up.png" height="16" width="16" alt="Back to top" /></a>
{/if}
            Powered by <a href="http://www.s9y.org" title="Serendipity, an open source weblog engine">s9y</a> &bull; Template by <a href="http://yellowled.de" title="YellowLeds Website">YellowLed</a> &bull; Icons by <a href="http://www.famfamfam.com/lab/icons/silk/" title="Mark James' Silk icon set">Mark James</a>
        </p>

        <div id="footerlinks">
            <ul>
{if $template_option.delicious != ''}
               <li><a href="{$template_option.delicious|escape}" title="del.icio.us Links"><img src="{$serendipityBaseURL}templates/{$template}/img/delicious.png" width="80" height="15" alt="del.icio.us" /></a></li>
{/if}
{if $template_option.flickr != ''}
               <li><a href="{$template_option.flickr|escape}" title="flickr Photos"><img src="{$serendipityBaseURL}templates/{$template}/img/flickr.png" width="80" height="15" alt="flickr" /></a></li>
{/if}
{if $template_option.technorati != ''}
               <li><a href="{$template_option.technorati|escape}" title="technorati Stats"><img src="{$serendipityBaseURL}templates/{$template}/img/technorati.png" width="80" height="15" alt="technorati" /></a></li>
{/if}
{if $template_option.amazon != ''}
               <li><a href="{$template_option.amazon|escape}" title="amazon Wishlist"><img src="{$serendipityBaseURL}templates/{$template}/img/wishlist.png" width="80" height="15" alt="amazon" /></a></li>
{/if}
               <li><a href="http://validator.w3.org/check?uri=referer" title="XHTML validator"><img src="{$serendipityBaseURL}templates/{$template}/img/vxhtml.png" width="80" height="15" alt="Valid XHTML" /></a></li>
               <li><a href="http://jigsaw.w3.org/css-validator/validator?uri={$serendipityBaseURL}" title="CSS validator"><img src="{$serendipityBaseURL}templates/{$template}/img/vcss.png" width="80" height="15" alt="Valid CSS" /></a></li>
            </ul>
        </div><!-- closes #footerlinks -->
    </div><!-- closes #footer -->
</div><!-- closes #wrapper -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
