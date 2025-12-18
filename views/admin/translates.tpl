<div class="container">

    <form class="inputsForm" id="langForm" method="post" action="/" enctype="multipart/form-data">

        {foreach $rsLangs as $item name = langs}
            <div class="project_text_input">
                <p>{$item['lang_index']}.en</p>
                <input type="text" id="{$item['lang_index']}.en" name="{$item['lang_index']}.en" class="form-control" value="{$item['en']}" />
            </div>
            <div class="project_text_input">
                <p>{$item['lang_index']}.ro</p>
                <input type="text" id="{$item['lang_index']}.ro" name="{$item['lang_index']}.ro" class="form-control" value="{$item['ro']}" />
            </div>
            <div class="project_text_input">
                <p>{$item['lang_index']}.ru</p>
                <input type="text" id="{$item['lang_index']}.ru" name="{$item['lang_index']}.ru" class="form-control" value="{$item['ru']}" />
            </div>

        {/foreach}

        <div style="margin-top: 20px; width:100%; display: flex; flex-direction:column; justify-content:center; align-items: center;">
            <button type="submit" class="button add_new_project">Save translates</button>
        </div>
    </form>

    <script>
        (function(){

            var form = document.getElementById('langForm');
            var attachFormHandler = function() {
                if (typeof savelang === 'function') {
                    form.addEventListener('submit', savelang);
                } else {
                    setTimeout(attachFormHandler, 100);
                }
            };
            attachFormHandler();
        })();
    </script>

</div>