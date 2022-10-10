{extends file='page.tpl'}
{block name='head_seo_title'}{if !isset($meta_title) || !$meta_title}{else}{$meta_title}{/if}{/block}
{block name='head_seo_description'}{if !isset($meta_description) || !$meta_description}{else}{$meta_description}{/if}{/block}
{block name='head_seo_keywords'}{if !isset($meta_keywords) || !$meta_keywords}{else}{$meta_keywords}{/if}{/block}
{block name='content'}
	{include 'module:pshowblog/views/themes_17/default/list/post-list.tpl'}
{/block}