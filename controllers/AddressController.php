<?php
include_once '../models/ProjectModel.php';

function indexAction($smarty){
    $langSetting = lang();
    $lang = $langSetting['lang'];
    $currentUrl = '/address/';
    $rsSettings = getAllSettings();
    $rsLangs = getAllTranslates();
    $langs = formatLangArray($rsLangs);

    $smarty->assign('lang_url', $langSetting['lang_url']);
    $smarty->assign('lang', $lang);
    $smarty->assign('index_lang_url', $langSetting['index_lang_url']);
    $smarty->assign('currentUrl', $currentUrl);
    $smarty->assign('rsSettings', $rsSettings);
    $smarty->assign('rsLangs', $langs);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'address');
    loadTemplate($smarty, 'footer');
}