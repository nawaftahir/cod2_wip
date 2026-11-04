// 1005f2d0 size=144 FUN_1005f2d0

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_1005f2d0(char *param_1)

{
  int iVar1;
  int iVar2;
  char local_1000 [4092];
  undefined4 uStack_4;
  
  iVar1 = DAT_101aac70;
  uStack_4 = 0x1005f2da;
  iVar2 = DAT_101aac70 * 0x45c;
  _vsprintf(local_1000,param_1,&stack0x00000008);
  if (DAT_101aac70 != 0) {
    FUN_10061cd0(1,&DAT_1019b940,(&PTR_DAT_101a6abc)[iVar1 * 0x117],&DAT_101a6acc + iVar2,
                 *(undefined4 *)(&DAT_101a6ab0 + iVar2),local_1000);
    return;
  }
  FUN_10061cd0(1,&DAT_1019b93c,local_1000);
  return;
}


