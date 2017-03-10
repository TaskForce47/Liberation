/*
 * Author: mindbl4ster
 * open custon dialog to give the player the option to chose allready defined loadouts without the need to open the arsenal
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 *
 * Public: yes
*/
closeDialog 0; //close old dialog

private _return = createDialog 'tf47_arsenal_mainMenu';
[] call tf47_arsenal_fnc_updateArsenalList;
true
