
void FUN_0048a480(int param_1,code *param_2,undefined4 param_3)

{
  undefined4 *puVar1;
  uint uVar2;
  
  if (param_1 == 1) {
    uVar2 = 0;
    do {
      for (puVar1 = *(undefined4 **)((int)&DAT_01147dd8 + uVar2); puVar1 != (undefined4 *)0x0;
          puVar1 = (undefined4 *)puVar1[1]) {
        if (*(char *)(puVar1 + 2) == '\x04') {
          (*param_2)(*puVar1,param_3);
        }
      }
      uVar2 = uVar2 + 4;
    } while (uVar2 < 0x1000);
  }
  return;
}

