{capture assign='contentTitle'}{$__wcf->getActivePage()->getTitle()} <span class="badge">{$items}</span>{/capture}

{include file='header'}

{hascontent}
	<div class="paginationTop">
		{content}{pages print=true assign=pagesLinks controller="PilloryAvatarBans" link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}{/content}
	</div>
{/hascontent}

{if $objects|count}
	<div class="section tabularBox">
		<table class="table">
			<thead>
			<tr>
				<th class="columnTitle columnName {if $sortField == 'username'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryAvatarBans'}pageNo={@$pageNo}&sortField=username&sortOrder={if $sortField == 'username' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.global.name{/lang}</th>
				<th class="columnText columnReason  {if $sortField == 'disableAvatarReason'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryAvatarBans'}pageNo={@$pageNo}&sortField=disableAvatarReason&sortOrder={if $sortField == 'disableAvatarReason' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.user.banReason{/lang}</th>
				<th class="columnText columnExpires  {if $sortField == 'disableAvatarExpires'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryAvatarBans'}pageNo={@$pageNo}&sortField=disableAvatarExpires&sortOrder={if $sortField == 'disableAvatarExpires' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.user.ban.expires{/lang}</th>
			</tr>
			</thead>

			<tbody>
			{foreach from=$objects item=user}
				<tr>
					<td class="columnTitle columnName"><a href="{link controller='User' id=$user->userID}{/link}">{$user->username}</a></td>
					<td class="columnText columnReason">{if $user->disableAvatarReason}{@$user->disableAvatarReason}{else}{lang}wcf.user.ban.noReason{/lang}{/if}</td>
					<td class="columnText columnExpire">{if $user->disableAvatarExpires != 0}{@$user->disableAvatarExpires|date}{else}{lang}wcf.user.ban.neverExpires{/lang}{/if}</td>
				</tr>
			{/foreach}
			</tbody>
		</table>
	</div>
{else}
	<p class="info">{lang}wcf.global.noItems{/lang}</p>
{/if}

<footer class="contentFooter">
	{hascontent}
		<div class="paginationBottom">
			{content}{@$pagesLinks}{/content}
		</div>
	{/hascontent}

	{hascontent}
		<nav class="contentFooterNavigation">
			<ul>
				{content}{event name='contentFooterNavigation'}{/content}
			</ul>
		</nav>
	{/hascontent}
</footer>

{include file='footer'}
