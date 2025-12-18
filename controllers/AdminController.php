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

//    $photosNames = [];
//    if (isset($_FILES['main_logo']) || isset($_FILES['project_images'])){
//        $photosNames = photosSaving();
//    } else {
//        $photosNames = ["logo" => ""];
//    }
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

//    echo "main_logo = ";
//    var_dump($_FILES['main_logo']);
//    echo "project_images = ";
//    var_dump($_FILES['project_images']);
//    if (empty($_FILES['project_images']['name'][0])) {
//        echo "array is empty";
//    } else {
//        echo "array is NOT empty";
//    }
//    die();


    $response = ['success' => true, 'message' => 'Project updated successfully!'];
    echo json_encode($response);

}

//project_images = array(6) {
//    ["name"]=>
//  array(1) {
//        [0]=>
//    string(0) ""
//  }
//  ["full_path"]=>
//  array(1) {
//        [0]=>
//    string(0) ""
//  }
//  ["type"]=>
//  array(1) {
//        [0]=>
//    string(0) ""
//  }
//  ["tmp_name"]=>
//  array(1) {
//        [0]=>
//    string(0) ""
//  }
//  ["error"]=>
//  array(1) {
//        [0]=>
//    int(4)
//  }
//  ["size"]=>
//  array(1) {
//        [0]=>
//    int(0)
//  }
//}

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

function updateprojectorderAction($smarty){
    $projId = isset($_POST['projectId']) ? $_POST['projectId'] : null;
    $orderIndex = isset($_POST['orderIndex']) ? $_POST['orderIndex'] : null;
    // var_dump("projId = " . $projId);
    // var_dump("orderIndex = " . $orderIndex);
    // echo "Post = ";
    // var_dump($_POST);
    // die();

    $res = updateOrderIndex($projId, $orderIndex);
    if ($res){
        $response = ['success' => true, 'message' => 'Order index updated successfully!'];
    } else {
        $response = ['success' => false, 'message' => 'Failed to update order index.'];
    }
    echo json_encode($response);
}   

/**
 * Action for adding new categories
 *
 * @return json array with response data
 */
// function addnewcatAction(){
//     $catName = $_POST['newCategoryName'];
//     $catParentId = $_POST['generalCatId'];
//     $res = insertCat($catName, $catParentId);

//     if($res){
//         $resData['success'] = 1;
//         $resData['message'] = 'Category Added';
//     } else {
//         $resData['success'] = 0;
//         $resData['message'] = 'Error on adding category.';
//     }

//     echo json_encode($resData);
//     return;
// }

/**
 * Category administration page
 *
 * @param $smarty
 */
// function categoryAction($smarty){
//     $rsCategories = getAllCategories();
//     $rsMainCategories = getAllMainCategories();

//     $smarty->assign('rsCategories', $rsCategories);
//     $smarty->assign('rsMainCategories', $rsMainCategories);
//     $smarty->assign('pageTitle', 'ADMINKA');

//     loadTemplate($smarty, 'adminHeader');
//     loadTemplate($smarty, 'adminCategory');
//     loadTemplate($smarty, 'adminFooter');
// }

/**
 * Realize process of updating categories data
 *
 * @return false|string return json
 */

// function updatecategoryAction(){

//     $itemId = $_POST['itemId'];
//     $parentId = $_POST['parentId'];
//     $name = $_POST['newName'];

//     if (updateCategoryData($itemId, $parentId, $name)){
//         $resData['success'] = 1;
//         $resData['message'] = 'Successfully updated';
//     } else {
//         $resData['success'] = 0;
//         $resData['message'] = "OOPS, Some error occurred during data updating :(";
//     }
//     echo json_encode($resData);
//     return;
// }

/**
 * Page of products control
 *
 * @param type smarty
 */

// function productsAction($smarty){
//     // $rsCategories = getAllChildCategories();
//     $rsProducts = getProducts();

//     // $smarty->assign('rsCategories', $rsCategories);
//     $smarty->assign('rsProducts', $rsProducts);
//     $smarty->assign('pageTitle', 'Site Administration');

//     loadTemplate($smarty,'adminHeader');
//     loadTemplate($smarty, 'adminProducts');
//     loadTemplate($smarty, 'adminFooter');
// }

/**
 * Add new product
 *
 * @return json array
 */
// function addproductAction(){
//     $itemName = $_POST['itemName'];
//     $itemPrice = $_POST['itemPrice'];
//     $itemDesc = $_POST['itemDesc'];
//     $itemCat = $_POST['itemCatId'];

//     if (insertProduct($itemName, $itemPrice, $itemDesc, $itemCat)){
//         $resData['success'] = 1;
//         $resData['message'] = 'Changes was successful introduced';
//     } else {
//         $resData['success'] = 0;
//         $resData['message'] = 'Some error occurred during introducing data';
//     }
//     echo json_encode($resData);
//     return;
// }

/**
 * Update product data
 *
 * @return json array
 */
// function updateproductAction(){
//     $itemId = $_POST['itemId'];
//     $itemName = $_POST['itemName'];
//     $itemPrice = $_POST['itemPrice'];
//     $itemStatus = $_POST['itemStatus'];
//     $itemDesc = $_POST['itemDesc'];
//     $itemCat = $_POST['itemCatId'];

//     $res = updateProduct($itemId, $itemName, $itemPrice, $itemStatus, $itemDesc, $itemCat);

//     if ($res){
//         $resData['success'] = 1;
//         $resData['message'] = "Updated with success;";
//     } else {
//         $resData['success'] = 0;
//         $resData['message'] = "Some Error occurred!";
//     }
//     echo json_encode($resData);
//     return;
// }

/**
 * Uploading image
 *
 */
// function uploadAction(){
//     $maxSize = 2 * 1024 * 1024;
//     $itemId = $_POST['itemId'];
//     //primim extensia fileului incarcabil
//     $ext = pathinfo($_FILES['filename']['name'], PATHINFO_EXTENSION);
//     //cream denumirea fileului
//     $newFileName = $itemId . '.' . $ext;

//     if ($_FILES['filename']['size']>$maxSize){
//         echo ('File size exceeds 2 MB');
//         return;
//     }

//     //controlam daca fileul este incarcat
//     if (is_uploaded_file($_FILES['filename']['tmp_name'])){
//         //daca fileul este incarcat il mutam din directoria teporara in directoria finala
//         $res = move_uploaded_file($_FILES['filename']['tmp_name'], $_SERVER['DOCUMENT_ROOT'] . '/images/products/' . $newFileName);
//         if ($res){
//             $res = updateProductImage($itemId, $newFileName);
//             if ($res) {
//                 redirect('/admin/products/');
//             }
//         }
//     } else {
//         echo ("Error of loading file");
//     }
// }

/**
 * Main controller for order page
 *
 * @param $smarty
 */
// function ordersAction($smarty){
//     $rsOrders = getOrders();

//     $smarty->assign('rsOrders', $rsOrders);
//     $smarty->assign('pageTitle', 'Orders');

//     loadTemplate($smarty, 'adminHeader');
//     loadTemplate($smarty, 'adminOrders');
//     loadTemplate($smarty, 'adminFooter');
// }

/**
 * Set order status
 *
 */
// function setorderstatusAction(){
//     $itemId = $_POST['itemId'];
//     $status = $_POST['status'];

//     if (updateOrderStatus($itemId, $status)){
//         $resData['success'] = 1;
//     } else {
//         $resData['success'] = 0;
//         $resData['message'] = 'Error of setting new status';
//     }

//     echo json_encode($resData);
// }

/**
 * Set Order Date Payment
 *
 */
// function setorderdatePaymentAction(){
//     $itemId = $_POST['itemId'];
//     $datePayment = $_POST['datePayment'];

//     if (updateOrderDatePayment($itemId, $datePayment)){
//         $resData['success'] = 1;
//     } else {
//         $resData['success'] = 0;
//         $resData['message'] = 'Error of setting payment date';
//     }

//     echo json_encode($resData);
// }

// function destroycategoryAction() {
//     $catId = intval($_POST['catId']);
//     if (deleteCategoryById($catId)) {
//         $resData['success'] = 1;
//         $resData['message'] = 'Category Successfully deleted';
//     } else {
//         $resData['success'] = 0;
//         $resData['message'] = 'Stoto ne tac uioba';
//     }
//     echo json_encode($resData);
// }

// function destroyproductAction() {
//     $prodId = intval($_POST['prodId']);
//     if (deleteProductById($prodId)) {
//         $resData['success'] = 1;
//         $resData['message'] = 'Product Successfully deleted';
//     } else {
//         $resData['success'] = 0;
//         $resData['message'] = 'Stoto ne tac uioba';
//     }
//     echo json_encode($resData);
// }
