// 1000cf90 size=119 FUN_1000cf90

void FUN_1000cf90(undefined4 param_1,undefined4 param_2)

{
  undefined2 in_AX;
  int iVar1;
  undefined4 uVar2;
  undefined4 in_ECX;
  undefined4 *unaff_ESI;
  
  *(undefined2 *)(unaff_ESI + 6) = in_AX;
  *(undefined2 *)((int)unaff_ESI + 0x1a) = in_AX;
  *(undefined2 *)(unaff_ESI + 7) = 1;
  *unaff_ESI = 5;
  if (DAT_101d496b == '\0') {
    in_ECX = 1;
  }
  iVar1 = (**(code **)(*DAT_101d1bf8 + 100))
                    (DAT_101d1bf8,in_AX,in_ECX,0,param_1,param_2,unaff_ESI + 1,0);
  if (iVar1 < 0) {
    uVar2 = FUN_100efe3c(iVar1);
    FUN_100138c0(1,"CreateCubeTexture ( %s, %i, %i, %i ) failed: %08x = %s",unaff_ESI[8],
                 *(undefined2 *)(unaff_ESI + 6),in_ECX,param_1,iVar1,uVar2);
  }
  return;
}


