// 100ca2e4 size=103 FUN_100ca2e4

void FUN_100ca2e4(void)

{
  uint *puVar1;
  uint uVar2;
  uint uVar3;
  uint uVar4;
  int in_ECX;
  undefined4 local_c;
  undefined4 local_8;
  
  puVar1 = *(uint **)(in_ECX + 0x100);
  uVar2 = puVar1[3];
  uVar3 = *puVar1;
  uVar4 = puVar1[4];
  FUN_100853cf(0,&local_8);
  FUN_100853cf(1,&local_c);
  FUN_100c9a7f(0x10042,uVar4,uVar2,local_c,local_8,0,uVar3 & 0xfffff,0,0,0,0);
  return;
}


