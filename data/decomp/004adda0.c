
void __fastcall FUN_004adda0(undefined4 param_1,int param_2)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  undefined4 *puVar4;
  
  *(int *)(param_2 + 0x34) = *(int *)(param_2 + 0x24) << 1;
  *(undefined2 *)(*(int *)(param_2 + 0x3c) + -2 + *(int *)(param_2 + 0x44) * 2) = 0;
  uVar3 = *(int *)(param_2 + 0x44) * 2 - 2;
  puVar4 = *(undefined4 **)(param_2 + 0x3c);
  for (uVar2 = uVar3 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
    *puVar4 = 0;
    puVar4 = puVar4 + 1;
  }
  for (uVar3 = uVar3 & 3; uVar3 != 0; uVar3 = uVar3 - 1) {
    *(undefined1 *)puVar4 = 0;
    puVar4 = (undefined4 *)((int)puVar4 + 1);
  }
  iVar1 = *(int *)(param_2 + 0x7c) * 0xc;
  *(uint *)(param_2 + 0x78) = (uint)*(ushort *)(&DAT_0053ddd2 + iVar1);
  *(uint *)(param_2 + 0x84) = (uint)*(ushort *)(&DAT_0053ddd0 + iVar1);
  *(uint *)(param_2 + 0x88) = (uint)*(ushort *)(&DAT_0053ddd4 + iVar1);
  *(uint *)(param_2 + 0x74) = (uint)*(ushort *)(&DAT_0053ddd6 + iVar1);
  *(undefined4 *)(param_2 + 100) = 0;
  *(undefined4 *)(param_2 + 0x54) = 0;
  *(undefined4 *)(param_2 + 0x6c) = 0;
  *(undefined4 *)(param_2 + 0x60) = 0;
  *(undefined4 *)(param_2 + 0x40) = 0;
  *(undefined4 *)(param_2 + 0x70) = 2;
  *(undefined4 *)(param_2 + 0x58) = 2;
  return;
}

