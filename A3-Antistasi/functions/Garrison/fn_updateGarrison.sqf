params ["_type", "_marker"];

/*  Checks for updates and updates the garrison if needed. SHOULD BE CALLED AFTER EVERY DESPAWN
*   Params
*     _type : STRING : The type of the marker
*     _marker : STRING : The marker name
*
*   Returns:
*     Nothing
*/

private _fileName = "updateGarrison";

private _preferred = garrison getVariable (format ["%1_preference", _type]);
private _garrison = garrison getVariable (format ["%1_garrison", _marker]);
private _requested = garrison getVariable (format ["%1_requested", _marker]);
private _side = garrison getVariable [_marker, sideUnknown];

private _replaced = [];

if(_side == sideUnknown) exitWith
{
    [2, format ["Could not load side for marker %1", _marker], _fileName] call A3A_fnc_log;
};

for "_i" from 0 to ((count _preferred) - 1) do
{
    private _garData = _garrison select _i;
    private _reqData = _requested select _i;
    private _preData = _preferred select _i;

    private _newVehicle = "";

    //Update the vehicle if needed
    if((_garData select 0) == "") then
    {
        //Vehicle is currently killed or there was never one
        if(![_reqData select 0, _preData select 0] call A3A_fnc_checkVehicleType) then
        {
            //Current reinforcements are not matching the wanted type, setting right one
            _newVehicle = [_preData select 0, _side] call A3A_fnc_selectVehicleType;
            _reqData set [0, _newVehicle];
        };
    }
    else
    {
        //Vehicle is currently at the marker
        if(![_garData select 0, _preData select 0] call A3A_fnc_checkVehicleType) then
        {
            //Current reinforcements are not matching the wanted type, setting right one
            _newVehicle = [_preData select 0, _side] call A3A_fnc_selectVehicleType;
            //Save the replaced vehicle (it should not vanish suddenly)
            _replaced pushBack (_garData select 0);
            _garData set [0, _newVehicle];
        };
    };

    if(_newVehicle != "") then
    {
        //Update crew only when vehicle is updated too
        private _garCrew = _garData select 1;
        private _reqCrew = _reqData select 1;
        private _crewNeeded = [_newVehicle] call BIS_fnc_crewCount;
        private _crewReqCount = {_x != ""} count _reqCrew;
        private _crewGarCount = {_x != ""} count _garCrew;
        private _crewAvailable = _crewReqCount + _crewGarCount;
        private _diff = _crewNeeded - _crewAvailable;
        private _crew = if(_side == Occupants) then {NATOCrew} else {CSATCrew};

        if(_diff > 0) then
        {
            //Vehicle needs more crew than the amount currently available
            for "_i" from 1 to _diff do
            {
                //Filling up the amount of needed crew into the requested
                _reqCrew pushBack _crew;
                _garCrew pushBack "";
            };
        } else
        {
            if(_diff < 0) then
            {
                //We have more crew units than we actually need, remove some
                //I don't like this case at all... Not sure if it is even possible
                //Is there a tank that uses less crew than an APC or an APC with less crew than a car?

                [
                    2,
                    "A strange case has appeared, please report this to wurzel on the official discord!",
                    _fileName
                ] call A3A_fnc_log;

                //Getting rid of the minus
                _diff = abs _diff;

                if(_diff < _crewReqCount) then
                {
                    //We have more crew units requested than we need, delete the request
                    for "_i" from 1 to (_crewReqCount - (abs _diff)) do
                    {
                        //Find if to return the first possible, saving time
                        private _crewIndex = _reqCrew findIf {_x != ""};
                        //If a -1 case occurs the logic before here is somehow wrong

                        //Delete entries on both arrays
                        _reqCrew deleteAt _crewIndex;
                        _garCrew deleteAt _crewIndex;
                    };
                }
                else
                {
                    private _garToDelete = _diff - _crewReqCount;
                    private _crewIndex = 0;
                    while {_crewIndex < (count _garCrew)} do
                    {
                        if((_garCrew select _crewIndex) == "") then
                        {
                            //Unit is currently requested, delete
                            _garCrew deleteAt _crewIndex;
                            _reqCrew deleteAt _crewIndex;
                        }
                        else
                        {
                            if(_garToDelete > 0) then
                            {
                                //Unit is there, but we are still deleting
                                _garCrew deleteAt _crewIndex;
                                _reqCrew deleteAt _crewIndex;
                                _garToDelete = _garToDelete - 1;
                                _replaced pushBack _crew;
                            }
                            else
                            {
                                //Unit is there, but we deleted enough alive units
                                _crewIndex = _crewIndex + 1;
                            };
                        };
                    };
                };
            };
        };

        //Update group if vehicle has been updated
        if(![_garData select 2, _newVehicle, _preData select 2] call A3A_fnc_checkGroupType) then
        {
            {
                //Alive units are saved
                if(_x != "") then
                {
                    _replaced pushBack _x;
                };
            } forEach (_garData select 2);

            //Fill up reqData with the squad and garData with the same amount of empty slots
            _reqData set [2, [_newVehicle, _preData select 2, _side] call A3A_fnc_selectGroupType];
            _garData set [2, []];
            for "_i" from 1 to (count (_reqData select 2)) do
            {
                (_garData select 2) pushBack "";
            };
        };
    };
};

//TODO _replaced still holds unit which needs to be added to the garrison as over units
