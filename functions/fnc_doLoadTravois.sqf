#include "function_macros.hpp"
/*
 * Author: commy2
 * Modified by: M3ales
 * Unit loads the target object into a vehicle. (logic same as canLoadCaptive)
 *
 * Arguments:
 * 0: Unit that wants to load a captive <OBJECT>
 * 1: A unit on travois. objNull for the first found <OBJECT>
 * 2: Vehicle to load the captive into. objNull for the nearest vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, tom, car] call ace_captives_fnc_doLoadCaptive
 *
 * Public: No
 */
params ["_unit", "_target", "_vehicle"];
LOGF_3("%1 is attempting to load %2 into %3", _unit, _target, _vehicle);
if (isNull _target && {_unit getVariable [QGVAR(isDragging), false]}) then {
    // Looking at a vehicle while escorting, get target from attached objects:
    _target = _unit getVariable [QGVAR(draggedObject), objNull];
    LOGF_1("%1 was determined to be the target based on context", _target);
};
if (isNull _target || {(vehicle _target) != _target} || {!(_target call FUNC(isOnTravois))}) exitWith {LOG("No target or vehicle")};
LOGF_1("%1 is target", _target);
// Looking at a captive unit, get nearest vehicle with valid seat:
if (isNull _vehicle) then {
    _vehicle = [_target, 10] call EFUNC(common,nearestVehiclesFreeSeat);
    _vehicle = _vehicle param [0, objNull];
    LOG("BlehBlehBleh");
} else {
    LOG("Bleh");
    // We have a vehicle picked, make sure it has empty seats:
    if (_vehicle emptyPositions "cargo" == 0 && {_vehicle emptyPositions "gunner" == 0}) then {
        _vehicle = objNull;
    };
};

if (isNull _vehicle) exitWith {LOG_ERROR("Could not find vehicle to load travois");};

_unit setVariable [QGVAR(isDragging), false, true];
_unit call FUNC(removeStretcher);
[{
    [_unit, _target, _vehicle] call ace_common_fnc_loadPerson;
}, _unit] call CBA_fnc_execNextFrame;