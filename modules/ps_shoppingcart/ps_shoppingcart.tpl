{**
 * 2007-2020 PrestaShop and Contributors
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div id="blockcart-wrapper">
  <div class="blockcart cart-preview" data-refresh-url="{$refresh_url}">
    <div class="header">
      <a rel="nofollow" href="{$cart_url}" class="position-relative cart-icon-count">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
          <path d="M18.76 7.08108C18.64 6.95946 18.4 6.83784 18.16 6.83784H15.16L11.68 1L10.72 1.72973L13.72 6.83784H6.28L9.28 1.72973L8.32 1L4.84 6.83784H1.84C1.6 6.83784 1.36 6.95946 1.24 7.08108C1.12 7.2027 1 7.44595 1 7.68919V8.17568C1 11.7027 1.84 15.2297 3.4 18.5135C3.52 18.6351 3.52 18.7568 3.76 18.8784C3.88 19 4 19 4.12 19H15.88C16.24 19 16.48 18.8784 16.6 18.5135C18.16 15.3514 19 11.8243 19 8.17568V7.68919C19 7.44595 18.88 7.2027 18.76 7.08108ZM15.64 17.7838H4.36C2.92 14.8649 2.2 11.5811 2.2 8.17568V8.05405H17.8V8.17568C17.8 11.5811 17.08 14.8649 15.64 17.7838Z" fill="#828380" stroke="white" stroke-width="0.2"/>
        </svg>
        <span class="count-cart">
{*          {$cart.products_count}*}
        </span>
      </a>
    </div>

  </div>
</div>
