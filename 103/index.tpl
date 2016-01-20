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
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="Powered-By" content="Serendipity v.{$head_version}" />
    <meta http-equiv="Content-Language" content="{$lang}" />
    <link rel="shortcut icon" href="{$serendipityBaseURL}favicon.ico" />
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="master.css"}" media="screen" />
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" media="screen" />
{if $template_option.externalfeed != ''}
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$template_option.externalfeed|escape}" />
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
{assign var="skiptext" value=$CONST.YL103_SKIP_TEXT}
{assign var="searchterms" value=$CONST.YL103_SEARCH_TERMS}
{assign var="socialnetwork" value=$CONST.YL103_SOCIAL_NETWORK}
{assign var="moreinfo" value=$CONST.YL103_MORE_INFO}
{assign var="imprint" value=$CONST.YL103_IMPRINT}
{assign var="contact" value=$CONST.YL103_CONTACT}
{assign var="privacy" value=$CONST.YL103_PRIVACY}
{assign var="poweredby" value=$CONST.YL103_POWERED_BY}
{assign var="templatecredit" value=$CONST.YL103_TEMPLATE_CREDIT}
{assign var="madeby" value=$CONST.YL103_MADE_BY}
{assign var="indexpage" value=$CONST.YL103_INDEX_PAGE}

<p id="skip" class="hideme"><a href="#content">{$skiptext}</a></p>

<div id="header" class="clearfix">
    <h1 id="logo"><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>

     <form id="search" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
         <input type="hidden" name="serendipity[action]" value="search" />
         <fieldset>
             <label for="searchterm" class="hideme">{$CONST.QUICKSEARCH} in {$blogTitle}</label>
             <input class="flatform" id="searchterm" type="text" name="serendipity[searchTerm]" value="{$searchterms}" onfocus="if(this.value=='{$searchterms}')value=''" onblur="if(this.value=='')value='{$searchterms}';" />
             <input type="submit" value="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]" />
        </fieldset>
     </form>
     {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}


     <dl id="social" class="clearfix">
        <dt class="hideme">{$socialnetwork}</dt>
        <dd><a href="{if $template_option.externalfeed != ''}{$template_option.externalfeed|escape}{else}{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2{/if}" title="RSS Feed"><img src="{$serendipityBaseURL}templates/{$template}/img/feed.png" alt="RSS Feed" /></a></dd>
     {if $template_option.twitter != ''}
        <dd><a href="{$template_option.twitter|escape}" title="Twitter"><img src="{$serendipityBaseURL}templates/{$template}/img/twitter.png" alt="Twitter" /></a></dd>
     {/if}
     {if $template_option.delicious != ''}
        <dd><a href="{$template_option.delicious|escape}" title="del.icio.us"><img src="{$serendipityBaseURL}templates/{$template}/img/delicious.png" alt="del.icio.us" /></a></dd>
     {/if}
     {if $template_option.flickr != ''}
        <dd><a href="{$template_option.flickr|escape}" title="flickr"><img src="{$serendipityBaseURL}templates/{$template}/img/flickr.png" alt="flickr" /></a></dd>
     {/if}
     {if $template_option.amazon != ''}
        <dd><a href="{$template_option.amazon|escape}" title="amazon Wishlist"><img src="{$serendipityBaseURL}templates/{$template}/img/amazon.png" alt="amazon Wishlist" /></a></dd>
     {/if}
     </dl>

     <dl id="archives" class="clearfix">
        <dt><a href="{$serendipityArchiveURL}">{$CONST.ARCHIVES}</a>:</dt>
        <dd><a href="{$serendipityArchiveURL}#bycats">{$CONST.CATEGORIES}</a></dd>
        <dd><a href="{$serendipityArchiveURL}#bytags">Tags</a></dd>
        <dd><a href="{$serendipityArchiveURL}#bydate">{$CONST.DATE}</a></dd>
        <dd><a href="{$serendipityBaseURL}plugin/tag/ports"><abbr title="Serendipity" lang="en">s9y</abbr> Ports</a></dd>
        <dd><a href="{$serendipityBaseURL}plugin/tag/bilingual">Bilingual{if $lang == "de"}e Einträge{else} entries{/if}</a></dd>
     </dl>
</div>

<div id="content" class="clearfix">
{if $view == "404"}
    <div id="404" class="clearfix">
        <div class="entry-info">
            <h1 class="entry-title">404: Not Found</h1>
        </div>

        <div class="entry-body">
          {if $lang == "de"}
            <p>Unter dem aufgerufenen <abbr title="Uniform Resource Locator">URL</abbr> konnten keine Inhalte gefunden werden. Das kann leider aus verschiedenen Gründen vorkommen. Sorry.</p>

            <p>Möglicherweise sind die gewünschten Inhalte über die <a href="#archives">{$CONST.ARCHIVES}</a> oder die <a href="#search">{$CONST.QUICKSEARCH}</a> zu finden.</p>
          {else}
            <p>There is no content available under that particular <abbr title="Uniform Resource Locator">URL</abbr>. Unfortunately, this can happen for various reasons. Sorry.</p>

            <p>It might be possible, however, to find that content in the <a href="#archives">{$CONST.ARCHIVES}</a> or by using the <a href="#search">{$CONST.QUICKSEARCH}</a>.</p>
          {/if}
        </div>

        <div class="entry-footer">
            <p><a href="{$serendipityBaseURL}">{$indexpage}</a></p>
        </div>
    </div>
{else}
{$CONTENT}
{/if}
</div>

<div id="footer" class="clearfix">
    <h1 class="hideme">{$moreinfo}</h1>

    <ul id="legal">
       <li><a href="{$template_option.imprinturl|escape}">{$imprint}</a></li>
       <li><a href="{$template_option.contacturl|escape}">{$contact}</a></li>
       <li><a href="{$template_option.privacyurl|escape}">{$privacy}</a></li>
    </ul>

    <p id="credits">{$blogTitle} {$poweredby} <a href="http://www.s9y.org">Serendipity</a> &amp; {$templatecredit} <em>YL 103</em> {$madeby} <a href="http://yellowled.de">YellowLed</a>. Social Icons {$madeby} <a href="http://www.quake9.com">Quake9</a>.</p>
</div>
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
