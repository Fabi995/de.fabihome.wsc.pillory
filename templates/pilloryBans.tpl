{capture assign='contentTitle'}{$__wcf->getActivePage()->getTitle()} <span class="badge">{$items}</span>{/capture}

{include file='header'}

{hascontent}
	<div class="paginationTop">
		{content}{pages print=true assign=pagesLinks controller="PilloryBans" link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}{/content}
	</div>
{/hascontent}

{if $objects|count}
	<div class="section tabularBox">
		<table class="table">
			<thead>
			<tr>
				<th class="columnTitle columnName {if $sortField == 'username'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryBans'}pageNo={@$pageNo}&sortField=username&sortOrder={if $sortField == 'username' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.global.name{/lang}</th>
				<th class="columnText columnReason  {if $sortField == 'banReason'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryBans'}pageNo={@$pageNo}&sortField=banReason&sortOrder={if $sortField == 'banReason' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.acp.user.banReason{/lang}</th>
				<th class="columnText columnExpires  {if $sortField == 'banExpires'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryBans'}pageNo={@$pageNo}&sortField=banExpires&sortOrder={if $sortField == 'banExpires' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.user.ban.expires{/lang}</th>
			</tr>
			</thead>

			<tbody>
			{foreach from=$objects item=user}
				<tr>
					<td class="columnTitle columnName"><a href="{link controller='User' id=$user->userID}{/link}">{$user->username}</a></td>
					<td class="columnText columnReason">{if $user->banReason}{@$user->banReason}{else}{lang}wcf.user.ban.noReason{/lang}{/if}</td>
					<td class="columnText columnExpire">{if $user->banExpires != 0}{@$user->banExpires|date}{else}{lang}wcf.user.ban.neverExpires{/lang}{/if}</td>
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
