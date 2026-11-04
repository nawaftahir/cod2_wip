// 1002b7f0 size=193 FUN_1002b7f0

int FUN_1002b7f0(undefined4 param_1,undefined4 param_2,undefined4 param_3)

{
  short sVar1;
  int iVar2;
  int unaff_EBX;
  int iVar3;
  int local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  if ((DAT_101d492c == '\0') && (sVar1 = *(short *)(unaff_EBX + 2), sVar1 < 0x201)) {
    iVar3 = 5;
    if (0x20 < sVar1) {
      do {
        iVar3 = iVar3 + 1;
      } while (1 << ((byte)iVar3 & 0x1f) < (int)sVar1);
    }
    iVar2 = FUN_1002acd0(iVar3);
    if (iVar2 != 0) {
      DAT_106a3130 = DAT_106a3130 + (1 << ((byte)iVar3 & 0x1f));
      DAT_106a3134 = DAT_106a3134 + *(short *)(unaff_EBX + 2);
      *(undefined4 *)(iVar2 + 0xc) = param_1;
      *(int *)(iVar2 + 8) = unaff_EBX;
      *(undefined4 *)(iVar2 + 4) = param_2;
      local_8 = param_2;
      local_4 = param_3;
      local_c = iVar2;
      FUN_1002b690(&local_c,&DAT_101daa00);
      FUN_1002b790();
      return iVar2;
    }
  }
  return 0;
}


