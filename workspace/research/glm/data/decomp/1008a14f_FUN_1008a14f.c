// 1008a14f size=254 FUN_1008a14f

int FUN_1008a14f(int param_1,uint param_2,int param_3,int param_4)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  int in_ECX;
  
  iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4);
  iVar3 = *(int *)(*(int *)(param_1 + 0x1c) + (param_4 + param_3 * 4) * 4);
  do {
    if (iVar3 == -1) {
      return -1;
    }
    iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
    if (*(uint *)(iVar4 + 0x48) < *(uint *)(iVar2 + 0x58)) {
      if (*(uint *)(iVar4 + 0x58) <= *(uint *)(iVar2 + 0x48)) {
        return -1;
      }
      if ((*(int *)(iVar2 + 0x14) == *(int *)(iVar4 + 0x14)) &&
         (*(int *)(iVar2 + 0x18) == *(int *)(iVar4 + 0x14))) {
        return iVar3;
      }
      iVar7 = iVar4;
      param_4 = iVar2;
      if (*(uint *)(iVar2 + 0x48) < *(uint *)(iVar4 + 0x48)) {
        iVar7 = iVar2;
        param_4 = iVar4;
      }
      iVar5 = *(int *)(param_1 + 0x54);
      param_2 = 0;
      iVar8 = *(int *)(iVar7 + 0x74) * 4;
      iVar7 = *(int *)(iVar8 + *(int *)(param_1 + 0x50));
      uVar6 = *(uint *)(iVar8 + *(int *)(param_1 + 0x4c));
      if (uVar6 != 0) {
        do {
          puVar1 = (uint *)(*(int *)(param_1 + 0x58) +
                           *(int *)(iVar5 + iVar7 * 4 + param_2 * 4) * 0xc);
          if (*puVar1 <= *(uint *)(param_4 + 0x48)) break;
          iVar8 = FUN_1008a09a(*(undefined4 *)(param_4 + 0x14),*(undefined4 *)(param_4 + 0x18),
                               puVar1[1],puVar1[2]);
          if (iVar8 == 0) {
            return iVar3;
          }
          param_2 = param_2 + 1;
        } while (param_2 < uVar6);
      }
    }
    iVar3 = *(int *)(iVar4 + 0x30);
  } while( true );
}


