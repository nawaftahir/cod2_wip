// 10017540 size=171 FUN_10017540

void FUN_10017540(void)

{
  uint uVar1;
  int iVar2;
  undefined4 *puVar3;
  
  FUN_10017470();
  puVar3 = &DAT_101d7fcc;
  for (iVar2 = 0xc0; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  DAT_101d7fc8 = 0;
  FUN_10016db0();
  uVar1 = 0;
  puVar3 = &DAT_101da564;
  for (iVar2 = 0x100; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  DAT_101da2d4 = 0;
  do {
    if (*(int *)((int)&DAT_101da460 + uVar1) != 0) {
      *(undefined4 *)((int)&DAT_101da460 + uVar1) = 0;
    }
    uVar1 = uVar1 + 4;
  } while (uVar1 < 0x100);
  uVar1 = 0;
  do {
    if (*(int *)((int)&DAT_101da3dc + uVar1) != 0) {
      *(undefined4 *)((int)&DAT_101da3dc + uVar1) = 0;
    }
    uVar1 = uVar1 + 4;
  } while (uVar1 < 0x80);
  uVar1 = 0;
  do {
    if (*(int *)((int)&DAT_101d92d4 + uVar1) != 0) {
      *(undefined4 *)((int)&DAT_101d92d4 + uVar1) = 0;
    }
    uVar1 = uVar1 + 4;
  } while (uVar1 < 0x1000);
  uVar1 = 0;
  do {
    if (*(int *)((int)&DAT_101d82d0 + uVar1) != 0) {
      *(undefined4 *)((int)&DAT_101d82d0 + uVar1) = 0;
    }
    uVar1 = uVar1 + 4;
  } while (uVar1 < 0x1000);
  return;
}


