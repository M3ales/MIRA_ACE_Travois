
//#include "config_macros.hpp"
#define GET_ON_TRAVOIS _target call FUNC(isOnTravois)
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class Self_GetUp {
                displayName = "Get Up Off Travois";
                condition =  QUOTE([_player] call FUNC(isOnTravois));
                statement = QUOTE(_target call FUNC(getOffTravois));
            };
        };
    };
};