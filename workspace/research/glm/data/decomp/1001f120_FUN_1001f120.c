// 1001f120 size=347 FUN_1001f120

undefined4 FUN_1001f120(int param_1,undefined4 param_2,int param_3,int param_4)

{
  short *in_EAX;
  undefined4 uVar1;
  int iVar2;
  undefined4 *unaff_EBX;
  int iVar3;
  
  iVar3 = (int)*in_EAX;
  uVar1 = (*(code *)RI_RI_unk123)(param_2,iVar3);
  iVar2 = (*(code *)RI_XModelNumBones)(uVar1);
  if (iVar2 != 0) {
    uVar1 = *(undefined4 *)(*(int *)(iVar2 + *(char *)(iVar3 + param_4) * 4) + in_EAX[1] * 4);
    iVar2 = (*(code *)RI_ResumeWorker)(param_2,iVar3,(int)in_EAX[1],(int)*(char *)(iVar3 + param_4))
    ;
    *(undefined4 *)(*(int *)(param_1 + 0x2c) + param_3 * 4) = uVar1;
    if (*(int *)(iVar2 + 0x10) != 0) {
      unaff_EBX[1] = iVar2;
      *unaff_EBX = 4;
      return 0x38;
    }
    if ((*(char *)(DAT_101ce70c + 8) != '\0') && (*(int *)(iVar2 + 0x14) != 0)) {
      unaff_EBX[3] = 0;
      iVar3 = FUN_1001e5b0((int)*(short *)(iVar2 + 2));
      unaff_EBX[2] = iVar3;
      if ((-1 < iVar3) && (*(int *)DAT_101da9c8[0x85f1e] + DAT_101d49b0 != 0)) goto LAB_1001f255;
    }
    iVar3 = DAT_101ce708;
    unaff_EBX[2] = 0xffffffff;
    iVar3 = (int)*(short *)(iVar2 + 2) * (((*(int *)(iVar3 + 8) != 2) - 1 & 0xffffffe4) + 0x40);
    if (DAT_101d49c4 + iVar3 < 0xa00001) {
      unaff_EBX[3] = DAT_101d49c0 + DAT_101d49c4;
      DAT_101d49c4 = DAT_101d49c4 + iVar3;
      (*(code *)RI_Z_VirtualCommitInternal)(unaff_EBX[3],iVar3);
LAB_1001f255:
      unaff_EBX[1] = iVar2;
      *unaff_EBX = 3;
      return 0x10;
    }
    if (DAT_1076a868 != *DAT_101da9c8) {
      DAT_1076a868 = *DAT_101da9c8;
      (*(code *)RI_Printf)(2,"TEMP_SKIN_BUF_SIZE exceeded - not skinning surface\n");
    }
  }
  return 0;
}


