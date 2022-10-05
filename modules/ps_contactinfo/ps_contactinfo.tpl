{*
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="block-contact">
	<h4>{l s='dane kontaktowe' d='Shop.Theme.Global'}</h4>
    <div class="contact-infos d-flex flex-column">
        <div class="contact-block d-flex align-items-start">
            <div class="icon">
                <svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M7.85715 0C5.77406 0.00245748 3.77699 0.831051 2.30403 2.30402C0.831059 3.77699 0.00246584 5.77405 8.3592e-06 7.85714C-0.00248656 9.55945 0.553566 11.2156 1.58287 12.5714C1.58287 12.5714 1.79715 12.8536 1.83215 12.8943L7.85715 20L13.885 12.8907C13.9164 12.8529 14.1314 12.5714 14.1314 12.5714L14.1322 12.5693C15.1609 11.214 15.7167 9.55866 15.7143 7.85714C15.7118 5.77405 14.8832 3.77699 13.4103 2.30402C11.9373 0.831051 9.94024 0.00245748 7.85715 0ZM7.85715 10.7143C7.29206 10.7143 6.73966 10.5467 6.26981 10.2328C5.79995 9.91882 5.43375 9.4726 5.2175 8.95052C5.00125 8.42845 4.94466 7.85397 5.05491 7.29974C5.16515 6.74551 5.43727 6.23642 5.83685 5.83684C6.23642 5.43726 6.74552 5.16514 7.29975 5.0549C7.85398 4.94466 8.42846 5.00124 8.95053 5.21749C9.47261 5.43374 9.91883 5.79994 10.2328 6.2698C10.5467 6.73965 10.7143 7.29205 10.7143 7.85714C10.7133 8.61461 10.412 9.34079 9.87641 9.8764C9.3408 10.412 8.61462 10.7133 7.85715 10.7143Z" fill="#504A4D"/>
                </svg>
            </div>
            <div class="infos">
                {$contact_infos.address.address1}
                <br>
                {$contact_infos.address.address2}
            </div>
        </div>
        <div class="contact-block d-flex align-items-start">
            <div class="icon">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M19.068 3.16019L16.483 0.57767C16.3007 0.394523 16.0839 0.249209 15.8453 0.150074C15.6066 0.0509392 15.3507 -6.19408e-05 15.0922 5.64551e-08C14.5655 5.64551e-08 14.0704 0.206311 13.699 0.57767L10.9175 3.35922C10.7343 3.54157 10.589 3.7583 10.4899 3.99698C10.3907 4.23565 10.3397 4.49156 10.3398 4.75C10.3398 5.2767 10.5461 5.77184 10.9175 6.1432L12.9515 8.17718C12.4754 9.2266 11.8134 10.1813 10.9976 10.9951C10.1838 11.813 9.22919 12.4773 8.17961 12.9563L6.14563 10.9223C5.96329 10.7392 5.74655 10.5939 5.50788 10.4947C5.26921 10.3956 5.0133 10.3446 4.75486 10.3447C4.22816 10.3447 3.73301 10.551 3.36165 10.9223L0.577671 13.7015C0.3943 13.8841 0.24886 14.1013 0.149721 14.3404C0.0505815 14.5795 -0.000300774 14.8358 1.33747e-06 15.0947C1.33747e-06 15.6214 0.206312 16.1165 0.577671 16.4879L3.15777 19.068C3.75 19.6626 4.56796 20 5.40777 20C5.58495 20 5.75486 19.9854 5.92233 19.9563C9.19418 19.4175 12.4393 17.6772 15.0583 15.0607C17.6748 12.4466 19.4126 9.20388 19.9587 5.92233C20.1238 4.9199 19.7913 3.88835 19.068 3.16019Z" fill="#504A4D"/>
                </svg>
            </div>
            <div class="infos">
                tel.  {if $contact_infos.phone}
                    <a href="tel:$contact_infos.phone">{$contact_infos.phone}</a>
                {/if}
                <br>
                e-mail: {if $contact_infos.email && $display_email}
                    <a href="mailto:{$contact_infos.email|cat}">{$contact_infos.email|cat}</a>
                {/if}
            </div>
        </div>
    </div>


{*    {if $contact_infos.fax}*}
{*      <br>*}
{*      *}{* First tag [1][/1] is for a HTML tag. *}
{*      {l*}
{*        s='Fax: %fax%'*}
{*        sprintf=[*}
{*          '%fax%' => $contact_infos.fax*}
{*        ]*}
{*        d='Modules.Contactinfo.Shop'*}
{*      }*}
{*    {/if}*}

</div>
