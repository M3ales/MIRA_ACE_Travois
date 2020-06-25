#include "function_macros.hpp"
/*
 * Author: commy2
 * Modified by: M3ales
 * Handle the Unconscious of a Unit while Dragging
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call ace_dragging_fnc_handleUnconscious;
 *
 * Public: No
*/

params ["_unit"];

private _player = ACE_player;

if (_player getVariable [QGVAR(isDragging), false] || !(_unit getVariable [QGVAR(onTravois), false])) then {

    private _draggedObject = _player getVariable [QGVAR(draggedObject), objNull];

    // handle falling unconscious
    if (_unit == _player) then {
        [_unit, _draggedObject] call FUNC(dropObject);
    };
};

if(_unit call FUNC(isOnTravois)) then {
    
};