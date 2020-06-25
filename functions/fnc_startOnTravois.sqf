#include "function_macros.hpp"
params["_player", "_target"];

LOGF_1("Placing %1 onto Travois", _target);
_player removeWeapon GVAR(launcherItem);
_target setVariable ["ace_dragging_canCarry", false];
_target call FUNC(attachStretcher);

//handle mesh placement
if(vehicle _target == _target) then {
  if (_target getVariable [QGVAR(travois), objNull] == objNull) then {
      _target call FUNC(attachStretcher);
  };
}
else {
  if(_target getVariable [QGVAR(travois), objNull] != objNull) then {
    _target call FUNC(removeStretcher);
  };
};

_target setVariable [QGVAR(onTravois), true];
// can't play action that depends on weapon if it was added the same frame
if !(_unit call EFUNC(common,isSwimming)) then {
    [{
		[_target, GVAR(travoisAnimation), 2, true] call EFUNC(common,doAnimation);
    }, _unit] call CBA_fnc_execNextFrame;
};
[_target, GVAR(travoisAnimation), 2, true] call EFUNC(common,doAnimation);
[_target, "AnimChanged", FUNC(handleAnimChanged), [_target]] call CBA_fnc_addBISEventHandler;
[FUNC(onTravoisPFH), 0.2, [_target, CBA_missionTime + 5]] call CBA_fnc_addPerFrameHandler;