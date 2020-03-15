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

LOGF_1("Attempting to drag %1 using Travois", _unit);
if!([_target] call FUNC(isOnTravois)) exitWith{LOG("Failed: Target not on Travois");false};
if((typeOf _target) isKindOf "StaticWeapon") exitWith {LOG("Failed: Target not is static weapon");false};
if !([_unit, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {LOG("Failed: Target is swimming");false};

alive _target && {_target getVariable [QGVAR(canDrag), false]}
