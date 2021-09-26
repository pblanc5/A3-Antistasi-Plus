#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_state"];

private _display = findDisplay HR_GRG_IDD_Garage;
private _ctrlSell = _display displayCtrl HR_GRG_IDC_Sell;
_ctrlSell ctrlShow _state;