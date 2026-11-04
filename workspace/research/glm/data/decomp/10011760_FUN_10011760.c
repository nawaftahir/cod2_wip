// 10011760 size=358 FUN_10011760

void FUN_10011760(void)

{
  int in_EAX;
  uint uVar1;
  char *pcVar2;
  undefined4 uVar3;
  char *pcVar4;
  int iVar5;
  int iVar6;
  
  (*(code *)RI_Printf)
            (0,"Pixel shader version is %i.%i\n",*(undefined1 *)(in_EAX + 0xcd),
             *(undefined1 *)(in_EAX + 0xcc));
  (*(code *)RI_Printf)
            (0,"Vertex shader version is %i.%i\n",*(undefined1 *)(in_EAX + 0xc5),
             *(undefined1 *)(in_EAX + 0xc4));
  uVar1 = FUN_100051e0();
  iVar5 = 0;
  iVar6 = 2;
  do {
    if ((uVar1 & 1 << ((byte)iVar6 & 0x1f)) != 0) {
      pcVar2 = "Direct3D 9";
      if (iVar6 != 1) {
        pcVar2 = "Direct3D 7";
      }
      (*(code *)RI_Printf)(0,"%s code path is available.\n",pcVar2);
      iVar5 = iVar6;
    }
    iVar6 = iVar6 + -1;
  } while (iVar6 != 0);
  if (iVar5 == 0) {
    (*(code *)RI_Error)(0,"No valid rendering code path detected.\n");
  }
  iVar6 = *(int *)(DAT_101ce7f8 + 8);
  if (iVar6 != 0) {
    if ((uVar1 & 1 << ((byte)iVar6 & 0x1f)) != 0) {
      pcVar2 = "Direct3D 9";
      if (iVar6 != 1) {
        pcVar2 = "Direct3D 7";
      }
      uVar3 = (*(code *)RI_Dvar_GetVariantString)(DAT_101ce7f8);
      (*(code *)RI_Printf)
                (0,"Using %s code path because r_rendererPreference is set to %s.\n",pcVar2,uVar3);
      (*(code *)RI_Dvar_SetBool)(DAT_101ce708,iVar6);
      return;
    }
    pcVar2 = "Direct3D 9";
    if (iVar6 != 1) {
      pcVar2 = "Direct3D 7";
    }
    pcVar4 = "Direct3D 9";
    if (iVar5 != 1) {
      pcVar4 = "Direct3D 7";
    }
    (*(code *)RI_Printf)
              (0,"Using %s code path because the requested %s code path is unavailable.\n",pcVar4,
               pcVar2);
    (*(code *)RI_Dvar_SetBool)(DAT_101ce708,iVar5);
    return;
  }
  pcVar2 = "Direct3D 9";
  if (iVar5 != 1) {
    pcVar2 = "Direct3D 7";
  }
  (*(code *)RI_Printf)
            (0,"Using %s code path because it is the best available path on this hardware.\n",pcVar2
            );
  (*(code *)RI_Dvar_SetBool)(DAT_101ce708,iVar5);
  return;
}


