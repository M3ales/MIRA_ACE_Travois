// by PabstMirror, commy2
#include "config_macros.hpp"

if (isServer) then {
    // release object and travois on hard disconnection. Function is identical to killed
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleKilled)}];
};

if (!hasInterface) exitWith {};

if (isNil "ACE_maxWeightDrag") then {
    ACE_maxWeightDrag = 800;
};

if (isNil "ACE_maxWeightCarry") then {
    ACE_maxWeightCarry = 600;
};

// release object on player change. This does work when returning to lobby, but not when hard disconnecting.
["unit", FUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addPlayerEventHandler;
["weapon", FUNC(handlePlayerWeaponChanged)] call CBA_fnc_addPlayerEventHandler;

// handle waking up dragged unit and falling unconscious while dragging
["ace_unconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;

GVAR(travoisAnimation) = "HubWoundedProne_idle1";
GVAR(travoisExitAnimation) = "AidlPpneMstpSnonWnonDnon_G03";
GVAR(launcherItem) = "MIRA_ACE_Travois";
GVAR(stretcherPos) = [0, -0.03, 0];