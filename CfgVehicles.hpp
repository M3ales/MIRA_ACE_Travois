#define SET_SPEED(spd) QUOTE([ARR_2(player, GVAR(spd))] call FUNC(setSpeed))

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        class ACE_SelfActions {
                class MIRA_ACE_SpeedLimiter {
                displayName = "Speed Limiter";
                condition = QUOTE(alive _target && GVAR(Enable));
                statement = "";
                exceptions[] = {"isNotSwimming", "isNotOnMap"};
                class Infantry {
                    displayName = "Infantry";
                    class Walking {
                        displayName = "Walking";
                        statement = SET_SPEED(Infantry_Walk)
                    };
                    class CombatPace {
                        displayName = "CombatPace";
                        statement = SET_SPEED(Infantry_CombatPace)
                    };
                    class Jogging {
                        displayName = "Jogging";
                        statement = SET_SPEED(Infantry_Jog)
                    };
                    class DoubleTime {
                        displayName = "Double Time";
                        statement = SET_SPEED(Infantry_Double)
                    };
                    class TripleTime {
                        displayName = "Triple Time";
                        statement = SET_SPEED(Infantry_Triple)
                    };
                };
                class Convoy {
                    displayName = "Convoy";
                    class Cautious {
                        displayName = "Cautious";
                        statement = SET_SPEED(Convoy_Cautious)
                    };
                    class Slow {
                        displayName = "Slow";
                        statement = SET_SPEED(Convoy_Slow)
                    };
                    class Moderate {
                        displayName = "Moderate";
                        statement = SET_SPEED(Convoy_Moderate)
                    };
                    class Fast {
                        displayName = "Fast";
                        statement = SET_SPEED(Convoy_Fast)
                    };
                    class Escape {
                        displayName = "Escape";
                        statement = SET_SPEED(Convoy_Escape)
                    };
                };
            };
        };
    };

    class Tank : LandVehicle {
        class ACE_SelfActions {
                class MIRA_ACE_SpeedLimiter {
                displayName = "Speed Limiter";
                condition = QUOTE(alive _target && GVAR(Enable));
                statement = "";
                exceptions[] = {"isNotSwimming", "isNotOnMap"};
                class Infantry {
                    displayName = "Infantry";
                    class Walking {
                        displayName = "Walking";
                        statement = SET_SPEED(Infantry_Walk)
                    };
                    class CombatPace {
                        displayName = "CombatPace";
                        statement = SET_SPEED(Infantry_CombatPace)
                    };
                    class Jogging {
                        displayName = "Jogging";
                        statement = SET_SPEED(Infantry_Jog)
                    };
                    class DoubleTime {
                        displayName = "Double Time";
                        statement = SET_SPEED(Infantry_Double)
                    };
                    class TripleTime {
                        displayName = "Triple Time";
                        statement = SET_SPEED(Infantry_Triple)
                    };
                };
                class Convoy {
                    displayName = "Convoy";
                    class Cautious {
                        displayName = "Cautious";
                        statement = SET_SPEED(Convoy_Cautious)
                    };
                    class Slow {
                        displayName = "Slow";
                        statement = SET_SPEED(Convoy_Slow)
                    };
                    class Moderate {
                        displayName = "Moderate";
                        statement = SET_SPEED(Convoy_Moderate)
                    };
                    class Fast {
                        displayName = "Fast";
                        statement = SET_SPEED(Convoy_Fast)
                    };
                    class Escape {
                        displayName = "Escape";
                        statement = SET_SPEED(Convoy_Escape)
                    };
                };
            };
        };
    };
};