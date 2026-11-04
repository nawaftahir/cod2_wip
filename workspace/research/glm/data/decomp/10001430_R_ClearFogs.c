// 10001430 size=42 R_ClearFogs

void R_ClearFogs(undefined4 *param_1)

{
  int iVar1;
  
  iVar1 = DAT_101d1b9c;
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    *(undefined4 *)(DAT_101d1b9c + 200) = *param_1;
    *(undefined4 *)(iVar1 + 0xcc) = param_1[1];
    *(undefined4 *)(iVar1 + 0xd0) = param_1[2];
  }
  return;
}


