<?php

/**
 * Model pentru tabela products
 *
 */

function getAllProjects(){
    $db = new Db;
    $sql = 'SELECT * FROM `projects` ORDER BY order_index;';

    $rs = mysqli_query($db->connect ,$sql);
    return createSmartyRsArray($rs);
}

function getAllWorks(){
    $db = new Db;
    $sql = 'SELECT * FROM `works` ORDER BY order_index;';

    $rs = mysqli_query($db->connect ,$sql);
    return createSmartyRsArray($rs);
}

function getAboutModel(){
    $db = new Db;
    $sql = 'SELECT * FROM `pages` WHERE id = "about";';

    return  createSmartyRsArray(mysqli_query($db->connect ,$sql));
}

function getAboutPhotos(){
    $db = new Db;
    $sql = "SELECT * FROM pages_photos
            WHERE page_id = 'about'";
    $rs = mysqli_query($db->connect,$sql);
    return createSmartyRsArray($rs);
}

function getAboutPhotosNames(){
    $db = new Db;
    $sql = "SELECT name FROM pages_photos
            WHERE page_id = 'about'";
    $rs = mysqli_query($db->connect,$sql);
    return createSmartyRsArray($rs);
}

function saveAboutModel($id, $title_en, $title_ro, $title_ru, $long_descriprion_en, $long_descriprion_ro, $long_descriprion_ru, $meta){
    $db = new Db;
    $mysqli = $db->connect;
    if (empty(getAboutModel())) {
        $sql = "INSERT INTO `pages` 
        ( `id`, `title_en`, `title_ro`, `title_ru`, `long_desc_en`, `long_desc_ro`, 
        `long_desc_ru`, `meta`) 
        VALUES 
        (?,?,?,?,?,?,?,?);";

        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param('ssssssss', $id, $title_en,  $title_ro, $title_ru,
            $long_descriprion_en, $long_descriprion_ro, $long_descriprion_ru, $meta);
        if ($stmt->execute()) {
            return $mysqli->insert_id;
        } else {
            return false;
        }
    } else {
        $sql = "
        UPDATE pages
        SET title_en = '{$title_en}', title_ro = '{$title_ro}', title_ru = '{$title_ru}',
            long_desc_en = '{$long_descriprion_en}', long_desc_ro = '{$long_descriprion_ro}', long_desc_ru = '{$long_descriprion_ru}',
            meta = '{$meta}'
        WHERE id = '{$id}';
        ";
        return  mysqli_query($db->connect,$sql);
    }
}

function insertPAgesPhotos($id, $photosNames){
    $db = new Db;
    $mysqli = $db->connect;
    $sql = "INSERT INTO `pages_photos` 
        (`page_id`, `name`) 
        VALUES 
        (?,?);";

    for($i=0; $i<count($photosNames); $i++){
        $name = $photosNames[$i];
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param('ss', $id, $name);
        if (!$stmt->execute()) {
            return false;
        }
    }
    return true;
}

function deletePagesPhotosById ($pageId) {
    $db = new Db;
    $sql = "DELETE FROM pages_photos WHERE page_id = '{$pageId}'";
    return mysqli_query($db->connect ,$sql);
}

function getAllSettings(){
    $db = new Db;
    $sql = "SELECT * FROM settings ORDER BY id;";
    $rs = mysqli_query($db->connect,$sql);
    return createSmartyRsArray($rs);
}

function getAllTranslates(){
    $db = new Db;
    $sql = "SELECT * FROM translates;";
    $rs = mysqli_query($db->connect,$sql);
    return createSmartyRsArray($rs);
}

function saveAllTranslates($about_us_en, $about_us_ro, $about_us_ru, $address_en, $address_ro, $address_ru,
                           $all_projects_en, $all_projects_ro, $all_projects_ru, $deliver_quality_en, $deliver_quality_ro, $deliver_quality_ru,
                           $our_works_en, $our_works_ro, $our_works_ru){

    $db = new Db;
    $sql = "
        UPDATE translates t1 JOIN translates t2 JOIN translates t3 JOIN translates t4 JOIN translates t5
        ON t1.lang_index = 'our_works' AND t2.lang_index = 'deliver_quality'
               AND t3.lang_index = 'all_projects' AND t4.lang_index = 'address'
               AND t5.lang_index = 'about_us'
        SET t1.en = '{$our_works_en}',
           t2.en = '{$deliver_quality_en}',
           t3.en = '{$all_projects_en}',
           t4.en = '{$address_en}',
           t5.en = '{$about_us_en}',
           t1.ru = '{$our_works_ru}',
           t2.ru = '{$deliver_quality_ru}',
           t3.ru = '{$all_projects_ru}',
           t4.ru = '{$address_ru}',
           t5.ru = '{$about_us_ru}',
           t1.ro = '{$our_works_ro}',
           t2.ro = '{$deliver_quality_ro}',
           t3.ro = '{$all_projects_ro}',
           t4.ro = '{$address_ro}',
           t5.ro = '{$about_us_ro}';
        ";

    return  mysqli_query($db->connect,$sql);
}

function saveAllSettings ($phone, $facebook, $instagram, $address, $work_time){
    $db = new Db;
    $sql = "";

    $sql = "
        UPDATE settings
        SET value = CASE name 
                            WHEN 'phone' THEN '{$phone}' 
                            WHEN 'facebook' THEN '{$facebook}' 
                            WHEN 'instagram' THEN '{$instagram}' 
                            WHEN 'address' THEN '{$address}' 
                            WHEN 'work_time' THEN '{$work_time}' 
                            ELSE ''
                            END
        WHERE name IN('phone', 'facebook', 'instagram', 'address', 'work_time');
        ";
    return mysqli_query($db->connect,$sql);
}

function getProjectByUri($uri){
    $db = new Db;
    $sql = "SELECT * FROM projects
            WHERE uri = '{$uri}'";
    $rs = mysqli_query($db->connect,$sql);
    return mysqli_fetch_assoc($rs);
}

function getProjectById($id){
    $db = new Db;
    $sql = "SELECT * FROM projects
            WHERE id = '{$id}'";
    $rs = mysqli_query($db->connect,$sql);
    return mysqli_fetch_assoc($rs);
}

function getWorkById($id){
    $db = new Db;
    $sql = "SELECT * FROM works
            WHERE id = '{$id}'";
    $rs = mysqli_query($db->connect,$sql);
    return mysqli_fetch_assoc($rs);
}
function updateWorkById($id, $uri, $order_index, $title_ro, $title_ru, $title_en, $long_desc_ro, $long_desc_ru, $long_desc_en, $logo, $meta){
    $db = new Db;
    $sql = "";
    if (!empty($logo)) {
        $sql = "
        UPDATE works
        SET uri = '{$uri}', order_index = '{$order_index}', title_ro = '{$title_ro}', title_ro = '{$title_ro}', title_ru = '{$title_ru}',
            title_en = '{$title_en}', long_descriprion_ro = '{$long_desc_ro}', long_descriprion_ru = '{$long_desc_ru}', long_descriprion_en = '{$long_desc_en}',
            logo = '{$logo}', meta = '{$meta}'
        WHERE id = {$id};
        ";
    } else {
        $sql = "
        UPDATE works
        SET uri = '{$uri}', order_index = '{$order_index}', title_ro = '{$title_ro}', title_ro = '{$title_ro}', title_ru = '{$title_ru}',
            title_en = '{$title_en}', long_descriprion_ro = '{$long_desc_ro}', long_descriprion_ru = '{$long_desc_ru}', long_descriprion_en = '{$long_desc_en}',
            meta = '{$meta}'
        WHERE id = {$id};
        ";
    }
//    $sql = "
//        UPDATE projects
//        SET uri = '{$uri}', order_index = '{$order_index}', title_ro = '{$title_ro}', title_ro = '{$title_ro}', title_ru = '{$title_ru}',
//            title_en = '{$title_en}', long_descriprion_ro = '{$long_desc_ro}', long_descriprion_ro = '{$long_desc_ru}', long_descriprion_ro = '{$long_desc_en}',
//            " . !empty($logo) ? "logo = '{$logo}'," : "," ." meta = '{$meta}'
//        WHERE id = {$id};
//    ";
    return mysqli_query($db->connect,$sql);
}

function updateProjectById($id, $uri, $order_index, $title_ro, $title_ru, $title_en, $long_desc_ro, $long_desc_ru, $long_desc_en, $logo, $meta){
    $db = new Db;
    $sql = "";
    if (!empty($logo)) {
        $sql = "
        UPDATE projects
        SET uri = '{$uri}', order_index = '{$order_index}', title_ro = '{$title_ro}', title_ro = '{$title_ro}', title_ru = '{$title_ru}',
            title_en = '{$title_en}', long_descriprion_ro = '{$long_desc_ro}', long_descriprion_ru = '{$long_desc_ru}', long_descriprion_en = '{$long_desc_en}',
            logo = '{$logo}', meta = '{$meta}'
        WHERE id = {$id};
        ";
    } else {
        $sql = "
        UPDATE projects
        SET uri = '{$uri}', order_index = '{$order_index}', title_ro = '{$title_ro}', title_ro = '{$title_ro}', title_ru = '{$title_ru}',
            title_en = '{$title_en}', long_descriprion_ro = '{$long_desc_ro}', long_descriprion_ru = '{$long_desc_ru}', long_descriprion_en = '{$long_desc_en}',
            meta = '{$meta}'
        WHERE id = {$id};
        ";
    }
//    $sql = "
//        UPDATE projects
//        SET uri = '{$uri}', order_index = '{$order_index}', title_ro = '{$title_ro}', title_ro = '{$title_ro}', title_ru = '{$title_ru}',
//            title_en = '{$title_en}', long_descriprion_ro = '{$long_desc_ro}', long_descriprion_ro = '{$long_desc_ru}', long_descriprion_ro = '{$long_desc_en}',
//            " . !empty($logo) ? "logo = '{$logo}'," : "," ." meta = '{$meta}'
//        WHERE id = {$id};
//    ";
    return mysqli_query($db->connect,$sql);
}

function getProjectPhotosById($id){
    $db = new Db;
    $sql = "SELECT * FROM project_photos
            WHERE project_id = '{$id}'";
    $rs = mysqli_query($db->connect,$sql);
    return createSmartyRsArray($rs);
}

function insertProject($uri, $order_index, $title_ro, $title_ru, $title_en, $long_descriprion_ro, $long_descriprion_ru,
                       $long_descriprion_en, $logo, $meta){
    $db = new Db;
    $mysqli = $db->connect;
    $sql = "INSERT INTO `projects` 
        ( `uri`, `order_index`, `title_ro`, `title_ru`, `title_en`, `long_descriprion_ro`, `long_descriprion_ru`, 
        `long_descriprion_en`, `logo`, `meta`) 
        VALUES 
        (?,?,?,?,?,?,?,?,?,?);";

    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param('ssssssssss', $uri, $order_index, $title_ro, $title_ru, $title_en,
        $long_descriprion_ro, $long_descriprion_ru, $long_descriprion_en, $logo, $meta);
    if ($stmt->execute()) {
        return $mysqli->insert_id;
    } else {
        return false;
    }
}

function insertWork($uri, $order_index, $title_ro, $title_ru, $title_en, $long_descriprion_ro, $long_descriprion_ru,
                       $long_descriprion_en, $logo, $meta){
    $db = new Db;
    $mysqli = $db->connect;
    $sql = "INSERT INTO `works` 
        ( `uri`, `order_index`, `title_ro`, `title_ru`, `title_en`, `long_descriprion_ro`, `long_descriprion_ru`, 
        `long_descriprion_en`, `logo`, `meta`) 
        VALUES 
        (?,?,?,?,?,?,?,?,?,?);";

    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param('ssssssssss', $uri, $order_index, $title_ro, $title_ru, $title_en,
        $long_descriprion_ro, $long_descriprion_ru, $long_descriprion_en, $logo, $meta);
    if ($stmt->execute()) {
        return $mysqli->insert_id;
    } else {
        return false;
    }
}

function insertPhotos($id, $photosNames){
    $db = new Db;
    $mysqli = $db->connect;
    $sql = "INSERT INTO `project_photos` 
        (`project_id`, `name`) 
        VALUES 
        (?,?);";

    for($i=0; $i<count($photosNames); $i++){
        $name = $photosNames[$i];
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param('is', $id, $name);
        if (!$stmt->execute()) {
            return false;
        }
    }
    return true;
}

function insertWorkPhotos($id, $photosNames){
    $db = new Db;
    $mysqli = $db->connect;
    $sql = "INSERT INTO `work_photos` 
        (`work_id`, `name`) 
        VALUES 
        (?,?);";

    for($i=0; $i<count($photosNames); $i++){
        $name = $photosNames[$i];
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param('is', $id, $name);
        if (!$stmt->execute()) {
            return false;
        }
    }
    return true;
}

function getWorkLogoNameById($workId){
    $db = new Db;
    $sql = "SELECT logo FROM works
            WHERE id = '{$workId}'";
    $rs = mysqli_query($db->connect,$sql);
    return mysqli_fetch_assoc($rs);
}

function getWorkPhotosNamesById($workId){
    $db = new Db;
    $sql = "SELECT name FROM work_photos
            WHERE work_id = '{$workId}'";
    $rs = mysqli_query($db->connect,$sql);
    return createSmartyRsArray($rs);
}

function deleteWorkPhotosById ($workId) {
    $db = new Db;
    $sql = "DELETE FROM work_photos WHERE work_id = '{$workId}'";
    return mysqli_query($db->connect ,$sql);
}

function deleteWorkById ($workId) {
    $db = new Db;
    $sql = "DELETE FROM works WHERE id = '{$workId}'";
    return mysqli_query($db->connect ,$sql);
}

function getLogoNameById($projId){
    $db = new Db;
    $sql = "SELECT logo FROM projects
            WHERE id = '{$projId}'";
    $rs = mysqli_query($db->connect,$sql);
    return mysqli_fetch_assoc($rs);
}

function getPhotosNamesById($projId){
    $db = new Db;
    $sql = "SELECT name FROM project_photos
            WHERE project_id = '{$projId}'";
    $rs = mysqli_query($db->connect,$sql);
    return createSmartyRsArray($rs);
}

function deleteProjectById ($projId) {
    $db = new Db;
    $sql = "DELETE FROM projects WHERE id = '{$projId}'";
    return mysqli_query($db->connect ,$sql);
}

function deletePhotosById ($projId) {
    $db = new Db;
    $sql = "DELETE FROM project_photos WHERE project_id = '{$projId}'";
    return mysqli_query($db->connect ,$sql);
}

function updateOrderIndex($projId, $newIndex){
    $db = new Db;
    $sql = "
        UPDATE projects
        SET order_index = '{$newIndex}'
        WHERE id = '{$projId}';
    ";
    return mysqli_query($db->connect,$sql);
}

function updateWorkOrderIndex($workId, $newIndex){
    $db = new Db;
    $sql = "
        UPDATE works
        SET order_index = '{$newIndex}'
        WHERE id = '{$workId}';
    ";
    return mysqli_query($db->connect,$sql);
}

/**
 * Primim un masiv de producte din masiv de id-uri
 *
 * @param $array
 */
function getProductsfromArray($idArray){
    $db = new Db;
    $strIds = implode(',', $idArray);

    $sql = "SELECT * FROM products
            where id in ({$strIds})";
    $rs = mysqli_query($db->connect,$sql);
    return createSmartyRsArray($rs);
}

/**
 * Get full data of all products
 *
 * @return array|false
 */
function getProducts(){
    $db = new Db;
    return createSmartyRsArray(mysqli_query($db->connect ,"SELECT * from products ORDER BY category_id"));
}

/**
 * Update product data
 *
 * @param $itemId
 * @param $itemName
 * @param $itemPrice
 * @param $itemStatus
 * @param $itemDesc
 * @param $itemCat
 * @param null $newFileName
 * @return bool|resource
 */
function updateProduct($itemId, $itemName, $itemPrice, $itemStatus, $itemDesc, $itemCat, $newFileName = null){
    $db = new Db;
    $set = array();
    if ($itemName){
        $set[] = "`name` = '{$itemName}'";
    }
    if ($itemPrice > 0){
        $set[] = "`price` = '{$itemPrice}'";
    }
    if ($itemStatus !== null){
        $set[] = "`status` = '{$itemStatus}'";
    }
    if ($itemDesc){
        $set[] = "`description` = '{$itemDesc}'";
    }
    if ($itemCat){
        $set[] = "`category_id` = '{$itemCat}'";
    }
    if ($newFileName){
        $set[] = "`image` = '{$newFileName}'";
    }
    $setStr = implode(", ", $set);
    $sql = "
        UPDATE products
        SET {$setStr}
        WHERE id = '{$itemId}';
    ";
    return mysqli_query($db->connect,$sql);
}

/**
 * Update product image filename
 *
 * @param $itemId
 * @param $newFileName
 * @return bool|resource
 */
function updateProductImage($itemId, $newFileName){
    return updateProduct($itemId, null, null, null,null, null, $newFileName);
}

/**
 * Delete product data by id
 *
 * @param $prodId product id
 */
function deleteProductById ($prodId) {
    $db = new Db;
    $sql = "DELETE FROM products WHERE id = '{$prodId}'";
    return mysqli_query($db->connect ,$sql);
}
