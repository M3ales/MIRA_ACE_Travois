#include "function_macros.hpp"
params[
	["_player", player, [player]],
	["_speed", 0, [0]]
];
// vehicle must be the vehicle the player is currently in
_veh = vehicle _player;

// make sure player is driver
if(_player != driver _veh) exitWith {
	LOGF_2("Player %1 is not the driver of %2", _player, _veh)
};

// set speed limiter to value
if(_speed == -1) exitWith {
	LOG("Speed Unset");
};

ace_vehicles_speedLimit = _speed;

// if its not already active turn it on
if(!ace_vehicles_isSpeedLimiter) then {
	[_player, _veh] call ace_vehicles_fnc_speedLimiter; // activate speed limiter
};