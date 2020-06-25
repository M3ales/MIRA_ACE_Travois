#include "function_macros.hpp"
params["_player", "_target"];
LOGF_2("%1.packupTravois(%2)", _player, _target);
[_target, false] call FUNC(getOffTravois);
_player addWeapon GVAR(launcherItem);