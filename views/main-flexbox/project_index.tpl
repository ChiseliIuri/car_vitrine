<div id="projects" class="container">
    <div class="categories_general_title">
{*        <h2 style="text-align: center; letter-spacing: 10px;color: #cccccc;font-weight: normal;font-size: 20px;">DELIVER QUALITY</h2>*}
{*        <h1 style="text-align: center; color: black; font-size: 36px; font-weight: bold;">ALL PROJECTS AT A GLANCE</h1>        *}
        <h1 style="text-align: center; color: black; font-size: 36px; font-weight: bold;">Turbo kits,  Exhaust & intake systems,  ECU tuning,  Custom wiring</h1>
        <h2 style="text-align: center; letter-spacing: 10px;color: #cccccc;font-weight: normal;font-size: 20px;">{$rsLangs['deliver_quality'][{$lang}]}</h2>
        <h1 style="text-align: center; color: black; font-size: 36px; font-weight: bold;">{$rsLangs['all_projects'][{$lang}]}</h1>
    </div>
    <div class="products">
        {foreach $rsProjects as $item name = projects}
            <a id="prod_{$item['id']}" class="product_card" href="/project/{$item['uri']}/{$lang_url}">
                <div class="product_img"><img src="/images/project_logos/{$item['logo']}" alt="{$item['uri']}"></div>
                <div class="product_title"><h1>{$item[$titleIndex]}</h1></div>
            </a>
        {/foreach}
{*    <div style="width: 100%;">*}
    </div>
    <div id="load_more" class="load_more">
        Load More
    </div>

</div>
