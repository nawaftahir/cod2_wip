// 100c98b1 size=262 FUN_100c98b1

undefined4 FUN_100c98b1(undefined4 param_1)

{
  undefined4 *puVar1;
  int in_ECX;
  int iVar2;
  uint uVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  if (((*(byte *)(in_ECX + 0xcc) & 1) != 0) && (*(int *)(in_ECX + 0x124) != 0)) {
    if (*(uint *)(in_ECX + 300) <= *(uint *)(in_ECX + 0x128)) {
      puVar1 = operator_new(*(uint *)(in_ECX + 300) * 0x30);
      if (puVar1 == (undefined4 *)0x0) {
        return 0x8007000e;
      }
      puVar4 = *(undefined4 **)(in_ECX + 0x124);
      puVar5 = puVar1;
      for (iVar2 = (*(int *)(in_ECX + 0x128) * 3 & 0x1fffffffU) << 1; iVar2 != 0; iVar2 = iVar2 + -1
          ) {
        *puVar5 = *puVar4;
        puVar4 = puVar4 + 1;
        puVar5 = puVar5 + 1;
      }
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
        puVar4 = (undefined4 *)((int)puVar4 + 1);
        puVar5 = (undefined4 *)((int)puVar5 + 1);
      }
      _free(*(void **)(in_ECX + 0x124));
      *(int *)(in_ECX + 300) = *(int *)(in_ECX + 300) << 1;
      *(undefined4 **)(in_ECX + 0x124) = puVar1;
    }
    *(undefined4 *)(*(int *)(in_ECX + 0x124) + *(int *)(in_ECX + 0x128) * 0x18) =
         *(undefined4 *)(in_ECX + 0x104);
    *(int *)(*(int *)(in_ECX + 0x124) + 4 + *(int *)(in_ECX + 0x128) * 0x18) =
         *(int *)(in_ECX + 0x110) << 2;
    uVar3 = 0;
    do {
      *(undefined4 *)(*(int *)(in_ECX + 0x124) + 8 + (uVar3 + *(int *)(in_ECX + 0x128) * 6) * 4) =
           0xffffffff;
      uVar3 = uVar3 + 1;
    } while (uVar3 < 4);
    *(int *)(in_ECX + 0x128) = *(int *)(in_ECX + 0x128) + 1;
  }
  *(undefined4 *)(in_ECX + 0x118) = *(undefined4 *)(in_ECX + 0x110);
  FUN_100c7b3a(param_1);
  return 0;
}


