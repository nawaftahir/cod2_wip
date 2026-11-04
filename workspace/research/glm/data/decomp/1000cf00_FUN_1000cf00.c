// 1000cf00 size=130 FUN_1000cf00

void FUN_1000cf00(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined2 in_AX;
  int iVar1;
  undefined4 uVar2;
  undefined2 in_CX;
  undefined2 in_DX;
  undefined4 *unaff_ESI;
  
  *(undefined2 *)(unaff_ESI + 7) = in_AX;
  *(undefined2 *)((int)unaff_ESI + 0x1a) = in_CX;
  *(undefined2 *)(unaff_ESI + 6) = in_DX;
  *unaff_ESI = 4;
  iVar1 = (**(code **)(*DAT_101d1bf8 + 0x60))
                    (DAT_101d1bf8,in_DX,in_CX,in_AX,param_1,param_2,param_3,param_4,unaff_ESI + 1,0)
  ;
  if (iVar1 < 0) {
    uVar2 = FUN_100efe3c(iVar1);
    FUN_100138c0(1,"Create3DTexture( %s, %i, %i, %i, %i, %i ) failed: %08x = %s",unaff_ESI[8],
                 *(undefined2 *)(unaff_ESI + 6),*(undefined2 *)((int)unaff_ESI + 0x1a),
                 *(undefined2 *)(unaff_ESI + 7),0,param_2,iVar1,uVar2);
  }
  return;
}


