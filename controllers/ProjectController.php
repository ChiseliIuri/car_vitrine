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
    $lang = $langSetting['lang'];
    $currentUrl = '/project/'.$prodId.'/';
    $titleIndex = 'title_' . $lang;
    $longDescriprionIndex = 'long_descriprion_' . $lang;
    if ($prodId == null) redirect('/');

    $project = getProjectByUri($prodId);
    $projectId = $project['id'];
    $projectPhotos = getProjectPhotosById($projectId);
    $rsSettings = getAllSettings();
    $rsLangs = getAllTranslates();
    $langs = formatLangArray($rsLangs);

    if (empty($project)){
        redirect('/');
    }

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
    // $smarty->assign('cat', $cat);
    // $smarty->assign('head', $project['name']);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'project');
    loadTemplate($smarty, 'footer');
}
