<div class="container">
    <a href="/admin/addprojects/"><div class="button add_new_project">+ Add New Project</div></a>
    {foreach $rsProjects as $item name = projects}
        <div class="project_main">
            <div class="project_head">
                <img class="project_head_img" src="/images/project_logos/{$item['logo']}" alt="project">
                <p>{$item['title_en']}</p>
            </div>
            <div class="project_buttons">
                <div class="button edit_button" onclick="editProject('{$item['id']}');">Edit</div>
                <div class="button delete_button"  onclick="deleteProject('{$item['id']}');">Delete</div>
                <div class="order_index_main_container">
                    Edit Order:
                    <input id="order_{$item['uri']}" class="order_index_main" type="text" value="{$item['order_index']}">
                </div>
            </div>
        </div>
        <script>
            el = document.getElementById('order_{$item['uri']}');
            el.addEventListener('change', function() {
                // var order_index = document.getElementById('order_{$item['uri']}').value;
                updateOrderIndex('{$item['id']}',  this.value);
                console.log('Changed order index for project ID: {$item['id']}');
                console.log('Current value: ' + this.value);
            });
        </script>
    {/foreach}
</div>