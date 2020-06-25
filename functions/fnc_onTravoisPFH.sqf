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
//if not on travois or dead, exit
if(!(_unit call FUNC(isOnTravois)) || !(alive _unit)) exitWith {
    LOGF_2("%1 is not on a Travois, exiting PFH %2!",_unit,_idPFH);
    if(animationState _unit isEqualTo toLower GVAR(travoisAnimation)) then {
        [_unit] call FUNC(getOffTravois);
    };
    LOGF_2("Exited TravoisPFH %1 after %2", _idPFH, CBA_missionTime);
    #ifdef DEBUG_ENABLED_TRAVOIS
        systemChat format ["%1 onTravoisPFH Exited", CBA_missionTime];
    #endif
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
if (vehicle _unit == _unit) then {
    //aggresively readd if we have no travois bound
    if (_unit getVariable [QGVAR(travois), objNull] == objNull) then {
        LOG_ERRORF_1("%1 has no travois, readding...", _unit);
        _unit call FUNC(attachStretcher);
    };

    if(animationState _unit != toLower GVAR(travoisAnimation)) then {
        LOG_ERRORF_1("%1 in wrong anim", _unit);
        if(primaryWeapon _unit  != "") then {
            LOG("Forcing weapon swap");
            _unit action ["SwitchWeapon", _unit, _unit, 299];
        };
        [_target, GVAR(travoisAnimation), 2, true] call EFUNC(common,doAnimation);
    };
}
else
{
    if(_unit getVariable [QGVAR(travois), objNull] != objNull) then {
        LOGF_1("%1 on stretcher in vehicle, removing", _unit);
        _unit call FUNC(removeStretcher);
    };
};