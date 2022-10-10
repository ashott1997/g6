{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
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
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {$cms.meta_title}
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-cms page-cms-{$cms.id}">

    {block name='cms_content'}
      {$cms.content nofilter}
      {if $cms.id ==9}
        <form class="b2b-form" link-to="{$urls.base_url}b2b.php">
          <div class="form-group">
            <label for="name">Imię i nazwisko</label>
            <input type="text" autocomplete="name" name="name" id="name" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" autocomplete="email" name="email" id="email" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="phone">Numer telefonu</label>
            <input type="tel" name="phone" autocomplete="phone" id="phone" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="company">Nazwa firmy</label>
            <input type="text" name="company" autocomplete="company" id="company" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="nip">NIP</label>
            <input type="text" name="nip" autocomplete="nip" id="nip" class="form-control" required>
          </div>
          <span class="btn btn-success mt-2">Wyślij</span>
          <div class="alert alert-success mt-2 d-none">Dziękujemy za wiadomość. </div>
        </form>
      {/if}
    {/block}

    {block name='hook_cms_dispute_information'}
      {hook h='displayCMSDisputeInformation'}
    {/block}

    {block name='hook_cms_print_button'}
      {hook h='displayCMSPrintButton'}
    {/block}

  </section>
{/block}
