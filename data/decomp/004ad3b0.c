
undefined4 __thiscall FUN_004ad3b0(undefined4 *param_1,int param_2)

{
  int iVar1;
  uint in_EAX;
  undefined4 uVar2;
  uint uVar3;
  uint uVar4;
  undefined4 *puVar5;
  
  if ((((param_2 != 0) && (iVar1 = *(int *)(param_2 + 0x1c), iVar1 != 0)) &&
      (param_1 != (undefined4 *)0x0)) && (*(int *)(iVar1 + 4) == 0x2a)) {
    uVar2 = FUN_004acfc0(*(undefined4 *)(param_2 + 0x30),param_1);
    *(undefined4 *)(param_2 + 0x30) = uVar2;
    if (2 < in_EAX) {
      uVar3 = *(int *)(iVar1 + 0x24) - 0x106;
      if (uVar3 < in_EAX) {
        param_1 = (undefined4 *)((int)param_1 + (in_EAX - uVar3));
        in_EAX = uVar3;
      }
      puVar5 = *(undefined4 **)(iVar1 + 0x30);
      for (uVar3 = in_EAX >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
        *puVar5 = *param_1;
        param_1 = param_1 + 1;
        puVar5 = puVar5 + 1;
      }
      for (uVar3 = in_EAX & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
        *(undefined1 *)puVar5 = *(undefined1 *)param_1;
        param_1 = (undefined4 *)((int)param_1 + 1);
        puVar5 = (undefined4 *)((int)puVar5 + 1);
      }
      *(uint *)(iVar1 + 100) = in_EAX;
      *(uint *)(iVar1 + 0x54) = in_EAX;
      uVar3 = (uint)**(byte **)(iVar1 + 0x30);
      *(uint *)(iVar1 + 0x40) = uVar3;
      *(uint *)(iVar1 + 0x40) =
           (uVar3 << ((byte)*(undefined4 *)(iVar1 + 0x50) & 0x1f) ^
           (uint)(*(byte **)(iVar1 + 0x30))[1]) & *(uint *)(iVar1 + 0x4c);
      uVar3 = 0;
      do {
        uVar4 = ((uint)*(byte *)(*(int *)(iVar1 + 0x30) + 2 + uVar3) ^
                *(int *)(iVar1 + 0x40) << ((byte)*(undefined4 *)(iVar1 + 0x50) & 0x1f)) &
                *(uint *)(iVar1 + 0x4c);
        *(uint *)(iVar1 + 0x40) = uVar4;
        *(undefined2 *)(*(int *)(iVar1 + 0x38) + (*(uint *)(iVar1 + 0x2c) & uVar3) * 2) =
             *(undefined2 *)(*(int *)(iVar1 + 0x3c) + uVar4 * 2);
        *(short *)(*(int *)(iVar1 + 0x3c) + *(int *)(iVar1 + 0x40) * 2) = (short)uVar3;
        uVar3 = uVar3 + 1;
      } while (uVar3 <= in_EAX - 3);
    }
    return 0;
  }
  return 0xfffffffe;
}

