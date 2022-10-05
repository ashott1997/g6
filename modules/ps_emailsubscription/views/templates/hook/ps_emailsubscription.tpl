{*
 * 2007-2020 PrestaShop.
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
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="email_subscription block_newsletter d-flex flex-column" id="blockEmailSubscription_{$hookName}">
  <h4>Zapisz się do <br> newslettera</h4>
  <span class="news_small text-uppercase">Nowości i newsy</span>
  <form action="{$urls.current_url}#blockEmailSubscription_{$hookName}" method="post">
    <div class="input_custom_mail d-flex align-items-center">
      <svg width="15" height="10" viewBox="0 0 15 10" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M0.478335 1.07167L6.72833 4.42917C6.93833 4.54167 7.21 4.595 7.48333 4.595C7.75667 4.595 8.02833 4.54167 8.23833 4.42917L14.4883 1.07167C14.8958 0.8525 15.2808 0 14.5333 0H0.434168C-0.313332 0 0.071668 0.8525 0.478335 1.07167ZM14.6775 2.9075L8.23833 6.26333C7.955 6.41167 7.75667 6.42917 7.48333 6.42917C7.21 6.42917 7.01167 6.41167 6.72833 6.26333C6.445 6.115 0.784168 3.1475 0.321668 2.90667C-0.00333195 2.73667 1.34672e-06 2.93583 1.34672e-06 3.08917V9.16667C1.34672e-06 9.51667 0.471668 10 0.833335 10H14.1667C14.5283 10 15 9.51667 15 9.16667V3.09C15 2.93667 15.0033 2.7375 14.6775 2.9075Z" fill="#828380"/>
      </svg>

      <input type="email" name="email" value="{$value}" placeholder="{l s='Your e-mail' d='Modules.Emailsubscription.Shop'}" required />
    </div>
{*    {if $conditions}*}
{*      <p>{$conditions}</p>*}
{*    {/if}*}
    {hook h='displayNewsletterRegistration'}
    <input type="hidden" value="{$hookName}" name="blockHookName" />
    <input type="submit" value="Wyślij" name="submitNewsletter" class="sub_news"/>
    {hook h='displayGDPRConsent' id_module=$id_module}
    <input type="hidden" name="action" value="0" />
  </form>
  {if $msg}
    <p class="notification {if $nw_error}notification-error{else}notification-success{/if}">{$msg}</p>
  {/if}
</div>
