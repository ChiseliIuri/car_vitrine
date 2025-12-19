<div class="container">
	<h2>Adaugă proiect nou</h2>

	<form class="inputsForm" id="projectForm" method="post" action="/" enctype="multipart/form-data">
		
		<div class="project_text_input">
			<p>URI (string)</p>
			<input type="text" id="uri" name="uri" class="form-control" required />
		</div>	
		<p style="color: red;">Atentie URI trebuie sa fie UNICAL si strict in formatul: 'test_' sau 'test_test', deci doar litere minuscule si delimitatorul '_', de exemplu: audi_rally_peoject sau audi_</p>
		<div class="project_text_input">
			<p>Order index (number)</p>
			<input type="number" id="order_index" name="order_index" class="form-control" value="1" />
		</div>
		<p style="color: green;">Acest index indica in ce ordine se va arata acest proiect in lista, cel mai mic numar e cea mai mare ordine</p>
		<div class="project_text_input">
			<p>Title (EN)</p>
			<input type="text" id="title_en" name="title_en" class="form-control" />
		</div>
		<div class="project_text_input">
			<p>Title (RO)</p>
			<input type="text" id="title_ro" name="title_ro" class="form-control" />
		</div>
		<div class="project_text_input">
			<p>Title (RU)</p>
			<input type="text" id="title_ru" name="title_ru" class="form-control" />
		</div>

		<div class="project_text_input">
			<p>Meta Tags</p>
			<input type="text" id="meta_tags" name="meta_tags" class="form-control" />
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

		<div class="project_img_input">
			<label style="margin-left: 10px; margin-right: 10px;" for="main_logo">Main logo (image)</label>
			<input type="file" id="main_logo" name="main_logo" accept="image/*" class="form-control" />
		</div>

		<div class="project_drag_and_drop">
			<label style="font-weight: bold; font-size: 30px;" for="project_images">Project's images (multiple images)</label>
            <h1>Drag-and-Drop File Uploader</h1>
            <div id="drop-area">
                Drag here to preview
            </div>
            <input type="file" id="project_images" name="project_images[]" accept="image/*" multiple hidden>
            <div id="preview-container"></div>
		</div>
		<div style="margin-top: 20px; width:100%; display: flex; flex-direction:column; justify-content:center; align-items: center;">
				<button type="submit" class="button add_new_project">Save project</button>
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

			var form = document.getElementById('projectForm');
			var attachFormHandler = function() {
				if (typeof saveProject === 'function') {
					form.addEventListener('submit', saveProject);
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