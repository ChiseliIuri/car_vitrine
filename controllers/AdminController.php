<?php
/**
 * AdminController.php
 *
 * Controllerul back-endului siteului
 *
 */

//conectam modelele
// include_once '../models/CategoriesModel.php';
include_once '../models/ProjectModel.php';
// include_once '../models/OrdersModel.php';
// include_once '../models/PurchaseModel.php';

//INCARCAM IN SMARTY TEMPLATES A MEDIULUI ADMIN
$smarty->setTemplateDir(TEMPLATE_ADMIN_PREFIX);
$smarty->assign('templateWebPath', TEMPLATE_ADMIN_WEB_PATH);

function indexAction($smarty){

    $rsSettings = getAllSettings();

    // $rsCategories = getAllMainCategories();
//    echo "settings:";
//    var_dump($rsSettings);
//    die();
    $smarty->assign('rsSettings', $rsSettings);
    $smarty->assign('pageTitle','ADMINKA');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'admin');
    loadTemplate($smarty, 'adminFooter');
}

function getaboutAction ($smarty) {
    $data = getAboutModel();
//    var_dump($data);
//    die();

    $smarty->assign('data', $data);
    $smarty->assign('pageTitle','ADMINKA');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'addAbout');
    loadTemplate($smarty, 'adminFooter');
}

function addaboutAction ($smarty) {
//    if (!empty($_FILES['main_logo']['name'])){
//        $logo_name = getLogoNameById($_POST['id']);
//        $logo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/project_logos/' . $logo_name['logo'];
//        if ($logo_name['logo'] && file_exists($logo_path)) {
//            unlink($logo_path);
//        }
//    }

    if (!empty($_FILES['project_images']['name'][0])) {
        $photosNames = getAboutPhotosNames();
        if ($photosNames) {
            foreach ($photosNames as $photo) {
                $photo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/project_galery/' . $photo['name'];
                if (file_exists($photo_path)) {
                    unlink($photo_path);
                }
            }
            deletePagesPhotosById("about");
        }
    }

//    $photosNames = [];
//    if (isset($_FILES['main_logo']) || isset($_FILES['project_images'])){
//        $photosNames = photosSaving();
//    } else {
//        $photosNames = ["logo" => ""];
//    }
    $photosNames = photosSaving();

    saveAboutModel(
        "about",
        $_POST['title_en'],
        $_POST['title_ro'],
        $_POST['title_ru'],
        $_POST['long_desc_en'],
        $_POST['long_desc_ro'],
        $_POST['long_desc_ru'],
        $_POST['meta']
    );

    if (!empty($_FILES['project_images']['name'][0])){
        insertPAgesPhotos("about", $photosNames['gallery']);
    }


    $response = ['success' => true, 'message' => 'Project updated successfully!'];
    echo json_encode($response);
}

function getalllangsAction($smarty){

    $rsLangs = getAllTranslates();
    $smarty->assign('rsLangs', $rsLangs);
    $smarty->assign('pageTitle','ADMINKA');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'translates');
    loadTemplate($smarty, 'adminFooter');
}

function savelangsAction($smarty) {
    saveAllTranslates(
        !empty($_POST['about_us_en']) ? strtoupper($_POST['about_us_en']) : '',
        !empty($_POST['about_us_ro']) ? strtoupper($_POST['about_us_ro']) : '',
        !empty($_POST['about_us_ru']) ? strtoupper($_POST['about_us_ru']) : '',
        !empty($_POST['address_en']) ? strtoupper($_POST['address_en']) : '',
        !empty($_POST['address_ro']) ? strtoupper($_POST['address_ro']) : '',
        !empty($_POST['address_ru']) ? strtoupper($_POST['address_ru']) : '',
        !empty($_POST['all_projects_en']) ? strtoupper($_POST['all_projects_en']) : '',
        !empty($_POST['all_projects_ro']) ? strtoupper($_POST['all_projects_ro']) : '',
        !empty($_POST['all_projects_ru']) ? strtoupper($_POST['all_projects_ru']) : '',
        !empty($_POST['deliver_quality_en']) ? strtoupper($_POST['deliver_quality_en']) : '',
        !empty($_POST['deliver_quality_ro']) ? strtoupper($_POST['deliver_quality_ro']) : '',
        !empty($_POST['deliver_quality_ru']) ? strtoupper($_POST['deliver_quality_ru']) : '',
        !empty($_POST['our_works_en']) ? strtoupper($_POST['our_works_en']) : '',
        !empty($_POST['our_works_ro']) ? strtoupper($_POST['our_works_ro']) : '',
        !empty($_POST['our_works_ru']) ? strtoupper($_POST['our_works_ru']) : ''
    );

    $response = ['success' => true, 'message' => 'Settings saved successfully!'];
    echo json_encode($response);
}

function savesettingsAction($smarty) {
    saveAllSettings(
        $_POST['phone'],
        $_POST['facebook'],
        $_POST['instagram'],
        $_POST['address'],
        $_POST['work_time']
    );

    $response = ['success' => true, 'message' => 'Settings saved successfully!'];
    echo json_encode($response);
}

function getallprojectsAction($smarty){
    $rsProjects = getAllProjects();
    $smarty->assign('rsProjects', $rsProjects);

    $smarty->assign('pageTitle','ADMINKA');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminProjects');
    loadTemplate($smarty, 'adminFooter');
}

function getallworksAction($smarty){
    $rsProjects = getAllWorks();
    $smarty->assign('rsProjects', $rsProjects);

    $smarty->assign('pageTitle','ADMINKA');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminWorks');
    loadTemplate($smarty, 'adminFooter');
}

function editworksAction($smarty){
    $projId = isset($_GET['id']) ? $_GET['id'] : null;

    $rsWork = getWorkById($projId);
    $smarty->assign('rsWork', $rsWork);

    $smarty->assign('pageTitle','ADMINKA');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminEditWork');
    loadTemplate($smarty, 'adminFooter');
}

function addworksAction($smarty){
    // $smarty->assign('rsProject', $rsProject);

    $smarty->assign('pageTitle','ADMINKA');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminAddWork');
    loadTemplate($smarty, 'adminFooter');
}

function saveworkAction($smarty){
    // $smarty->assign('rsProject', $rsProject);
    $photosNames = workPhotosSaving();
    $projectId = insertWork(
        $_POST['uri'],
        $_POST['order_index'],
        $_POST['title_ro'],
        $_POST['title_ru'],
        $_POST['title_en'],
        $_POST['long_desc_ro'],
        $_POST['long_desc_ru'],
        $_POST['long_desc_en'],
        $photosNames['logo'],
        $_POST['meta_tags']
    );
    insertWorkPhotos($projectId, $photosNames['gallery']);
    $response = ['success' => true, 'message' => 'Project saved successfully!'];
    echo json_encode($response);
}

function editprojectsAction($smarty){
    $projId = isset($_GET['id']) ? $_GET['id'] : null;

    $rsProject = getProjectById($projId);
    $smarty->assign('rsProject', $rsProject);

    $smarty->assign('pageTitle','ADMINKA');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminEditProject');
    loadTemplate($smarty, 'adminFooter');
}

function saveeditedprojectAction($smarty){
    if (!empty($_FILES['main_logo']['name'])){
        $logo_name = getLogoNameById($_POST['id']);
        $logo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/project_logos/' . $logo_name['logo'];
        if ($logo_name['logo'] && file_exists($logo_path)) {
            unlink($logo_path);
        }
    }

    if (!empty($_FILES['project_images']['name'][0])) {
        $photosNames = getPhotosNamesById($_POST['id']);
        if ($photosNames) {
            foreach ($photosNames as $photo) {
                $photo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/project_galery/' . $photo['name'];
                if (file_exists($photo_path)) {
                    unlink($photo_path);
                }
            }
            deletePhotosById($_POST['id']);
        }
    }

    $photosNames = photosSaving();

    updateProjectById(
        $_POST['id'],
        $_POST['uri'],
        $_POST['order_index'],
        $_POST['title_ro'],
        $_POST['title_ru'],
        $_POST['title_en'],
        $_POST['long_desc_ro'],
        $_POST['long_desc_ru'],
        $_POST['long_desc_en'],
        $photosNames['logo'],
        $_POST['meta_tags']
    );

    if (!empty($_FILES['project_images']['name'][0])){
        insertPhotos($_POST['id'], $photosNames['gallery']);
    }

    $response = ['success' => true, 'message' => 'Project updated successfully!'];
    echo json_encode($response);

}

function saveeditedworkAction($smarty){
    if (!empty($_FILES['main_logo']['name'])){
        $logo_name = getWorkLogoNameById($_POST['id']);
        $logo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/work_logos/' . $logo_name['logo'];
        if ($logo_name['logo'] && file_exists($logo_path)) {
            unlink($logo_path);
        }
    }

    if (!empty($_FILES['project_images']['name'][0])) {
        $photosNames = getWorkPhotosNamesById($_POST['id']);
        if ($photosNames) {
            foreach ($photosNames as $photo) {
                $photo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/work_galery/' . $photo['name'];
                if (file_exists($photo_path)) {
                    unlink($photo_path);
                }
            }
            deleteWorkPhotosById($_POST['id']);
        }
    }

    $photosNames = workPhotosSaving();

    updateWorkById(
        $_POST['id'],
        $_POST['uri'],
        $_POST['order_index'],
        $_POST['title_ro'],
        $_POST['title_ru'],
        $_POST['title_en'],
        $_POST['long_desc_ro'],
        $_POST['long_desc_ru'],
        $_POST['long_desc_en'],
        $photosNames['logo'],
        $_POST['meta_tags']
    );

    if (!empty($_FILES['project_images']['name'][0])){
        insertWorkPhotos($_POST['id'], $photosNames['gallery']);
    }

    $response = ['success' => true, 'message' => 'Project updated successfully!'];
    echo json_encode($response);

}

function addprojectsAction($smarty){
    // $smarty->assign('rsProject', $rsProject);

    $smarty->assign('pageTitle','ADMINKA');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminAddProject');
    loadTemplate($smarty, 'adminFooter');
}

function saveprojectAction($smarty){
    // $smarty->assign('rsProject', $rsProject);
    $photosNames = photosSaving();
    $projectId = insertProject(
        $_POST['uri'],
        $_POST['order_index'],
        $_POST['title_ro'],
        $_POST['title_ru'],
        $_POST['title_en'],
        $_POST['long_desc_ro'],
        $_POST['long_desc_ru'],
        $_POST['long_desc_en'],
        $photosNames['logo'],
        $_POST['meta_tags']
    );
    insertPhotos($projectId, $photosNames['gallery']);
    $response = ['success' => true, 'message' => 'Project saved successfully!'];
    echo json_encode($response);
}

function deleteprojectAction($smarty){
    $projId = isset($_GET['id']) ? $_GET['id'] : null;
    $logo_name = getLogoNameById($projId);
    $logo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/project_logos/' . $logo_name['logo'];
    if ($logo_name['logo'] && file_exists($logo_path)) {
        unlink($logo_path);
    }
    $photosNames = getPhotosNamesById($projId);
    if ($photosNames) {
        foreach ($photosNames as $photo) {
            $photo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/project_galery/' . $photo['name'];
            if (file_exists($photo_path)) {
                unlink($photo_path);
            }
        }
    }

    deleteProjectById($projId);
    deletePhotosById($projId);

    $response = ['success' => true, 'message' => 'Project deleted successfully!'];
    echo json_encode($response);
}

function deleteworkAction($smarty){
    $workId = isset($_GET['id']) ? $_GET['id'] : null;
    $logo_name = getWorkLogoNameById($workId);
    $logo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/work_logos/' . $logo_name['logo'];
    if ($logo_name['logo'] && file_exists($logo_path)) {
        unlink($logo_path);
    }
    $photosNames = getWorkPhotosNamesById($workId);
    if ($photosNames) {
        foreach ($photosNames as $photo) {
            $photo_path = $_SERVER['DOCUMENT_ROOT'] . '/images/work_galery/' . $photo['name'];
            if (file_exists($photo_path)) {
                unlink($photo_path);
            }
        }
    }

    deleteWorkById($workId);
    deleteWorkPhotosById($workId);

    $response = ['success' => true, 'message' => 'Project deleted successfully!'];
    echo json_encode($response);
}

function updateworkorderAction($smarty){
    $workId = isset($_POST['projectId']) ? $_POST['projectId'] : null;
    $orderIndex = isset($_POST['orderIndex']) ? $_POST['orderIndex'] : null;

    $res = updateWorkOrderIndex($workId, $orderIndex);
    if ($res){
        $response = ['success' => true, 'message' => 'Order index updated successfully!'];
    } else {
        $response = ['success' => false, 'message' => 'Failed to update order index.'];
    }
    echo json_encode($response);
} 

function updateprojectorderAction($smarty){
    $projId = isset($_POST['projectId']) ? $_POST['projectId'] : null;
    $orderIndex = isset($_POST['orderIndex']) ? $_POST['orderIndex'] : null;

    $res = updateOrderIndex($projId, $orderIndex);
    if ($res){
        $response = ['success' => true, 'message' => 'Order index updated successfully!'];
    } else {
        $response = ['success' => false, 'message' => 'Failed to update order index.'];
    }
    echo json_encode($response);
}   
