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
    if ($prodId == null) redirect('/');

    $project = getProjectByUri($prodId);
    $projectId = $project['id'];
    $projectPhotos = getProjectPhotosById($projectId);

    if (empty($project)){
        redirect('/');
    }

    $smarty->assign('project', $project);
    $smarty->assign('projectPhotos', $projectPhotos);
    // $smarty->assign('cat', $cat);
    // $smarty->assign('head', $project['name']);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'project');
    loadTemplate($smarty, 'footer');
}
