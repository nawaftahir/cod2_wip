// 10014c60 size=235 FUN_10014c60

int FUN_10014c60(void)

{
  char *in_EAX;
  int iVar1;
  int iVar2;
  
  while( true ) {
    iVar2 = 0;
    if (0 < DAT_101d7eb0) {
      do {
        iVar1 = __stricmp(in_EAX,*(char **)((&DAT_101d7eb4)[iVar2] + 0x14));
        if (iVar1 == 0) {
          return (&DAT_101d7eb4)[iVar2];
        }
        iVar2 = iVar2 + 1;
      } while (iVar2 < DAT_101d7eb0);
    }
    if (DAT_101d7eb0 == 0x40) {
      (*(code *)RI_Printf)(0,"Loaded light defs:\n");
      iVar2 = 0;
      if (0 < DAT_101d7eb0) {
        do {
          (*(code *)RI_Printf)(0,"  %s\n",*(undefined4 *)((&DAT_101d7eb4)[iVar2] + 0x14));
          iVar2 = iVar2 + 1;
        } while (iVar2 < DAT_101d7eb0);
      }
      FUN_100138c0(1,"Can\'t load light def %s; %i unique light defs already loaded",DAT_101d7eb0);
    }
    iVar2 = FUN_100150e0();
    if (iVar2 != 0) break;
    iVar2 = __stricmp(in_EAX,"light_dynamic");
    if (iVar2 == 0) {
      FUN_100138c0(1,"Can\'t load the default light def \'%s\'",in_EAX);
    }
    in_EAX = "light_dynamic";
  }
  (&DAT_101d7eb4)[DAT_101d7eb0] = iVar2;
  DAT_101d7eb0 = DAT_101d7eb0 + 1;
  return iVar2;
}


