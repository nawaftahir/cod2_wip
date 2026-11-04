// 1000ce80 size=113 FUN_1000ce80

void FUN_1000ce80(undefined4 param_1,undefined4 param_2)

{
  undefined2 in_AX;
  int iVar1;
  undefined2 in_CX;
  undefined4 *unaff_ESI;
  
  *(undefined2 *)((int)unaff_ESI + 0x1a) = in_AX;
  *(undefined2 *)(unaff_ESI + 6) = in_CX;
  *(undefined2 *)(unaff_ESI + 7) = 1;
  *unaff_ESI = 3;
  iVar1 = (**(code **)(*DAT_101d1bf8 + 0x5c))(DAT_101d1bf8,in_CX,in_AX,param_1,param_2);
  if (iVar1 < 0) {
    FUN_100efe3c(iVar1);
    FUN_100138c0(1,"Create2DTexture( %s, %i, %i, %i, %i ) failed: %08x = %s",unaff_ESI[8],
                 *(undefined2 *)(unaff_ESI + 6),*(undefined2 *)((int)unaff_ESI + 0x1a),0);
  }
  return;
}


