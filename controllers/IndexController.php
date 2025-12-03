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
    $rsProjects = getAllProjects();
    // var_dump($rsProducts);
    // die();

    // $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsProjects', $rsProjects);
    $smarty->assign('head', 'MyShop');
    $smarty->assign('pageTitle', 'Principala Pagina a site-ului');

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'index_carousel');
    loadTemplate($smarty, 'index');
    loadTemplate($smarty, 'footer');
}