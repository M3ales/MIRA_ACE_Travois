#include "function_macros.hpp"
/*
 * Author: 654wak654
 * Modified by: M3ales
 * Adds child actions to the "load captive" action for near vehicles.
 *
 * Arguments:
 * 0: Captive <OBJECT>
 *
 * Return Value:
 * Child actions <ARRAY>
 *
 * Example:
 * [mira] call mira_ace_travois_fnc_addLoadTravoisActions
 *
 * Public: No
 */

params ["_target"];

private _statement = {
    params ["_target", "_player", "_vehicle"];
    [_player, _target, _vehicle] call FUNC(doLoadTravois);
};
[_target call EFUNC(common,nearestVehiclesFreeSeat), _statement, _target] call EFUNC(interact_menu,createVehiclesActions)