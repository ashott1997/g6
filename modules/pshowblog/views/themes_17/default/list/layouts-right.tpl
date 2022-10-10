{if !isset($isHook) || !$isHook}
<meta property="og:title" content="{if isset($category) && $category}{if !$category->og_title}{preg_replace('/[\'\"]/m', '', $category->name)}{else}{preg_replace('/[\'\"]/m', '', $category->og_title)}{/if}{else}{preg_replace('/[\'\"]/m', '', $meta_title)}{/if}" />
<meta property="og:type" content="article" />
{if isset($has_img) && $has_img}
<meta property="og:image" content="{$has_img}" />
{/if}
<meta property="og:url" content="{if isset($category) && $category}{PShowBlog::getCategoryLink($id_category)}{else}{$link->getModuleLink('pshowblog', 'blog')}{/if}" />
<meta property="og:description" content="{if isset($category) && $category}{if !$category->og_description}{preg_replace('/[\'\"]/m', '', $category->description)}{else}{preg_replace('/[\'\"]/m', '', $category->og_description)}{/if}{else}{preg_replace('/[\'\"]/m', '', $meta_title)}{/if}" />
{/if}
<div itemscope itemtype="https://schema.org/Blog" class="pshowblog row">
    <div id="pshowblog_entries" class="col-xs-12">
	{if $blog}
    	{if !isset($isHook) || !$isHook}
    		<h1 class="page-heading" itemprop="name">{if isset($category_name) && $category_name}{$category_name}{else}{l s='All entries' mod='pshowblog'}{/if}</h1>
    		<div class="row row-eq-height">
        		{if isset($has_img) && $has_img}
        			<div class="pshowblog_entry_image col-xs-12 col-sm-3">
        				<img src="{$has_img}" alt="{if $category_image_title}{$category_image_title}{else}{$category_name}{/if}" title="{if $category_image_title}{$category_image_title}{else}{$category_name}{/if}" class="img-responsive">
        			</div>
                {/if}
        		{if isset($description)}<div class="entry_content col-xs-12 col-sm-9">{$description nofilter}</div>{/if}
    		</div>
		{else}
    		{if $title}
                <div class="post-list-title" itemprop="name"><a href="{$link->getModuleLink('pshowblog', 'blog')}">{$title}</a></div>
            {/if}
		{/if}
    	<div class="row row-eq-height layout_grid">
        	{foreach from=$blog item='entry'}
        		{if $entry@index != (count($blog)-1)}
    				{if $entry@index == 0}<div class="col-xs-12 col-sm-12 col-md-6">{/if}
    					<article itemprop="blogPost" itemscope itemtype="https://schema.org/BlogPosting" style="{if $entry@index == 0}padding-top: 15px;{/if}{if $entry@index == 3}margin-bottom: 15px;{/if}padding-bottom: 30px;border-bottom: 1px solid #d6d4d4;">
                            <div class="pshowblog_entry row" id="pshowblog_entry_{$entry['id_pshow_blog_entry']}">
            	                <div class="col-xs-12 col-sm-3">
                                	{if ($entry['has_img'])}
            							<figure itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
            								<div class="pshowblog_entry_image col-xs-12 col-sm-12" style="min-height: unset;">
            									<a class="img_anchor" rel="next" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" title="{$entry['title']}">
            										<img src="{$entry['has_img']}" alt="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" title="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" class="img-responsive" style="height: 100px;">
            									</a>
            									<meta itemprop="url" content="{$entry['has_img']}">
            									<meta itemprop="caption" content="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}"/>
            								</div>
            							</figure>
                                    {else}
                                    	<figure itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
            								<div class="pshowblog_entry_image">
            									<meta itemprop="url" content="{$logo_url}">
            									<meta itemprop="caption" content="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}"/>
            								</div>
            							</figure>
                                    {/if}
                                </div>
            					<meta itemprop="mainEntityOfPage" content="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}"/>
                                <div class="col-xs-12 col-sm-9">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="row row-heading-entries-list row-eq-height" style="border: none;">
                                            	<div class="col-xs-12 row-heading-entries-list-info" style="text-align: left;">
                                                    {if $entry['date_add'] && $list_display_public_date}
                        								<small class="entry_date"><i class="fa fa-calendar"></i>&nbsp;{$entry['date_add']}</small>
                                                    {/if}
                            						{if $entry['author'] && $list_display_author}
                            							<span itemprop="author" itemscope itemtype="https://schema.org/Person">
                        									<small><i class="fa fa-user"></i>&nbsp;<span itemprop="name">{$entry['author']}</span></small>
                        								</span>
                            						{else}
                            							<span itemprop="author" itemscope itemtype="https://schema.org/Person">
                            								<meta itemprop="name" content="{l s='Undefined' mod='pshowblog'}"/>
                            							</span>
                            						{/if}
                            						{if $entry['comments_conf'] && $list_display_comments_count}
                            							<small class="entry_comments_count">
                        									<a href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}#comments" rel="next" title="{l s='Comments' mod='pshowblog'}">
                        										<i class="fa fa-comments"></i>&nbsp;{$entry['comments']}
                        									</a>
                        								</small>
                            						{/if}
                                                    {if $entry['review'] && $entry['review'] > 0 && $list_display_review}
                            							<div class="star_content_entries_list" itemprop="review" itemscope itemtype="http://schema.org/Review">
                                							<meta itemprop="name" content="{$entry['title']}" />
                                		            			<meta itemprop="ratingValue" content="{$entry['review']|escape:'html':'UTF-8'|intval}" />
                                							</div>
                                    						<meta itemprop="datePublished" content="{$entry['date_add']}"/>
                                    						<div itemprop="author" itemscope itemtype="http://schema.org/Person"><meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}" /></div>
                                    						<div itemprop="publisher" itemscope itemtype="http://schema.org/Organization"><meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}" /></div>
                            							</div>
                                                    {/if}
                                           		</div>
                    						</div>
                                        </div>
                                        <div class="col-xs-12">
                                            <a href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" rel="next" title="{l s='read more' mod='pshowblog'}">
                                                <div class="entry_content-title" itemprop="description">{$entry['title']}</div>
                    						</a>
                                            <meta itemprop="datePublished" content="{$entry['date_add']}"/>
                    						<meta itemprop="dateModified" content="{$entry['date_upd']}"/>
                    						<div itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
                    							<meta itemprop="name" content="{Configuration::get('PS_SHOP_NAME')}" />
                    							<span itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
                        							<meta itemprop="url" content="{$logo_url}">
                        							{if isset($logo_image_width) && $logo_image_width}<meta itemprop="width" content="{$logo_image_width}">{/if}
                        							{if isset($logo_image_height) && $logo_image_height}<meta itemprop="height" content="{$logo_image_height}">{/if}
                    							</span>
                    						</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
    				{if $entry@index == (count($blog)-2)}</div>{/if}
				{else}
    				<div class="col-xs-12 col-sm-12 col-md-6">
    					<article itemprop="blogPost" itemscope itemtype="https://schema.org/BlogPosting">
    						<div class="pshowblog_entry row" id="pshowblog_entry_{$entry['id_pshow_blog_entry']}" style="-webkit-box-shadow: 1px 1px 2px 1px rgba(0,0,0,0.2);-moz-box-shadow: 1px 1px 2px 1px rgba(0,0,0,0.2);box-shadow: 1px 1px 2px 1px rgba(0,0,0,0.2);border-radius: 5px;max-width: 100%;">
        						<meta itemprop="mainEntityOfPage" content="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}"/>
        						{if ($entry['has_img'])}
        							<figure itemprop="image" class="pshowblog_entry_image_content" itemscope itemtype="https://schema.org/ImageObject">
        								<div class="pshowblog_entry_image col-xs-12">
        									<a class="img_anchor" rel="next" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" title="{$entry['title']}">
        										<img style="height: 350px; padding: 15px 15px 10px;" src="{$entry['has_img']}" alt="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" title="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" class="img-responsive">
        									</a>
        									<meta itemprop="url" content="{$entry['has_img']}">
        									<meta itemprop="caption" content="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}"/>
        								</div>
        							</figure>
                                {else}
                                	<figure itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
        								<div class="pshowblog_entry_image">
        									<meta itemprop="url" content="{$logo_url}">
        									<meta itemprop="caption" content="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}"/>
        								</div>
        							</figure>
                                {/if}
                                <div class="entry_content col-xs-12">
                                	<a class="entry_title_anchor" rel="next" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" title="{$entry['title']}">
                                        <h2 class="page-heading-title" style="margin-bottom: 15px;" itemprop="name headline">{$entry['title']}{if isset($entry['subtitle']) && $entry['subtitle']}&nbsp;-&nbsp;{$entry['subtitle']}{/if}</h2>
                                    </a>
                                    {if $list_display_review || $list_display_public_date || $list_display_comments_count || $list_display_author}
                                        {if $entry['review'] && $entry['review'] > 0 && $list_display_review}
        	                                <div class="pshowblog_entry_heading-item-rating">
        										<div itemprop="review" itemscope itemtype="http://schema.org/Review">
        											<meta itemprop="name" content="{$entry['title']}" />
        											<div class="star_content clearfix" itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating">
        						            			<meta itemprop="ratingValue" content="{$entry['review']|escape:'html':'UTF-8'|intval}" />
        											</div>
        											<meta itemprop="datePublished" content="{$entry['date_add']}"/>
        											<div itemprop="author" itemscope itemtype="http://schema.org/Person"><meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}" /></div>
        											<div itemprop="publisher" itemscope itemtype="http://schema.org/Organization"><meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}" /></div>
        										</div>
        	                                </div>
                                        {/if}
        	                            <div class="pshowblog_entry_heading" style="margin-bottom: -5px;">
        	                                {if $entry['date_add'] && $list_display_public_date}
        	                                	<div class="pshowblog_entry_heading-item" style="padding-bottom: 0px;">
        											<small class="entry_date"><i class="fa fa-calendar"></i>&nbsp;{$entry['date_add']}</small>
        	                                	</div>
        	                                {/if}
        									{if $entry['author'] && $list_display_author}
        										<div class="pshowblog_entry_heading-item" style="padding-bottom: 0px;">
        											<span itemprop="author" itemscope itemtype="https://schema.org/Person">
        												<i class="fa fa-user"></i>&nbsp;<span itemprop="name">{$entry['author']}</span>
        											</span>
        										</div>
        									{else}
        										<span itemprop="author" itemscope itemtype="https://schema.org/Person">
        											<meta itemprop="name" content="{l s='Undefined' mod='pshowblog'}"/>
        										</span>
        									{/if}
        									{if $entry['comments_conf'] && $list_display_comments_count}
        										<div class="pshowblog_entry_heading-item" style="padding-bottom: 0px;">
        											<small class="entry_comments_count">
        												<a href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}#comments" rel="next" title="{l s='Comments' mod='pshowblog'}">
        													<i class="fa fa-comments"></i>&nbsp;({$entry['comments']})
        												</a>
        											</small>
        										</div>
        									{/if}
        	                            </div>
        							{/if}
                                    <a href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" rel="next" title="{l s='read more' mod='pshowblog'}">
                                        <div class="entry_content-description" itemprop="description">{$entry['short_content'] nofilter}</div>
        							</a>
                                    <a class="entry_content-more" style="color: #5f8827;background: none;padding: 0px 0px 15px;text-transform: uppercase;font-size: 9pt;" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" rel="next" title="{l s='read more' mod='pshowblog'}">
                                        {l s='read more' mod='pshowblog'}
            						</a>
                                    <meta itemprop="datePublished" content="{$entry['date_add']}"/>
        							<meta itemprop="dateModified" content="{$entry['date_upd']}"/>
        							<div itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
        								<meta itemprop="name" content="{Configuration::get('PS_SHOP_NAME')}" />
        								<span itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
                							<meta itemprop="url" content="{$logo_url}">
                							{if isset($logo_image_width) && $logo_image_width}<meta itemprop="width" content="{$logo_image_width}">{/if}
                							{if isset($logo_image_height) && $logo_image_height}<meta itemprop="height" content="{$logo_image_height}">{/if}
        								</span>
        							</div>
                                </div>
                        	</div>
                    	</article>
    				</div>
				{/if}
			{/foreach}
		</div>
	{else}
		<p class="alert alert-info">{l s='No entries yet.' mod='pshowblog'}</p>
	{/if}

	</div>
	{if !isset($isHook) || !$isHook}
	{if $entriesCount > $entriesPerPage}
		<nav class="pshowblog_pagination col-xs-12">
			<ul class="pagination pull-right">

				<li {if $actualPage == 1}class="disabled"{/if}>
					<a rel="prev" {if $actualPage > 1}href="{PShowBlog::getPaginationLink($id_category, 1, true)}"{/if} 
							aria-label="{l s='First page' mod='pshowblog'}" 
							title="{l s='First page' mod='pshowblog'}">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				
				<li {if $actualPage == 1}class="disabled"{/if}>
					<a rel="prev" {if $actualPage > 1}href="{PShowBlog::getPaginationLink($id_category, $actualPage-1, true)}"{/if} 
							aria-label="{l s='Previous page' mod='pshowblog'}" 
							title="{l s='Previous page' mod='pshowblog'}"
							rel="prev">
						<span aria-hidden="true">&lsaquo;</span>
					</a>
				</li>

				{assign var='startFrom' value=(($actualPage > 2) ? ($actualPage-2) : 1)}
				{assign var='stopAt' value=(($actualPage+2 < $pagesCount) ? ($actualPage+2) : $pagesCount)}

				{if $startFrom > 1}
					<li class="disabled">
						<span>...</span>
					</li>
				{/if}

				{for $i=$startFrom to $stopAt}
					{if $i == $actualPage}
						<li class="active"><span>{$i}</span></li>
							{else}
						<li>
							<a rel="next" href="{PShowBlog::getPaginationLink($id_category, $i, true)}" title="{l s='Page:' mod='pshowblog'} {$i}">{$i}</a>
						</li>
						{/if}
					{/for}

				{if $stopAt < $pagesCount}
					<li class="disabled">
						<span>...</span>
					</li>
				{/if}
				
				<li {if $actualPage == $pagesCount}class="disabled"{/if}>
					<a rel="next" {if $actualPage < $pagesCount}href="{PShowBlog::getPaginationLink($id_category, $actualPage+1, true)}"{/if} 
							aria-label="{l s='Next page' mod='pshowblog'}"
							title="{l s='Next page' mod='pshowblog'}"
							rel="next">
						<span aria-hidden="true">&rsaquo;</span>
					</a>
				</li>

				<li {if $actualPage == $pagesCount}class="disabled"{/if}>
					<a rel="next" {if $actualPage < $pagesCount}href="{PShowBlog::getPaginationLink($id_category, $pagesCount, true)}"{/if} 
							aria-label="{l s='Last page' mod='pshowblog'}"
							title="{l s='Last page' mod='pshowblog'}">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>

			</ul>
		</nav>
	{/if}
	{/if}
</div>
{if !isset($isHook) || !$isHook}
{if $comments_category}
	<section id="entries_block_left" class="block pshow_blog_entries_comments">
		<h4 class="title_block">
			PShowBlog {l s='Comments entries' mod='pshowblog'}
		</h4>
		<div class="block_content" style="">
			<ul class="tree dynamized" style="display: block;">

				{foreach from=$comments_category item='comment'}

					<li>
						<article itemscope itemtype="https://schema.org/Comment" class="comment clearfix" data-id="{$comment['id_pshow_blog_comment']}">
							<div class="comment_content">
								<a class="entry_title_anchor" style="border-bottom: none; padding: 0px;" rel="next" href="{PShowBlog::getEntryLink($comment['id_entry'])}" title="{$comment['title']}">
									<h5 class="page-heading" style="margin-bottom: 5px;padding: 0px 0px 5px 0px;">{$comment['title']}</h5>
								</a>
								<div itemprop="review" itemscope itemtype="http://schema.org/Review">
									<meta itemprop="name" content="{$entry['title']}" />
								{if $comment['review']}
									<div class="star_content clearfix" style="display: block;">
										{section name="i" start=0 loop=5 step=1}
											{if $comment['review'] le $smarty.section.i.index}
												<div class="star"></div>
											{else}
												<div class="star star_on"></div>
											{/if}
										{/section}
										</div>
									{/if}
								<h5 itemprop="author" itemscope itemtype="https://schema.org/Person" style="display: inline-block;">
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
{if $tags}
	<div id="tags_list" class="clearfix">			
		<div style="display: inline;"><i class="fa fa-tags"></i></div>
		{foreach $tags as $tag}
			<a href="{PShowBlog::getSearchLink($tag['id_pshow_blog_tag'])}" class="btn btn-default" rel="next">
				{$tag["name"]}
			</a>
		{/foreach}
	</div>
{/if}
<script>
	document.addEventListener('DOMContentLoaded', function (event) {
		$(document).on('change', 'select#pshowblog_sort', function() 
		{
			var link = $(this).parent().attr('action');
			link += '?sort=' + $(this).val();
			
			document.location.href = link;
		});
		var html = "";
		var search = "";
		{if $tags}
			html = $('#tags_list').html();
			if (html && typeof html !== 'undefined')
	        {
				$('#tags_list').remove();
				$('#left_column').prepend('<div id="tags_list" class="clearfix">'+html+'</div>');
	        }
		{/if}
		{if $comments_category}
			html = $('.pshow_blog_entries_comments').html();
			search = $('#search-blog').html();
			if (html && typeof html !== 'undefined')
            {
				$('.pshow_blog_entries_comments').remove();
				$('#left_column').prepend('<div id="entries_block_left" class="block pshow_blog_entries_comments">'+html+'</div>');
            }
		{/if}
	});
</script>
{/if}