<?php

/**
 *
 * CONTROLERUL PAGINII PRINCIPALE
 *
*/

//conectam models
// include_once '../models/CategoriesModel.php';
include_once '../models/ProjectModel.php';


//make a test action
function testAction(){
    echo '__________________________IndexController.php > testAction____________________________________';
}

/**
 * Prepare smarty-vars and load templates for index page
 *
 * @param $smarty
 */
function indexAction($smarty){
    // $rsCategories = getAllCatsWithChildren();
//    echo 'lang = ' . $_GET['lang'];

    $langSetting = lang();
    $lang = $langSetting['lang'];
    $rsProjects = getAllProjects();
    $rsSettings = getAllSettings();
    $rsLangs = getAllTranslates();
    $langs = formatLangArray($rsLangs);
//    var_dump($rsLangs);
//    echo '<br/><br/>';
//    var_dump($langs);
//    die();
//        array(5) {
//        ["about_us"]=> array(4) { ["lang_index"]=> string(8) "about_us" ["en"]=> string(8) "ABOUT US" ["ru"]=> string(9) "Î ÍÀÑ" ["ro"]=> string(6) "DESPRE" }
//        ["address"]=> array(4) { ["lang_index"]=> string(7) "address" ["en"]=> string(7) "ADDRESS" ["ru"]=> string(14) "ÀÄÄÐÅÑÑ" ["ro"]=> string(6) "ADRESA" }
//        ["all_projects"]=> array(4) { ["lang_index"]=> string(12) "all_projects" ["en"]=> string(25) "ALL PROJECTS AT A GLANCE " ["ru"]=> string(46) "ÂÑÅ ÏÐÎÅÊÒÛ Â ÎÄÍÎÌ ÌÅÑÒÅ" ["ro"]=> string(36) "TOATE PROIECTELE ?NTR-UN SINGUR LOC" }
//        ["deliver_quality"]=> array(4) { ["lang_index"]=> string(15) "deliver_quality" ["en"]=> string(15) "DELIVER QUALITY" ["ru"]=> string(37) "ÏÎÑÒÀÂËßÅÌ ÊÀ×ÅÑÒÂÎ" ["ro"]=> string(19) "ASIGUR?M CALITATEA" }
//        ["our_works"]=> array(4) { ["lang_index"]=> string(9) "our_works" ["en"]=> string(9) "OUR WORKS" ["ru"]=> string(14) "ÏÐÎÅÊÒÛ" ["ro"]=> string(10) "PROIECTELE" } }
    $currentUrl = "/index/";
    $titleIndex = 'title_' . $lang;
    // var_dump($rsProducts);
    // die();

    // $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('lang_url', $langSetting['lang_url']);
    $smarty->assign('lang', $lang);
    $smarty->assign('titleIndex', $titleIndex);
    $smarty->assign('currentUrl', $currentUrl);
    $smarty->assign('index_lang_url', $langSetting['index_lang_url']);
    $smarty->assign('rsSettings', $rsSettings);
    $smarty->assign('rsProjects', $rsProjects);
    $smarty->assign('rsLangs', $langs);
    $smarty->assign('head', 'MyShop');
    $smarty->assign('pageTitle', 'Principala Pagina a site-ului');

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'index_carousel');
    loadTemplate($smarty, 'index');
    loadTemplate($smarty, 'footer');
}