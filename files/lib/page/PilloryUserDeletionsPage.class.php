<?php

namespace wcf\page;
use wcf\data\user\UserList;

/**
 * Lists started account deletions
 *
 * @author          Fabian Graf
 * @copyright       2017 Fabian Graf
 * @license         Fabihome Free License <https://https://fabihome.de/license.html>
 * @package         de.fabihome.wsc.pillory
 */

class PilloryUserDeletionsPage extends SortablePage {

	/**
	 * @inheritDoc
	 */
	public $neededPermissions = ['user.pillory.canSeeDeletions'];
	/**
	 * @see	\wcf\page\AbstractPage::$neededModules
	 */
	public $neededModules = ['MODULE_PILLORY'];

	/**
	 * @inheritDoc
	 */
	public $sortOrder = PILLORY_DEFAULT_SORT_ORDER;

	/**
	 * @inheritDoc
	 */
	public $itemsPerPage = PILLORY_ITEMS_PER_PAGE;

	/**
	 * @inheritDoc
	 */
	public $defaultSortField = 'username';

	/**
	 * @inheritDoc
	 */
	public $validSortFields = ['username', 'quitStarted'];

	/**
	 * @inheritDoc
	 */
	public $objectListClassName = UserList::class;

	/**
	 * @inheritDoc
	 */
	protected function initObjectList() {
		parent::initObjectList();

		$this->objectList->getConditionBuilder()->add('quitStarted <> 0');
	}

}
