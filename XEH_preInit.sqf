#include "functions\function_macros.hpp"
LOG("PreInit Begin");

LOG("PREP Begin");
#include "XEH_PREP.sqf"
LOG("PREP Complete");

LOG("Creating CBA Addon Options");
//General
[QUOTE(GVAR(Enable)), "CHECKBOX", ["Enable Speed Limiter Interactions", "Determines if the speed limiter interactions will be shown"], ["ACE Vehicle Speed Limiter Interactions", "General"], true, 0, {}] call CBA_fnc_addSetting;

//Infantry
_infantryCategory =  ["ACE Vehicle Speed Limiter Interactions", "Infantry"];
[QUOTE(GVAR(Infantry_Walk)), "SLIDER", ["Walking", "Top Speed"], _infantryCategory, [1, 500, 5, 0], 0, {}] call CBA_fnc_addSetting;
[QUOTE(GVAR(Infantry_CombatPace)), "SLIDER", ["Combat Pace", "Top Speed"], _infantryCategory, [1, 500, 11, 0], 0, {}] call CBA_fnc_addSetting;
[QUOTE(GVAR(Infantry_Jog)), "SLIDER", ["Jogging", "Top Speed"], _infantryCategory, [1, 500, 14, 0], 0, {}] call CBA_fnc_addSetting;
[QUOTE(GVAR(Infantry_Double)), "SLIDER", ["Double Time", "Top Speed"], _infantryCategory, [1, 500, 18, 0], 0, {}] call CBA_fnc_addSetting;
[QUOTE(GVAR(Infantry_Triple)), "SLIDER", ["Triple Time", "Top Speed"], _infantryCategory, [1, 500, 23, 0], 0, {}] call CBA_fnc_addSetting;

//Convoy
_convoyCategory =  ["ACE Vehicle Speed Limiter Interactions", "Convoy"];
[QUOTE(GVAR(Convoy_Cautious)), "SLIDER", ["Cautious", "Top Speed"], _convoyCategory, [1, 500, 15, 0], 0, {}] call CBA_fnc_addSetting;
[QUOTE(GVAR(Convoy_Slow)), "SLIDER", ["Slow", "Top Speed"], _convoyCategory, [1, 500, 35, 0], 0, {}] call CBA_fnc_addSetting;
[QUOTE(GVAR(Convoy_Moderate)), "SLIDER", ["Moderate", "Top Speed"], _convoyCategory, [1, 500, 50, 0], 0, {}] call CBA_fnc_addSetting;
[QUOTE(GVAR(Convoy_Fast)), "SLIDER", ["Fast", "Top Speed"], _convoyCategory, [1, 500, 70, 0], 0, {}] call CBA_fnc_addSetting;
[QUOTE(GVAR(Convoy_Escape)), "SLIDER", ["Escape", "Top Speed"], _convoyCategory, [1, 500, 90, 0], 0, {}] call CBA_fnc_addSetting;
LOG("CBA Addon Options Complete");
LOG("PreInit Complete");