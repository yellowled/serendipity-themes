    <head>
        <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
<!--[if lt IE 7]>
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="ie.css"}" />
<![endif]-->
        <script type="text/javascript">
           window.onload = function() {ldelim}
             parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('page').offsetHeight
                                                                               + parseInt(document.getElementById('page').style.marginTop)
                                                                               + parseInt(document.getElementById('page').style.marginBottom)
                                                                               + 'px';
             parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
             parent.document.getElementById('serendipity_iframe').style.border = 0;
           {rdelim}
        </script>
    </head>

    <body>
        <div id="page" style="margin: 5px auto; width: 98%;">
            <div id="main">
                <div id="cont">
                {$preview}
                </div>
            </div>
        </div>
    </body>
