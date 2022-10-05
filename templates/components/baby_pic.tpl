<section class="baby-pic d-flex justify-content-center {$reverse}-sec">
    <div class="wrapper d-flex flex-column {if $reverse == 'true'}flex-lg-row-reverse{else} flex-lg-row{/if} align-items-center justify-content-center ">
        <div class="content d-flex {if $reverse == 'true'}justify-content-start{else}justify-content-start{/if} align-items-center {if $reverse == 'true'}flex-row-reverse{else}flex-row{/if}">
                <style>
                    .{$reverse}-sec .content{
                        background: {$background};
                        {if $reverse == 'true'}
                            padding-left:190px;
                        {else}
                            padding-right:190px;
                        {/if}
                    }

                    @media(max-width:470px){
                        .{$reverse}-sec .content{
                            background: {$background};
                        {if $reverse == 'true'}
                            padding-left:100px;
                        {else}
                            padding-right:100px;
                        {/if}
                        }
                    }
                </style>
            <div class="left-img" >
                {if $reverse == 'true'}
                    {include file="themes/G6_ZABAWKI/templates/components/svg/baby_left_reverse.tpl"}
                {else}
                    {include file="themes/G6_ZABAWKI/templates/components/svg/baby_left.tpl"}
                {/if}
            </div>
            <div class="inner d-flex flex-column">
                <h3 style="color: {$text_color};">{$name}</h3>
                <p style="color: {$text_color};">{$text}</p>
                <h4 style="color: {$text_color};">{$cat_name}</h4>
                <a href="{$cat_link}">
                    {include file="themes/G6_ZABAWKI/templates/components/svg/check_prod.tpl"}
                </a>
            </div>
        </div>
        <div class="img-wrapper">
            <img src="{$pic}" alt="">
        </div>
    </div>
</section>