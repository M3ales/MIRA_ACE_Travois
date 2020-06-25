#include "function_macros.hpp"
/*
 * Author: commy2
 * Modified by: M3ales
 * Check if the unit can load the target object into a vehicle.
 *
 * Arguments:
 * 0: Unit that wants to load a captive <OBJECT>
 * 1: A captive. objNull for the first escorted captive <OBJECT>
 * 2: Vehicle to load the captive into. objNull for the nearest vehicle <OBJECT>
 *
 * Return Value:
 * Can load captive <BOOL>
 *
 * Example:
 * [bob, tom, car] call mira_ace_travois_fnc_canLoadTravois
 *
 * Public: No
 */
params ["_unit", "_target", "_vehicle"];

// Don't show "Load Travois" if unit is unconscious (already has "Load Patient")
if (_target getVariable ["ACE_isUnconscious", false]) exitWith {false};

if ((isNull _target) && {_unit getVariable [QGVAR(isDragging), false]}) then {
    //Looking at a vehicle while dragging, get target from vars:
    _target = _unit getVariable [QGVAR(draggedObject), objNull];
};
if (isNull _target || {(vehicle _target) != _target} || !([_target] call FUNC(isOnTravois))) exitWith {false};

if (isNull _vehicle) then {
    // Looking at a travois unit, get nearest vehicle with valid seat:
    LOGF_1("%1 searching for nearby vehicle", _target);
    _vehicle = (_target call EFUNC(common,nearestVehiclesFreeSeat)) param [0, objNull];
} else {
    // We have a vehicle picked, make sure it has empty seats:
    if (_vehicle emptyPositions "cargo" == 0 && {_vehicle emptyPositions "gunner" == 0}) then {
        _vehicle = objNull;
    };
};

_res = !isNull _vehicle;
LOGF_2("%1.canLoadTravois : %2", _target, _res);
_res