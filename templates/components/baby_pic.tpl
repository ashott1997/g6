<section class="baby-pic d-flex justify-content-center">
    <div class="wrapper d-flex flex-column flex-lg-row align-items-center justify-content-center">
        <div class="content d-flex justify-content-start align-items-center" style="background: {$background};">
            <div class="left-img" >
                {include file="themes/G6_ZABAWKI/templates/components/svg/baby_left.tpl"}
            </div>
            <div class="inner d-flex flex-column">
                <h3 style="color: {$text_color};">{$name}</h3>
                <p style="color: {$text_color};">{$text}</p>
                <h4 style="color: {$text_color};">{$cat_name}</h4>
                <a href="{$cat_link}">
                    {include file="themes/G6_ZABAWKI/assets/svg/check_prod.svg"}
                </a>
            </div>
        </div>
        <div class="img-wrapper">
            <img src="{$pic}" alt="">
        </div>
    </div>
</section>