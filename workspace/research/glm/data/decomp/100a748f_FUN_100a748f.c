// 100a748f size=122 FUN_100a748f

int FUN_100a748f(void)

{
  undefined4 *puVar1;
  int iVar2;
  int in_ECX;
  undefined4 local_f8;
  undefined4 uStack_f4;
  undefined4 uStack_f0;
  undefined1 local_58 [64];
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  local_8 = 0;
  local_18 = 0;
  iVar2 = 1;
  local_14 = 1;
  local_10 = 2;
  local_c = 3;
  if ((**(uint **)(in_ECX + 0x100) & 0xfffff) == 3) {
    iVar2 = FUN_100b99af(*(uint **)(in_ECX + 0x100),&DAT_10116a70,local_58,&local_8,&local_f8,
                         &local_18,3,1);
    if (iVar2 == 0) {
      puVar1 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 8);
      *puVar1 = local_f8;
      puVar1[1] = uStack_f4;
      puVar1[2] = uStack_f0;
      iVar2 = 0;
    }
  }
  return iVar2;
}


