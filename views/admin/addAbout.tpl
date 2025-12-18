<div class="container">
    <h2>Redacteaza pagina despre noi</h2>

    <form class="inputsForm" id="aboutForm" method="post" action="/" enctype="multipart/form-data">

        <div class="project_text_input">
            <p>Title EN</p>
            <input type="text" id="title_en" name="title_en" class="form-control" value="{$data[0]['title_en']}" required />
        </div>
        <div class="project_text_input">
            <p>Title RO</p>
            <input type="text" id="title_ro" name="title_ro" class="form-control" value="{$data[0]['title_ro']}" required />
        </div>
        <div class="project_text_input">
            <p>Title RU</p>
            <input type="text" id="title_ru" name="title_ru" class="form-control" value="{$data[0]['title_ru']}" required />
        </div>

        <div class="project_text_input">
            <p>Key Words Meta</p>
            <input type="text" id="meta" name="meta" class="form-control" value="{$data[0]['meta']}" />
        </div>

        <div class="long_text_input">
            <label>Long description (EN)</label>
            <div id="editor_en" style="margin-left: 10px; margin-right: 10px;height:200px; background:#fff;"></div>
            <input type="hidden" name="long_desc_en" id="long_desc_en" />
        </div>

        <div class="long_text_input">
            <label>Long description (RO)</label>
            <div id="editor_ro" style="margin-left: 10px; margin-right: 10px; height:200px; background:#fff;"></div>
            <input type="hidden" name="long_desc_ro" id="long_desc_ro" />
        </div>

        <div class="long_text_input">
            <label>Long description (RU)</label>
            <div id="editor_ru" style="margin-left: 10px; margin-right: 10px;height:200px; background:#fff;"></div>
            <input type="hidden" name="long_desc_ru" id="long_desc_ru" />
        </div>

        <div class="project_drag_and_drop">
            <label style="font-weight: bold; font-size: 30px;" for="project_images">About us images (multiple images)</label>
            <h1>Drag-and-Drop File Uploader</h1>
            <div id="drop-area">
                Drag here to preview
            </div>
            <input type="file" id="project_images" name="project_images[]" accept="image/*" multiple hidden>
            <div id="preview-container"></div>
        </div>
        <div style="margin-top: 20px; width:100%; display: flex; flex-direction:column; justify-content:center; align-items: center;">
            <button type="submit" class="button add_new_project">Save page</button>
        </div>
    </form>

    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.min.js"></script>

    <script>
        var quillEn, quillRo, quillRu;

        (function(){
            quillEn = new Quill('#editor_en', { theme: 'snow' });
            quillRo = new Quill('#editor_ro', { theme: 'snow' });
            quillRu = new Quill('#editor_ru', { theme: 'snow' });

            quillEn.root.innerHTML = '{$data[0]['long_desc_en']}';
            quillRo.root.innerHTML = '{$data[0]['long_desc_ro']}';
            quillRu.root.innerHTML = '{$data[0]['long_desc_ru']}';

            var form = document.getElementById('aboutForm');
            var attachFormHandler = function() {
                if (typeof saveAbout === 'function') {
                    form.addEventListener('submit', saveAbout);
                } else {
                    setTimeout(attachFormHandler, 100);
                }
            };
            attachFormHandler();
        })();
    </script>
    <script type="text/javascript">
        const dropArea = document.getElementById('drop-area');
        const fileInput = document.getElementById('project_images');

        function preventDefaults(e) {
            e.preventDefault();
            e.stopPropagation();
        }

        dropArea.addEventListener('dragover', preventDefaults);
        dropArea.addEventListener('dragenter', preventDefaults);
        dropArea.addEventListener('dragleave', preventDefaults);

        dropArea.addEventListener('drop', handleDrop);

        dropArea.addEventListener('dragover', () => {
            dropArea.classList.add('drag-over');
        });

        dropArea.addEventListener('dragleave', () => {
            dropArea.classList.remove('drag-over');
        });

        function handleDrop(e) {
            e.preventDefault();

            const files = e.dataTransfer.files;

            if (files.length) {
                fileInput.files = files;
                handleFiles(files);
            }
        }

        function handleFiles(files) {
            for (const file of files) {
                const reader = new FileReader();
                reader.readAsDataURL(file);

                reader.onloadend = function (e) {
                    const preview = document.createElement('img');

                    if (isValidFileType(file)) {
                        preview.src = e.target.result;
                    }

                    preview.classList.add('preview-image');
                    const previewContainer = document.getElementById('preview-container');
                    previewContainer.appendChild(preview);
                };
            }
        }

        function isValidFileType(file) {
            const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
            return allowedTypes.includes(file.type);
        }
    </script>

</div>