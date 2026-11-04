// 1001f2a0 size=479 FUN_1001f2a0

undefined4 FUN_1001f2a0(int param_1,int *param_2,int param_3,int param_4,undefined4 *param_5)

{
  int iVar1;
  undefined4 uVar2;
  int in_ECX;
  int in_EDX;
  undefined4 *unaff_ESI;
  int iVar3;
  
  iVar1 = (*(code *)RI_XModelNumBones)();
  if (iVar1 != 0) {
    iVar1 = *(int *)(*(int *)(iVar1 + param_4 * 4) + in_ECX * 4);
    *(int *)(*(int *)(param_1 + 0x2c) + in_ECX * 4) = iVar1;
    if ((((*param_2 == 2) && (*(char *)(DAT_101ce780 + 8) != '\0')) &&
        (*(short *)(in_EDX + 6) != -1)) &&
       ((*(int *)(DAT_101ce708 + 8) != 2 ||
        (((iVar3 = *(int *)(*(int *)(iVar1 + 0x38) + 0x34), iVar3 != 0 &&
          (*(short *)(iVar3 + 6) != 0)) && (*(char *)(iVar3 + 0xc) != '\0')))))) {
      iVar3 = in_ECX * 0x10 + *(int *)(DAT_101d7e94 + 4 + param_3 * 8);
      if (*(int *)(iVar3 + param_4 * 4) == 0) {
        uVar2 = FUN_1002b7f0(iVar3,param_3,iVar1);
        *(undefined4 *)(iVar3 + param_4 * 4) = uVar2;
      }
      if (*(int *)(iVar3 + param_4 * 4) != 0) {
        FUN_1002b8c0();
        *unaff_ESI = 5;
        unaff_ESI[1] = in_EDX;
        unaff_ESI[2] = *(undefined4 *)(iVar3 + param_4 * 4);
        unaff_ESI[3] = param_2;
        return 0x10;
      }
    }
    if (*(int *)(in_EDX + 0x10) != 0) {
      unaff_ESI[1] = in_EDX;
      *unaff_ESI = 4;
      *param_5 = 1;
      return 0x38;
    }
    if ((*(char *)(DAT_101ce70c + 8) != '\0') && (*(int *)(in_EDX + 0x14) != 0)) {
      unaff_ESI[3] = 0;
      iVar1 = FUN_1001e5b0((int)*(short *)(in_EDX + 2));
      unaff_ESI[2] = iVar1;
      if ((-1 < iVar1) && (*(int *)DAT_101da9c8[0x85f1e] + DAT_101d49b0 != 0)) goto LAB_1001f445;
    }
    iVar1 = DAT_101ce708;
    unaff_ESI[2] = 0xffffffff;
    iVar1 = (int)*(short *)(in_EDX + 2) * (((*(int *)(iVar1 + 8) != 2) - 1 & 0xffffffe4) + 0x40);
    if (DAT_101d49c4 + iVar1 < 0xa00001) {
      unaff_ESI[3] = DAT_101d49c0 + DAT_101d49c4;
      DAT_101d49c4 = DAT_101d49c4 + iVar1;
      (*(code *)RI_Z_VirtualCommitInternal)(unaff_ESI[3],iVar1);
LAB_1001f445:
      *unaff_ESI = 3;
      unaff_ESI[1] = in_EDX;
      *param_5 = 1;
      return 0x10;
    }
    if (DAT_1076a870 != *DAT_101da9c8) {
      DAT_1076a870 = *DAT_101da9c8;
      (*(code *)RI_Printf)(2,"TEMP_SKIN_BUF_SIZE exceeded - not skinning surface\n");
    }
  }
  return 0;
}


