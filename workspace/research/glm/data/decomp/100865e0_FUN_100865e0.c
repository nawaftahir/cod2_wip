// 100865e0 size=59 FUN_100865e0

uint FUN_100865e0(uint param_1,uint param_2,int param_3)

{
  int iVar1;
  int iVar2;
  
  iVar1 = *(int *)(*(int *)(*(int *)(param_3 + 0x18) + param_1 * 4) + 0x30);
  iVar2 = *(int *)(*(int *)(*(int *)(param_3 + 0x18) + param_2 * 4) + 0x30);
  if (iVar2 <= iVar1) {
    if (iVar2 < iVar1) {
      return 1;
    }
    if (param_2 <= param_1) {
      return (uint)(param_2 < param_1);
    }
  }
  return 0xffffffff;
}


