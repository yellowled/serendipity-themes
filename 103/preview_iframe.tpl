    <head>
        <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="master.css"}" media="screen" />
<!--[if lt IE 8]>
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="css/ie.css"}" media="screen" />
<![endif]-->
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
        <script type="text/javascript">
           window.onload = function() {ldelim}
             parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('content').offsetHeight
                                                                               + parseInt(document.getElementById('content').style.marginTop)
                                                                               + parseInt(document.getElementById('content').style.marginBottom)
                                                                               + 'px';
             parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
             parent.document.getElementById('serendipity_iframe').style.border = 0;
           {rdelim}
        </script>
    </head>

    <body style="padding: 0; margin: 0;">
        <div id="content" class="clearfix" style="padding: 0px; margin: 5px auto 5px auto; width: 98%;">
        {$preview}
        </div>
    </body>
