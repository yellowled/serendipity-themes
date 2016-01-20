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
        'var'           => 'feedburner',
        'name'          => FEEDBURNER_102,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'delicious',
        'name'          => DELICIOUS_102,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'flickr',
        'name'          => 'flickr URI',
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'technorati',
        'name'          => 'technorati URI',
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'addthiswidget',
        'name'          => 'addthis.com Bookmark Widget',
        'type'          => 'boolean',
        'default'       => 'false',
    ),
    array(
        'var'           => 'addthisaccount',
        'name'          => 'addthis.com Account',
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'type'          => 'string',
        'default'       => '5',
    )
);

$template_loaded_config = serendipity_loadThemeOptions($template_config, $serendipity['smarty_vars']['template_option']);

if(isset($_POST['serendipity']['template']['amount']) && serendipity_userLoggedIn() && serendipity_checkPermission('adminTemplates')) {
  $temp_post=$_POST['serendipity']['template']['amount'];
  if(is_numeric($temp_post)) $template_loaded_config['amount'] =$temp_post;
}

$navlinks = array();

for ($i = 0; $i < $template_loaded_config['amount']; $i++) {
    $navlinks[] = array(
        'title' => $template_loaded_config['navlink' . $i . 'text'],
        'href'  => $template_loaded_config['navlink' . $i . 'url'],
        'akey'  => $template_loaded_config['navlink' . $i . 'key']
    );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'text',
        'name'          => NAV_LINK_TEXT . ' #' . $i,
        'type'          => 'string',
        'default'       => 'Link #' . $i,
        );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'url',
        'name'          => NAV_LINK_URL . ' #' . $i,
        'type'          => 'string',
        'default'       => '#',
    );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'key',
        'name'          => NAV_LINK_KEY . ' #' . $i,
        'type'          => 'string',
        'default'       => $i,
    );
}

$serendipity['smarty']->assign_by_ref('navlinks', $navlinks);
