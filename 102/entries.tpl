<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
    {assign var="nocomment" value=$CONST.NOCOMMENT_102}
    {assign var="dacomment" value=$CONST.DACOMMENT_102}
    {assign var="datrckbck" value=$CONST.DATRCKBCK_102}
    {assign var="backtotop" value=$CONST.BACKTOTOP_102}
    {foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope="parent"}
    <div id="entry-{$entry.id}" class="entry">
        <h2><a href="{$entry.link}" rel="bookmark">{$entry.title}</a></h2>

        <p class="entryinfo">{if $entry.categories}<span class="cats">{foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}</span>{/if} <span class="date">{if $dategroup.is_sticky}{$CONST.STICKY_POSTINGS}{else}{$entry.timestamp|@formatTime:'%d.%m.%Y'}, {$entry.timestamp|@formatTime:'%H:%M'}{/if}</span> <span class="permalink"><a href="{$entry.link}" rel="bookmark">Permalink</a></span></p>

        <div class="entrycontent">
            {$entry.body}
        {if $entry.is_extended}
            <a id="extended"></a>
            {$entry.extended}
        {/if}
        {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
            <p class="readmore"><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title}</a></p>
        {/if}
        </div>

        <div class="entrymeta">
            <ul>
            {if $entry.has_comments}
               <li class="comm"><a href="{$entry.link}#comments">{if $entry.comments == 0}{$nocomment}{else}{$entry.comments}&nbsp;{$entry.label_comments}{/if}</a></li>
               <li class="acom"><a href="{$entry.link}#serendipity_CommentForm">{$CONST.ADD_COMMENT}</a></li>
            {else}
               <li class="lock">{$dacomment}</li>
            {/if}
            {if $entry.has_trackbacks}
               <li class="trbk"><a href="{$entry.link}#trackbacks">{if $entry.trackbacks == 0}{$CONST.NO_TRACKBACKS}{else}{$entry.trackbacks}&nbsp;{$entry.label_trackbacks}{/if}</a></li>
               <li class="atrb"><a class="trackbackuri" rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">Trackback-URL</a></li>
            {else}
               <li class="lock">{$datrckbck}</li>
            {/if}
            </ul>
        </div>

        <div class="fplugins">
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
        {if $entry.is_entry_owner and not $is_preview}
            <p><span class="edit"><a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a></span></p>
        {/if}
            <p class="hidden"><a href="#skip">{$backtotop}</a></p>
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

        {if $is_single_entry and not $use_popups and not $is_preview}
            {if $CONST.DATA_UNSUBSCRIBED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</p>
            {/if}
            {if $CONST.DATA_TRACKBACK_DELETED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</p>
            {/if}
            {if $CONST.DATA_TRACKBACK_APPROVED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</p>
            {/if}
            {if $CONST.DATA_COMMENT_DELETED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</p>
            {/if}
            {if $CONST.DATA_COMMENT_APPROVED}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</p>
            {/if}

            <div id="trackbacksection">
                <a id="trackbacks"></a>
                <h2>{if $entry.trackbacks == 0}{$CONST.NO_TRACKBACKS}{else}{$entry.trackbacks}&nbsp;{$entry.label_trackbacks}{/if}</h2>
                <p class="serendipity_center"><a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">Trackback-URL</a></p>
                {serendipity_printTrackbacks entry=$entry.id}
            </div><!-- /#trackbacksection -->
        {/if}

        {if $is_single_entry and not $is_preview}
            <div id="commentsection">
                <a id="comments"></a>
                <h2>{if $entry.comments == 0}{$nocomment}{else}{$entry.comments}&nbsp;{$entry.label_comments}{/if}</h2>
                <p class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    {$CONST.COMMENTS_VIEWMODE_LINEAR} &bull; <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>
                {else}
                    <a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> &bull; {$CONST.COMMENTS_VIEWMODE_THREADED}
                {/if}
                </p>

                {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

                {if $entry.is_entry_owner}
                    {if $entry.allow_comments}
                    <p class="serendipity_center"><a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a></p>
                    {else}
                    <p class="serendipity_center"><a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a></p>
                    {/if}
                {/if}

                <a id="feedback"></a>
                {foreach from=$comments_messagestack item="message"}
                <p class="serendipity_center serendipity_msg_important">{$message}</p>
                {/foreach}
                {if $is_comment_added}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}</p>
                {elseif $is_comment_moderate}
                <p class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED} ({$CONST.THIS_COMMENT_NEEDS_REVIEW})</p>
                {elseif not $entry.allow_comments}
                <p class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
                {else}
                <div id="commentformsection">
                {$COMMENTFORM}
                </div>
                {/if}
            </div>
        {/if}
        {$entry.backend_preview}
    </div>
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
            <a title="{$CONST.PREVIOUS_PAGE}" href="{$footer_prev_page}"><span class="pagarrow">&#9668;</span></a>
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
            <a title="{$CONST.NEXT_PAGE}" href="{$footer_next_page}"><span class="pagarrow">&#9658;</span></a>
         {/if}
        </div>
        {serendipity_hookPlugin hook="entries_footer"}
    </div>
<!-- ENTRIES END -->
