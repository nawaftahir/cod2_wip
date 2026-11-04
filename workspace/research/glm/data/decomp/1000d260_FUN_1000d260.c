// 1000d260 size=120 FUN_1000d260

void FUN_1000d260(void)

{
  undefined4 *puVar1;
  int *piVar2;
  uint uVar3;
  
  uVar3 = 0;
  do {
    puVar1 = *(undefined4 **)((int)&DAT_101cea68 + uVar3);
    if ((puVar1 != (undefined4 *)0x0) && (4 < *(byte *)((int)puVar1 + 0x1e))) {
      if ((1 < *(byte *)(puVar1 + 3)) && (*(byte *)(puVar1 + 3) != 4)) {
        DAT_101d0a74 = DAT_101d0a74 - puVar1[4];
        DAT_101d0a78 = DAT_101d0a78 - puVar1[5];
      }
      piVar2 = (int *)puVar1[1];
      if (piVar2 != (int *)0x0) {
        (**(code **)(*piVar2 + 8))(piVar2);
        puVar1[1] = 0;
        puVar1[4] = 0;
        puVar1[5] = 0;
      }
      *puVar1 = 0;
    }
    uVar3 = uVar3 + 4;
  } while (uVar3 < 0x2000);
  return;
}


