// 1001e4b0 size=138 FUN_1001e4b0

void FUN_1001e4b0(int param_1)

{
  int *piVar1;
  undefined4 uVar2;
  int iVar3;
  
  piVar1 = *(int **)(*(int *)(DAT_101da9c8 + 0x217c78) + 8);
  if ((DAT_101d4810 != 0) || (uVar2 = 0x2000, param_1 != 0)) {
    uVar2 = 0x1000;
  }
  iVar3 = (**(code **)(*piVar1 + 0x2c))(piVar1,0,0,&DAT_101d49b0,uVar2);
  if (iVar3 < 0) {
    (*(code *)RI_Printf)
              (0,
               "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n"
              );
    uVar2 = FUN_100efe3c(iVar3);
    (*(code *)RI_Printf)(0,"********** error information:  %s\n",uVar2);
    (*(code *)RI_Sys_DirectXFatalError)();
  }
  if ((DAT_101d49b0 & 0xf) != 0) {
    (**(code **)(*piVar1 + 0x30))(piVar1);
    DAT_101d49b0 = 0;
  }
  return;
}


