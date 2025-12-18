<div class="project_container">
    <h1 class="project_title">{$title}</h1>
    <div id="sync2" class="owl-carousel owl-theme">
        {foreach $photos as $item name = projectPhotos}
            <div class="item">
                <img class="carousel_background_project" src="/images/project_galery/{$item['name']}" alt="">
            </div>
        {/foreach}
    </div>
    <div class="long_description">
        {$description}
    </div>
</div>