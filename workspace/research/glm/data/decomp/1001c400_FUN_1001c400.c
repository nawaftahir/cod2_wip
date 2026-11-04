// 1001c400 size=149 FUN_1001c400

uint FUN_1001c400(undefined4 param_1)

{
  undefined4 *in_EAX;
  uint uVar1;
  int iVar2;
  undefined2 *puVar3;
  int local_4;
  
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    uVar1 = FUN_1001c3c0(param_1);
    return uVar1;
  }
  local_4 = 0;
  iVar2 = DAT_101ce708;
  if (*(short *)((int)in_EAX + 6) != 0) {
    puVar3 = (undefined2 *)((int)in_EAX + 0x1a);
    do {
      uVar1 = FUN_1001c2f0(param_1,*in_EAX,*puVar3,*(undefined4 *)(puVar3 + 3));
      if ((char)uVar1 == '\0') {
LAB_1001c48d:
        return uVar1 & 0xffffff00;
      }
      uVar1 = FUN_1001c2f0(param_1,*in_EAX,puVar3[-1],*(undefined4 *)(puVar3 + 1));
      if ((char)uVar1 == '\0') goto LAB_1001c48d;
      iVar2 = local_4 + 1;
      puVar3 = puVar3 + 0xe;
      local_4 = iVar2;
    } while (iVar2 < (int)(uint)*(ushort *)((int)in_EAX + 6));
  }
  return CONCAT31((int3)((uint)iVar2 >> 8),1);
}


