// 10085d21 size=61 FUN_10085d21

undefined4 FUN_10085d21(int param_1)

{
  undefined4 uVar1;
  int in_ECX;
  
  if (param_1 == 0) {
    uVar1 = 0x80004005;
  }
  else {
    *(undefined4 *)(in_ECX + 0x60) = *(undefined4 *)(param_1 + 0x60);
    *(undefined4 *)(in_ECX + 100) = *(undefined4 *)(param_1 + 100);
    *(undefined4 *)(in_ECX + 0x68) = *(undefined4 *)(param_1 + 0x68);
    *(undefined4 *)(in_ECX + 0x6c) = *(undefined4 *)(param_1 + 0x6c);
    *(undefined4 *)(in_ECX + 0x70) = *(undefined4 *)(param_1 + 0x70);
    *(undefined4 *)(in_ECX + 0x74) = *(undefined4 *)(param_1 + 0x74);
    uVar1 = 0;
  }
  return uVar1;
}


