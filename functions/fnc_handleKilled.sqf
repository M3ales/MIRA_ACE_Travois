#include "function_macros.hpp"
/*
 * Author: commy2
 * Modified by: M3ales
 * Handle death of the dragger
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call mira_ace_travois_fnc_handleDraggerKilled;
 *
 * Public: No
*/

params ["_unit"];
LOGF_1("params [%1]",_unit);

if (_unit getVariable [QGVAR(isDragging), false]) then {
    private _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

    [_unit, _draggedObject] call FUNC(dropObject);
};

if (_unit getVariable [QGVAR(travois), objNull] != objNull) then {
    [_unit, true] call FUNC(getOffTravois);
};