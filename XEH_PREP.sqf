//#include "config_macros.hpp"
#define PREP(var1) FUNC(var1) = compile preProcessFileLineNumbers QUOTE(ADDON\functions\CONCAT(fnc_,var1).sqf);
PREP(addLoadTravoisActions)
PREP(attachStretcher)
PREP(canDrag)
PREP(canDrop)
PREP(canLoadTravois)
PREP(canUnloadTravois)
PREP(doLoadTravois)
PREP(doUnloadTravois)
PREP(dragObject)
PREP(dragObjectPFH)
PREP(dropObject)
PREP(getOffTravois)
PREP(getWeight)
PREP(handleKilled)
PREP(handlePlayerChanged)
PREP(handlePlayerWeaponChanged)
PREP(handleUnconscious)
PREP(hasTravois)
PREP(initPerson)
PREP(isObjectOnObject)
PREP(isOnTravois)
PREP(onTravoisPFH)
PREP(packUpTravois)
PREP(removeStretcher)
PREP(setDraggable)
PREP(startDrag)
PREP(startDragPFH)
PREP(startOnTravois)