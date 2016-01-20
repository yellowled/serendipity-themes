<?php
if (IN_serendipity !== true) {
  die ("Don't hack!");
}

$probelang = dirname(__FILE__) . '/' . $serendipity['charset'] . 'lang_' . $serendipity['lang'] . '.inc.php';

if (file_exists($probelang)) {
    include $probelang;
}

include dirname(__FILE__) . '/lang_en.inc.php';

$template_config = array(
    array(
        'var'           => 'contact',
        'name'          => MRW_CONTACT,
        'type'          => 'string',
        'default'       => '#',
    )
);
