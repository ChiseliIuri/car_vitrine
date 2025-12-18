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

{*        <div class="project_text_input">*}
{*            <p>Phone</p>*}
{*            <input type="text" id="phone" name="phone" class="form-control" value="{$rsSettings['0']['value']}" />*}
{*        </div>*}
{*        <div class="project_text_input">*}
{*            <p>Facebook</p>*}
{*            <input type="text" id="facebook" name="facebook" class="form-control" value="{$rsSettings['1']['value']}" />*}
{*        </div>*}
{*        <div class="project_text_input">*}
{*            <p>Instagram</p>*}
{*            <input type="text" id="instagram" name="instagram" class="form-control" value="{$rsSettings['2']['value']}" />*}
{*        </div>*}
{*        <div class="project_text_input">*}
{*            <p>Address</p>*}
{*            <input type="text" id="address" name="address" class="form-control" value="{$rsSettings[3]['value']}" />*}
{*        </div>*}
{*        <div class="long_text_input">*}
{*            <p>Work Time</p>*}
{*            <div id="editor_wt" style="margin-left: 10px; margin-right: 10px; height:200px; background:#fff;"></div>*}
{*            <input type="hidden" id="work_time" name="work_time" class="form-control" />*}
{*        </div>*}

        <div style="margin-top: 20px; width:100%; display: flex; flex-direction:column; justify-content:center; align-items: center;">
            <button type="submit" class="button add_new_project">Save translates</button>
        </div>
    </form>

{*    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">*}
{*    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>*}

    <script>
        // var quillWt;

        (function(){
            {*quillWt = new Quill('#editor_wt', { theme: 'snow' });*}
            {*quillWt.root.innerHTML = "{$rsSettings[4]['value']}";*}

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