/**
 * Js funcitons for admin page
 */

// window.onload = function () {
//     document.getElementById()
// }

function editProject(id) {
    window.location = "/admin/editprojects/en/"+ id +"/";
}

function editWork(id) {
    window.location = "/admin/editworks/en/"+ id +"/";
}

function saveEditProject(e){
    if (e) e.preventDefault();

    // Sync Quill editor contents to hidden inputs
    document.getElementById('long_desc_en').value = quillEn.root.innerHTML;
    document.getElementById('long_desc_ro').value = quillRo.root.innerHTML;
    document.getElementById('long_desc_ru').value = quillRu.root.innerHTML;

    // Create FormData from form element (handles files automatically)
    var form = document.getElementById('projectForm');
    var formData = new FormData(form);

    $.ajax({
        type: 'POST',
        async: true,
        url: '/admin/saveeditedproject/en/',
        data: formData,
        processData: false,  // Important: don't convert FormData to query string
        contentType: false,  // Important: let browser set content-type with boundary
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                // alert(data['message'] || 'Project saved successfully!');
                window.location = "/admin/getallprojects/en/";
            } else {
                alert('Error: ' + (data['message'] || 'Failed to save project'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function saveEditWork(e){
    if (e) e.preventDefault();

    // Sync Quill editor contents to hidden inputs
    document.getElementById('long_desc_en').value = quillEn.root.innerHTML;
    document.getElementById('long_desc_ro').value = quillRo.root.innerHTML;
    document.getElementById('long_desc_ru').value = quillRu.root.innerHTML;

    // Create FormData from form element (handles files automatically)
    var form = document.getElementById('projectForm');
    var formData = new FormData(form);

    $.ajax({
        type: 'POST',
        async: true,
        url: '/admin/saveeditedwork/en/',
        data: formData,
        processData: false,  // Important: don't convert FormData to query string
        contentType: false,  // Important: let browser set content-type with boundary
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                // alert(data['message'] || 'Project saved successfully!');
                window.location = "/admin/getallworks/en/";
            } else {
                alert('Error: ' + (data['message'] || 'Failed to save project'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function saveProject(e){
    // Prevent default form submission
    if (e) e.preventDefault();

    // Sync Quill editor contents to hidden inputs
    document.getElementById('long_desc_en').value = quillEn.root.innerHTML;
    document.getElementById('long_desc_ro').value = quillRo.root.innerHTML;
    document.getElementById('long_desc_ru').value = quillRu.root.innerHTML;

    // Create FormData from form element (handles files automatically)
    var form = document.getElementById('projectForm');
    var formData = new FormData(form);

    $.ajax({
        type: 'POST',
        async: true,
        url: '/admin/saveproject/en/',
        data: formData,
        processData: false,  // Important: don't convert FormData to query string
        contentType: false,  // Important: let browser set content-type with boundary
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                // alert(data['message'] || 'Project saved successfully!');
                window.location = "/admin/getallprojects/en/";
            } else {
                alert('Error: ' + (data['message'] || 'Failed to save project'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function saveWork(e){
    // Prevent default form submission
    if (e) e.preventDefault();

    // Sync Quill editor contents to hidden inputs
    document.getElementById('long_desc_en').value = quillEn.root.innerHTML;
    document.getElementById('long_desc_ro').value = quillRo.root.innerHTML;
    document.getElementById('long_desc_ru').value = quillRu.root.innerHTML;

    // Create FormData from form element (handles files automatically)
    var form = document.getElementById('workForm');
    var formData = new FormData(form);

    $.ajax({
        type: 'POST',
        async: true,
        url: '/admin/savework/en/',
        data: formData,
        processData: false,  // Important: don't convert FormData to query string
        contentType: false,  // Important: let browser set content-type with boundary
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                // alert(data['message'] || 'Project saved successfully!');
                window.location = "/admin/getallworks/en/";
            } else {
                alert('Error: ' + (data['message'] || 'Failed to save project'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function saveAbout(e){
    // Prevent default form submission
    if (e) e.preventDefault();

    // Sync Quill editor contents to hidden inputs
    document.getElementById('long_desc_en').value = quillEn.root.innerHTML;
    document.getElementById('long_desc_ro').value = quillRo.root.innerHTML;
    document.getElementById('long_desc_ru').value = quillRu.root.innerHTML;

    // Create FormData from form element (handles files automatically)
    var form = document.getElementById('aboutForm');
    var formData = new FormData(form);

    $.ajax({
        type: 'POST',
        async: true,
        url: '/admin/addabout/en/',
        data: formData,
        processData: false,  // Important: don't convert FormData to query string
        contentType: false,  // Important: let browser set content-type with boundary
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                // alert(data['message'] || 'Project saved successfully!');
                window.location = "/admin/getabout/en/";
            } else {
                alert('Error: ' + (data['message'] || 'Failed to save project'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function saveSettings(e) {
    // Prevent default form submission
    if (e) e.preventDefault();

    // Sync Quill editor contents to hidden inputs
    document.getElementById('work_time').value = quillWt.root.innerHTML;
    var form = document.getElementById('settingsForm');
    var formData = new FormData(form);

    $.ajax({
        type: 'POST',
        async: true,
        url: '/admin/savesettings/en/',
        data: formData,
        processData: false,  // Important: don't convert FormData to query string
        contentType: false,  // Important: let browser set content-type with boundary
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                // alert(data['message'] || 'Project saved successfully!');
                window.location = "/admin/en/";
            } else {
                alert('Error: ' + (data['message'] || 'Failed to save settings'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function savelang(e) {
    // Prevent default form submission
    if (e) e.preventDefault();

    // Sync Quill editor contents to hidden inputs
    // document.getElementById('work_time').value = quillWt.root.innerHTML;
    var form = document.getElementById('langForm');
    var formData = new FormData(form);

    $.ajax({
        type: 'POST',
        async: true,
        url: '/admin/savelangs/en/',
        data: formData,
        processData: false,  // Important: don't convert FormData to query string
        contentType: false,  // Important: let browser set content-type with boundary
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                // alert(data['message'] || 'Project saved successfully!');
                window.location = "/admin/getalllangs/en/";
            } else {
                alert('Error: ' + (data['message'] || 'Failed to save translate'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function deleteProject(id){
        // let postData = {'projectId': id};

        // let postData = '?projectId=' + id;

        $.ajax({
        type: 'GET',
        async: true,
        url: '/admin/deleteproject/en/'+ id +'/',
        data: '',
        processData: false,  // Important: don't convert FormData to query string
        contentType: false,  // Important: let browser set content-type with boundary
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                // alert(data['message'] || 'Project deleted successfully!');
                window.location = "/admin/getallprojects/en/";
            } else {
                alert('Error: ' + (data['message'] || 'Failed to delete project'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function deleteWork(id){
        // let postData = {'projectId': id};

        // let postData = '?projectId=' + id;

        $.ajax({
        type: 'GET',
        async: true,
        url: '/admin/deletework/en/'+ id +'/',
        data: '',
        processData: false,  // Important: don't convert FormData to query string
        contentType: false,  // Important: let browser set content-type with boundary
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                // alert(data['message'] || 'Project deleted successfully!');
                window.location = "/admin/getallworks/en/";
            } else {
                alert('Error: ' + (data['message'] || 'Failed to delete project'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function updateOrderIndex(projectId, newIndex){
    let postData = {projectId: projectId, orderIndex: newIndex};

    $.ajax({
        type: 'POST',
        async: true,
        url: '/admin/updateprojectorder/en/',
        data: postData,
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                window.location = "/admin/getallprojects/en/";
                console.log('Order index updated successfully!');
            } else {
                alert('Error: ' + (data['message'] || 'Failed to update order index'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

function updateWorkOrderIndex(projectId, newIndex){
    let postData = {projectId: projectId, orderIndex: newIndex};

    $.ajax({
        type: 'POST',
        async: true,
        url: '/admin/updateworkorder/en/',
        data: postData,
        dataType: 'json',
        success: function (data) {
            console.log('Success:', data);
            if (data['success']) {
                window.location = "/admin/getallworks/en/";
                console.log('Order index updated successfully!');
            } else {
                alert('Error: ' + (data['message'] || 'Failed to update order index'));
            }
        },
        error: function(xhr, status, error) {
            console.log('AJAX Error:', error);
            alert('Error: ' + error);
        }
    });
}

// /**
//  *Ajax function for adding new category
//  */
// function newCategory(){
//     let catName = document.getElementById('newCategoryName').value;
//     let catID = document.getElementsByTagName('select')[0].value;
//     console.log(catName + '__' + catID);
//     let postData = 'newCategoryName=' + catName + '&generalCatId=' + catID;
//     console.log(postData);
//
//     $.ajax({
//         type: 'POST',
//         async: false,
//         url:'/admin/addnewcat/',
//         data: postData,
//         dataType: 'json',
//         success: function(data){
//             if (data['success']){
//                 alert(data['message']);
//                 $('#newCategoryName').val('');
//             } else {
//                 alert(data['message']);
//             }
//         }
//     });
// }
//
// /**
//  * Update category data
//  *
//  * @param catId
//  */
// function updateCat(catId){
//     let name = document.getElementById("itemName_"+catId).value
//     let parentId = document.getElementById("parentId_"+catId).value
//
//     // \/old possibility of write post data(directly as if we would write in url)
//     // let postData = 'itemId=' + catId + '&parentId=' + parentId + '&newName=' + name
//
//     // \/new possibility of write post data(more beautifully and easier, as json)
//     let postData = {itemId: catId, parentId: parentId, newName: name};
//
//     $.ajax({
//         type: 'POST',
//         async: false,
//         url: '/admin/updatecategory/',
//         data: postData,
//         dataType: 'json',
//         success: function (data) {
//                 alert(data['message'])
//         }
//     });
// }
//
// /**
//  * Add new product
//  *
//  */
// function addProduct(){
//     let postData = {
//         itemName: $('#newItemName').val(),
//         itemPrice: $('#newItemPrice').val(),
//         itemCatId: $('#newItemCatId').val(),
//         itemDesc: $('#newItemDesc').val()
//     }
//
//     $.ajax({
//         type: 'POST',
//         async: false,
//         url: '/admin/addproduct/',
//         data: postData,
//         dataType: 'json',
//         success: function (data) {
//             alert(data['message'])
//             if (data['success']) {
//                 $('#newItemName').val('')
//                 $('#newItemPrice').val('')
//                 $('#newItemCatId').val('')
//                 $('#newItemDesc').val('')
//             }
//             window.location = "http://localhost/admin/products/";
//         }
//     })
// }
//
//
//
// /**
//  * Show product under-table in orders table
//  *
//  * @param item
//  */
// function showProducts(item){
//     $("#purchaseForOrderId_" + item).toggle()
// }
//
// /**
//  * Ajax for update order status
//  *
//  * @param itemId
//  */
// function updateOrderStatus(itemId){
//     let itemStatus = $('#itemStatus_'+itemId).prop('checked');
//     if (itemStatus){
//         itemStatus = 1;
//     } else {
//         itemStatus = 0;
//     }
//
//     let postData = {itemId: itemId, status: itemStatus}
//     $.ajax({
//         type: 'POST',
//         async: false,
//         url: '/admin/setorderstatus/',
//         data: postData,
//         dataType: 'json',
//         success: function (data) {
//             if (!data['success']){
//                 alert(data['message'])
//             }
//         }
//     })
// }
//
//
//
// function updateDatePayment(itemId){
//     let date = $('#datePayment_' + itemId).val()
//     console.log(date)
//     let postData = {itemId: itemId, datePayment: date}
//
//     $.ajax({
//         type: 'POST',
//         async: false,
//         url: '/admin/setorderdatepayment/',
//         data: postData,
//         dataType: 'json',
//         success: function(data){
//             if(!data['success']){
//                 alert(data['message'])
//             }
//         }
//     })
// }
//
// function deleteCat(catId){
//     let postData = {catId: catId}
//
//     $.ajax({
//         type: 'POST',
//         async: false,
//         url: '/admin/destroycategory/',
//         data: postData,
//         dataType: 'json',
//         success: function(data){
//             if(!data['success']){
//                 alert(data['message'])
//             } else {
//                 document.getElementById(catId).style.display = 'none';
//                 alert(data['message'])
//             }
//         }
//     })
// }
//
// function destroyProduct(prodId){
//     let postData = {prodId: prodId}
//
//     $.ajax({
//         type: 'POST',
//         async: false,
//         url: '/admin/destroyproduct/',
//         data: postData,
//         dataType: 'json',
//         success: function(data){
//             if(!data['success']){
//                 alert(data['message'])
//             } else {
//                 document.getElementById(prodId).style.display = 'none';
//                 alert(data['message'])
//             }
//         }
//     })
// }
