
void FUN_0040c620(int param_1,char param_2)

{
  uint3 uVar3;
  int iVar1;
  undefined4 *puVar2;
  undefined4 uVar4;
  int iVar5;
  
  if (*(int *)(param_1 + 0x18) != 0) {
    uVar3 = (uint3)((uint)*(int *)(param_1 + 0x18) >> 8);
    if (((param_2 == '\0') && (*(char *)(param_1 + 0x14) == '\0')) ||
       (*(char *)(param_1 + 100) == '\0')) {
      iVar1 = (uint)uVar3 << 8;
    }
    else {
      iVar1 = CONCAT31(uVar3,1);
    }
    (**(code **)(**(int **)(param_1 + 0x18) + 0x38))(iVar1);
    iVar1 = *(int *)(param_1 + 0x1c);
    iVar5 = 0;
    if (0 < iVar1) {
      do {
        if (((param_2 == '\0') && (*(char *)(param_1 + 0x14) == '\0')) ||
           ((iVar5 != *(int *)(param_1 + 0x54) || (*(char *)(param_1 + 100) != '\0')))) {
          uVar4 = 0;
        }
        else {
          uVar4 = 1;
        }
        puVar2 = (undefined4 *)FUN_0040abc0();
        (**(code **)(*(int *)*puVar2 + 0x38))(uVar4);
        iVar5 = iVar5 + 1;
      } while (iVar5 < iVar1);
    }
  }
  return;
}

