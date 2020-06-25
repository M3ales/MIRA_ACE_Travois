#include "function_macros.hpp"
params["_unit"];

_travois = _unit getVariable [QGVAR(travois), objNull];
if(_travois != objNull) then {
	//delete stretcher mesh, and clear var
	deleteVehicle _travois;
	_unit setVariable [QGVAR(travois), objNull];
	LOGF_1("%1.removeStretcher()", _unit);
};