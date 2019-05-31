{capture assign='contentTitle'}{$__wcf->getActivePage()->getTitle()} <span class="badge">{$items}</span>{/capture}

{include file='header'}

{hascontent}
	<div class="paginationTop">
		{content}{pages print=true assign=pagesLinks controller="PilloryUserDeletions" link="pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"}{/content}
	</div>
{/hascontent}

{if $objects|count}
	<div class="section tabularBox">
		<table class="table">
			<thead>
			<tr>
				<th class="columnTitle columnName {if $sortField == 'username'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryUserDeletions'}pageNo={@$pageNo}&sortField=username&sortOrder={if $sortField == 'username' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.global.name{/lang}</th>
				<th class="columnText columnQuit {if $sortField == 'quitStarted'} active {@$sortOrder}{/if}"><a href="{link controller='PilloryUserDeletions'}pageNo={@$pageNo}&sortField=quitStarted&sortOrder={if $sortField == 'quitStarted' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{/link}">{lang}wcf.user.deletions{/lang}</th>
			</tr>
			</thead>

			<tbody>
			{foreach from=$objects item=user}
				<tr>
					<td class="columnTitle columnName"><a href="{link controller='User' id=$user->userID}{/link}">{$user->username}</a></td>
					<td class="columnText columnQuit">{@$user->quitStarted|date}</td>
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
