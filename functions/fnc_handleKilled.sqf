#include "function_macros.hpp"
/*
 * Author: commy2
 * Handle death of the dragger
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call ace_dragging_fnc_handleKilled;
 *
 * Public: No
*/

params ["_unit"];
LOGF_1("params [%1]",_unit);

if (_unit getVariable [QGVAR(isDragging), false]) then {
    private _draggedObject = _unit getVariable [QGVAR(draggedObject), objNull];

    [_unit, _draggedObject] call FUNC(dropObject);
};