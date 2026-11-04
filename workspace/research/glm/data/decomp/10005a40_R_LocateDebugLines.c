// 10005a40 size=199 R_LocateDebugLines

void R_LocateDebugLines(undefined4 *param_1,undefined4 param_2,undefined4 *param_3,
                       undefined4 param_4)

{
  undefined4 *puVar1;
  
  if (DAT_101ae500 == 0) {
    DAT_101ae500 = (*(code *)RI_Z_MallocInternal)(DAT_101ae508 * 0x28);
    DAT_101ae504 = 0;
  }
  if (DAT_101ae504 != DAT_101ae508) {
    puVar1 = (undefined4 *)(DAT_101ae500 + DAT_101ae504 * 0x28);
    *puVar1 = *param_1;
    puVar1[1] = param_1[1];
    puVar1[2] = param_1[2];
    puVar1 = (undefined4 *)(DAT_101ae500 + 0xc + DAT_101ae504 * 0x28);
    *puVar1 = *param_3;
    puVar1[1] = param_3[1];
    puVar1[2] = param_3[2];
    *(undefined4 *)(DAT_101ae500 + 0x1c + DAT_101ae504 * 0x28) = param_2;
    *(undefined4 *)(DAT_101ae500 + 0x20 + DAT_101ae504 * 0x28) = DAT_10678504;
    *(undefined4 *)(DAT_101ae500 + 0x24 + DAT_101ae504 * 0x28) = param_4;
    DAT_101ae504 = DAT_101ae504 + 1;
  }
  return;
}


