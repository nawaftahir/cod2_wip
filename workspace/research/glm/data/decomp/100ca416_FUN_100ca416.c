// 100ca416 size=54 FUN_100ca416

void FUN_100ca416(void)

{
  uint *puVar1;
  uint uVar2;
  uint uVar3;
  int in_ECX;
  
  puVar1 = *(uint **)(in_ECX + 0x100);
  uVar2 = puVar1[2];
  uVar3 = *puVar1 & 0xfffff;
  FUN_100c9a7f(0x5a,puVar1[4],puVar1[3],uVar2,uVar2 + uVar3 * 4,uVar2 + uVar3 * 8,uVar3,0,0,0,0);
  return;
}


