/*
    Author: [Socrates]
    [Description]
       Sells current selected vehicle.

    Arguments: <nil>

    Return Value: <nil>

    Scope: Clients
    Environment: Any
    Public: No
    Dependencies:
        <ARRAY> HR_GRG_SelectedVehicles

    Example: [] call HR_GRG_fnc_sell;

    License: APL-ND
*/

#include "defines.inc"

HR_GRG_SelectedVehicles params ["_catIndex", "_vehUID", "_class"];
if (_vehUID isEqualTo -1) exitWith {["STR_HR_GRG_Feedback_confirm_NullSelection"] call HR_GRG_fnc_Hint};

//TODO: показывать цену продажи в тултипе
//TODO: сообщение о том, что не удалось продать
//TODO: сообщение или звук о том, что удалось продать и за сколько

[] call HR_GRG_onSellEvent;

//run code on server as HR_GRG_Users is maintained ONLY on the server
[clientOwner, player, "HR_GRG_fnc_removeFromPool"] remoteExecCall ["HR_GRG_fnc_execForGarageUsers", 2];

[true] call HR_GRG_fnc_reloadExtras;

HR_GRG_SelectedVehicles set [2, ""];
[] call HR_GRG_fnc_reloadPreview;

// if (!isNull HR_GRG_previewVeh) then {
//     {
//         if !(_x isEqualTo HR_GRG_previewCam) then {detach _x; deleteVehicle _x};
//     } forEach (attachedObjects HR_GRG_previewVeh);
//     deleteVehicle HR_GRG_previewVeh;
// };

[false] call HR_GRG_fnc_toggleSellBttn;
[false] call HR_GRG_fnc_toggleConfirmBttn;