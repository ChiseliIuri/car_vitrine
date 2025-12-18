<?php

/**
 * productController.php
 *
 *Контроллер страницы продуктов (/product/1)
 *
 */

//Conectam modelele
// include_once '../models/CategoriesModel.php';
include_once '../models/ProjectModel.php';

/**
 * Formam paginile categoriilor
 *
 * @param object $smarty shablonizator
 */
function indexAction($smarty)
{
    $prodId = isset($_GET['id']) ? $_GET['id'] : null;
    $langSetting = lang();
    $rsSettings = getAllSettings();
    $rsLangs = getAllTranslates();
    $langs = formatLangArray($rsLangs);
    $lang = $langSetting['lang'];
    if ($prodId == null) {
        redirect('/');
    }
    $currentUrl = '/work/'.$prodId.'/';
    $titleIndex = 'title_' . $lang;
    $longDescriprionIndex = 'long_descriprion_' . $lang;
    $project = getWorkByUri($prodId);
    $projectId = $project['id'];
    $projectPhotos = getWorkPhotosById($projectId);

    $smarty->assign('lang_url', $langSetting['lang_url']);
    $smarty->assign('lang', $lang);
    $smarty->assign('title_head', $project[$titleIndex]);
    $smarty->assign('meta', $project['meta']);
    $smarty->assign('titleIndex', $titleIndex);
    $smarty->assign('longDescriprionIndex', $longDescriprionIndex);
    $smarty->assign('currentUrl', $currentUrl);
    $smarty->assign('index_lang_url', $langSetting['index_lang_url']);
    $smarty->assign('rsSettings', $rsSettings);
    $smarty->assign('rsLangs', $langs);
    $smarty->assign('project', $project);
    $smarty->assign('projectPhotos', $projectPhotos);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'work');
    loadTemplate($smarty, 'footer');
    
}
