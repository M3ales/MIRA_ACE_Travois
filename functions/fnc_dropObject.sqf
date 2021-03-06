#include "function_macros.hpp"
/*
 * Author: commy2
 * Drop a dragged object.
 *
 * Arguments:
 * 0: Unit that drags the other object <OBJECT>
 * 1: Dragged object to drop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_dropObject;
 *
 * Public: No
 */

params ["_unit", "_target"];
LOGF_2("params [%1, %2]",_unit,_target);

// remove drop action
[_unit, "DefaultAction", _unit getVariable [QGVAR(ReleaseActionID), -1]] call EFUNC(common,removeActionEventHandler);

private _inBuilding = [_unit] call FUNC(isObjectOnObject);
/* 
if !(_unit getVariable ["ACE_isUnconscious", false]) then {
    // play release animation
    [_unit, "released"] call EFUNC(common,doGesture);
}; */

// prevent collision damage
[QEGVAR(common,fixCollision), _unit] call CBA_fnc_localEvent;
[QEGVAR(common,fixCollision), _target, _target] call CBA_fnc_targetEvent;

// release object
detach _target;

[_unit, "blockThrow", "ACE_dragging", false] call EFUNC(common,statusEffect_set);

// prevent object from flipping inside buildings
if (_inBuilding) then {
    _target setPosASL (getPosASL _target vectorAdd [0, 0, 0.05]);
    LOGF_2("setPos %1, %2",getPosASL _unit,getPosASL _target);
};

// hide mouse hint
[] call EFUNC(interaction,hideMouseHint);

_unit setVariable [QGVAR(isDragging), false, true];
_unit setVariable [QUOTE(ace_dragging_isDragging), false, true];
_unit setVariable [QGVAR(draggedObject), objNull, true];

// make object accessible for other units
[objNull, _target, true] call EFUNC(common,claim);

if([_target] call FUNC(isOnTravois)) then {
    [_target, GVAR(travoisAnimation)] call EFUNC(common,doAnimation);
}
else {
    if (_target getVariable ["ACE_isUnconscious", false]) then {
        [_target, "unconscious", 2, true] call EFUNC(common,doAnimation);
    }
    else {
        [_target, "", 2, true] call EFUNC(common,doAnimation);  //@todo "AinjPpneMrunSnonWnonDb_release" seems to fall back to unconsciousness anim.
    };
};

// reset mass
private _mass = _target getVariable [QGVAR(originalMass), 0];

if (_mass != 0) then {
    [QEGVAR(common,setMass), [_target, _mass], _target] call CBA_fnc_targetEvent;
};
