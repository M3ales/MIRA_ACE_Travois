#include "function_macros.hpp"
/*
 * Author: commy2, PiZZADOX
 * Modified by: M3ales
 * Start the dragging process.
 *
 * Arguments:
 * 0: Unit that should do the dragging <OBJECT>
 * 1: Object to drag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call mira_ace_travois_fnc_startDrag;
 *
 * Public: No
 */

params ["_unit", "_target"];
LOGF_2("params [%1, %2]",_unit,_target);

// exempt from weight check if object has override variable set
/* if (!(_target getVariable [QGVAR(ignoreWeightDrag),false]) && {
    private _weight = [_target] call FUNC(getWeight);
    _weight > missionnamespace getVariable ["ACE_maxWeightDrag", 1E11]
}) exitWith {
    // exit if object weight is over global var value
    ["Unable to drag, too heavy"] call EFUNC(common,displayTextStructured);
}; */

if (!(_target getVariable [QGVAR(onTravois), false])) exitWith {
    LOG("Target is not on Travois, Exiting...");
};

[_unit, "blockThrow", "ACE_dragging", true] call EFUNC(common,statusEffect_set);

//_unit action ["SwitchWeapon", _unit, _unit, 299];

// prevent multiple players from accessing the same object
[_unit, _target, true] call EFUNC(common,claim);

// can't play action that depends on weapon if it was added the same frame
/* if !(_unit call EFUNC(common,isSwimming)) then {
    [{
        [_this, "grabDrag"] call EFUNC(common,doGesture);
    }, _unit] call CBA_fnc_execNextFrame;
}; */
_target setDir (getDir _unit + 180);
_target setPosASL (getPosASL _unit vectorAdd (vectorDir _unit vectorMultiply 1.5));
//[_target, "AinjPpneMrunSnonWnonDb_grab", 2, true] call EFUNC(common,doAnimation);
// prevents draging and carrying at the same time
_unit setVariable [QGVAR(isDragging), true, true];
_unit setVariable [QUOTE(ace_dragging_isDragging), true, true];

[FUNC(startDragPFH), 0.4, [_unit, _target, CBA_missionTime + 5]] call CBA_fnc_addPerFrameHandler;

// disable collisions by setting the physx mass to almost zero
private _mass = getMass _target;

if (_mass > 1) then {
    _target setVariable [QGVAR(originalMass), _mass, true];
    [QEGVAR(common,setMass), [_target, 1e-12], _target] call CBA_fnc_targetEvent;
};
