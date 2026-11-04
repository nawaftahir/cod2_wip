// 1004d520 size=59 FUN_1004d520

void FUN_1004d520(int *param_1)

{
  undefined4 *puVar1;
  
  puVar1 = (undefined4 *)param_1[0x66];
  *puVar1 = FUN_1004d460;
  *(undefined1 *)(puVar1 + 4) = 0;
  *(undefined1 *)((int)puVar1 + 0x11) = 0;
  *(undefined1 *)(puVar1 + 5) = 1;
  (**(code **)(*param_1 + 0x10))(param_1);
  (**(code **)param_1[0x67])(param_1);
  param_1[0x25] = 0;
  return;
}


