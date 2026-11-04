// 100c229a size=77 FUN_100c229a

undefined4 FUN_100c229a(uint param_1,uint param_2)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  int in_ECX;
  
  uVar2 = *(undefined4 *)(*(int *)(in_ECX + 0x18) + param_2 * 4);
  if (param_2 < param_1) {
    do {
      puVar1 = (undefined4 *)(*(int *)(in_ECX + 0x18) + param_2 * 4);
      param_2 = param_2 + 1;
      *puVar1 = puVar1[1];
    } while (param_2 < param_1);
  }
  else {
    for (; param_1 < param_2; param_2 = param_2 - 1) {
      puVar1 = (undefined4 *)(*(int *)(in_ECX + 0x18) + param_2 * 4);
      *puVar1 = puVar1[-1];
    }
  }
  *(undefined4 *)(*(int *)(in_ECX + 0x18) + param_1 * 4) = uVar2;
  return 0;
}


