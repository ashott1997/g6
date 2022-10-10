{extends file='page.tpl'}
{block name='head_seo_title'}{if !$entry['meta_title']}{$entry['title']}{else}{$entry['meta_title']}{/if}{/block}
{block name='head_seo_description'}{if !$entry['meta_description']}{$entry['short_content']}{else}{$entry['meta_description']}{/if}{/block}
{block name='head_seo_keywords'}{if !$entry['meta_keywords']}{else}{$entry['meta_keywords']}{/if}{/block}
{block name='content'}
    {if $entry === false}
        <div class="alert alert-warning">
            {l s='Entry not found' mod='pshowblog'}
        </div>
    {else}
        <meta property="og:title"
              content="{if !$entry['og_title']}{preg_replace('/[\'\"]/m', '', $entry['title'])}{else}{preg_replace('/[\'\"]/m', '', $entry['og_title'])}{/if}"/>
        <meta property="og:type" content="article"/>
        {if $entry['has_img']}
            <meta property="og:image" content="{$entry['has_img']}"/>
        {/if}
        <link rel="canonical" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}"/>
        <meta property="og:url" content="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}"/>
        <meta property="og:description"
              content="{if !$entry['og_description']}{preg_replace('/[\'\"]/m', '', $entry['short_content'])}{else}{preg_replace('/[\'\"]/m', '', $entry['og_description'])}{/if}"/>
        <div itemscope itemtype="https://schema.org/Blog" id="pshowblog_entry" class="pshowblog row"
             {if isset($content_only) && $content_only}style="padding: 30px;"{/if}>
            {hook h="pShowBlogGetProducts" id_entry=$entry['id_pshow_blog_entry']}
            <article itemprop="blogPost" itemscope itemtype="https://schema.org/BlogPosting">
                <div class="col-xs-12" id="pshowblog_entry_{$entry['id_pshow_blog_entry']}">
                    <meta itemprop="mainEntityOfPage"
                          content="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}"/>
                    {if $entry['has_img']}
                        <figure itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
                            <div class="pshowblog_entry_image">
                                <img src="{$entry['has_img']}"
                                     alt="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}"
                                     title="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}"
                                     class="img-responsive">
                                <meta itemprop="caption"
                                      content="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}"/>
                                <meta itemprop="url" content="{$entry['has_img']}"/>
                            </div>
                        </figure>
                    {else}
                        <figure itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
                            <div class="pshowblog_entry_image">
                                <meta itemprop="url" content="{$logo_url}">
                                <meta itemprop="caption"
                                      content="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}"/>
                            </div>
                        </figure>
                    {/if}
                    <h1 class="page-heading-title" itemprop="name headline">{$entry['title']}
                        &nbsp;-&nbsp;{if isset($entry['subtitle']) && $entry['subtitle']}<span
                                class="page-heading-subtitle">{$entry['subtitle']}</span>{/if}</h1>
                    <div {if $review && $review > 0}itemprop="review" itemscope
                         itemtype="http://schema.org/Review"{/if}>
                        {if $review && $review > 0}
                            <meta itemprop="name" content="{$entry['title']}" />{/if}
                        <div class="pshowblog_entry_heading">
                            {if $review && $review > 0}
                                <div class="comment-rate" data-rate="{$comment['review']}" itemprop="reviewRating"
                                     itemscope
                                     itemtype="https://schema.org/Rating">

                                </div>
                            {/if}
                            <small class="entry_date"
                                   {if $review && $review > 0}itemprop="datePublished"{/if}>{$entry['date_add']},&nbsp;
                                <span {if $review && $review > 0}itemprop="author" itemscope
                                      itemtype="https://schema.org/Person"{/if}>
        					{if $entry['author']}
                                <span {if $review && $review > 0}itemprop="name"{/if}>{$entry['author']}</span>




{else}
        						{if $review && $review > 0}
                                <meta itemprop="name" content="{l s='Undefined' mod='pshowblog'}"/>{/if}
                            {/if}
        				</span>
                            </small>

                            {if ($comments_conf)}<small
                                    class="entry_comments_count">{$comments_count} {l s='comments' mod='pshowblog'}</small>{/if}
                        </div>
                        {if $review && $review > 0}
                            <div itemprop="author" itemscope itemtype="http://schema.org/Person">
                                <meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}"/>
                            </div>
                            <div itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
                                <meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}"/>
                            </div>
                        {/if}
                    </div>
                    <div itemprop="articleBody" class="entry_content">{$entry['content'] nofilter}</div>
                    <meta itemprop="datePublished" content="{$entry['date_add']}"/>
                    <meta itemprop="dateModified" content="{$entry['date_upd']}"/>
                    <div itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
                        <meta itemprop="name" content="{Configuration::get('PS_SHOP_NAME')}"/>
                        <span itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
            			<meta itemprop="url" content="{$logo_url}">
            			{if isset($logo_image_width) && $logo_image_width}
                            <meta itemprop="width" content="{$logo_image_width}">{/if}
                            {if isset($logo_image_height) && $logo_image_height}
                                <meta itemprop="height" content="{$logo_image_height}">{/if}
					</span>
                    </div>
                </div>
                <div itemprop="author" itemscope itemtype="http://schema.org/Person">
                    <meta itemprop="name" content="{$entry['author']}"/>
                </div>
                {if $tags && $show_tags_on_entry_page}
                    <div id="tags_list" class="clearfix">
                        <div style="display: inline;"><i class="icon-tags"></i></div>
                        {foreach $tags as $tag}
                            <a href="{PShowBlog::getTagLink($tag['id_pshow_blog_tag'])}" class="btn btn-default"
                               rel="next">
                                {$tag["name"]}
                            </a>
                        {/foreach}
                    </div>
                {/if}
                {if $share_twitter || $share_fb || $share_gp || $share_pinterest}
                    <p class="socialsharing_product list-inline no-print">
                        {if $share_twitter}
                            <button data-type="twitter" type="button"
                                    class="btn btn-default btn-twitter social-sharing">
                                {l s='Tweet' mod='pshowblog'}
                                <!-- <img src="{$link->getMediaLink("`$module_dir`img/twitter.gif")}" alt="Tweet" /> -->
                            </button>
                        {/if}
                        {if $share_fb}
                            <button data-type="facebook" type="button"
                                    class="btn btn-default btn-facebook social-sharing">
                                {l s='Share' mod='pshowblog'}
                                <!-- <img src="{$link->getMediaLink("`$module_dir`img/facebook.gif")}" alt="Facebook Like" /> -->
                            </button>
                        {/if}
                        {if $share_gp}
                            <button data-type="google-plus" type="button"
                                    class="btn btn-default btn-google-plus social-sharing">
                                {l s='Google+' mod='pshowblog'}
                                <!-- <img src="{$link->getMediaLink("`$module_dir`img/google.gif")}" alt="Google Plus" /> -->
                            </button>
                        {/if}
                        {if $share_pinterest}
                            <button data-type="pinterest" type="button"
                                    class="btn btn-default btn-pinterest social-sharing">
                                {l s='Pinterest' mod='pshowblog'}
                                <!-- <img src="{$link->getMediaLink("`$module_dir`img/pinterest.gif")}" alt="Pinterest" /> -->
                            </button>
                        {/if}
                    </p>
                {/if}

                {if ($comments_conf)}
                    <section style="display: inline-block;width: 100%;">
                        <div id="comment_list" class="clearfix">
                            <p class="page-subheading">{l s='Comments' mod='pshowblog'}&nbsp;({count($comments)})</p>

                            {if $comments}
                                {foreach from=$comments item='comment'}
                                    <article itemscope itemtype="https://schema.org/Comment" class="comment clearfix"
                                             data-id="{$comment['id_pshow_blog_comment']}">
                                        <div class="comment_content col-xs-10">
                                            <h4 itemprop="author" itemscope itemtype="https://schema.org/Person">
                                                <span itemprop="name">{$comment['author_name']}</span>
                                            </h4>
                                            <p>
                                                [<span itemprop="dateCreated">{$comment['date_add']|date_format:"H:i d/m/Y"}</span>]
                                            </p>
                                            {if $comment['review']}
                                                <div class="comment-rate" data-rate="{$comment['review']}"
                                                     itemprop="reviewRating" itemscope
                                                     itemtype="https://schema.org/Rating">

                                                </div>
                                            {/if}
                                            <p class="comment_content_text" itemprop="text">{$comment['content']}</p>
                                        </div>

                                        {if $logged || (!$logged && $comments_guests)}
                                            <div class="comment_response_button col-xs-2">
                                                <button class="pull-right btn btn-default button"
                                                        onclick="$(this).parent().next().find('.comment_response_form').removeClass('hidden'); $(this).hide();">
                                                    <span>{l s='Response' mod='pshowblog'}</span>
                                                </button>
                                            </div>
                                            <div class="comment_response col-xs-12">
                                                <form method="POST" action=""
                                                      class="hidden comment_response_form std box col-xs-12 col-md-10 col-lg-8 clearfix">
                                                    <p class="page-subheading">{l s='Add comment' mod='pshowblog'}</p>
                                                    <div class="add-response clearfix">
                                                        {if $logged}
                                                            <p>
                                                                {l s='You are writing as ' mod='pshowblog'}
                                                                <strong>{$author_name}</strong>.
                                                            </p>
                                                            <input required type="hidden" name="author_response_name"
                                                                   id="author_response_name" value="{$author_name}">
                                                            <input required type="hidden" name="author_response_email"
                                                                   id="author_response_email" value="{$author_email}">
                                                        {else}
                                                            <div class="required form-group">
                                                                <label for="author_response_name">{l s='Your name' mod='pshowblog'}
                                                                    : <sup>*</sup></label>
                                                                <input required type="text" class="form-control"
                                                                       name="author_response_name"
                                                                       id="author_response_name"
                                                                       value="{if isset($captcha_error) && isset($smarty.post.author_response_name)}{$smarty.post.author_response_name}{/if}">
                                                            </div>
                                                            <div class="required form-group">
                                                                <label for="author_response_email">{l s='Your e-mail' mod='pshowblog'}
                                                                    : <sup>*</sup></label>
                                                                <input required type="email" class="form-control"
                                                                       name="author_response_email"
                                                                       id="author_response_email"
                                                                       value="{if isset($captcha_error) && isset($smarty.post.author_response_email)}{$smarty.post.author_response_email}{/if}">
                                                            </div>
                                                        {/if}

                                                        <div class="required form-group">
                                                            <label for="content_response">{l s='Comment' mod='pshowblog'}
                                                                : <sup>*</sup></label>
                                                            <textarea required name="content_response"
                                                                      class="form-control"
                                                                      id="content_response">{if isset($captcha_error) && isset($smarty.post.content_response)}{$smarty.post.content_response}{/if}</textarea>
                                                        </div>
                                                    </div>

                                                    <div class="submit clearfix">
                                                        <input type="hidden" name="id_parent_comment"
                                                               value="{$comment['id_pshow_blog_comment']}">

                                                        {if isset($captcha_img) && !Configuration::get('PSHOW_BLOG_API_KEY')}
                                                            <div class="required form-group"
                                                                 style="display: inline-block;">
                                                                <label for="captcha">
                                                                    {l s='Rewrite the text from the image' mod='pshowblog'}
                                                                    : <sup>*</sup>
                                                                    {if isset($captcha_error) && isset($smarty.post.content_response)}
                                                                        <br/>
                                                                        <span style="color: red;">{l s='Wrong image code' mod='pshowblog'}</span>{/if}
                                                                    <br/><img src="{$captcha_img}"
                                                                              alt="{l s='Captcha' mod='pshowblog'}"
                                                                              title="{l s='Captcha' mod='pshowblog'}">
                                                                </label>
                                                                <input required type="text" name="captcha"
                                                                       style="width: auto;" class="form-control"
                                                                       id="captcha">
                                                            </div>
                                                        {elseif isset($captcha_img) && Configuration::get('PSHOW_BLOG_API_KEY')}
                                                            {if isset($captcha_error)}<span
                                                                    style="color: red;">{l s='Wrong image code' mod='pshowblog'}</span>{/if}
                                                            <div class="g-recaptcha"
                                                                 data-sitekey="{Configuration::get('PSHOW_BLOG_API_KEY')}"
                                                                 style="display: inline-block;"></div>
                                                        {/if}

                                                        <button type="submit" name="addComment"
                                                                class="btn btn-default button pull-right">
                                                            <span>{l s='Add comment' mod='pshowblog'}</span>
                                                        </button>

                                                        <button class="btn btn-default button pull-right"
                                                                onclick="$(this).parents('.comment_response_form').addClass('hidden'); $(this).parents('.comment_response').prev().find('button').show();">
                                                            <span>{l s='Cancel' mod='pshowblog'}</span>
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        {/if}
                                    </article>
                                    {if $comment['children']}
                                        <div class="comment_response_list clearfix">
                                            {foreach from=$comment['children'] item='c'}
                                                <div class="comment col-xs-12" data-id="{$c['id_pshow_blog_comment']}">
                                                    <p>
                                                        <strong>{$c['author_name']}</strong>
                                                        [{$c['date_add']|date_format:"H:i d/m/Y"}]
                                                    </p>
                                                    <p>{$c['content']}</p>
                                                </div>
                                            {/foreach}
                                        </div>
                                    {/if}
                                {/foreach}
                            {else}
                                <p class="nocommentsinfo text-center">{l s='There are no comments. Be the first!' mod='pshowblog'}</p>
                            {/if}
                        </div>
                    </section>
                    <div id="comments" class="col-xs-12">
                        {if $logged || (!$logged && $comments_guests)}
                            {if isset($errors_in_comments) && count($errors_in_comments) > 0}
                                <div class="pshowalert alert-danger">
                                    {foreach $errors_in_comments as $error_in_comment}
                                        <p>{$error_in_comment}</p>
                                    {/foreach}
                                </div>
                            {/if}
                            <div id="comment_form" class="clearfix">
                                <form method="POST" action="" class="std box col-xs-12 col-md-10 col-lg-8">
                                    <div class="add-comment clearfix">
                                        <p class="page-subheading">{l s='Add comment' mod='pshowblog'}</p>
                                        {if $logged}
                                            <p>
                                                {l s='You are writing as ' mod='pshowblog'}
                                                <strong>{$author_name}</strong>.
                                            </p>
                                            <input required type="hidden" name="author_name" id="author_name"
                                                   value="{$author_name}">
                                            <input required type="hidden" name="author_email" id="author_email"
                                                   value="{$author_email}">
                                        {else}
                                            <div class="required form-group col-xs-12 col-md-12 nopadding-left">
                                                <label for="author_name">{l s='Your name' mod='pshowblog'}: <sup>*</sup></label>
                                                <input required type="text" class="form-control" name="author_name"
                                                       id="author_name"
                                                       value="{if isset($captcha_error) && isset($smarty.post.author_name)}{$smarty.post.author_name}{/if}">
                                            </div>
                                            <div class="required form-group col-xs-12 col-md-12 nopadding-left">
                                                <label for="author_email">{l s='Your e-mail' mod='pshowblog'}:</label>
                                                <input type="email" class="form-control" name="author_email"
                                                       id="author_email"
                                                       value="{if isset($captcha_error) && isset($smarty.post.author_email)}{$smarty.post.author_email}{/if}">
                                            </div>
                                        {/if}

                                        <div class="required form-group">
                                            <label for="criterions_list">{l s='Comment' mod='pshowblog'}:
                                                <sup>*</sup></label>
                                            <div id="comment_rating"></div>
                                            <input type="hidden" name="criterion_review" value="0">
                                            <textarea required name="content" class="form-control"
                                                      id="content">{if isset($captcha_error) && isset($smarty.post.content)}{$smarty.post.content}{/if}</textarea>
                                        </div>
                                    </div>

                                    <div class="submit clearfix">
                                        {if isset($captcha_img) && !Configuration::get('PSHOW_BLOG_API_KEY')}
                                            <div class="required" style="display: inline-block;">
                                                <label for="captcha">
                                                    {l s='Rewrite the text from the image' mod='pshowblog'}:
                                                    <sup>*</sup>
                                                    {if isset($captcha_error) && isset($smarty.post.content)}
                                                        <br/>
                                                        <span style="color: red;">{l s='Wrong image code' mod='pshowblog'}</span>{/if}
                                                    <br/><img src="{$captcha_img}" alt="{l s='Captcha' mod='pshowblog'}"
                                                              title="{l s='Captcha' mod='pshowblog'}">
                                                </label>
                                                <input required type="text" name="captcha" class="form-control"
                                                       id="captcha" style="display: block; width: auto;">
                                            </div>
                                        {elseif isset($captcha_img) && Configuration::get('PSHOW_BLOG_API_KEY')}
                                            {if isset($captcha_error)}<span
                                                    style="color: red;">{l s='Wrong image code' mod='pshowblog'}</span>{/if}
                                            <div class="g-recaptcha"
                                                 data-sitekey="{Configuration::get('PSHOW_BLOG_API_KEY')}"></div>
                                        {/if}

                                        <button type="submit" name="addComment" class="btn btn-default button">
                                            <span>{l s='Add comment' mod='pshowblog'}</span>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        {/if}
                    </div>
                {/if}
            </article>
        </div>
    {/if}
    {if $entry['display_recommended_entries']}{hook h="pShowBlogGetEntries" display_hook=true id_entry=$entry['id_pshow_blog_entry'] show_recommended=true}{/if}
    {if $comments_category}
        <section id="entries_block_left" class="block pshow_blog_entries_comments">
            <h4 class="title_block">
                PShowBlog {l s='Comments entries' mod='pshowblog'}
            </h4>
            <div class="block_content" style="">
                <ul class="tree dynamized" style="display: block;">

                    {foreach from=$comments_category item='comment'}
                        <li>
                            <article itemscope itemtype="https://schema.org/Comment" class="comment clearfix"
                                     data-id="{$comment['id_pshow_blog_comment']}">
                                <div class="comment_content">
                                    <a class="entry_title_anchor" style="border-bottom: none; padding: 0px;" rel="next"
                                       href="{PShowBlog::getEntryLink($comment['id_entry'])}"
                                       title="{$comment['title']}">
                                        <h5 class="page-heading"
                                            style="margin-bottom: 5px;padding: 0px 0px 5px 0px;">{$comment['title']}</h5>
                                    </a>
                                    {if $comment['review']}
                                        <div class="comment-rate" data-rate="{$comment['review']}"
                                             itemprop="reviewRating" itemscope
                                             itemtype="https://schema.org/Rating">

                                        </div>
                                    {/if}
                                    <h5 itemprop="author" itemscope itemtype="https://schema.org/Person"
                                        style="display: inline-block;">
                                        <strong itemprop="name">{$comment['author_name']}</strong>
                                    </h5>
                                    <p>
                                        [<span itemprop="dateCreated">{$comment['date_add']|date_format:"H:i d/m/Y"}</span>]
                                    </p>
                                    <p itemprop="text">{$comment['content']}</p>
                                </div>
                            </article>
                        </li>
                    {/foreach}
                </ul>
            </div>
        </section>
    {/if}
{/block}
<script>
    document.addEventListener('DOMContentLoaded', function (event) {
        var html = "";
        {if $tags && $show_tags}
        html = $('#tags_list').html();
        if (html && typeof html !== 'undefined') {
            $('#left_column').prepend('<div id="tags_list" class="clearfix">' + html + '</div>');
        }
        {/if}
        {if $comments_category}
        html = $('.pshow_blog_entries_comments').html();
        if (html && typeof html !== 'undefined') {
            $('.pshow_blog_entries_comments').remove();
            $('#left_column').prepend('<div id="entries_block_left" class="block pshow_blog_entries_comments">' + html + '</div>');
        }
        {/if}
    });
</script>
