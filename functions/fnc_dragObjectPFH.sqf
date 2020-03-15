#include "function_macros.hpp"
/*
 * Author: commy2
 * Modified by: M3ales
 * PFH for Drag Object
 * 
 * Arguments:
 * 0: ARGS <ARRAY>
 *  0: Unit <OBJECT>
 *  1: Target <OBJECT>
 *  2: Start time <NUMBER>
 * 1: PFEH Id <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, target], 20] call mira_ace_travois_fnc_dragObjectPFH;
 *
 * Public: No
 */

#ifdef DEBUG_ENABLED_TRAVOIS
    systemChat format ["%1 dragObjectPFH running", CBA_missionTime];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_target", "_startTime"];

if!(_target getVariable [QGVAR(onTravois), false]) exitWith{
    LOGF_1("%1 is not on a Travois!");
    [_unit, _target] call FUNC(dropObject);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {
    LOG_ERRORF_2("drag false",_unit,_target);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

// drop if the crate is destroyed OR (target moved away from carrier (weapon disasembled))
if (!alive _target || {_unit distance _target > 10}) then {
    if ((_unit distance _target > 10) && {(CBA_missionTime - _startTime) < 1}) exitWith {
        //attachTo seems to have some kind of network delay and target can return an odd position during the first few frames,
        //so wait a full second to exit if out of range (this is critical as we would otherwise detach and set it's pos to weird pos)
        LOGF_3("Network delay likely, target out of range (distance: %1, startTime: %2, missionTime: %3)",_unit distance _target,_startTime,CBA_missionTime);
    };
    [_unit, _target] call FUNC(dropObject);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
