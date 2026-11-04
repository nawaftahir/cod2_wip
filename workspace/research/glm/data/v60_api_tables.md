# v60 (1.0) Engine <-> Renderer API Slot Tables

Recovered from `Refrences/opencod2` v60 adapters. `refexport` is the table the **retail 1.0 DLL fills** in `GetRefAPI` (768 bytes = 192 slots). `refimport` is the table the engine passes **to** the DLL (181 slots).

## refexport_v60 (renderer -> engine callable; naming target inside the DLL)

| slot | name | source | confidence |
|---|---|---|---|
| 0 | Shutdown | kReV60: refexport_t[0]->v60 | mapped |
| 1 | BeginRegistration | kReV60: refexport_t[1]->v60 | mapped |
| 2 | RegisterModel | kReV60: refexport_t[2]->v60 | mapped |
| 3 | RegisterInlineModel | kReV60: refexport_t[3]->v60 | mapped |
| 4 | RegisterMaterial | kReV60: refexport_t[4]->v60 | mapped |
| 5 | RegisterRawImage | kReV60: refexport_t[5]->v60 | mapped |
| 6 | Material_IsDefault | kReV60: refexport_t[6]->v60 | mapped |
| 7 | LoadWorld | kReV60: refexport_t[7]->v60 | mapped |
| 8 | GetWorldBounds | kReV60: refexport_t[8]->v60 | mapped |
| 9 | FinishLoadingModels | kReV60: refexport_t[9]->v60 | mapped |
| 10 | SetIgnorePrecacheErrors | kReV60: refexport_t[10]->v60 | mapped |
| 11 | GetIgnorePrecacheErrors | kReV60: refexport_t[11]->v60 | mapped |
| 12 | GetMinSpecImageMemory | kReV60: refexport_t[12]->v60 | mapped |
| 13 | GetMaterialName | kReV60: refexport_t[13]->v60 | mapped |
| 14 | GetMaterialSubimageCount | kReV60: refexport_t[14]->v60 | mapped |
| 15 | IsMaterialRefractive | kReV60: refexport_t[15]->v60 | mapped |
| 16 | GetFarPlaneDist | kReV60: refexport_t[16]->v60 | mapped |
| 17 | EndRegistration | kReV60: refexport_t[17]->v60 | mapped |
| 18 | ClearScene | kReV60: refexport_t[18]->v60 | mapped |
| 19 | AddPolyToScene | kReV60: refexport_t[20]->v60 | mapped |
| 20 | R_AddRefEntityToScene | v60 adapter: dst[20] = R_AddRefEntityToScene | certain |
| 21 | AddLightToScene | kReV60: refexport_t[21]->v60 | mapped |
| 22 | ri[178] callback | v60 adapter: dst[22] = rimp[178] | certain |
| 23 | ri[177] callback | v60 adapter: dst[23] = rimp[177] | certain |
| 24 | noop (v60: unused) | v60 adapter: dst[24] = v60_noop | certain |
| 25 | DefaultVertexFrames | kReV60: refexport_t[19]->v60 | mapped |
| 26 | AddPolyToScene | dst[26] = re59[20] | certain |
| 27 | AddLightToScene | dst[27] = re59[21] | certain |
| 28 | InterpretSunLightParseParams | kReV60: refexport_t[22]->v60 | mapped |
| 29 | ResetSunLightParseParams | kReV60: refexport_t[23]->v60 | mapped |
| 30 | SetCullDist | kReV60: refexport_t[24]->v60 | mapped |
| 31 | SetFog | kReV60: refexport_t[25]->v60 | mapped |
| 32 | SwitchFog | kReV60: refexport_t[26]->v60 | mapped |
| 33 | ArchiveFogState | kReV60: refexport_t[27]->v60 | mapped |
| 34 | ClearFogs | kReV60: refexport_t[28]->v60 | mapped |
| 35 | SetSunLightOverride | kReV60: refexport_t[29]->v60 | mapped |
| 36 | ResetSunLightOverride | kReV60: refexport_t[30]->v60 | mapped |
| 37 | RenderScene | kReV60: refexport_t[31]->v60 | mapped |
| 38 | BeginDelayedDrawing | kReV60: refexport_t[32]->v60 | mapped |
| 39 | EndDelayedDrawing | kReV60: refexport_t[33]->v60 | mapped |
| 40 | IssueDelayedDrawing | kReV60: refexport_t[34]->v60 | mapped |
| 41 | ClearFlares | kReV60: refexport_t[35]->v60 | mapped |
| 42 | SetMaterialColor | kReV60: refexport_t[36]->v60 | mapped |
| 43 | DrawStretchPic | kReV60: refexport_t[37]->v60 | mapped |
| 44 | DrawStretchPicRotate | kReV60: refexport_t[38]->v60 | mapped |
| 45 | DrawStretchRaw | kReV60: refexport_t[39]->v60 | mapped |
| 46 | DrawQuadPic | kReV60: refexport_t[40]->v60 | mapped |
| 47 | DrawSprite | kReV60: refexport_t[41]->v60 | mapped |
| 48 | BeginFrame | kReV60: refexport_t[42]->v60 | mapped |
| 49 | EndFrame | kReV60: refexport_t[43]->v60 | mapped |
| 50 | BeginDebugFrame | kReV60: refexport_t[44]->v60 | mapped |
| 51 | EndDebugFrame | kReV60: refexport_t[45]->v60 | mapped |
| 52 | EndView | kReV60: refexport_t[46]->v60 | mapped |
| 53 | DoneRenderingViews | kReV60: refexport_t[47]->v60 | mapped |
| 54 | SaveScreen | kReV60: refexport_t[48]->v60 | mapped |
| 55 | BlendSavedScreen | kReV60: refexport_t[49]->v60 | mapped |
| 56 | ClearScreen | kReV60: refexport_t[50]->v60 | mapped |
| 57 | SetViewport | kReV60: refexport_t[51]->v60 | mapped |
| 58 | MarkFragments | kReV60: refexport_t[52]->v60 | mapped |
| 59 | ModelBounds | kReV60: refexport_t[53]->v60 | mapped |
| 60 | TrackStatistics | kReV60: refexport_t[54]->v60 | mapped |
| 61 | PickMaterial | kReV60: refexport_t[55]->v60 | mapped |
| 62 | RegisterFont | kReV60: refexport_t[56]->v60 | mapped |
| 63 | ResetImageAllocations | kReV60: refexport_t[57]->v60 | mapped |
| 64 | FreeImageAllocations | kReV60: refexport_t[58]->v60 | mapped |
| 65 | BeginCubemapShot | kReV60: refexport_t[59]->v60 | mapped |
| 66 | EndCubemapShot | kReV60: refexport_t[60]->v60 | mapped |
| 67 | SaveCubemapShot | kReV60: refexport_t[61]->v60 | mapped |
| 68 | LightingFromCubemapShots | kReV60: refexport_t[62]->v60 | mapped |
| 69 | LocateDebugStrings | kReV60: refexport_t[63]->v60 | mapped |
| 70 | LocateDebugLines | kReV60: refexport_t[64]->v60 | mapped |
| 71 | AddPlume | kReV60: refexport_t[65]->v60 | mapped |
| 72 | ShutdownDebug | kReV60: refexport_t[66]->v60 | mapped |
| 73 | UpdateColor | kReV60: refexport_t[67]->v60 | mapped |
| 74 | NormalizedTextScale | kReV60: refexport_t[68]->v60 | mapped |
| 75 | TextWidth | kReV60: refexport_t[69]->v60 | mapped |
| 76 | TextHeight | kReV60: refexport_t[70]->v60 | mapped |
| 77 | DrawText | kReV60: refexport_t[71]->v60 | mapped |
| 78 | DrawTextInSpace | kReV60: refexport_t[72]->v60 | mapped |
| 79 | ConsoleTextWidth | kReV60: refexport_t[73]->v60 | mapped |
| 80 | DrawConsoleText | kReV60: refexport_t[74]->v60 | mapped |
| 81 | DrawTextWithCursor | dst[81] = src[75] (dup) | certain |
| 82 | DObjGetSurfMaterials | kReV60: refexport_t[76]->v60 | mapped |
| 83 | DObjReplaceMaterial | kReV60: refexport_t[77]->v60 | mapped |
| 84 | ParseSunLight | kReV60: refexport_t[78]->v60 | mapped |
| 85 | Material_Duplicate | kReV60: refexport_t[79]->v60 | mapped |
| 86 | DuplicateFont | kReV60: refexport_t[80]->v60 | mapped |
| 87 | **UNKNOWN** |  | unknown |
| 88 | **UNKNOWN** |  | unknown |
| 89 | **UNKNOWN** |  | unknown |
| 90 | **UNKNOWN** |  | unknown |
| 91 | **UNKNOWN** |  | unknown |
| 92 | **UNKNOWN** |  | unknown |
| 93 | **UNKNOWN** |  | unknown |
| 94 | **UNKNOWN** |  | unknown |
| 95 | **UNKNOWN** |  | unknown |
| 96 | **UNKNOWN** |  | unknown |
| 97 | R_LoadXModelSurfsSurface | v60 adapter: dst[97] | certain |
| 98 | R_RegisterXModelSurfs | v60 adapter: dst[98] | certain |
| 99 | **UNKNOWN** |  | unknown |
| 100 | **UNKNOWN** |  | unknown |
| 101 | **UNKNOWN** |  | unknown |
| 102 | **UNKNOWN** |  | unknown |
| 103 | SyncRenderThread | kReV60: refexport_t[82]->v60 | mapped |
| 104 | AbortRenderCommands | kReV60: refexport_t[83]->v60 | mapped |
| 105 | IsGpuFenceFinished | kReV60: refexport_t[84]->v60 | mapped |
| 106 | GpuWaited | kReV60: refexport_t[86]->v60 | mapped |
| 107 | SetLodOrigin | kReV60: refexport_t[87]->v60 | mapped |
| 108 | **UNKNOWN** |  | unknown |
| 109 | **UNKNOWN** |  | unknown |
| 110 | **UNKNOWN** |  | unknown |
| 111 | **UNKNOWN** |  | unknown |
| 112 | **UNKNOWN** |  | unknown |
| 113 | **UNKNOWN** |  | unknown |
| 114 | **UNKNOWN** |  | unknown |
| 115 | **UNKNOWN** |  | unknown |
| 116 | **UNKNOWN** |  | unknown |
| 117 | **UNKNOWN** |  | unknown |
| 118 | **UNKNOWN** |  | unknown |
| 119 | **UNKNOWN** |  | unknown |
| 120 | **UNKNOWN** |  | unknown |
| 121 | **UNKNOWN** |  | unknown |
| 122 | **UNKNOWN** |  | unknown |
| 123 | **UNKNOWN** |  | unknown |
| 124 | **UNKNOWN** |  | unknown |
| 125 | **UNKNOWN** |  | unknown |
| 126 | **UNKNOWN** |  | unknown |
| 127 | **UNKNOWN** |  | unknown |
| 128 | **UNKNOWN** |  | unknown |
| 129 | **UNKNOWN** |  | unknown |
| 130 | **UNKNOWN** |  | unknown |
| 131 | **UNKNOWN** |  | unknown |
| 132 | **UNKNOWN** |  | unknown |
| 133 | **UNKNOWN** |  | unknown |
| 134 | **UNKNOWN** |  | unknown |
| 135 | **UNKNOWN** |  | unknown |
| 136 | **UNKNOWN** |  | unknown |
| 137 | **UNKNOWN** |  | unknown |
| 138 | **UNKNOWN** |  | unknown |
| 139 | **UNKNOWN** |  | unknown |
| 140 | **UNKNOWN** |  | unknown |
| 141 | **UNKNOWN** |  | unknown |
| 142 | **UNKNOWN** |  | unknown |
| 143 | **UNKNOWN** |  | unknown |
| 144 | **UNKNOWN** |  | unknown |
| 145 | **UNKNOWN** |  | unknown |
| 146 | **UNKNOWN** |  | unknown |
| 147 | **UNKNOWN** |  | unknown |
| 148 | **UNKNOWN** |  | unknown |
| 149 | **UNKNOWN** |  | unknown |
| 150 | **UNKNOWN** |  | unknown |
| 151 | **UNKNOWN** |  | unknown |
| 152 | **UNKNOWN** |  | unknown |
| 153 | **UNKNOWN** |  | unknown |
| 154 | **UNKNOWN** |  | unknown |
| 155 | **UNKNOWN** |  | unknown |
| 156 | **UNKNOWN** |  | unknown |
| 157 | **UNKNOWN** |  | unknown |
| 158 | **UNKNOWN** |  | unknown |
| 159 | **UNKNOWN** |  | unknown |
| 160 | **UNKNOWN** |  | unknown |
| 161 | **UNKNOWN** |  | unknown |
| 162 | **UNKNOWN** |  | unknown |
| 163 | **UNKNOWN** |  | unknown |
| 164 | **UNKNOWN** |  | unknown |
| 165 | **UNKNOWN** |  | unknown |
| 166 | **UNKNOWN** |  | unknown |
| 167 | **UNKNOWN** |  | unknown |
| 168 | **UNKNOWN** |  | unknown |
| 169 | **UNKNOWN** |  | unknown |
| 170 | **UNKNOWN** |  | unknown |
| 171 | **UNKNOWN** |  | unknown |
| 172 | **UNKNOWN** |  | unknown |
| 173 | **UNKNOWN** |  | unknown |
| 174 | **UNKNOWN** |  | unknown |
| 175 | **UNKNOWN** |  | unknown |
| 176 | **UNKNOWN** |  | unknown |
| 177 | **UNKNOWN** |  | unknown |
| 178 | **UNKNOWN** |  | unknown |
| 179 | **UNKNOWN** |  | unknown |
| 180 | **UNKNOWN** |  | unknown |
| 181 | **UNKNOWN** |  | unknown |
| 182 | **UNKNOWN** |  | unknown |
| 183 | **UNKNOWN** |  | unknown |
| 184 | **UNKNOWN** |  | unknown |
| 185 | **UNKNOWN** |  | unknown |
| 186 | **UNKNOWN** |  | unknown |
| 187 | **UNKNOWN** |  | unknown |
| 188 | **UNKNOWN** |  | unknown |
| 189 | **UNKNOWN** |  | unknown |
| 190 | **UNKNOWN** |  | unknown |
| 191 | **UNKNOWN** |  | unknown |

## refimport_v60 (engine -> renderer callbacks the DLL calls through)

| slot | name | source | confidence |
|---|---|---|---|
| 0 | Printf | refimport_t[0] | mapped |
| 1 | Error | refimport_t[1] | mapped |
| 2 | Milliseconds | refimport_t[2] | mapped |
| 3 | Hunk_AllocInternal | refimport_t[3] | mapped |
| 4 | Hunk_AllocateTempMemoryInternal | refimport_t[4] | mapped |
| 5 | Z_MallocInternal | refimport_t[5] | mapped |
| 6 | Z_FreeInternal | refimport_t[6] | mapped |
| 7 | Hunk_AllocAlignInternal | refimport_t[7] | mapped |
| 8 | Z_VirtualReserveInternal | refimport_t[8] | mapped |
| 9 | Z_VirtualCommitInternal | refimport_t[9] | mapped |
| 10 | Z_VirtualDecommitInternal | refimport_t[10] | mapped |
| 11 | Z_VirtualFreeInternal | refimport_t[11] | mapped |
| 12 | Hunk_FreeTempMemory | refimport_t[12] | mapped |
| 13 | Hunk_ClearTempMemory | refimport_t[13] | mapped |
| 14 | Hunk_HideTempMemory | refimport_t[14] | mapped |
| 15 | Hunk_ShowTempMemory | refimport_t[15] | mapped |
| 16 | Hunk_AllocateTempMemoryHighInternal | refimport_t[16] | mapped |
| 17 | Hunk_ClearTempMemoryHigh | refimport_t[17] | mapped |
| 18 | HiAlloc | gfx_dll_v60.c override | certain |
| 19 | HiSetOffset | gfx_dll_v60.c override | certain |
| 20 | HiOffToPtr | gfx_dll_v60.c override | certain |
| 21 | Sys_DirectXFatalError | gfx_dll_v60.c override | certain |
| 22 | ShowWindow | gfx_dll_v60.c override | certain |
| 23 | HideWindow | gfx_dll_v60.c override | certain |
| 24 | PumpMessages | gfx_dll_v60.c override | certain |
| 25 | Dvar_FindVar | gfx_dll_v60.c override | certain |
| 26 | Dvar_RegisterBool | refimport_t[22] | mapped |
| 27 | Dvar_RegisterInt | refimport_t[23] | mapped |
| 28 | Dvar_RegisterFloat | refimport_t[24] | mapped |
| 29 | Dvar_RegisterString | refimport_t[25] | mapped |
| 30 | Dvar_RegisterEnum | refimport_t[26] | mapped |
| 31 | Dvar_RegisterColor | refimport_t[27] | mapped |
| 32 | Dvar_RegisterVec2 | refimport_t[28] | mapped |
| 33 | Dvar_RegisterVec3 | refimport_t[29] | mapped |
| 34 | Dvar_RegisterVec4 | refimport_t[30] | mapped |
| 35 | Dvar_UnregisterSystem | refimport_t[31] | mapped |
| 36 | Dvar_ChangeResetValue | refimport_t[32] | mapped |
| 37 | Dvar_IsAtDefaultValue | refimport_t[33] | mapped |
| 38 | Dvar_ClearModified | refimport_t[34] | mapped |
| 39 | Dvar_SetModified | refimport_t[35] | mapped |
| 40 | Dvar_UpdateEnumDomain | refimport_t[36] | mapped |
| 41 | Dvar_SetBool | refimport_t[37] | mapped |
| 42 | Dvar_SetInt | refimport_t[38] | mapped |
| 43 | Dvar_SetFloat | refimport_t[39] | mapped |
| 44 | Dvar_SetString | refimport_t[40] | mapped |
| 45 | Dvar_SetColor | refimport_t[41] | mapped |
| 46 | Dvar_SetVec2 | refimport_t[42] | mapped |
| 47 | Dvar_SetVec3 | refimport_t[43] | mapped |
| 48 | Dvar_SetVec4 | refimport_t[44] | mapped |
| 49 | Dvar_SetFromString | refimport_t[45] | mapped |
| 50 | Dvar_SetBoolByName | refimport_t[46] | mapped |
| 51 | Dvar_SetIntByName | refimport_t[47] | mapped |
| 52 | Dvar_SetFloatByName | refimport_t[48] | mapped |
| 53 | Dvar_SetStringByName | refimport_t[49] | mapped |
| 54 | Dvar_SetColorByName | refimport_t[50] | mapped |
| 55 | Dvar_SetVec2ByName | refimport_t[51] | mapped |
| 56 | Dvar_SetVec3ByName | refimport_t[52] | mapped |
| 57 | Dvar_SetVec4ByName | refimport_t[53] | mapped |
| 58 | Dvar_SetFromStringByName | refimport_t[54] | mapped |
| 59 | Dvar_GetBool | refimport_t[55] | mapped |
| 60 | Dvar_GetInt | refimport_t[56] | mapped |
| 61 | Dvar_GetFloat | refimport_t[57] | mapped |
| 62 | Dvar_GetString | refimport_t[58] | mapped |
| 63 | Dvar_GetVariantString | refimport_t[59] | mapped |
| 64 | Dvar_EnumToString | refimport_t[60] | mapped |
| 65 | Dvar_Reset | refimport_t[61] | mapped |
| 66 | Cmd_AddCommand | refimport_t[62] | mapped |
| 67 | Cmd_RemoveCommand | refimport_t[63] | mapped |
| 68 | Cmd_Argc | refimport_t[64] | mapped |
| 69 | Cmd_Argv | refimport_t[65] | mapped |
| 70 | Cbuf_ExecuteText | refimport_t[66] | mapped |
| 71 | Com_SaveDvarsToBuffer | refimport_t[67] | mapped |
| 72 | Com_LoadDvarsFromBuffer | refimport_t[68] | mapped |
| 73 | Com_GetBsp | refimport_t[69] | mapped |
| 74 | SEH_ReadCharFromString | refimport_t[70] | mapped |
| 75 | CL_UpdateDebugData | refimport_t[71] | mapped |
| 76 | CL_FlushDebugData | refimport_t[72] | mapped |
| 77 | StatMon_Warning | refimport_t[73] | mapped |
| 78 | FS_ReadFile | refimport_t[74] | mapped |
| 79 | FS_FreeFile | refimport_t[75] | mapped |
| 80 | FS_FOpenFileRead | refimport_t[76] | mapped |
| 81 | FS_ListFiles | refimport_t[77] | mapped |
| 82 | FS_FreeFileList | refimport_t[78] | mapped |
| 83 | FS_FileExists | refimport_t[79] | mapped |
| 84 | FS_WriteFile | refimport_t[80] | mapped |
| 85 | FS_FOpenFileByMode | refimport_t[81] | mapped |
| 86 | FS_FCloseFile | refimport_t[82] | mapped |
| 87 | FS_Read | refimport_t[83] | mapped |
| 88 | FS_Write | refimport_t[84] | mapped |
| 89 | CM_SaveLump | refimport_t[85] | mapped |
| 90 | CM_BoxTrace | refimport_t[86] | mapped |
| 91 | CM_BoxSightTrace | refimport_t[87] | mapped |
| 92 | CM_RayTriangleIntersect | refimport_t[88] | mapped |
| 93 | XModelPrecache | refimport_t[89] | mapped |
| 94 | XModelGetSurfaces | refimport_t[90] | mapped |
| 95 | XModelBad | refimport_t[91] | mapped |
| 96 | Hunk_OverrideDataForFile | refimport_t[92] | mapped |
| 97 | XModelGetNumLods | refimport_t[93] | mapped |
| 98 | XModelSetTestLods | refimport_t[94] | mapped |
| 99 | XModelGetLodForDist | refimport_t[95] | mapped |
| 100 | XModelGetLodOutDist | refimport_t[96] | mapped |
| 101 | XModelGetSurfaceName | refimport_t[97] | mapped |
| 102 | XModelGetName | refimport_t[98] | mapped |
| 103 | XModelGetFlags | refimport_t[99] | mapped |
| 104 | XModelNumBones | refimport_t[100] | mapped |
| 105 | XModelGetSkins | refimport_t[101] | mapped |
| 106 | XModelGetMemUsage | refimport_t[102] | mapped |
| 107 | XModelGetLodName | refimport_t[103] | mapped |
| 108 | XModelGetBasePose | refimport_t[104] | mapped |
| 109 | XModelGetBasePoseBone | refimport_t[105] | mapped |
| 110 | DObjBad | refimport_t[106] | mapped |
| 111 | DB_EnumXAssets | gfx_dll_v60.c override | certain |
| 112 | GetThreadData | gfx_dll_v60.c override | certain |
| 113 | CurThreadId | gfx_dll_v60.c override | certain |
| 114 | IsWorker | gfx_dll_v60.c override | certain |
| 115 | ResumeWorker | gfx_dll_v60.c override | certain |
| 116 | InitWorker | gfx_dll_v60.c override | certain |
| 117 | UNK_m114 | gfx_dll_v60.c override | certain |
| 118 | UNK_m115 | gfx_dll_v60.c override | certain |
| 119 | UNK_m116 | gfx_dll_v60.c override | certain |
| 120 | UNK_m117 | gfx_dll_v60.c override | certain |
| 121 | UNK_m118 | gfx_dll_v60.c override | certain |
| 122 | UNK_m119 | gfx_dll_v60.c override | certain |
| 123 | UNK_m120 | gfx_dll_v60.c override | certain |
| 124 | UNK_m121 | gfx_dll_v60.c override | certain |
| 125 | UNK_m122 | gfx_dll_v60.c override | certain |
| 126 | DObjGetBounds | refimport_t[108] | mapped |
| 127 | DObjGetSurface | refimport_t[109] | mapped |
| 128 | DObjGetNumModels | refimport_t[110] | mapped |
| 129 | DObjGetNumSurfaces | refimport_t[111] | mapped |
| 130 | DObjGetSurfaces | refimport_t[112] | mapped |
| 131 | DObjGetPartBits | refimport_t[113] | mapped |
| 132 | DObjGetRotTransArray | refimport_t[114] | mapped |
| 133 | DObjSkelAreBonesUpToDate | refimport_t[115] | mapped |
| 134 | DObjGetMatOffset | refimport_t[116] | mapped |
| 135 | DObjGetModel | refimport_t[117] | mapped |
| 136 | DObjGetSurfaceName | refimport_t[118] | mapped |
| 137 | DObjCreate | refimport_t[119] | mapped |
| 138 | DObjGetAllocSkelSize | refimport_t[120] | mapped |
| 139 | DObjCreateSkel | refimport_t[121] | mapped |
| 140 | DObjCalcSkel | refimport_t[123] | mapped |
| 141 | DObjCalcAnim | refimport_t[122] | mapped |
| 142 | DObjNumBones | refimport_t[124] | mapped |
| 143 | DObjGetBoneInfo | refimport_t[125] | mapped |
| 144 | DObjGetLodForDist | refimport_t[126] | mapped |
| 145 | DObjGetLodOutDist | refimport_t[127] | mapped |
| 146 | DObjCompleteHierarchyBits | refimport_t[128] | mapped |
| 147 | DObjSetModel | refimport_t[129] | mapped |
| 148 | CIN_RunCinematic | refimport_t[132] | mapped |
| 149 | UNK_THUNK_149 | gfxV60Thunks | thunk |
| 150 | UNK_THUNK_150 | gfxV60Thunks | thunk |
| 151 | CG_DObjCalcPose | refimport_t[133] | mapped |
| 152 | UNK_THUNK_152 | gfxV60Thunks | thunk |
| 153 | UNK_THUNK_153 | gfxV60Thunks | thunk |
| 154 | UNK_THUNK_154 | gfxV60Thunks | thunk |
| 155 | UNK_THUNK_155 | gfxV60Thunks | thunk |
| 156 | UNK_THUNK_156 | gfxV60Thunks | thunk |
| 157 | UNK_THUNK_157 | gfxV60Thunks | thunk |
| 158 | UNK_THUNK_158 | gfxV60Thunks | thunk |
| 159 | CM_GetPlaneNum | gfx_dll_v60.c override | certain |
| 160 | UNK_THUNK_160 | gfxV60Thunks | thunk |
| 161 | UNK_THUNK_161 | gfxV60Thunks | thunk |
| 162 | UNK_THUNK_162 | gfxV60Thunks | thunk |
| 163 | UNK_THUNK_163 | gfxV60Thunks | thunk |
| 164 | UNK_THUNK_164 | gfxV60Thunks | thunk |
| 165 | UNK_THUNK_165 | gfxV60Thunks | thunk |
| 166 | UNK_THUNK_166 | gfxV60Thunks | thunk |
| 167 | UNK_THUNK_167 | gfxV60Thunks | thunk |
| 168 | UNK_THUNK_168 | gfxV60Thunks | thunk |
| 169 | UNK_THUNK_169 | gfxV60Thunks | thunk |
| 170 | UNK_THUNK_170 | gfxV60Thunks | thunk |
| 171 | UNK_THUNK_171 | gfxV60Thunks | thunk |
| 172 | UNK_THUNK_172 | gfxV60Thunks | thunk |
| 173 | UNK_THUNK_173 | gfxV60Thunks | thunk |
| 174 | UNK_THUNK_174 | gfxV60Thunks | thunk |
| 175 | UNK_THUNK_175 | gfxV60Thunks | thunk |
| 176 | UNK_THUNK_176 | gfxV60Thunks | thunk |
| 177 | UNK_THUNK_177 | gfxV60Thunks | thunk |
| 178 | UNK_THUNK_178 | gfxV60Thunks | thunk |
| 179 | UNK_THUNK_179 | gfxV60Thunks | thunk |
| 180 | UNK_THUNK_180 | gfxV60Thunks | thunk |
