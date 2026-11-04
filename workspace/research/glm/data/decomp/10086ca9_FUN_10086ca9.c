// 10086ca9 size=95 FUN_10086ca9

void FUN_10086ca9(int param_1,int param_2,int param_3,int param_4)

{
  uint uVar1;
  uint uVar2;
  int in_ECX;
  bool bVar3;
  
  if (param_4 == 0) {
    uVar2 = *(uint *)(*(int *)(param_1 + 8) + (*(int *)(param_1 + 0xc) * param_2 + param_3) * 4);
  }
  else {
    uVar1 = *(uint *)(*(int *)(param_1 + 8) + param_3 * 4);
    uVar2 = *(uint *)(*(int *)(param_1 + 8) + (*(int *)(param_1 + 0xc) + param_3) * 4);
    if (param_2 == 0) {
      if (uVar2 < uVar1) goto LAB_10086cf2;
    }
    else if (uVar1 <= uVar2) goto LAB_10086cf2;
    uVar2 = uVar1;
  }
LAB_10086cf2:
  do {
    uVar1 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar2 * 4) + 0x30);
    bVar3 = uVar2 != uVar1;
    uVar2 = uVar1;
  } while (bVar3);
  return;
}


