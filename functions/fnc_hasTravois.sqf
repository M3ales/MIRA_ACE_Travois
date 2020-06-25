#include "function_macros.hpp"
params["_unit"];
_hasItem = false;
_travois = ["MIRA_ACE_Travois"];
{
	if (_x in _travois) exitWith
	{
		_hasItem = true;
	};
} forEach weapons _unit;
LOGF_2("%1.hasTravois : %2", _unit, _hasItem);
_hasItem