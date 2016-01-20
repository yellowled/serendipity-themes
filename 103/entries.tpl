{assign var="readmore" value=$CONST.YL103_READ_MORE}
<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}

    {foreach from=$entries item="dategroup"}
      {foreach from=$dategroup.entries item="entry"}
      {assign var="entry" value=$entry scope="parent"}
        <div id="entry-{$entry.id}" class="entry">
            <div class="entry-info">
                <h1 class="entry-title"><a href="{$entry.link}" rel="bookmark">{$entry.title}</a></h1>

               <ul class="entry-meta plainList">
                  <li class="published" title="{$entry.timestamp|@formatTime:'%A, %d. %B %Y'} {$CONST.AT} {$entry.timestamp|@formatTime:'%H:%M'}">{$entry.timestamp|@formatTime:'%d.%m.%y'}</li>
               {if $entry.categories}
                  <li class="category">{foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}" title="{$CONST.CATEGORY}: {$entry_category.category_name|@escape}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}</li>
               {/if}
               {if $entry.has_comments}
                  <li class="feedback" title="{$entry.comments} {$entry.label_comments}, {$entry.trackbacks} {$entry.label_trackbacks}"><a href="{$entry.link}#comments">{$entry.comments} {$entry.label_comments}</a></li>
               {/if}
                  <li class="tweetthis"><a href="{$entry.url_tweetthis}">Tweet this!</a></li>
                  <li class="dentthis"><a href="{$entry.url_dentthis}">Dent this!</a></li>
                  <li class="shorturl"><a href="{$entry.url_shorturl}">{if $lang == "de"}Kurz-{else}Short {/if}<abbr title="Uniform Resource Locator" lang="en">URL</abbr></a></li>
               </ul>
            </div>

            <div class="entry-body">
                {$entry.body}
            {if $entry.is_extended}
                <div id="extended">
                {$entry.extended}
                </div>
            {/if}
            {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
                <p><a href="{$entry.link}#extended">{$readmore} &raquo;</a></p>
            {/if}
            </div>

            <div class="entry-footer">
            {$entry.add_footer}
            {$entry.plugin_display_dat}
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


      {if $is_single_entry and not $use_popups and not $is_preview}
        {if $CONST.DATA_UNSUBSCRIBED}
        <p class="serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</p>
        {/if}
        {if $CONST.DATA_TRACKBACK_DELETED}
        <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</p>
        {/if}
        {if $CONST.DATA_TRACKBACK_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</p>
        {/if}
        {if $CONST.DATA_COMMENT_DELETED}
        <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</p>
        {/if}
        {if $CONST.DATA_COMMENT_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</p>
        {/if}

        <h2 id="trackbacks">{$entry.trackbacks} {$entry.label_trackbacks}</h2>

        <p><a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">Trackback-<abbr title="Uniform Resource Locator">URL</abbr></a></p>

        {serendipity_printTrackbacks entry=$entry.id}
      {/if}

      {if $is_single_entry and not $is_preview}
        <h2 id="comments">{$entry.comments} {$entry.label_comments}</h2>

        <p><a href="{$serendipityBaseURL}rss.php?version=2.0&amp;type=comments&amp;cid={$entry.id}"><abbr title="Really Simple Syndication" lang="en">RSS</abbr> Feed ({$CONST.COMMENTS}) {if $lang == 'de'}für diesen Eintrag{else}for this entry{/if}</a></p>

        {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

        <a id="feedback"></a>

        {foreach from=$comments_messagestack item="message"}
        <p class="serendipity_msg_important">{$message}</p>
        {/foreach}

        {if $is_comment_added}
        <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED}</p>
        {elseif $is_comment_moderate}
        <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED} ({$CONST.THIS_COMMENT_NEEDS_REVIEW})</p>
        {elseif not $entry.allow_comments}
        <p class="serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
        {else}
        <h2>{$CONST.ADD_COMMENT}</h2>

        {$COMMENTFORM}
        {/if}
      {/if}

      {$entry.backend_preview}
      {/foreach}
    {foreachelse}
      {if not $plugin_clean_page}
        <p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
      {/if}
    {/foreach}

    <div class="pagination">
    {if $footer_info}
        <p class="paginfo">{$footer_info}</p>
    {/if}

        <div class="pagelinks">
         {eval var=$footer_currentPage-3 assign="paginationStartPage"}

         {if $footer_currentPage+3 > $footer_totalPages}
            {eval var=$footer_totalPages-6 assign="paginationStartPage"}
         {/if}

         {if $paginationStartPage <= 0}
            {assign var="paginationStartPage" value="1"}
         {/if}

         {if $footer_prev_page}
            <a title="{$CONST.PREVIOUS_PAGE}" href="{$footer_prev_page}"><span class="pagarrow">&laquo;</span></a>
         {/if}

         {if $paginationStartPage > 1}
            <a href="{'1'|string_format:$footer_pageLink}">1</a>
         {/if}

         {if $paginationStartPage > 2}
            &hellip;
         {/if}

         {section name=i start=$paginationStartPage loop=$footer_totalPages+1 max=7}
            {if $smarty.section.i.index != $footer_currentPage}
            <a href="{$smarty.section.i.index|string_format:$footer_pageLink}">{$smarty.section.i.index}</a>
            {else}
            <span id="thispage">{$smarty.section.i.index}</span>
            {/if}
         {/section}

         {if $smarty.section.i.index < $footer_totalPages}
            &hellip;
         {/if}

         {if $smarty.section.i.index <= $footer_totalPages}
            <a href="{$footer_totalPages|string_format:$footer_pageLink}">{$footer_totalPages}</a>
         {/if}

         {if $footer_next_page}
            <a title="{$CONST.NEXT_PAGE}" href="{$footer_next_page}"><span class="pagarrow">&raquo;</span></a>
         {/if}
        </div>
        {serendipity_hookPlugin hook="entries_footer"}
    </div>
<!-- ENTRIES END -->
