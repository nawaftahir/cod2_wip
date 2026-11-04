// 10067bd4 size=106 FUN_10067bd4

void FUN_10067bd4(int param_1,uint param_2)

{
  int iVar1;
  int in_ECX;
  uint *puVar2;
  
  iVar1 = FUN_100674ae(param_1,&param_1);
  if (-1 < iVar1) {
    if (param_2 == 0xff) {
      puVar2 = (uint *)(*(int *)(in_ECX + 0x1c) + param_1 * 4);
      *puVar2 = *puVar2 & 0x20;
      puVar2 = (uint *)(param_1 * 4 + *(int *)(in_ECX + 0x1c));
      *puVar2 = *puVar2 | 1;
    }
    else if (param_2 == 0x10) {
      puVar2 = (uint *)(*(int *)(in_ECX + 0x1c) + param_1 * 4);
      *puVar2 = *puVar2 | 0x10;
    }
    else {
      puVar2 = (uint *)(*(int *)(in_ECX + 0x1c) + param_1 * 4);
      *puVar2 = *puVar2 & 0xfffffff0;
      puVar2 = (uint *)(param_1 * 4 + *(int *)(in_ECX + 0x1c));
      *puVar2 = *puVar2 | param_2 & 0xf;
    }
  }
  return;
}


