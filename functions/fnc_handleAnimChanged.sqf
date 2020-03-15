#include "function_macros.hpp"
/*
 * Author: commy2
 * Handle the animaion for a Unit for Dragging Module
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: animaion <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, "amovpercmstpsnonwnondnon"] call ace_dragging_fnc_handleAnimChanged;
 *
 * Public: No
*/

//IGNORE_PRIVATE_WARNING ["_thisArgs", "_thisID"]; // From CBA_fnc_addBISEventHandler;

params ["_unit", "_anim"];
_thisArgs params ["_realUnit"];
LOGF_4("params [%1, %2, %3, %4]",_unit,_anim,_realUnit,_thisID);

if (_unit != _realUnit) exitWith {
    LOGF_2("[%1, %2] respawn (unit changed) - remove EH",_unit,_realUnit);
    _unit removeEventHandler ["AnimChanged", _thisID];
};