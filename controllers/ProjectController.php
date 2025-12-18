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
        $rsProjects = getAllProjects();
        // $rsProjects = getAllWorks();
        $currentUrl = "/project/";
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
        loadTemplate($smarty, 'project_index');
        loadTemplate($smarty, 'footer');
    } else {
        $currentUrl = '/project/'.$prodId.'/';
        $titleIndex = 'title_' . $lang;
        $longDescriprionIndex = 'long_descriprion_' . $lang;
        $project = getProjectByUri($prodId);
        $projectId = $project['id'];
        $projectPhotos = getProjectPhotosById($projectId);

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
        loadTemplate($smarty, 'project');
        loadTemplate($smarty, 'footer');
    }
}
