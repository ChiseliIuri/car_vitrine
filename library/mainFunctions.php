<?php

/**
 *
 * FUNCTII PRINCIPALE
 *
*/

/**
 * Formarea Paginii apelate
 *
 * @param object $smarty obiect a clasei Smarty
 * @param string $controllerName denumirea controlerului
 * @param string $actionName denumirea functiei de prelucrare a paginii
*/
function loadPage($smarty, $controllerName, $actionName = 'index'){
    include_once PathPrefix . $controllerName . PathPostfix;
    $function = $actionName . 'Action';
    $function($smarty);
}

/**
 * Template loading
 *
 * @param object $smarty obiect a sablonizatorului
 * @param string $templateName denumirea file-ului sablonului
 */
function loadTemplate($smarty, $templateName){
    $smarty->display($templateName . TEMPLATE_POSTFIX);
}

/**
 * Функция отладки. Останавливает работу программы выводя значение переменной
 * $value
 *
 * @param variant $value переменная для вывода ее на страницу
 */
function debug($value = null, $die = 1){
    echo'Debug: <br/><pre>';
    print_r($value);
    echo'</pre>';
    if($die) die;
}

/**
 *Преобразование результата работы функции выборки в ассоциативный массив
 *
 * @param $rs
 * @return array
 */
function createSmartyRsArray($rs){

    if(! $rs) return false;

    $smartyRs = array();
    while ($row = mysqli_fetch_assoc($rs)){
        $smartyRs[] = $row;
    }
    return $smartyRs;
}


/**
 *Преобразование результата работы функции выборки в ассоциативный массив с PDO
 *
 * @param $rs
 * @return array
 */
function createSmartyRsArrayPDO($stmt){
    $result = array();
    try {
        $result[] = $stmt->fetchAll();
        return $result;
    } catch (PDOException $e){
        echo $e->getMessage();
    }
}

/**
 * Redirect
 *
 * @param string url
 */
function redirect($url){
    if(!$url) $url = '/';
    header("Location: {$url}");
    exit;
}

/**
 * Implementation of mysql_field_name in mysqli
 *
 * @param $result
 * @param $field_offset
 * @return null
 */
function mysqli_field_name($result, $field_offset)
{
    $properties = mysqli_fetch_field_direct($result, $field_offset);
    return is_object($properties) ? $properties->name : null;
}

// Функция для генерации уникального имени
function generateFileName($originalName) {
    $ext = pathinfo($originalName, PATHINFO_EXTENSION);
    // uniqid генерирует ID на основе времени, снижает риск дублей
    return uniqid('img_', true) . '.' . $ext;
}

function photosSaving(){
    $avatarDir = '../www/images/project_logos/';
    $galleryDir = '../www/images/project_galery/';
    $logoName = '';
    $galleryNames = [];
    // === 1. ОБРАБОТКА ОДИНОЧНОГО ФАЙЛА (Аватар) ===
    if (isset($_FILES['main_logo']) && $_FILES['main_logo']['error'] === UPLOAD_ERR_OK) {
        $tmpName = $_FILES['main_logo']['tmp_name'];
        $fileName = generateFileName($_FILES['main_logo']['name']);
        
        $destination = $avatarDir . $fileName;
        move_uploaded_file($tmpName, $destination) ? $logoName = $fileName : $logoName = '';
        
    }

    // === 2. ОБРАБОТКА МНОЖЕСТВЕННЫХ ФАЙЛОВ (Галерея) ===
    // PHP принимает их в странном формате: $_FILES['gallery']['name'][0], $_FILES['gallery']['name'][1] и т.д.
    if (isset($_FILES['project_images']) && is_array($_FILES['project_images']['name'])) {
        // Считаем сколько файлов пришло
        $count = count($_FILES['project_images']['name']);

        // Подготавливаем запрос (лучше делать это один раз перед циклом)
        // $stmt = $pdo->prepare("INSERT INTO user_photos (user_id, photo_path) VALUES (?, ?)");

        for ($i = 0; $i < $count; $i++) {
            // Проверяем на ошибки каждый файл
            if ($_FILES['project_images']['error'][$i] === UPLOAD_ERR_OK) {
                
                $tmpName = $_FILES['project_images']['tmp_name'][$i];
                $originalName = $_FILES['project_images']['name'][$i];
                
                $fileName = generateFileName($originalName);
                
                $destination = $galleryDir . $fileName;
                $galleryNames[$i] = $fileName;
                move_uploaded_file($tmpName, $destination);
            }
        }
    }

    return ['logo' => $logoName, 'gallery' => $galleryNames];
}


















