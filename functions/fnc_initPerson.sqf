#include "function_macros.hpp"
/*
 * Author: commy2
 * Modified: M3ales
 * Initialize variables for drag or carryable persons. Called from init EH.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call mira_ace_travois_fnc_initPerson;
 *
 * Public: No
 */

params ["_unit"];

[_unit, true, [0,-1.9,0.3], 0] call FUNC(setDraggable);
