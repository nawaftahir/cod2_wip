// 10057160 size=273 FUN_10057160

void FUN_10057160(int param_1,int param_2,int param_3)

{
  int in_EAX;
  undefined4 uVar1;
  byte *pbVar2;
  byte *pbVar3;
  short *psVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int *piVar8;
  int local_184;
  byte local_180 [128];
  undefined1 local_100 [256];
  
  iVar5 = *(int *)(*(int *)(param_1 + 0x1b0) + 0x18);
  iVar6 = (param_3 >> 2) * 0x20 + 4;
  iVar7 = (param_2 >> 2) * 0x20 + 4;
  uVar1 = FUN_10056e10(iVar7,iVar6,local_100);
  FUN_10056fe0(param_1,iVar7,(in_EAX >> 3) * 0x20 + 2,iVar6,uVar1,local_100,local_180);
  pbVar3 = local_180;
  piVar8 = (int *)(iVar5 + (param_2 >> 2) * 0x10);
  local_184 = 4;
  do {
    iVar6 = 8;
    iVar5 = ((in_EAX >> 3) * 0x100 + (param_3 >> 2) * 4) * 2;
    do {
      psVar4 = (short *)(*piVar8 + iVar5);
      iVar5 = iVar5 + 0x40;
      *psVar4 = *pbVar3 + 1;
      psVar4[1] = pbVar3[1] + 1;
      pbVar2 = pbVar3 + 3;
      psVar4[2] = pbVar3[2] + 1;
      pbVar3 = pbVar3 + 4;
      iVar6 = iVar6 + -1;
      psVar4[3] = *pbVar2 + 1;
    } while (iVar6 != 0);
    piVar8 = piVar8 + 1;
    local_184 = local_184 + -1;
  } while (local_184 != 0);
  return;
}


