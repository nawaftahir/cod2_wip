// 10013270 size=1051 GetRefAPI

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 * GetRefAPI(int param_1,dword *param_2)

{
  int iVar1;
  dword *pdVar2;
  undefined4 *puVar3;
  
  pdVar2 = &RI_Printf;
                    /* 0x13270  1  GetRefAPI */
  for (iVar1 = 0xa9; iVar1 != 0; iVar1 = iVar1 + -1) {
    *pdVar2 = *param_2;
    param_2 = param_2 + 1;
    pdVar2 = pdVar2 + 1;
  }
  puVar3 = &DAT_1076a880;
  for (iVar1 = 0x6c; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  if (param_1 != 0x3b) {
    (*(code *)RI_Printf)(0,"Mismatched REF_API_VERSION: expected %i, got %i\n",0x3b,param_1);
    return (undefined4 *)0x0;
  }
  DAT_1076a880 = R_Shutdown;
  DAT_1076a884 = R_BeginRegistration;
  _DAT_1076a888 = R_RegisterModel;
  _DAT_1076a88c = R_RegisterInlineModel;
  _DAT_1076a8b0 = R_GetMinSpecImageMemory;
  _DAT_1076a890 = R_RegisterMaterial;
  _DAT_1076a894 = R_RegisterRawImage;
  _DAT_1076a898 = R_Material_IsDefault;
  _DAT_1076a89c = R_LoadWorld;
  _DAT_1076a8a0 = R_GetWorldBounds;
  _DAT_1076a8a4 = R_FinishLoadingModels;
  _DAT_1076a8a8 = R_SetIgnorePrecacheErrors;
  _DAT_1076a8ac = R_GetIgnorePrecacheErrors;
  _DAT_1076a8c4 = R_EndRegistration;
  _DAT_1076a8b4 = R_GetMaterialName;
  _DAT_1076a8b8 = R_GetMaterialSubimageCount;
  _DAT_1076a8bc = R_IsMaterialRefractive;
  _DAT_1076a8c0 = R_GetFarPlaneDist;
  _DAT_1076a93c = R_DrawSprite;
  _DAT_1076a940 = R_BeginFrame;
  _DAT_1076a944 = R_EndFrame;
  _DAT_1076a948 = R_BeginDebugFrame;
  _DAT_1076a94c = R_EndDebugFrame;
  _DAT_1076a950 = thunk_FUN_10029560;
  _DAT_1076a954 = R_DoneRenderingViews;
  _DAT_1076a958 = R_SaveScreen;
  _DAT_1076a95c = R_BlendSavedScreen;
  _DAT_1076a960 = R_ClearScreen;
  _DAT_1076a964 = R_SetViewport;
  _DAT_1076a968 = R_MarkFragments;
  _DAT_1076a8c8 = R_ClearScene;
  _DAT_1076a8cc = R_AddPolyToScene;
  _DAT_1076a8d0 = R_AddRefEntityToScene;
  _DAT_1076a8d4 = R_AddLightToScene;
  _DAT_1076a8d8 = &DAT_10020cb0;
  _DAT_1076a8dc = &DAT_10020cc0;
  _DAT_1076a8e0 = R_noop;
  _DAT_1076a8e4 = R_DefaultVertexFrames;
  _DAT_1076a8e8 = R_AddPolyToScene_s26;
  _DAT_1076a8ec = R_AddLightToScene_s27;
  _DAT_1076a8f0 = thunk_FUN_100013d0;
  _DAT_1076a8f4 = R_ResetSunLightParseParams;
  _DAT_1076a8f8 = R_SetCullDist;
  _DAT_1076a8fc = R_SetFog;
  _DAT_1076a900 = R_SwitchFog;
  _DAT_1076a904 = R_ArchiveFogState;
  _DAT_1076a908 = R_ClearFogs;
  _DAT_1076a90c = R_SetSunLightOverride;
  _DAT_1076a910 = R_ResetSunLightOverride;
  _DAT_1076a914 = R_RenderScene;
  _DAT_1076a918 = R_BeginDelayedDrawing;
  _DAT_1076a91c = R_EndDelayedDrawing;
  _DAT_1076a920 = R_IssueDelayedDrawing;
  _DAT_1076a928 = R_SetMaterialColor;
  _DAT_1076a92c = R_DrawStretchPic;
  _DAT_1076a930 = R_DrawStretchPicRotate;
  _DAT_1076a934 = R_DrawStretchRaw;
  _DAT_1076a938 = R_DrawQuadPic;
  _DAT_1076a924 = R_ClearFlares;
  _DAT_1076a974 = R_PickMaterial;
  _DAT_1076a978 = R_RegisterFont;
  _DAT_1076a97c = R_ResetImageAllocations;
  _DAT_1076a980 = R_FreeImageAllocations;
  _DAT_1076a984 = R_BeginCubemapShot;
  _DAT_1076a988 = R_EndCubemapShot;
  _DAT_1076a98c = R_SaveCubemapShot;
  _DAT_1076a990 = R_LightingFromCubemapShots;
  _DAT_1076a994 = R_LocateDebugStrings;
  _DAT_1076a998 = R_LocateDebugLines;
  _DAT_1076a99c = R_AddPlume;
  _DAT_1076a96c = R_ModelBounds;
  _DAT_1076a970 = R_TrackStatistics;
  _DAT_1076a9a0 = R_ShutdownDebug;
  _DAT_1076a9a4 = R_UpdateColor;
  _DAT_1076a9a8 = R_NormalizedTextScale;
  _DAT_1076a9ac = R_TextWidth;
  _DAT_1076a9b0 = R_TextHeight;
  _DAT_1076a9b4 = R_DrawText;
  _DAT_1076a9b8 = R_DrawTextInSpace;
  _DAT_1076a9bc = R_ConsoleTextWidth;
  _DAT_1076a9c0 = R_DrawConsoleText;
  _DAT_1076a9c4 = R_DrawTextWithCursor;
  _DAT_1076a9c8 = R_DObjGetSurfMaterials;
  _DAT_1076a9cc = R_DObjReplaceMaterial;
  _DAT_1076a9d0 = R_ParseSunLight;
  _DAT_1076a9d4 = R_Material_Duplicate;
  _DAT_1076aa00 = FUN_1002d4a0;
  _DAT_1076aa04 = R_LoadXModelSurfsSurface;
  _DAT_1076aa08 = R_RegisterXModelSurfs;
  _DAT_1076aa0c = FUN_1002ce40;
  _DAT_1076aa10 = &LAB_1002ce30;
  _DAT_1076aa14 = &LAB_1002ce20;
  _DAT_1076aa18 = &DAT_10020cf0;
  _DAT_1076aa1c = R_SyncRenderThread;
  _DAT_1076aa20 = R_AbortRenderCommands;
  _DAT_1076aa24 = R_IsGpuFenceFinished;
  _DAT_1076aa28 = R_GpuWaited;
  _DAT_1076aa2c = R_SetLodOrigin;
  return &DAT_1076a880;
}


