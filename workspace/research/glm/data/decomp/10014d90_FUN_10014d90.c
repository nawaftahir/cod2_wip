// 10014d90 size=184 FUN_10014d90

void FUN_10014d90(undefined4 param_1,float param_2)

{
  int in_EAX;
  uint uVar1;
  int iVar2;
  int in_ECX;
  uint *puVar3;
  float10 fVar4;
  
  if (-1 < in_EAX + -1) {
    puVar3 = (uint *)(in_ECX + (in_EAX + -1) * 8);
    do {
      if (*(code **)(&DAT_101a5a8c + *(int *)puVar3[1] * 4) != (code *)0x0) {
        if ((int)*puVar3 < 0) {
          iVar2 = 0x13;
        }
        else {
          iVar2 = 4;
        }
        uVar1 = *puVar3 >> iVar2 & 0xfff;
        if (0x7ff < uVar1) {
          uVar1 = 0x7fe;
        }
        iVar2 = (**(code **)(&DAT_101a5a8c + *(int *)puVar3[1] * 4))(puVar3,uVar1);
        if ((iVar2 != 0) && (fVar4 = (float10)FUN_1005a270(), fVar4 <= (float10)(param_2 * param_2))
           ) {
          *(uint *)(DAT_10678abc + DAT_10678ab8 * 8) = *puVar3;
          *(uint *)(DAT_10678abc + 4 + DAT_10678ab8 * 8) = puVar3[1];
          DAT_10678ab8 = DAT_10678ab8 + 1;
          *(int *)(DAT_101da9c8 + 4) = *(int *)(DAT_101da9c8 + 4) + 1;
        }
      }
      puVar3 = puVar3 + -2;
      in_EAX = in_EAX + -1;
    } while (in_EAX != 0);
  }
  return;
}


