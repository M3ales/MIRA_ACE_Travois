#include "function_macros.hpp"
params["_unit", ["_dropTravois", true, [true]]];
LOGF_1("%1 is getting off their Travois", _unit);
_unit setVariable [QGVAR(onTravois), false];
_target setVariable ["ace_dragging_canCarry", true];

_travoisMesh = _unit getVariable [QGVAR(travois), objNull];
if(_travoisMesh != objNull) then {
	deleteVehicle _travoisMesh;
	LOG("Deleted Travois Mesh");
};

[_unit, GVAR(travoisExitAnimation), 2, true] call EFUNC(common,doAnimation);
if(_dropTravois) then {
	LOGF_1("Placing Weapon on Ground at %1", position _unit);
	_wh = "GroundWeaponHolder" createVehicle position _unit;
	_wh addWeaponCargoGlobal [GVAR(launcherItem), 1];
};
LOGF_2("'%1' is no longer on Travois with animationState '%2'", _unit, animationState _unit);