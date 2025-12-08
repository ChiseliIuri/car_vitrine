<div class="container">
    <div class="categories_general_title">
        <h2 style="text-align: center; letter-spacing: 10px;color: #cccccc;font-weight: normal;font-size: 20px;">DELIVER QUALITY</h2>
        <h1 style="text-align: center; color: black; font-size: 36px; font-weight: bold;">ALL PROJECTS AT A GLANCE</h1>
    </div>
    <div class="products">
        {foreach $rsProjects as $item name = projects}
            <a id="prod_{$item['id']}" class="product_card" href="/project/{$item['uri']}/">
                <div class="product_img"><img src="/images/project_logos/{$item['logo']}" alt="{$item['uri']}"></div>
                <div class="product_title">{$item['title_en']}</div>
            </a>
        {/foreach}
    <div id="load_more" class="load_more">
        Load More
    </div>
</div>
