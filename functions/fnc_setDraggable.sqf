#include "function_macros.hpp"
/*
 * Author: commy2, PiZZADOX
 * Modified by: M3ales
 * Enable the object to be dragged.
 *
 * Arguments:
 * 0: Any object <OBJECT>
 * 1: true to enable dragging, false to disable <BOOL>
 * 2: Position offset for attachTo command (optional; default: [0,0,0])<ARRAY>
 * 3: Direction in degree to rotate the object after attachTo (optional; default: 0) <NUMBER>
 * 4: Override weight limit (optional; default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, true, [0,0,0], 0, false] call mira_ace_travois_fnc_setDraggable;
 *
 * Public: Yes
 */

//IGNORE_PRIVATE_WARNING ["_player", "_target"];
params ["_object", "_enableDrag", "_position", "_direction", ["_ignoreWeightDrag", false, [false]]];

if (isNil "_position") then {
    _position = _object getVariable [QGVAR(dragPosition), [0,0,0]];
};

if (isNil "_direction") then {
    _direction = _object getVariable [QGVAR(dragDirection), 0];
};

// update variables
_object setVariable [QGVAR(canDrag), _enableDrag];
_object setVariable [QGVAR(dragPosition), _position];
_object setVariable [QGVAR(dragDirection), _direction];
_object setVariable [QGVAR(ignoreWeightDrag), _ignoreWeightDrag];
_object setVariable [QGVAR(travois), objNull];
_object setVariable [QGVAR(onTravois), false];

// add action to class if it is not already present

// add action to class if it is not already present
private _type = typeOf _object;
private _initializedClasses = missionNamespace getVariable [QGVAR(initializedClasses),[]];

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {LOGF_1("Type %1 already has actions added.", _type);};

_initializedClasses pushBack _type;
GVAR(initializedClasses) = _initializedClasses;

_icon = "";
LOGF_1("Adding actions to class %1", _type);

_dragAction = 
[
    QGVAR(drag), 
    "Drag Travois", 
    _icon, 
    {
        [_player, _target] call FUNC(startDrag)
    }, 
    {
        [_player, _target] call FUNC(canDrag) && (vehicle player == player)
    }
] call EFUNC(interact_menu,createAction);

_dropAction = 
[
    QGVAR(drop), 
    "Drop Travois", 
    "", 
    {
        [_player, _target] call FUNC(dropObject)
    }, 
    {
        [_player, _target] call FUNC(canDrop) && (vehicle player == player)
    }
] call EFUNC(interact_menu,createAction);

_placeOnAction = 
[
    QGVAR(placeOn), 
    "Place on Travois", 
    "", 
    {
        [_player, _target] call FUNC(startOnTravois)
    }, 
    {
        [_player] call FUNC(hasTravois) && !([_target] call FUNC(isOnTravois))
    }
] call EFUNC(interact_menu,createAction);

_packupAction = 
[
    QGVAR(packup), 
    "Packup Travois", 
    "", 
    {
        [_player, _target] call FUNC(packUpTravois)
    }, 
    {
        [_target] call FUNC(isOnTravois)
    }
] call EFUNC(interact_menu,createAction);

[_type, 0, ["ACE_MainActions"], _dragAction] call EFUNC(interact_menu,addActionToClass);
[_type, 0, ["ACE_MainActions"], _placeOnAction] call EFUNC(interact_menu,addActionToClass);
[_type, 0, ["ACE_MainActions"], _packupAction] call EFUNC(interact_menu,addActionToClass);
[_type, 0, [], _dropAction] call EFUNC(interact_menu,addActionToClass);
LOGF_1("Completed adding actions to class %1", _type);