// 10018bf0 size=356 FUN_10018bf0

bool FUN_10018bf0(undefined4 param_1)

{
  char cVar1;
  int in_EAX;
  
  cVar1 = FUN_100188e0(param_1,"alphaTest",&PTR_s_alphaTest_1018fed0,in_EAX + 4);
  if (cVar1 == '\0') {
    return false;
  }
  cVar1 = FUN_100188e0(param_1,"blendFunc",&PTR_s_blendFuncRgb_1018fef0,in_EAX + 8);
  if (cVar1 != '\0') {
    FUN_10018af0();
    cVar1 = FUN_100188e0(param_1,"separateAlphaBlendFunc",&PTR_s_blendFuncAlpha_1018ff30,
                         in_EAX + 0xc);
    if (cVar1 != '\0') {
      FUN_10018b50();
      cVar1 = FUN_100188e0(param_1,"cullFace",&PTR_s_cullFace_1018ff70,in_EAX + 0x10);
      if (cVar1 != '\0') {
        cVar1 = FUN_100188e0(param_1,"depthTest",&PTR_s_depthTest_1018ff90,in_EAX + 0x14);
        if (cVar1 != '\0') {
          cVar1 = FUN_100188e0(param_1,"depthWrite",&PTR_s_depthWrite_1018ffb0,in_EAX + 0x18);
          if (cVar1 != '\0') {
            cVar1 = FUN_100188e0(param_1,"colorWrite",&PTR_s_colorWrite_1018ffd0,in_EAX + 0x1c);
            if (cVar1 != '\0') {
              cVar1 = FUN_100188e0(param_1,&DAT_10195a98,&PTR_DAT_10190000,in_EAX + 0x20);
              if (cVar1 != '\0') {
                cVar1 = FUN_100188e0(param_1,"polygonOffset",&PTR_s_polygonOffset_10190020,
                                     in_EAX + 0x24);
                if (cVar1 != '\0') {
                  cVar1 = FUN_100188e0(param_1,"stencil",&PTR_s_stencil_10190060,in_EAX + 0x28);
                  if (cVar1 != '\0') {
                    cVar1 = FUN_100188e0(param_1,"wireframe",&PTR_s_wireframe_10190040,in_EAX + 0x2c
                                        );
                    return cVar1 != '\0';
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return false;
}


