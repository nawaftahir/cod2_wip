// 1000aaf0 size=4046 FUN_1000aaf0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1000aaf0(void)

{
  FUN_10028a10();
  _DAT_101ce670 = (*(code *)RI_Dvar_RegisterBool)("r_ignore",0,0x80000000,0x7fffffff,0x2000);
  DAT_101ce668 = (*(code *)RI_Dvar_RegisterBool)("r_overbrightBits",1,0,1,0x2021);
  DAT_101ce62c = (*(code *)RI_Dvar_RegisterInt)("r_gamma",0x3f800000,0x3f000000,0x40400000,0x2001);
  DAT_101ce6f8 = (*(code *)RI_Dvar_FindVar)("r_ignorehwgamma",0,0x2021);
  DAT_101ce644 = (*(code *)RI_Dvar_RegisterString)("r_textureMode",&PTR_s_nearest_101a5924,2,0x2001)
  ;
  DAT_101ce6f0 = (*(code *)RI_Dvar_RegisterBool)("r_anisotropy",8,2,0x10,0x2001);
  DAT_101ce6d0 = (*(code *)RI_Dvar_FindVar)("r_fullbright",0,0x2080);
  DAT_101ce6ac = (*(code *)RI_Dvar_RegisterString)("r_debugShader",&PTR_DAT_101a5990,0,0x2080);
  DAT_101ce824 = (*(code *)RI_Dvar_RegisterBool)("r_debugEntCounts",0,0,0x7fe,0x2000);
  _DAT_101ce720 = (*(code *)RI_Dvar_FindVar)("r_optimize",1,0x2020);
  DAT_101ce6c4 = (*(code *)RI_Dvar_FindVar)("r_optimizeLightmaps",1,0x2020);
  DAT_101ce648 = (*(code *)RI_Dvar_RegisterBool)("r_optimizeXModels",100,0,1000,0x2020);
  DAT_101ce6c8 = (*(code *)RI_Dvar_RegisterString)("r_gpuSync",&PTR_DAT_101a5950,3,0x2000);
  DAT_101ce6b0 = (*(code *)RI_Dvar_FindVar)("r_multiGpu",0,0x2000);
  DAT_101ce70c = (*(code *)RI_Dvar_FindVar)("r_skinCache",1,0x2000);
  DAT_101ce780 = (*(code *)RI_Dvar_FindVar)("r_smc_enable",1,0x2000);
  DAT_101ce690 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_lodScale",0x3f800000,0x3f800000,0x40800000,0x2001);
  DAT_101ce628 = (*(code *)RI_Dvar_RegisterInt)("r_lodBias",0,0xc47a0000,0,0x2001);
  DAT_101ce814 = (*(code *)RI_Dvar_RegisterInt)("r_znear",0x40800000,0x3a83126f,0x41800000,0x2080);
  DAT_101ce678 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_znear_depthhack",0x3dcccccd,0x3a83126f,0x41800000,0x2080);
  DAT_101ce61c = (*(code *)RI_Dvar_RegisterInt)("r_zfar",0,0,0x7f7fffff,0x2080);
  DAT_101ce828 = (*(code *)RI_Dvar_FindVar)("r_fog",1,0x2080);
  DAT_101ce674 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_polygonOffsetScale",0xbf800000,0xc0800000,0x40800000,0x2001);
  DAT_101ce698 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_polygonOffsetBias",0xbf800000,0xc1800000,0x41800000,0x2001);
  DAT_101ce704 = (*(code *)RI_Dvar_FindVar)("r_picmip_manual",0,0x2001);
  DAT_101ce5f8 = (*(code *)RI_Dvar_RegisterBool)("r_picmip",0,0,3,0x2001);
  DAT_101ce6c0 = (*(code *)RI_Dvar_RegisterBool)("r_picmip_bump",0,0,3,0x2001);
  DAT_101ce7d4 = (*(code *)RI_Dvar_RegisterBool)("r_picmip_spec",0,0,3,0x2001);
  DAT_101ce714 = (*(code *)RI_Dvar_RegisterString)("r_lightMap",&PTR_s_Unchanged_101a5964,0,0x2080);
  DAT_101ce7a0 = (*(code *)RI_Dvar_RegisterString)("r_colorMap",&PTR_s_Unchanged_101a5964,0,0x2080);
  DAT_101ce7f0 = (*(code *)RI_Dvar_RegisterString)("r_normalMap",&PTR_s_Unchanged_101a5974,0,0x2080)
  ;
  DAT_101ce700 = (*(code *)RI_Dvar_RegisterString)
                           ("r_specularMap",&PTR_s_Unchanged_101a5964,0,0x2080);
  DAT_101ce638 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_specularColorScale",0x3f800000,0x3c23d70a,0x42c80000,0x2080);
  DAT_101ce680 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_cosinePowerMapShift",0,0xbf800000,0x3f800000,0x2080);
  DAT_101ce6e4 = (*(code *)RI_Dvar_RegisterBool)("r_showTris",0,0,2,0x2080);
  DAT_101ce63c = (*(code *)RI_Dvar_FindVar)("r_showTriCounts",0,0x2080);
  DAT_101ce774 = (*(code *)RI_Dvar_FindVar)("r_showSurfCounts",0,0x2080);
  DAT_101ce808 = (*(code *)RI_Dvar_FindVar)("r_showVertCounts",0,0x2080);
  DAT_101ce7c8 = (*(code *)RI_Dvar_RegisterString)("r_xdebug",&PTR_DAT_101a593c,0,0x2080);
  DAT_101ce6a8 = (*(code *)RI_Dvar_RegisterInt)("r_railCoreWidth",0x3f800000,0,0x41800000,0x2001);
  DAT_101ce6d4 = (*(code *)RI_Dvar_RegisterBool)("r_vc_makelog",0,0,2,0x2020);
  DAT_101ce7cc = (*(code *)RI_Dvar_RegisterBool)("r_vc_showlog",0,0,0x400,0x2000);
  DAT_101ce818 = (*(code *)RI_Dvar_FindVar)("r_showLightGrid",0,0x2080);
  DAT_101ce758 = (*(code *)RI_Dvar_FindVar)("r_showMissingLightGrid",0,0x2080);
  DAT_101ce73c = (*(code *)RI_Dvar_RegisterInt)
                           ("r_lightTweakAmbient",0x3dcccccd,0,0x40800000,0x2200);
  DAT_101ce5fc = (*(code *)RI_Dvar_RegisterInt)
                           ("r_lightTweakDiffuseFraction",0x3f000000,0,0x3f800000,0x2200);
  DAT_101ce604 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_lightTweakSunLight",0x3f800000,0,0x40800000,0x2200);
  DAT_101ce6d8 = (*(code *)RI_Dvar_RegisterEnum)
                           ("r_lightTweakAmbientColor",0x3f800000,0,0,0x3f800000,0x2200);
  DAT_101ce778 = (*(code *)RI_Dvar_RegisterEnum)
                           ("r_lightTweakSunColor",0,0x3f800000,0,0x3f800000,0x2200);
  DAT_101ce768 = (*(code *)RI_Dvar_RegisterEnum)
                           ("r_lightTweakSunDiffuseColor",0,0,0x3f800000,0x3f800000,0x2200);
  DAT_101ce728 = (*(code *)RI_Dvar_RegisterVec2)
                           ("r_lightTweakSunDirection",0,0,0,0xc3b40000,0x43b40000,0x2200);
  DAT_101ce81c = (*(code *)RI_Dvar_RegisterEnum)
                           ("r_objectiveColorDx7Min",0x3f0ccccd,0x3ec28f5c,0,0x3f800000,0x2000);
  DAT_101ce7b4 = (*(code *)RI_Dvar_RegisterEnum)
                           ("r_objectiveColorDx7Max",0x3f800000,0x3f333333,0x3e4ccccd,0x3f800000,
                            0x2000);
  DAT_101ce7ec = (*(code *)RI_Dvar_RegisterBool)("r_logFile",0,0,0x7fffffff,0x2000);
  DAT_101ce750 = (*(code *)RI_Dvar_FindVar)("r_skipBackEnd",0,0x2080);
  DAT_101ce600 = (*(code *)RI_Dvar_FindVar)("r_norefresh",0,0x2080);
  DAT_101ce7dc = (*(code *)RI_Dvar_FindVar)("r_swapInterval",0,0x2021);
  DAT_101ce67c = (*(code *)RI_Dvar_RegisterString)("r_aaAlpha",&PTR_DAT_101a5914,1,0x2001);
  DAT_101ce6dc = (*(code *)RI_Dvar_RegisterBool)("r_aaSamples",1,1,4,0x2021);
  DAT_101ce798 = (*(code *)RI_Dvar_RegisterEnum)("r_clearColor",0,0,0,0,0x2000);
  _DAT_101ce77c = (*(code *)RI_Dvar_RegisterEnum)("r_clearColor2",0,0,0,0,0x2000);
  DAT_101ce684 = (*(code *)RI_Dvar_FindVar)("r_drawSun",1,0x2001);
  DAT_101ce6a4 = (*(code *)RI_Dvar_FindVar)("r_drawWorld",1,0x2080);
  DAT_101ce7bc = (*(code *)RI_Dvar_FindVar)("r_drawDecals",1,0x2080);
  DAT_101ce64c = (*(code *)RI_Dvar_FindVar)("r_drawEntities",1,0x2080);
  DAT_101ce654 = (*(code *)RI_Dvar_FindVar)("r_drawBModels",1,0x2080);
  DAT_101ce760 = (*(code *)RI_Dvar_FindVar)("r_drawSModels",1,0x2080);
  DAT_101ce65c = (*(code *)RI_Dvar_FindVar)("r_drawXModels",1,0x2080);
  DAT_101ce6fc = (*(code *)RI_Dvar_RegisterBool)("r_dlightLimit",4,0,0x20,0x2000);
  DAT_101ce6b8 = (*(code *)RI_Dvar_RegisterBool)("r_drawPrimCap",0,0xffffffff,10000,0x2080);
  DAT_101ce764 = (*(code *)RI_Dvar_RegisterBool)("r_drawPrimFloor",0,0,10000,0x2080);
  DAT_101ce794 = (*(code *)RI_Dvar_FindVar)("r_drawWater",1,0x2080);
  DAT_101ce748 = (*(code *)RI_Dvar_FindVar)("r_depthPrepassModels",0,0x2000);
  DAT_101ce710 = (*(code *)RI_Dvar_FindVar)("r_lockPvs",0,0x2080);
  DAT_101ce78c = (*(code *)RI_Dvar_FindVar)("r_skipPvs",0,0x2080);
  _DAT_101ce820 = (*(code *)RI_Dvar_FindVar)("r_pvsStats",0,0x2000);
  DAT_101ce800 = (*(code *)RI_Dvar_FindVar)("r_portalFineCull",1,0x2080);
  DAT_101ce6a0 = (*(code *)RI_Dvar_RegisterInt)("r_portalBevels",0x3f333333,0,0x3f800000,0x2001);
  DAT_101ce80c = (*(code *)RI_Dvar_FindVar)("r_portalBevelsOnly",0,0x2000);
  DAT_101ce664 = (*(code *)RI_Dvar_FindVar)("r_singleCell",0,0x2080);
  DAT_101ce68c = (*(code *)RI_Dvar_RegisterBool)("r_portalWalkLimit",0,0,100,0x2080);
  DAT_101ce788 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_portalMinClipArea",0x3ca3d70a,0,0x3f800000,0x2000);
  DAT_101ce6e0 = (*(code *)RI_Dvar_RegisterBool)("r_showPortals",0,0,3,0x2080);
  DAT_101ce738 = (*(code *)RI_Dvar_FindVar)("r_showSModelNames",0,0x2080);
  DAT_101ce754 = (*(code *)RI_Dvar_RegisterString)("r_showFbColorDebug",&PTR_DAT_101a5980,0,0x2080);
  DAT_101ce7b8 = (*(code *)RI_Dvar_FindVar)("r_showFloatZDebug",0,0x2080);
  DAT_101ce658 = (*(code *)RI_Dvar_FindVar)("r_showGroundLit",0,0x20a0);
  DAT_101ce694 = (*(code *)RI_Dvar_FindVar)("r_zFeather",1,0x2000);
  DAT_101ce7e4 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_highLodDist",0xbf800000,0xbf800000,0x7f7fffff,0x2080);
  DAT_101ce724 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_mediumLodDist",0xbf800000,0xbf800000,0x7f7fffff,0x2080);
  DAT_101ce69c = (*(code *)RI_Dvar_RegisterInt)
                           ("r_lowLodDist",0xbf800000,0xbf800000,0x7f7fffff,0x2080);
  DAT_101ce630 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_lowestLodDist",0xbf800000,0xbf800000,0x7f7fffff,0x2080);
  DAT_101ce7e8 = (*(code *)RI_Dvar_RegisterString)("r_forceLod",&PTR_DAT_101a59b0,4,0x2080);
  DAT_101ce7c4 = (*(code *)RI_Dvar_FindVar)("sc_enable",1,0x2000);
  DAT_101ce830 = (*(code *)RI_Dvar_RegisterBool)("sc_blur",2,0,4,0x2080);
  _DAT_101ce7a8 = (*(code *)RI_Dvar_RegisterBool)("sc_count",0x18,0,0x18,0x2080);
  DAT_101ce810 = (*(code *)RI_Dvar_RegisterBool)("sc_debugCasterCount",0x18,0,0x18,0x2080);
  DAT_101ce640 = (*(code *)RI_Dvar_RegisterBool)("sc_debugReceiverCount",0x18,0,0x18,0x2080);
  DAT_101ce730 = (*(code *)RI_Dvar_FindVar)("sc_showOverlay",0,0x2080);
  DAT_101ce790 = (*(code *)RI_Dvar_FindVar)("sc_showDebug",0,0x2080);
  DAT_101ce718 = (*(code *)RI_Dvar_RegisterBool)("sc_wantCount",0xc,0,0x18,0x2080);
  DAT_101ce72c = (*(code *)RI_Dvar_RegisterBool)("sc_wantCountMargin",1,0,0x18,0x2080);
  DAT_101ce76c = (*(code *)RI_Dvar_RegisterInt)("sc_fadeRange",0x3e800000,0,0x3f800000,0x2080);
  DAT_101ce620 = (*(code *)RI_Dvar_RegisterInt)("sc_shadowInRate",0x40000000,0,0x41a00000,0x2080);
  DAT_101ce7d0 = (*(code *)RI_Dvar_RegisterInt)("sc_shadowOutRate",0x40a00000,0,0x41a00000,0x2080);
  DAT_101ce618 = (*(code *)RI_Dvar_RegisterInt)("sc_length",0x43c80000,0x3f800000,0x44fa0000,0x2080)
  ;
  _DAT_101ce608 =
       (*(code *)RI_Dvar_RegisterInt)("sc_offscreenCasterLodBias",0,0xff7fffff,0x7f7fffff,0x2080);
  _DAT_101ce734 =
       (*(code *)RI_Dvar_RegisterInt)("sc_offscreenCasterLodScale",0x41a00000,0,0x7f7fffff,0x2080);
  DAT_101ce7a4 = (*(code *)RI_Dvar_RegisterInt)("r_blur",0,0,0x42000000,0x2080);
  DAT_101ce650 = (*(code *)RI_Dvar_FindVar)("r_distortion",1,0x2001);
  DAT_101ce71c = (*(code *)RI_Dvar_FindVar)("r_glow",1,0x2001);
  DAT_101ce7ac = (*(code *)RI_Dvar_RegisterInt)("r_glowRadius0",0x40a00000,0,0x42000000,0x2000);
  DAT_101ce7b0 = (*(code *)RI_Dvar_RegisterInt)("r_glowRadius1",0x41400000,0,0x42000000,0x2000);
  DAT_101ce740 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_glowSkyBleedIntensity0",0x3f000000,0,0x3f800000,0x2000);
  DAT_101ce744 = (*(code *)RI_Dvar_RegisterInt)("r_glowSkyBleedIntensity1",0,0,0x3f800000,0x2000);
  DAT_101ce6e8 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_glowBloomIntensity0",0x3f800000,0,0x41000000,0x2000);
  DAT_101ce6ec = (*(code *)RI_Dvar_RegisterInt)
                           ("r_glowBloomIntensity1",0x3f800000,0,0x41000000,0x2000);
  DAT_101ce784 = (*(code *)RI_Dvar_RegisterInt)("r_glowBloomCutoff",0x3f666666,0,0x3f800000,0x2000);
  DAT_101ce82c = (*(code *)RI_Dvar_RegisterInt)
                           ("r_glowBloomDesaturation",0x3f400000,0,0x3f800000,0x2000);
  DAT_101ce614 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_outdoorAwayBias",0x42000000,0xff7fffff,0x7f7fffff,0x2000);
  DAT_101ce7f4 = (*(code *)RI_Dvar_RegisterInt)("r_outdoorDownBias",0,0xff7fffff,0x7f7fffff,0x2000);
  DAT_101ce6b4 = (*(code *)RI_Dvar_RegisterInt)
                           ("r_outdoorFeather",0x41000000,0xff7fffff,0x7f7fffff,0x2000);
  (*(code *)RI_Dvar_ClearModified)(DAT_101ce6b4);
  DAT_101ce7c0 = (*(code *)RI_Dvar_FindVar)("r_sun_from_dvars",0,0x2080);
  DAT_101ce74c = (*(code *)RI_Dvar_RegisterBool)("r_testTransform",0,0,1,0x2000);
  DAT_101ce75c = (*(code *)RI_Dvar_RegisterBool)("r_testFill",0,0,500,0x2000);
  DAT_101ce79c = (*(code *)RI_Dvar_FindVar)("r_testFillEnable",0,0x2020);
  DAT_101ce634 = (*(code *)RI_Dvar_FindVar)("fx_sort",1,0x2000);
  DAT_101ce6cc = (*(code *)RI_Dvar_RegisterBool)("vid_xpos",3,0xfffff000,0x1000,0x2001);
  DAT_101ce66c = (*(code *)RI_Dvar_RegisterBool)("vid_ypos",0x16,0xfffff000,0x1000,0x2001);
  DAT_101ce7d8 = (*(code *)RI_Dvar_RegisterBool)("developer",0,0,2,0x2000);
  DAT_101ce6bc = (*(code *)RI_Dvar_FindVar)("sv_cheats",0,0x2048);
  DAT_101ce624 = (*(code *)RI_Dvar_FindVar)("com_statmon",0,0x2000);
  DAT_101ce770 = (*(code *)RI_Dvar_FindVar)("sys_SSE",0,0x2000);
  DAT_101ce7e0 = (*(code *)RI_Dvar_FindVar)("r_sse_skinning",1,0x2000);
  DAT_101ce60c = (*(code *)RI_Dvar_FindVar)("r_fullscreen",1,0x2040);
  DAT_101ce610 = (*(code *)RI_Dvar_RegisterBool)("r_monitor",0,0,8,0x2021);
  DAT_101ce7f8 = (*(code *)RI_Dvar_RegisterString)
                           ("r_rendererPreference",&PTR_DAT_101a58f0,0,0x2021);
  DAT_101ce708 = (*(code *)RI_Dvar_RegisterString)("r_rendererInUse",&PTR_DAT_101a58f0,0,0x2040);
  DAT_101ce804 = (*(code *)RI_Dvar_RegisterString)("r_aspectRatio",&PTR_DAT_101a5900,0,0x2021);
  return;
}


