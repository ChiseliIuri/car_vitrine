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
    $langSetting = lang();
    $lang = $langSetting['lang'];
    // $rsProjects = getAllProjects();
    $rsProjects = getAllWorks();
    $rsSettings = getAllSettings();
    $rsLangs = getAllTranslates();
    $langs = formatLangArray($rsLangs);
    $currentUrl = "/index/";
    $titleIndex = 'title_' . $lang;

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