#include "function_macros.hpp"
/*
 * Author: commy2
 * Drag an object. Called from mira_ace_travois_fnc_startDrag
 *
 * Arguments:
 * 0: Unit that should do the dragging <OBJECT>
 * 1: Object to drag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call mira_ace_travois_fnc_dragObject;
 *
 * Public: No
 */

params ["_unit", "_target"];
LOGF_2("params [%1, %2]",_unit,_target);

// get attachTo offset and direction.
_position = _target getVariable [QGVAR(dragPosition), [0, -2., 0.5]];
_direction = _target getVariable [QGVAR(dragDirection), 180];

_travois = _target getVariable [QGVAR(travois), objNull];
_travois disableCollisionWith _unit;

LOGF_2("Attaching for drag at %1, %2",_position,_direction);

[QEGVAR(common,setDir), [_target, _direction], _target] call CBA_fnc_targetEvent;
_target attachTo [_unit, _position];

[_target, GVAR(travoisAnimation), 0, true] call EFUNC(common,doAnimation);

_unit setVariable [QGVAR(isDragging), true, true];
_unit setVariable [QGVAR(draggedObject), _target, true];

// add drop action
_unit setVariable [QGVAR(ReleaseActionID), [
    _unit, "DefaultAction",
    {!isNull ((_this select 0) getVariable [QGVAR(draggedObject), objNull])},
    {[_this select 0, (_this select 0) getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject)}
] call EFUNC(common,addActionEventHandler)];

// show mouse hint
["Drop Travois", ""] call EFUNC(interaction,showMouseHint);

// check everything
[FUNC(dragObjectPFH), 0.5, [_unit, _target, CBA_missionTime]] call CBA_fnc_addPerFrameHandler;

// reset current dragging height.
GVAR(currentHeightChange) = 0;