// 10057990 size=58 FUN_10057990

void FUN_10057990(int param_1,int param_2,uint param_3)

{
  int in_EAX;
  undefined4 *puVar1;
  int in_ECX;
  uint uVar2;
  int in_EDX;
  undefined4 *puVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  puVar1 = (undefined4 *)(in_ECX + in_EAX * 4);
  puVar3 = (undefined4 *)(param_1 + in_EDX * 4);
  if (0 < param_2) {
    do {
      puVar4 = (undefined4 *)*puVar1;
      puVar5 = (undefined4 *)*puVar3;
      for (uVar2 = param_3 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
        *puVar5 = *puVar4;
        puVar4 = puVar4 + 1;
        puVar5 = puVar5 + 1;
      }
      puVar1 = puVar1 + 1;
      puVar3 = puVar3 + 1;
      param_2 = param_2 + -1;
      for (uVar2 = param_3 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
        *(undefined1 *)puVar5 = *(undefined1 *)puVar4;
        puVar4 = (undefined4 *)((int)puVar4 + 1);
        puVar5 = (undefined4 *)((int)puVar5 + 1);
      }
    } while (param_2 != 0);
  }
  return;
}


