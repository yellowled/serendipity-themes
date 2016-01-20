<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
    {foreach from=$entries item="dategroup"}
    {foreach from=$dategroup.entries item="entry"}
    {assign var="entry" value=$entry scope="parent"}
    <div id="post-{$entry.id}" class="post">
        <h1>{$entry.title}</h1>

        <ul class="postdata">
           <li class="auth"><a href="{$entry.link_author}">{$entry.author}</a></li>
           <li class="date">{$entry.timestamp|@formatTime:'%a %e.%m.%Y'}</li>
           <li class="time">{$entry.timestamp|@formatTime:'%H:%M'}</li>
        {if $entry.categories}
           <li class="cats">{foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}</li>
        {/if}
        </ul>

        <div class="entry">
            <div class="entrycontent">
                {$entry.body}
            {if $entry.is_extended}
                <div class="extendedentry">
                    <a id="extended"></a>
                    {$entry.extended}
                </div>
            {/if}
            {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
                <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title} &raquo;</a></p>
            {/if}
            </div>
        </div>

        <ul class="postmeta">
           <li class="plnk"><a href="{$entry.link}" rel="bookmark">Permalink</a></li>
        {if $entry.has_comments}
           <li class="ncom"><a href="{$entry.link}#comments">{$entry.comments} {$entry.label_comments}</a></li>
           <li class="acom"><a href="{$entry.link}#feedback">{$CONST.ADD_COMMENT}</a></li>
        {/if}
        {if $entry.has_trackbacks}
           <li class="ntrb"><a href="{$entry.link}#trackbacks">{$entry.trackbacks} {$entry.label_trackbacks}</a></li>
           <li class="atrb"><a class="trackbackuri" rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">Trackback <abbr title="Universal Resource Identifier">URI</abbr></a></li>
        {/if}
        {if $entry.is_entry_owner and not $is_preview}
           <li class="edpo"><a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a></li>
        {/if}
        </ul>

        <div class="fplugins">
            {$entry.add_footer}
            {$entry.plugin_display_dat}
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

    </div>

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

            <div class="trackbacksection">
                <a id="trackbacks"></a>
                <h2>{$entry.trackbacks} {$entry.label_trackbacks}</h2>
                <p class="serendipity_center"><a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">Trackback <abbr title="Universal Resource Identifier">URI</abbr></a></p>
                {serendipity_printTrackbacks entry=$entry.id}
            </div>
        {/if}

        {if $is_single_entry and not $is_preview}
            <div class="commentsection">
                <a id="comments"></a>
                <h2>{$entry.comments} {$entry.label_comments}</h2>
                <p class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    {$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>
                {else}
                    <a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED}
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
                <p class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}<br />{$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
                {elseif not $entry.allow_comments}
                <p class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
                {else}
                <div class="commentformsection">
                    <h2>{$CONST.ADD_COMMENT}</h2>
                    {$COMMENTFORM}
		</div>
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

    <div class="serendipity_pageFooter" style="text-align: center">
    {if $footer_prev_page}
        <a href="{$footer_prev_page}">&laquo; {$CONST.PREVIOUS_PAGE}</a>&nbsp;&bull;
    {/if}
    {if $footer_info}
        {$footer_info}
    {/if}
    {if $footer_next_page}
        &bull;&nbsp;<a href="{$footer_next_page}">{$CONST.NEXT_PAGE} &raquo;</a>
    {/if}
    {serendipity_hookPlugin hook="entries_footer"}
    </div>
<!-- ENTRIES END -->
