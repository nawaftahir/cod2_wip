
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void __fastcall FUN_0047d8b0(char *param_1,char *param_2,undefined4 param_3,int param_4)

{
  DWORD DVar1;
  int iVar2;
  char *unaff_EDI;
  char local_14 [4];
  char local_10 [4];
  char local_c [4];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  local_14 = (char  [4])s_<unknown>_00550a54._0_4_;
  local_10 = (char  [4])s_<unknown>_00550a54._4_4_;
  local_c._0_2_ = s_<unknown>_00550a54._8_2_;
  if (param_1 == (char *)0x0) {
    param_1 = local_14;
  }
  if (param_2 == (char *)0x0) {
    param_2 = local_14;
  }
  DVar1 = GetModuleFileNameA((HMODULE)0x0,&DAT_01141e70,0x104);
  if (DVar1 == 0) {
    DAT_01141e70 = s_<unknown_application>_00550a3c[0];
    DAT_01141e70_1._0_1_ = s_<unknown_application>_00550a3c[1];
    DAT_01141e70_1._1_1_ = s_<unknown_application>_00550a3c[2];
    DAT_01141e70_1._2_1_ = s_<unknown_application>_00550a3c[3];
    DAT_01141e74 = s_<unknown_application>_00550a3c[4];
    DAT_01141e74_1._0_1_ = s_<unknown_application>_00550a3c[5];
    DAT_01141e74_1._1_1_ = s_<unknown_application>_00550a3c[6];
    DAT_01141e74_1._2_1_ = s_<unknown_application>_00550a3c[7];
    DAT_01141e78 = s_<unknown_application>_00550a3c[8];
    DAT_01141e78_1._0_1_ = s_<unknown_application>_00550a3c[9];
    DAT_01141e78_1._1_1_ = s_<unknown_application>_00550a3c[10];
    DAT_01141e78_1._2_1_ = s_<unknown_application>_00550a3c[0xb];
    DAT_01141e7c = s_<unknown_application>_00550a3c[0xc];
    DAT_01141e7c_1._0_1_ = s_<unknown_application>_00550a3c[0xd];
    DAT_01141e7c_1._1_1_ = s_<unknown_application>_00550a3c[0xe];
    DAT_01141e7c_1._2_1_ = s_<unknown_application>_00550a3c[0xf];
    DAT_01141e80 = s_<unknown_application>_00550a3c[0x10];
    DAT_01141e80_1._0_1_ = s_<unknown_application>_00550a3c[0x11];
    DAT_01141e80_1._1_1_ = s_<unknown_application>_00550a3c[0x12];
    DAT_01141e80_1._2_1_ = s_<unknown_application>_00550a3c[0x13];
    DAT_01141e84 = s_<unknown_application>_00550a3c[0x14];
    DAT_01141e84_1 = s_<unknown_application>_00550a3c[0x15];
  }
  iVar2 = _sprintf(unaff_EDI,"Expression:\n\t%s\n\nModule:\t%s\nFile:\t%s\nLine:\t%d\n\n",param_2,
                   &DAT_01141e70,param_1,param_3);
  FUN_0047d720(unaff_EDI + iVar2,0x20,param_4 + 1);
  return;
}

