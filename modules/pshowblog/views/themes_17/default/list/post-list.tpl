
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
    		<h1 class="page-heading" itemprop="name">Aktualności</h1>
    		
    		
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
                <div class="post-list-title" itemprop="name" class="page-heading"><a href="{$link->getModuleLink('pshowblog', 'blog')}">{$title}</a></div>
            {/if}
		{/if}
			{foreach from=$blog item='entry'}
				{if $entries_per_row <= 1}
					<article itemprop="blogPost" itemscope itemtype="https://schema.org/BlogPosting">
	                <div class="pshowblog_entry row" id="pshowblog_entry_{$entry['id_pshow_blog_entry']}">
	                <div class="col-xs-12 col-sm-4 hidden-sm hidden-md hidden-lg">
	                            	{if ($entry['has_img'])}
							<figure itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
								<div class="pshowblog_entry_image col-xs-12 col-sm-12">
									<a class="img_anchor" rel="next" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" title="{$entry['title']}">
										<img src="{$entry['has_img']}" alt="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" title="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" class="img-responsive">
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
	                            <div class="col-xs-12 col-sm-4">
	                            	<a class="entry_title_anchor" rel="next" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" title="{$entry['title']}">
	                                    <h2 class="page-heading-title" itemprop="name headline">{$entry['title']}{if isset($entry['subtitle']) && $entry['subtitle']}&nbsp;-&nbsp;{$entry['subtitle']}{/if}</h2>
	                                </a>
	                                <div class="row">
	                                {if $entry['review'] && $entry['review'] > 0 && $list_display_review}
	                                <div class="col-xs-6 pshowblog_entry_heading-item">
											<div itemprop="review" itemscope itemtype="http://schema.org/Review">
												<meta itemprop="name" content="{$entry['title']}" />
												<div class="star_content clearfix" itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating">
													{section name="i" start=0 loop=5 step=1}
														{if $entry['review'] le $smarty.section.i.index}
															<div class="star"></div>
														{else}
															<div class="star star_on"></div>
														{/if}
													{/section}
							            			<meta itemprop="ratingValue" content="{$entry['review']|escape:'html':'UTF-8'|intval}" />
												</div>
											<meta itemprop="datePublished" content="{$entry['date_add']}"/>
											<div itemprop="author" itemscope itemtype="http://schema.org/Person"><meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}" /></div>
											<div itemprop="publisher" itemscope itemtype="http://schema.org/Organization"><meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}" /></div>
										</div>
	                                </div>
	                                {/if}
	                                {if $entry['date_add'] && $list_display_public_date}
	                                	<div class="col-xs-6 pshowblog_entry_heading-item">
											<small class="entry_date"><i class="icon-calendar"></i>&nbsp;{$entry['date_add']}</small>
	                                	</div>
	                                {/if}
									{if $entry['comments_conf'] && $list_display_comments_count}
										<div class="col-xs-6 pshowblog_entry_heading-item">
											<small class="entry_comments_count">
												<a href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}#comments" rel="next" title="{l s='Comments' mod='pshowblog'}">
													<i class="icon-comments"></i>&nbsp;({$entry['comments']} {l s='comments' mod='pshowblog'})
												</a>
											</small>
										</div>
									{/if}
									{if $entry['author'] && $list_display_author}
										<div class="col-xs-6 pshowblog_entry_heading-item">
											<span itemprop="author" itemscope itemtype="https://schema.org/Person">
												<small><i class="icon-user"></i>&nbsp;<span itemprop="name">{$entry['author']}</span></small>
											</span>
										</div>
									{else}
										<span itemprop="author" itemscope itemtype="https://schema.org/Person">
											<meta itemprop="name" content="{l s='Undefined' mod='pshowblog'}"/>
										</span>
									{/if}
									</div>
	                            </div>
	                            <div class="col-xs-12 col-sm-4">
	                                <a href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" rel="next" title="{l s='read more' mod='pshowblog'}">
	                                    <div class="entry_content-description" itemprop="description">{$entry['short_content'] nofilter}</div>
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
	                            <div class="col-xs-12 col-sm-4 hidden-xs">
	                            	{if ($entry['has_img'])}
							<figure itemprop="image" itemscope itemtype="https://schema.org/ImageObject">
								<div class="pshowblog_entry_image col-xs-12 col-sm-12">
									<a class="img_anchor" rel="next" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" title="{$entry['title']}">
										<img src="{$entry['has_img']}" alt="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" title="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" class="img-responsive">
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
	                    </div>
	                    </article>
						{else}
							{if ($entry@index == 0 || $entry@index % $entries_per_row == 0) && !$isMobile_Blog}<div class="row row-eq-height">{assign var="temp" value=0}{/if}
								<div class="col-xs-12 col-sm-6 col-md-{(12/$entries_per_row)} article_grid" data-fun-1="{$entry@index % $entries_per_row}" data-fun-2="{$entry@index % ($entries_per_row - 1)}" data-nr="{$entry@index}">
									<article itemprop="blogPost" itemscope itemtype="https://schema.org/BlogPosting">
									<div class="pshowblog_entry" id="pshowblog_entry_{$entry['id_pshow_blog_entry']}">
						<meta itemprop="mainEntityOfPage" content="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}"/>
						{if ($entry['has_img'])}
							<figure itemprop="image" class="pshowblog_entry_image_content" itemscope itemtype="https://schema.org/ImageObject">
								<div class="pshowblog_entry_image">
									<a class="img_anchor" rel="next" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" title="{$entry['title']}">
										<img src="{$entry['has_img']}" alt="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" title="{if $entry['image_title']}{$entry['image_title']}{else}{$entry['title']}{/if}" class="img-responsive">
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
								{if $list_display_review || $list_display_public_date || $list_display_comments_count || $list_display_author}
	                            <div class="pshowblog_entry_heading col-xs-10">
	                                <div class="row">
	                                {if $entry['review'] && $entry['review'] > 0 && $list_display_review}
	                                <div class="col-xs-6 pshowblog_entry_heading-item">
											<div itemprop="review" itemscope itemtype="http://schema.org/Review">
												<meta itemprop="name" content="{$entry['title']}" />
												<div class="star_content clearfix" itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating">
													{section name="i" start=0 loop=5 step=1}
														{if $entry['review'] le $smarty.section.i.index}
															<div class="star"></div>
														{else}
															<div class="star star_on"></div>
														{/if}
													{/section}
							            			<meta itemprop="ratingValue" content="{$entry['review']|escape:'html':'UTF-8'|intval}" />
												</div>
											<meta itemprop="datePublished" content="{$entry['date_add']}"/>
											<div itemprop="author" itemscope itemtype="http://schema.org/Person"><meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}" /></div>
											<div itemprop="publisher" itemscope itemtype="http://schema.org/Organization"><meta itemprop="name" content="{l s='Customer rating' mod='pshowblog'}" /></div>
										</div>
	                                </div>
	                                {/if}
	                                {if $entry['date_add'] && $list_display_public_date}
	                                	<div class="col-xs-6 pshowblog_entry_heading-item">
											<small class="entry_date"><i class="icon-calendar"></i>&nbsp;{$entry['date_add']}</small>
	                                	</div>
	                                {/if}
									{if $entry['comments_conf'] && $list_display_comments_count}
										<div class="col-xs-6 pshowblog_entry_heading-item">
											<small class="entry_comments_count">
												<a href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}#comments" rel="next" title="{l s='Comments' mod='pshowblog'}">
													<i class="icon-comments"></i>&nbsp;({$entry['comments']} {l s='comments' mod='pshowblog'})
												</a>
											</small>
										</div>
									{/if}
									{if $entry['author'] && $list_display_author}
										<div class="col-xs-6 pshowblog_entry_heading-item">
											<span itemprop="author" itemscope itemtype="https://schema.org/Person">
												<i class="icon-user"></i>&nbsp;<span itemprop="name">{$entry['author']}</span>
											</span>
										</div>
									{else}
										<span itemprop="author" itemscope itemtype="https://schema.org/Person">
											<meta itemprop="name" content="{l s='Undefined' mod='pshowblog'}"/>
										</span>
									{/if}
									</div>
	                            </div>
								{/if}
	                            <div class="entry_content col-xs-10">
	                            	<a class="entry_title_anchor" rel="next" href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" title="{$entry['title']}">
	                                    <h2 class="page-heading-title" itemprop="name headline">{$entry['title']}{if isset($entry['subtitle']) && $entry['subtitle']}&nbsp;-&nbsp;{$entry['subtitle']}{/if}</h2>
	                                </a>
	                                <a href="{PShowBlog::getEntryLink($entry['id_pshow_blog_entry'])}" rel="next" title="{l s='read more' mod='pshowblog'}">
	                                    <div class="entry_content-description" itemprop="description">{$entry['short_content'] nofilter}</div>
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
							{if !$isMobile_Blog}
								{assign var="temp" value=($temp+1)}
								{if $temp % $entries_per_row == 0 || (count($blog)-1) == $entry@index}</div>{/if}
							{/if}
						{/if}
			{/foreach}
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
		<div style="display: inline;"><i class="icon-tags"></i></div>
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