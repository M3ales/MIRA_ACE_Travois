#include "function_macros.hpp"
params["_player", "_target"];

LOGF_1("Placing %1 onto Travois", _target);
[_target, GVAR(travoisAnimation), 2, true] call EFUNC(common,doAnimation);
_target setVariable [QGVAR(onTravois), true];
_player removeWeapon GVAR(launcherItem);
[FUNC(onTravoisPFH), 0.2, [_target, CBA_missionTime + 5]] call CBA_fnc_addPerFrameHandler;