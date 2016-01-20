<?php
if (IN_serendipity !== true) {
  die ("Don't hack!");
}

$probelang = dirname(__FILE__) . '/' . $serendipity['charset'] . 'lang_' . $serendipity['lang'] . '.inc.php';

if (file_exists($probelang)) {
    include $probelang;
}

include dirname(__FILE__) . '/lang_en.inc.php';

$serendipity['smarty']->assign(array('currpage'=> "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']));

$template_config = array(
    array(
        'var'           => 'externalfeed',
        'name'          => YL103_EXTERNAL_FEED,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'twitter',
        'name'          => YL103_TWITTER,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'delicious',
        'name'          => YL103_DELICIOUS,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'flickr',
        'name'          => YL103_FLICKR,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'amazon',
        'name'          => YL103_AMAZON,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'imprinturl',
        'name'          => YL103_IMPRINT_URL,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'contacturl',
        'name'          => YL103_CONTACT_URL,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'privacyurl',
        'name'          => YL103_PRIVACY_URL,
        'type'          => 'string',
        'default'       => '',
    )
);

$template_loaded_config = serendipity_loadThemeOptions($template_config, $serendipity['smarty_vars']['template_option']);
