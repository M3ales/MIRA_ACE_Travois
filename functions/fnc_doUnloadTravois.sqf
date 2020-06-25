#include "function_macros.hpp"
params["_player", "_target"];
[_target] call ace_common_fnc_unloadPerson;
[_target] call FUNC(attachStretcher);
[{
	[_target, GVAR(travoisAnimation), 2, true] call EFUNC(common,doAnimation);
}, _player] call CBA_fnc_execNextFrame;