////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = if (worldName == "Tanoa") then {"SDK"} else {"FIA"};
SDKFlag = "Flag_FIA_F";
SDKFlagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
typePetros = "I_G_officer_F";

lootCrate = "Box_Syndicate_Ammo_F";
rallyPointRoot = "B_RadioBag_01_wdl_F";

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military
staticCrewTeamPlayer = "I_G_Soldier_unarmed_F";
SDKUnarmed = "I_G_Survivor_F";
SDKSniper = ["I_G_Sharpshooter_F","I_ghillie_ard_F"];
SDKATman = ["I_G_Soldier_LAT2_F","I_Soldier_LAT2_F"];
SDKMedic = ["I_G_medic_F","I_medic_F"];
SDKMG = ["I_G_Soldier_AR_F","I_Soldier_AR_F"];
SDKExp = ["I_G_Soldier_exp_F","I_Soldier_exp_F"];
SDKGL = ["I_G_Soldier_GL_F","I_Soldier_GL_F"];
SDKMil = ["I_G_Soldier_lite_F","I_Soldier_lite_F"];
SDKSL = ["I_G_Soldier_SL_F","I_Soldier_SL_F"];
SDKEng = ["I_G_engineer_F","I_engineer_F"];

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
groupsSDKmid = [SDKSL,SDKGL,SDKMG,SDKMil];
groupsSDKAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
groupsSDKSquad = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
groupsSDKSquadEng = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
groupsSDKSquadSupp = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic,[staticCrewTeamPlayer,staticCrewTeamPlayer],[staticCrewTeamPlayer,staticCrewTeamPlayer]];
groupsSDKSniper = [SDKSniper,SDKSniper];
groupsSDKSentry = [SDKGL,SDKMil];

//Rebel Unit Tiers (for costs)
sdkTier1 = SDKMil + [staticCrewTeamPlayer] + SDKMG + SDKGL + SDKATman;
sdkTier2 = SDKMedic + SDKExp + SDKEng;
sdkTier3 = SDKSL + SDKSniper;
soldiersSDK = sdkTier1 + sdkTier2 + sdkTier3;

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
vehSDKBike = "CUP_I_TT650_NAPA";
vehSDKLightArmed = "CUP_I_Hilux_DSHKM_IND_G_F";
vehSDKAT = "CUP_I_Hilux_SPG9_IND_G_F";
vehSDKLightUnarmed = "CUP_I_Hilux_unarmed_IND_G_F";
vehSDKTruck = "CUP_V3S_Open_NAPA";
vehSDKPlane = "I_C_Plane_Civil_01_F";
vehSDKBoat = "I_G_Boat_Transport_01_F";
vehSDKRepair = "CUP_I_V3S_Repair_TKG";
vehSDKFuel = "CUP_I_V3S_Refuel_TKG";

//Civilian Vehicles
civCar = "CUP_O_Hilux_unarmed_CR_CIV";
civTruck = "CUP_C_Ural_Civ_03";
civHeli = "CUP_C_Mi17_Civilian_RU";
civBoat = "CUP_C_Fishing_Boat_Chernarus";
civLooter = "CUP_C_V3S_Open_TKC";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "CUP_I_DSHKM_NAPA";
staticATteamPlayer = "CUP_I_SPG9_NAPA";
staticAAteamPlayer = "CUP_I_ZU23_NAPA";
SDKMortar = "CUP_I_2b14_82mm_NAPA";
SDKMortarHEMag = "8Rnd_82mm_Mo_shells";
SDKMortarSmokeMag = "8Rnd_82mm_Mo_Smoke_white";

//Static Weapon Bags
MGStaticSDKB = "CUP_B_DShkM_Gun_Bag";
ATStaticSDKB = "CUP_B_SPG9_Gun_Bag";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "CUP_B_Podnos_Gun_Bag";
//Tall Support
supportStaticsSDKB2 = "CUP_B_DShkM_TripodHigh_Bag";
//Mortar Support
supportStaticsSDKB3 = "CUP_B_Podnos_Bipod_Bag";

////////////////////////////////////
//             ITEMS             ///
////////////////////////////////////
//Mines
ATMineMag = "ATMine_Range_Mag";
APERSMineMag = "APERSMine_Range_Mag";

//Breaching explosives
//Breaching APCs needs one demo charge
breachingExplosivesAPC = [["DemoCharge_Remote_Mag", 1]];
//Breaching tanks needs one satchel charge or two demo charges
breachingExplosivesTank = [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]];

//Starting Unlocks
initialRebelEquipment append ["CUP_hgun_Makarov","CUP_hgun_TaurusTracker455", "CUP_hgun_Colt1911"];

initialRebelEquipment append ["CUP_srifle_CZ550_rail", "CUP_sgun_CZ584", "CUP_sgun_CZ584_RIS"];
initialRebelEquipment append ["CUP_srifle_Remington700", "CUP_smg_saiga9", "hgun_Pistol_Signal_F"];

initialRebelEquipment append ["CUP_6Rnd_45ACP_M", "CUP_8Rnd_9x18_Makarov_M", "CUP_20Rnd_B_765x17_Ball_M", "CUP_7Rnd_45ACP_1911"];
initialRebelEquipment append ["CUP_5x_22_LR_17_HMR_M", "CUP_1Rnd_B_CZ584_74Slug", "CUP_1Rnd_B_CZ584_74Pellets", "CUP_1Rnd_762x51_CZ584"];
initialRebelEquipment append ["CUP_6Rnd_762x51_R700","CUP_10Rnd_9x19_Saiga9", "6Rnd_GreenSignal_F", "6Rnd_RedSignal_F"];
initialRebelEquipment append ["SmokeShell", "MiniGrenade", "Chemlight_green"];

initialRebelEquipment append ["B_Messenger_Gray_F", "B_AssaultPack_blk", "CUP_B_ACRScout_m95"];
initialRebelEquipment append ["CUP_V_O_Ins_Carrier_Rig_Com", "CUP_V_B_ALICE", "CUP_V_O_Ins_Carrier_Rig_MG", "CUP_V_O_Ins_Carrier_Rig_Light", "CUP_V_I_Guerilla_Jacket"];
initialRebelEquipment append ["Binocular", "acc_flashlight", "Laserbatteries"];

allRebelUniforms append ["CUP_U_O_Partisan_TTsKO",
    "CUP_U_O_Partisan_TTsKO_Mixed",
    "CUP_U_O_Partisan_VSR_Mixed1",
    "CUP_U_O_Partisan_VSR_Mixed2",
    "CUP_U_I_GUE_Woodland1",
    "CUP_U_I_GUE_Flecktarn4",
    "CUP_U_I_GUE_Flecktarn",
    "CUP_U_I_GUE_Flecktarn3",
    "CUP_U_I_GUE_Flecktarn2",
    "CUP_U_I_Ghillie_Top",
    "CUP_U_I_GUE_WorkU_02",
    "CUP_U_I_GUE_WorkU_01",
    "CUP_U_I_GUE_Anorak_02",
    "CUP_U_I_GUE_Anorak_03",
    "CUP_U_I_GUE_Anorak_01",
    "CUP_U_O_CHDKZ_Lopotev",
    "CUP_U_O_CHDKZ_Bardak"
];

//TFAR Unlocks
if (hasTFAR) then {initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (hasTFAR && startWithLongRangeRadio) then {initialRebelEquipment pushBack "tf_anprc155"};

//black market stuff
//3 tiers except UAV
shop_UAV = ["I_UAV_01_F"];
shop_AA = ["CUP_B_ZSU23_Afghan_CDF", "CUP_B_M163_USA", "CUP_O_2S6_RU"];
shop_MRAP = ["CUP_I_BRDM2_HQ_NAPA", "CUP_I_BRDM2_NAPA", "CUP_B_RG31_M2_OD_USA"];
shop_wheel_apc = ["CUP_B_BTR60_FIA", "CUP_B_BTR80_FIA", "CUP_I_LAV25M240_RACS"];
shop_track_apc = ["CUP_B_MTLB_pk_FIA", "CUP_I_BMP1_TK_GUE", "CUP_I_BMP2_NAPA"];
shop_heli = ["CUP_I_Ka60_GL_Blk_ION", "CUP_I_Wildcat_Green_AAF", "I_Heli_light_03_dynamicLoadout_F"];
shop_tank = ["CUP_I_T34_NAPA", "CUP_I_T55_NAPA", "CUP_B_M60A3_USMC"];
shop_plane = ["CUP_I_L39_AAF", "I_Plane_Fighter_03_dynamicLoadout_F", "CUP_I_AV8B_DYN_AAF"];

additionalShopLight = ["CUP_B_HMMWV_M1114_USMC", "CUP_B_Jackal2_L2A1_FIA", "CUP_B_M1165_GMV_USMC"];
additionalShopAtgmVehicles = ["CUP_B_UAZ_METIS_ACR", "CUP_B_M1167_USMC", "CUP_I_BRDM2_ATGM_NAPA"];
additionalShopManpadsVehicles = ["CUP_B_UAZ_AA_CDF", "CUP_O_LR_AA_TKM",  "CUP_B_HMMWV_Avenger_USMC"];
additionalShopArtillery = ["CUP_I_Hilux_podnos_IND_G_F", "CUP_I_Hilux_UB32_IND_G_F", "CUP_I_Hilux_MLRS_IND_G_F"];

//technical menu content, CUP exclusive
techicalAa = "CUP_I_Ural_ZU23_NAPA";
vehSDKLightUnarmedArmored = "CUP_I_Hilux_armored_unarmed_IND_G_F";
technicalArmoredBtr = "CUP_I_Hilux_armored_BTR60_IND_G_F";
technicalArmoredAa = "CUP_I_Hilux_armored_zu23_IND_G_F";
technicalArmoredSpg = "CUP_I_Hilux_armored_SPG9_IND_G_F";
technicalArmoredMg = "CUP_I_Hilux_armored_DSHKM_IND_G_F";

//military building models (common for all sides)
smallBunker = "Land_BagBunker_Small_F";
sandbag = "Land_BagFence_Long_F";