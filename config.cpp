#include "config_macros.hpp"

class CfgPatches {
	class ADDON
	{
		name = QUOTE(ADDON_NAME);
		author = "M3ales";
		url = "https://github.com/M3ales/";
		requiredAddons[] = {"ace_interact_menu", "ace_vehicles", "cba_settings"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgWeapons {
	 class Launcher_Base_F;
    class MIRA_ACE_Travois : Launcher_Base_F {
        canLock = 0;
        scope = 2;
        scopeCurator = 2;
        scopeArsenal = 2;
        displayName = "ACE Travois";
        model = "\501RDStretcher\model\501_stretcher.p3d";
        picture = "\501RDStretcher\data\stretcher_co.paa";
    };
};

#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"