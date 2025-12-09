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

function getProjectByUri($uri){
    $db = new Db;
    $sql = "SELECT * FROM projects
            WHERE uri = '{$uri}'";
    $rs = mysqli_query($db->connect,$sql);
    return mysqli_fetch_assoc($rs);
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
