extern unsigned int DAT_101d4810;
extern unsigned int DAT_101d49b0;
extern unsigned int DAT_101da9c8;
extern int FUN_100efe3c();


void FUN_1001e4b0(int param_1)

{
  int *piVar1;
  unsigned int uVar2;
  int iVar3;
  
  piVar1 = *(int **)(*(int *)(DAT_101da9c8 + 0x217c78) + 8);
  if ((DAT_101d4810 != 0) || (uVar2 = 0x2000, param_1 != 0)) {
    uVar2 = 0x1000;
  }
  iVar3 = (**(void **)(*piVar1 + 0x2c))(piVar1,0,0,&g_101d49b0,uVar2);
 
	int g_101d49b0 = DAT_101d49b0; if (iVar3 < 0) {
    (*(void *)RI_Printf)
              (0,
               "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n"
              );
    uVar2 = FUN_100efe3c(iVar3);
    (*(void *)RI_Printf)(0,"********** error information:  %s\n",uVar2);
    (*(void *)RI_Sys_DirectXFatalError)();
  }
  if ((g_101d49b0 & 0xf) != 0) {
    (**(void **)(*piVar1 + 0x30))(piVar1);
    g_101d49b0 = 0;
  }
  return;
}


