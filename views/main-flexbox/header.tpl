<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="
    {if isset($meta)}
        {$meta}
    {else}
        Professional auto tuning atelier. Custom projects, quality, and experience. Turbo kits,  Exhaust & intake systems,  ECU tuning,  Custom wiring.
    {/if}
    ">
    <title>
        {if isset($title_head)}
            {$title_head}
        {else}
            NXFAB Moldova Tuning
        {/if}
    </title>
    <script type="text/javascript" src="/js/jquery_2.1.3.js"></script>
    <script type="text/javascript" src="/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/js/main.js"></script>
    <link rel="stylesheet" href="/templates/main-flexbox/css/main.css">
    <link rel="stylesheet" href="/templates/main-flexbox/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/templates/main-flexbox/css/owl.theme.default.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fugaz+One&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Nunito:ital,wght@0,200..1000;1,200..1000&family=Sansation:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=WDXL+Lubrifont+SC&display=swap" rel="stylesheet">
    

    {* <link href="./templates/main-flexbox/css/fonts.css" rel="stylesheet"> *}
</head>

<body>
<div id="up_anchor"></div>
<div class="top_bar">
    <div class="top_list">
        <div class="first_block">
            <div id="main_logo"><a href="{$index_lang_url}"><img id="logo" src="/images/icons/logo_without_back.png" alt="logo"></a></div>

            <div class="top_list_text"><a href="/about/{$lang}/">{$rsLangs['about_us'][{$lang}]}</a></div>
            <div class="top_list_text"><a href="/index/{$lang}/#projects">{$rsLangs['our_works'][{$lang}]}</a></div>
        </div>
        <div class="second_block top_list_text">
            <div class="lang_buttons_container">
                {if $lang eq 'en'}
                <div class="lang_button">EN</div>
                <div id="hidden_lang" style="display: none;">
                        <a href="{$currentUrl}ru/"><div class="lang_button">RU</div></a>
                        <a href="{$currentUrl}ro/"><div class="lang_button">RO</div></a>
                    {elseif $lang eq 'ru'}
                    <div class="lang_button">RU</div>
                    <div id="hidden_lang" style="display: none;">
                        <a href="{$currentUrl}ro/"><div class="lang_button">RO</div></a>
                        <a href="{$currentUrl}en/"><div class="lang_button">EN</div></a>
                    {else}
                    <div class="lang_button">RO</div>
                    <div id="hidden_lang" style="display: none;">
                        <a href="{$currentUrl}ru/"><div class="lang_button">RU</div></a>
                        <a href="{$currentUrl}en/"><div class="lang_button">EN</div></a>
                    {/if}

                </div>
            </div>
            <script>
                container = document.querySelector(".lang_buttons_container");
                container.addEventListener("click", ()=>{
                    hidden_lang = document.getElementById("hidden_lang");
                    display = hidden_lang.style.display;
                    display === "none" ? hidden_lang.style.display = "block" : hidden_lang.style.display = "none";
                });
                // container.addEventListener("focusout", ()=>{
                //     document.getElementById("hidden_lang").style.display = "none";
                // });
            </script>
            <a href="/address/{$lang_url}">{$rsLangs['address'][{$lang}]}</a>
        </div>
    </div>
</div>



