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
