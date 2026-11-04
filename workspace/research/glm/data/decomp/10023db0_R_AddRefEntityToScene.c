// 10023db0 size=209 R_AddRefEntityToScene

int R_AddRefEntityToScene(int *param_1,undefined4 param_2,undefined4 param_3)

{
  int iVar1;
  
  if (*param_1 < 2) {
    iVar1 = FUN_10023cc0(param_1,param_2,param_3);
    return iVar1;
  }
  if ((*(char *)(DAT_101ce624 + 8) != '\0') && (0x1cc4 < (uint)DAT_101da9c8[0x28003])) {
    (*(code *)RI_CL_FlushDebugData)(5,3000,"gfx/2d/warning@models.jpg");
  }
  iVar1 = *param_1;
  if ((iVar1 < 0) || (9 < iVar1)) {
    FUN_100138c0(1,&DAT_10196d00,iVar1);
  }
  if (0x1ff7 < (uint)DAT_101da9c8[0x28003]) {
    if (DAT_1076a878 != *DAT_101da9c8) {
      DAT_1076a878 = *DAT_101da9c8;
      (*(code *)RI_Printf)(2,"refEntity buffer exceeded - not drawing model\n");
    }
    return 0;
  }
  iVar1 = FUN_10023af0();
  if (iVar1 < 0) {
    return 0;
  }
  FUN_10023780(iVar1,param_1,param_2);
  return iVar1 * 0x74 + DAT_10678510;
}


