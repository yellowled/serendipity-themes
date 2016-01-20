<?php
// Be nice to the frontend users. They don't need the additional constants
// and file lookups. Only load them when in Admin mode.
if ($serendipity['GET']['adminModule'] == 'templates' || $serendipity['POST']['adminModule'] != 'templates') {
    // Probe for a language include with constants. Still include defines 
    // later on, if some constants were missing
    $probelang = dirname(__FILE__) . '/' . $serendipity['charset'] . 'lang_' . $serendipity['lang'] . '.inc.php';
    if (file_exists($probelang)) {
        include $probelang;
    } 
    
    include dirname(__FILE__) . '/lang_en.inc.php';
}

$template_config = array(
    array(
        'var'           => 'colorset',
        'name'          => THEME_COLORSET,
        'description'   => THEME_COLORSET_DESC,
        'type'          => 'select',
        'default'       => 'default',
        'select_values' => array('YL' => 'YellowLed',
				 'RL' => 'Robert Lender',
				 'TM' => 'The Matrix',
				 'PI' => 'Pirates!',
				 'MC' => MY_COLORSET)
    ),
    array(
        'var'           => 'entryfooterposition',
        'name'          => FOOTER_POSITION,
        'description'   => FOOTER_POSITION_DESC,
        'type'          => 'radio',
        'radio'         => array('value' => array('true', 'false'),
                                 'desc'  => array(BELOW_ENTRY, SPLIT_ENTRY)),
        'default'       => 'true',
    ),
    array(
        'var'           => 'cocommentactive',
        'name'          => COCOMMENT_ACTIVE,
        'description'   => COCOMMENT_ACTIVE_DESC,
        'type'          => 'select',
        'default'       => 'inactive',
        'select_values' => array('active' => USE_COCOMMENT,
                                 'inactive' => NO_COCOMMENT)
    ),
    array(
        'var'           => 'counter_code',
        'name'          => COUNTER_CODE,
        'description'   => COUNTER_CODE_DESC,
        'type'          => 'text',
        'default'       => ' ',
    ),
    array(
        'var'           => 'counter_code_toggle',
        'name'          => USE_COUNTER,
        'description'   => USE_COUNTER_DESC,
        'type'          => 'radio',
        'radio'         => array('value' => array('true', 'false'),
                                 'desc'  => array(CC_POS, CC_NEG)),
        'default'       => 'false'
    ),
    array(
        'var'           => 'footer_text',
        'name'          => FOOTER_TEXT,
        'description'   => FOOTER_TEXT_DESC,
        'type'          => 'text',
        'default'       => ' ',
    ),
    array(
        'var'           => 'footer_text_toggle',
        'name'          => USE_FOOTER_TEXT,
        'description'   => USE_FOOTER_TEXT_DESC,
        'type'          => 'radio',
        'radio'         => array('value' => array('true', 'false'),
                                 'desc'  => array(FT_POS, FT_NEG)),
        'default'       => 'false'
    ),
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'description'   => NAVLINK_AMOUNT_DESC,
        'type'          => 'string',
        'default'       => '5',
    )
);

if (version_compare($serendipity['version'],"1.1.beta3") >= 0) {
$vars = serendipity_loadThemeOptions($template_config);

$navlinks = array();

for ($i = 0; $i < $vars['amount']; $i++) {
    $navlinks[] = array(
        'title' => $vars['navlink' . $i . 'text'],
        'href'  => $vars['navlink' . $i . 'url']
    );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'text',
        'name'          => NAV_LINK_TEXT . ' #' . $i,
        'description'   => NAV_LINK_DESC . ' #' .$i,
        'type'          => 'string',
        'default'       => constant('NAV_DEFAULT_' . $i),
	);
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'url',
        'name'          => NAV_LINK_URL . ' #' . $i,
        'description'   => NAV_LINK_URL_DESC . ' #' . $i,
        'type'          => 'string',
        'default'       => '#',
    );
}

$serendipity['smarty']->assign_by_ref('navlinks', $navlinks);
}

?>
