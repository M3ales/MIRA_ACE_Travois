#include "function_macros.hpp"
/*
 * Author: commy2
 * Modified by: M3ales
 * Check if the unit can unload a travois from the vehicle.
 *
 * Arguments:
 * 0: Unit that wants to unload a travoised unit (player) <OBJECT>
 * 1: A travoised unit loaded in a vehicle <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call mira_ace_travois_fnc_canUnloadTravois;
 *
 * Public: No
 */
params ["_player", "_unit"];
(vehicle _player == _player) && {vehicle _unit != _unit} &&  {_unit call FUNC(isOnTravois)} && {!(_unit getVariable ["ACE_isUnconscious", false])}