// 10034010 size=184 FUN_10034010

int FUN_10034010(undefined4 *param_1,undefined4 *param_2,undefined4 param_3,int param_4)

{
  undefined1 uVar1;
  int in_EAX;
  int in_ECX;
  int unaff_EBX;
  undefined4 *puVar2;
  
  if (in_ECX < param_4 + 2) {
    FUN_10031780(param_4 / 2,1);
    param_4 = 0;
  }
  puVar2 = (undefined4 *)(in_EAX + param_4 * 0x10);
  if (unaff_EBX == 0) {
    puVar2[3] = 0xffffffff;
  }
  else {
    uVar1 = FUN_1010a8a8();
    *(undefined1 *)(puVar2 + 3) = uVar1;
    uVar1 = FUN_1010a8a8();
    *(undefined1 *)((int)puVar2 + 0xd) = uVar1;
    uVar1 = FUN_1010a8a8();
    *(undefined1 *)((int)puVar2 + 0xe) = uVar1;
    uVar1 = FUN_1010a8a8();
    *(undefined1 *)((int)puVar2 + 0xf) = uVar1;
  }
  puVar2[7] = puVar2[3];
  *puVar2 = *param_1;
  puVar2[1] = param_1[1];
  puVar2[2] = param_1[2];
  puVar2[4] = *param_2;
  puVar2[5] = param_2[1];
  puVar2[6] = param_2[2];
  return param_4 + 2;
}


