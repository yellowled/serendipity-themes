{if $is_embedded != true}
{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
          "http://www.w3.org/TR/html4/loose.dtd">
{/if}

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}">
<head>
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
{if $lang == 'de'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="sir-de.css"}" />
{else}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="sir-en.css"}" />
{/if}
<!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="ie.css"}" />
<![endif]-->
{if $template_option.feedburner != ''}
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$template_option.feedburner|escape}" />
{else}
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
{/if}
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
{assign var="skipcont" value=$CONST.SKIPCONT_102}
{assign var="skipnavi" value=$CONST.SKIPNAVI_102}
{assign var="srchdeflt" value=$CONST.SRCHDEFLT_102}
{assign var="srchstart" value=$CONST.SRCHSTART_102}

<div id="page">
    <div id="skip">
        <ul>
           <li><a href="#cont" accesskey="S">{$skipcont}</a></li>
           <li><a href="#navi">{$skipnavi}</a></li>
        </ul>

        <form id="srch" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
            <input type="hidden" name="serendipity[action]" value="search" />
            <fieldset>
                <label for="srchbox">{$CONST.QUICKSEARCH} in {$blogTitle}:</label>
                <input id="srchbox" type="text" name="serendipity[searchTerm]" value="{$srchdeflt}" onfocus="if(this.value=='{$srchdeflt}')value=''" onblur="if(this.value=='')value='{$srchdeflt}';" />
                <label class="hidden" for="srchbut">{$srchstart}</label>
                <input id="srchbut" type="submit" value="{$CONST.GO}" name="serendipity[searchButton]" />
            </fieldset>
        </form>
        {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}
    </div><!-- /#skip -->

    <div id="head">
        <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>

        <div id="feed">
            <a href="{if $template_option.feedburner != ''}{$template_option.feedburner|escape}{else}{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2{/if}" title="{$blogTitle} RSS Feed"><img height="64" width="64" alt="{$blogTitle} RSS Feed{if $template_option.feedburner != ''} (via Feedburner){/if}" src="{$serendipityBaseURL}templates/{$template}/img/rss.png" /></a>
        </div><!-- /#feed -->
    </div><!-- /#head -->

    <div id="navi">
        <ul>
        {foreach from=$navlinks item="navlink" name=navbar}
           <li>{if $currpage==$navlink.href}<strong>{$navlink.title}</strong>{else}<a href="{$navlink.href}" accesskey="{$navlink.akey}" title="{$navlink.title} - access key {$navlink.akey}">{$navlink.title}</a>{/if}</li>
        {/foreach}
        </ul>
    </div><!-- closes #navi -->

    <div id="main">
        <div id="cont">
        {$CONTENT}
        </div><!-- /#cont -->

        <div id="side">
        {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
        </div><!-- /#side -->
    </div><!-- /#main -->

    <div id="bttm">
    {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
    </div><!-- /#bttm -->

    <div id="foot">
        <div id="social" lang="en" xml:lang="en">
            <ul>
        {if $template_option.delicious != ''}
               <li><a href="{$template_option.delicious|escape}" title="del.icio.us Links"><img src="{$serendipityBaseURL}templates/{$template}/img/delicious.png" width="32" height="32" alt="del.icio.us" /></a></li>
        {/if}
        {if $template_option.flickr != ''}
               <li><a href="{$template_option.flickr|escape}" title="flickr Photos"><img src="{$serendipityBaseURL}templates/{$template}/img/flickr.png" width="32" height="32" alt="flickr" /></a></li>
        {/if}
        {if $template_option.technorati != ''}
               <li><a href="{$template_option.technorati|escape}" title="technorati Stats"><img src="{$serendipityBaseURL}templates/{$template}/img/technorati.png" width="32" height="32" alt="technorati" /></a></li>
        {/if}
            </ul>
        </div><!-- /#social -->

        <div id="blogmeta" lang="en" xml:lang="en">
            <ul>
               <li>{$blogTitle} is powered by <a href="http://www.s9y.org" title="Serendipity, an open source weblog engine">Serendipity</a></li>
               <li><em>YL 102</em> template by <a href="http://yellowled.de" title="Matthias 'YellowLed' Mees' website">YellowLed</a></li>
               <li>Icons by <a href="http://www.famfamfam.com/lab/icons/silk/" title="FamFamFam silk icons by Mark James">Mark James</a></li>
            </ul>
        </div><!-- /#blogmeta -->

        <div id="w3c" lang="en" xml:lang="en">
            <ul>
               <li><a href="http://validator.w3.org/check?uri=referer" title="XHTML validator">Valid <abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a></li>
               <li><a href="http://jigsaw.w3.org/css-validator/validator?uri={$serendipityBaseURL}" title="CSS validator">Valid <abbr title="Cascading StyleSheet">CSS</abbr></a></li>
            </ul>
        </div><!-- /#w3c -->
    </div><!-- /#foot -->
</div><!-- /#page -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
