<?php

namespace wcf\page;
use wcf\data\user\UserList;

/**
 * Lists users whose Signature has been banned
 *
 * @author          Fabian Graf
 * @copyright       2017 Fabian Graf
 * @license         Fabihome Free License <https://https://fabihome.de/license.html>
 * @package         de.fabihome.wsc.pillory
 */

class PillorySignatureBansPage extends SortablePage {

	/**
	 * @inheritDoc
	 */
	public $neededPermissions = ['user.pillory.canSeePillory'];

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
	public $validSortFields = ['username', 'disableSignatureReason', 'disableSignatureExpires'];

	/**
	 * @inheritDoc
	 */
	public $objectListClassName = UserList::class;

	/**
	 * @inheritDoc
	 */
	protected function initObjectList() {
		parent::initObjectList();

		$this->objectList->getConditionBuilder()->add('disableSignature = ?', [1]);
	}

}
