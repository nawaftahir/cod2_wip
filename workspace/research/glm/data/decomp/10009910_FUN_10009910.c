// 10009910 size=253 FUN_10009910

void FUN_10009910(int param_1,float *param_2)

{
  uint uVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  undefined4 local_200 [128];
  
  puVar3 = DAT_101ce5e8;
  if (*(int *)(param_1 + 0x28) == 0) {
    if (DAT_101ce5e8 == (undefined4 *)0x0) {
      FUN_100138c0(1,"more than %i queued portals",0x100);
    }
    DAT_101ce5e8 = (undefined4 *)*DAT_101ce5e8;
    *(undefined4 **)(param_1 + 0x28) = puVar3;
    *(undefined1 *)(param_1 + 0x25) = 0;
  }
  else if (*(char *)(param_1 + 0x25) == '@') {
    FUN_10057a40(0x40,local_200);
    uVar1 = FUN_10057f10(0x3e,local_200);
    if (uVar1 == 0x40) {
      FUN_100138c0(1,"More than %i points on a clipped portal\'s convex hull\n",0x40);
    }
    *(char *)(param_1 + 0x25) = (char)uVar1;
    puVar3 = local_200;
    puVar4 = *(undefined4 **)(param_1 + 0x28);
    for (iVar2 = (uVar1 & 0xff) << 1; iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar4 = *puVar3;
      puVar3 = puVar3 + 1;
      puVar4 = puVar4 + 1;
    }
    for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
      *(undefined1 *)puVar4 = *(undefined1 *)puVar3;
      puVar3 = (undefined4 *)((int)puVar3 + 1);
      puVar4 = (undefined4 *)((int)puVar4 + 1);
    }
  }
  *(float *)(*(int *)(param_1 + 0x28) + (uint)*(byte *)(param_1 + 0x25) * 8) =
       *(float *)(param_1 + 0x2c) * *param_2 +
       *(float *)(param_1 + 0x30) * param_2[1] + *(float *)(param_1 + 0x34) * param_2[2];
  *(float *)(*(int *)(param_1 + 0x28) + 4 + (uint)*(byte *)(param_1 + 0x25) * 8) =
       *(float *)(param_1 + 0x38) * *param_2 +
       *(float *)(param_1 + 0x3c) * param_2[1] + *(float *)(param_1 + 0x40) * param_2[2];
  *(char *)(param_1 + 0x25) = *(char *)(param_1 + 0x25) + '\x01';
  return;
}


