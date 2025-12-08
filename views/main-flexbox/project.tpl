<div class="project_container">
    <h1 class="project_title">Project: {$project['title_en']}</h1>
    <div id="sync2" class="owl-carousel owl-theme">
        {foreach $projectPhotos as $item name = projectPhotos}
            <div class="item">
                <img class="carousel_background_project" src="/images/project_galery/{$item['name']}" alt="">
            </div>
        {/foreach}
    </div>
    <div class="long_description">
        {$project['long_descriprion_ru']}
    </div>
</div>