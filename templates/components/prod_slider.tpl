
<div class="swiper {$class} prod-slider" data-slide="{$class}">
    <div class="swiper-wrapper">
        {foreach from=$all_prods_custom item=item}
            {if $item.cat_id == $cat_id}
                <div class="swiper-slide">
                    <a href="{$item.link}" class="d-flex flex-column align-items-center text-decoration-none">
                        <div class="img-wrapper"><img src="{$item.thumbnail}" alt="{$item.name}"></div>
                        <h2 class="text-center">{$item.name}</h2>
                        <span class="price">{$item.bruto} zł</span>
                    </a>
                </div>
            {/if}
        {/foreach}
    </div>
</div>