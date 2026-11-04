// 10020dc0 size=73 R_SyncRenderThread

void R_SyncRenderThread(void)

{
  int iVar1;
  
  if (DAT_101d4d00 != '\0') {
    FUN_1001e540();
    iVar1 = DAT_101da9c8;
    *(undefined4 *)(DAT_101da9c8 + 0x249d0c) = 0;
    *(undefined4 *)(iVar1 + 0x249d10) = 0;
    *(undefined4 *)(iVar1 + 0x249d14) = 0;
    if (DAT_101d49c4 != 0) {
      (*(code *)RI_Z_VirtualDecommitInternal)(DAT_101d49c0,DAT_101d49c4);
      DAT_101d49c4 = 0;
    }
  }
  return;
}


