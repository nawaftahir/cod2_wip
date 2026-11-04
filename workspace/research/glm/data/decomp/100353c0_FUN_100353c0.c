// 100353c0 size=110 FUN_100353c0

void FUN_100353c0(void)

{
  undefined4 *puVar1;
  int in_ECX;
  int iVar2;
  
  iVar2 = 0;
  if (0 < *(int *)(in_ECX + 0x14)) {
    puVar1 = (undefined4 *)(in_ECX + 0x20);
    do {
      *(undefined4 *)(((int)&DAT_1072dc10 - in_ECX) + (int)puVar1) = puVar1[-2];
      *(undefined4 *)(((int)&DAT_1072dc14 - in_ECX) + (int)puVar1) = puVar1[-1];
      *(undefined4 *)(((int)&DAT_1072dc18 - in_ECX) + (int)puVar1) = *puVar1;
      *(undefined4 *)((int)puVar1 + ((int)&DAT_1072dc1c - in_ECX)) = puVar1[1];
      iVar2 = iVar2 + 1;
      puVar1 = puVar1 + 4;
    } while (iVar2 < *(int *)(in_ECX + 0x14));
  }
  return;
}


