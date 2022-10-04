{**
 * 2007-2020 PrestaShop SA and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div id="search_widget" class="search-widgets" data-search-controller-url="{$search_controller_url}">
  <form method="get" action="{$search_controller_url}" class="d-flex justify-content-center">
    <input type="hidden" name="controller" value="search">
    <div class="input-search d-flex align-items-center">
      <input type="text" class="text-end" name="s" value="{$search_string}" placeholder="{l s='Wyszukaj' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
      <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M8.90553 16.8111C13.2716 16.8111 16.8111 13.2716 16.8111 8.90553C16.8111 4.53943 13.2716 1 8.90553 1C4.53943 1 1 4.53943 1 8.90553C1 13.2716 4.53943 16.8111 8.90553 16.8111Z" stroke="#5D7E9D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
        <path d="M18.7869 18.7865L14.4883 14.4879" stroke="#5D7E9D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    </div>

  </form>
</div>
