#include "function_macros.hpp"
/*
 * Author: commy2
 * Modified by: M3ales
 * Check if unit can drag the object. Doesn't check weight.
 *
 * Arguments:
 * 0: Unit that should do the dragging <OBJECT>
 * 1: Object to drag <OBJECT>
 *
 * Return Value:
 * Can the unit drag the object? <BOOL>
 *
 * Example:
 * [player, cursorTarget] call mira_ace_travois_fnc_canDrag;
 *
 * Public: No
 */

params ["_unit", "_target"];

if!([_target] call FUNC(isOnTravois)) exitWith {LOGF_1("%1.canDrag : false - not on Travois", _target); false};
if((typeOf _target) isKindOf "StaticWeapon") exitWith {LOGF_1("%1.canDrag : false - is a static weapon.", _target); false};
if !([_unit, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {LOGF_1("%1.canDrag : false - Swimming", _target); false};

_res = alive _target && {_target getVariable [QGVAR(canDrag), false]};
LOGF_2("%1.canDrag : %2", _target, _res);
_res