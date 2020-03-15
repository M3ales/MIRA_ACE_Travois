#include "function_macros.hpp"
/*
 * Author: M3ales
 * PFH for unit on Travois
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
    systemChat format ["%1 onTravoisPFH running", CBA_missionTime];
#endif

params ["_args", "_idPFH"];
_args params ["_unit", "_startTime"];
if(!(_unit getVariable [QGVAR(onTravois), false]) || !(alive _unit)) exitWith {
    LOGF_1("%1 is not on a Travois!");
    //Set animation to prone for self
    if(animationState _unit isEqualTo toLower GVAR(travoisAnimation)) then {
        [_unit] call FUNC(getOffTravois);
    };
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};