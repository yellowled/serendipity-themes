<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}

    {foreach from=$entries item="dategroup"}
    {if $dategroup.is_sticky}<div class="stickyposts">{$CONST.STICKY_POSTINGS}</div>{/if}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope="parent"}
    <div class="serendipity_entry">
        <h1 class="serendipity_title">{$entry.title}</h1>

        <p class="entrybyline">{$CONST.POSTED_BY}&nbsp;<a href="{$entry.link_author}">{$entry.author}</a>{if $entry.categories} {$CONST.IN}&nbsp;{foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}{/if} {$CONST.ON}&nbsp;{$entry.timestamp|@formatTime:DATE_FORMAT_ENTRY} {$CONST.AT}&nbsp;{$entry.timestamp|@formatTime:'%H:%M'} <span class="permalink"> &bull; <a href="{$entry.link}" rel="bookmark" title="Permalink: {$entry.title}">Permalink</a></span></p>

        <div class="serendipity_entry_body">
            {$entry.body}
        {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
            <p><span class="readmore"><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title}</a></span></p>
        {/if}

        </div>

        {if $entry.is_extended}
        <div class="serendipity_entry_body serendipity_entry_extended">
            <a id="extended"></a>
            {$entry.extended}
        </div>
        {/if}

        <div class="serendipity_entryFooter">
            <ul>
            {if $entry.has_comments}
               <li><a href="{$entry.link}#comments">{if $entry.comments == 0}{$CONST.NO_COMMENTS}{else}{$entry.comments}&nbsp;{$entry.label_comments}{/if}</a></li>
               <li><a href="{$entry.link}#commentform">{$CONST.ADD_COMMENT}</a></li>
            {/if}
            {if $entry.has_trackbacks}
               <li><a href="{$entry.link}#trackbacks">{if $entry.trackbacks == 0}{$CONST.NO_TRACKBACKS}{else}{$entry.trackbacks}&nbsp;{$entry.label_trackbacks}{/if}</a></li>
               <li><a class="trackbackuri" rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">Trackback-URI</a></li>
            {/if}
            </ul>
        </div>

        <div class="addfooter">
        {if $entry.is_entry_owner and not $is_preview}
            <a class="editlink" href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>
        {/if}
            {$entry.add_footer}
{if $template_option.addthiswidget == 'true'}
            <div class="addthiswidget">
<script type="text/javascript">
    addthis_url = '{$entry.rdf_ident|escape:url}';
    addthis_title = '{$entry.title|escape:url}';
    addthis_pub = '{$template_option.addthisaccount|escape}';
</script>
<script type="text/javascript" src="http://s7.addthis.com/js/addthis_widget.php?v=12" ></script>
            </div>
{/if}
        </div>
    </div>

    <!--
    <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
             xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
             xmlns:dc="http://purl.org/dc/elements/1.1/">
    <rdf:Description
             rdf:about="{$entry.link_rdf}"
             trackback:ping="{$entry.link_trackback}"
             dc:title="{$entry.title_rdf|@default:$entry.title}"
             dc:identifier="{$entry.rdf_ident}" />
    </rdf:RDF>
    -->
   {$entry.plugin_display_dat}

   {if $is_single_entry and not $is_preview}
       {if $CONST.DATA_UNSUBSCRIBED}
       <p class="notice msg">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</p>
       {/if}
       {if $CONST.DATA_TRACKBACK_DELETED}
       <p class="notice msg">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</p>
       {/if}
       {if $CONST.DATA_TRACKBACK_APPROVED}
       <p class="notice msg">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</p>
       {/if}
       {if $CONST.DATA_COMMENT_DELETED}
       <p class="notice msg">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</p>
       {/if}
       {if $CONST.DATA_COMMENT_APPROVED}
       <p class="notice msg">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</p>
       {/if}

       <div id="trackbacksection">
       <a id="trackbacks"></a>
           <h2>{if $entry.trackbacks != 0}{$entry.trackbacks} {/if}{if $entry.trackbacks == 1}{$CONST.TRACKBACK}{else}{$CONST.TRACKBACKS}{/if}</h2>
           <a class="trackbackuri" rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">Trackback-URI</a>
           {serendipity_printTrackbacks entry=$entry.id}
       </div>

       <div id="commentsection">
       <a id="comments"></a>
           <h2>{if $entry.comments != 0}{$entry.comments} {/if}{if $entry.comments == 1}{$CONST.COMMENT}{else}{$CONST.COMMENTS}{/if}</h2>

           <dl id="commentview">
              <dt>{$CONST.DISPLAY_COMMENTS_AS}</dt>
           {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
              <dd>({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)</dd>
           {else}
              <dd>(<a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})</dd>
           {/if}
           </dl>

           {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

           {if $entry.is_entry_owner}
               {if $entry.allow_comments}
                    <p class="msg">(<a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>)</p>
               {else}
                    <p class="msg">(<a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>)</p>
               {/if}
           {/if}

           <a id="feedback"></a>

           {foreach from=$comments_messagestack item="message"}
           <p class="important msg">{$message}</p>
           {/foreach}

           {if $is_comment_added}
               <p class="msg">{$CONST.COMMENT_ADDED}</p>
           {elseif $is_comment_moderate}
               <p class="notice msg">{$CONST.COMMENT_ADDED}{$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
           {elseif not $entry.allow_comments}
               <p class="important msg">{$CONST.COMMENTS_CLOSED}</p>
           {else}

           {$COMMENTFORM}
           {/if}
       </div>
   {/if}

   {$entry.backend_preview}
   {/foreach}

   {foreachelse}
   {if not $plugin_clean_page}
       {$CONST.NO_ENTRIES_TO_PRINT}
   {/if}
   {/foreach}

   <div id="pagination">
       <ul>
   {if $footer_prev_page}
          <li class="pagprev"><a href="{$footer_prev_page}">{$CONST.PREVIOUS_PAGE}</a></li>
   {/if}
          <li>{if $footer_info}({/if}{$footer_info}{if $footer_info}){/if}</li>
   {if $footer_next_page}
          <li class="pagnext"><a href="{$footer_next_page}">{$CONST.NEXT_PAGE}</a></li>
   {/if}
       </ul>
   {serendipity_hookPlugin hook="entries_footer"}
   </div>
<!-- ENTRIES END -->
