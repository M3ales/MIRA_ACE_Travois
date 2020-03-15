#include "function_macros.hpp"
params["_player", "_target"];
LOG("Packing Up Travois");
[_target, false] call FUNC(getOffTravois);
_player addWeapon GVAR(launcherItem);