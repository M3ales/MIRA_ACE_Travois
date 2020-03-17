#include "function_macros.hpp"
params[
	["_unit", player, [player]]
];
LOGF_1("Attempting to attach travois to %1", _unit);
_mesh = "501RDStretcher\model\501_stretcher.p3d";
_pos = _unit getRelPos [0, 0];
_dir = getDir _unit;
_object = createSimpleObject [_mesh, _pos];
_object setDir _dir;
_object attachTo [_unit,  GVAR(stretcherPos)];  // [0,0,0.97] on self, [0, -1, 1.2] when being dragged
_unit setVariable [QGVAR(travois), _object];
LOGF_4("Mesh '%1' attached to '%2' at position '%3' with direction %4", _object, _unit, _pos, _dir);