
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00451e00(void)

{
  float fVar1;
  float fVar2;
  int in_EAX;
  uint uVar3;
  int iVar4;
  
  fVar2 = _DAT_00556b30 / *(float *)(in_EAX + 0x60);
  uVar3 = (uint)(*(int *)(in_EAX + 0xf4) == 0);
  *(uint *)(in_EAX + 0xa4) = uVar3;
  iVar4 = (*(int *)(in_EAX + 0xf4) != 2) + 1;
  *(int *)(in_EAX + 0xa8) = iVar4;
  *(uint *)(in_EAX + 0xac) = (3 - iVar4) - uVar3;
  fVar1 = (float)*(int *)(in_EAX + 0x58) * fVar2;
  fVar2 = (float)*(int *)(in_EAX + 0x5c) * fVar2;
  *(float *)(in_EAX + 0xb0) = *(float *)(in_EAX + 0x70 + uVar3 * 4) - fVar1;
  *(float *)(in_EAX + 0xb8) = fVar1 + *(float *)(in_EAX + 0x70 + uVar3 * 4);
  *(float *)(in_EAX + 0xb4) = *(float *)(in_EAX + 0x70 + iVar4 * 4) - fVar2;
  *(float *)(in_EAX + 0xbc) = fVar2 + *(float *)(in_EAX + 0x70 + iVar4 * 4);
  FUN_00451eb0(in_EAX);
  return;
}

