#include "function_macros.hpp"
/*
 * Author: commy2
 * Handle the Weapon Changed Event
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, "gun"] call ace_dragging_fnc_handlePlayerWeaponChanged;
 *
 * Public: No
*/

params ["_unit", "_weapon"];
LOGF_2("params [%1, %2]",_unit,_weapon);

if (_unit getVariable [QGVAR(isDragging), false]) then {

    // drop dragged object when selecting a non-primary weapon
    if (_weapon != primaryWeapon _unit) then {
        private _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

        [_unit, _draggedObject] call FUNC(dropObject);
    };

};