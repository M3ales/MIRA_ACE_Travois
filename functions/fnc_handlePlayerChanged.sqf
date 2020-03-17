#include "function_macros.hpp"
/*
 * Author: commy2
 * Handle player changes.
 *
 * Arguments:
 * 0: New Player Unit <OBJECT>
 * 1: Old Player Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_newPlayer, _oldPlayer] call ace_dragging_fnc_handlePlayerChanged;
 *
 * Public: No
*/

params ["_newPlayer", "_oldPlayer"];
LOGF_2("params[%1, %2]",_newPlayer,_oldPlayer);

{
    if (_x getVariable [QGVAR(isDragging), false]) then {
        [_x, _x getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
    };
    if (_x getVariable [QGVAR(onTravois), false]) then {
        if (_x getVariable [QGVAR(travois), objNull] != objNull) then {
            LOG("handlePlayerChanged with Mesh set");
        }
        else {
            LOG("handlePlayerChanged without Mesh set");
        };
    };
} forEach [_newPlayer, _oldPlayer];
