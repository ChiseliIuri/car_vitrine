<?php
include_once '../models/ProjectModel.php';

function indexAction($smarty){
    $langSetting = lang();
    $lang = $langSetting['lang'];
    $currentUrl = '/about/';
    $rsSettings = getAllSettings();
    $rsLangs = getAllTranslates();
    $langs = formatLangArray($rsLangs);
    $data = getAboutModel();
    $photos = getAboutPhotos();
    $title = $data[0]['title_' . $lang];
    $description = $data[0]['long_desc_' . $lang];

    $smarty->assign('lang_url', $langSetting['lang_url']);
    $smarty->assign('lang', $lang);
    $smarty->assign('index_lang_url', $langSetting['index_lang_url']);
    $smarty->assign('currentUrl', $currentUrl);
    $smarty->assign('rsSettings', $rsSettings);
    $smarty->assign('rsLangs', $langs);
    $smarty->assign('title', $title);
    $smarty->assign('description', $description);
    $smarty->assign('photos', $photos);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'about_us');
    loadTemplate($smarty, 'footer');
}