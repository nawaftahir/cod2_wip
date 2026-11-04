// 10062d3b size=120 FUN_10062d3b

char * FUN_10062d3b(int *param_1)

{
  int iVar1;
  undefined1 local_134 [196];
  uint local_70;
  byte local_3c;
  int local_38;
  int local_34;
  
  if ((param_1 == (int *)0x0) ||
     (iVar1 = (**(code **)(*param_1 + 0x1c))(param_1,local_134), iVar1 < 0)) {
    return (char *)0x0;
  }
  local_70 = local_70 & 0xffff;
  if (local_70 < 0x200) {
    return (char *)(~-(uint)(local_70 != 0x101) & 0x1010c460);
  }
  if (local_70 < 0x300) {
    if (((0xc < local_34) && ((local_3c & 1) != 0)) && (local_38 == 0x18)) {
      return "vs_2_a";
    }
    return "vs_2_0";
  }
  return "vs_3_0";
}


