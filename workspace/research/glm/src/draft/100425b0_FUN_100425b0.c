


void FUN_100425b0(int param_1,char param_2)

{
  int iVar1;
  int iVar2;
  unsigned int uVar3;
  int iVar4;
  int *piVar5;
  unsigned int *puStack_8;
  
  puStack_8 = (unsigned int *)(*(void *)**(unsigned int **)(param_1 + 4))(param_1,1,0x68);
  *(unsigned int **)(param_1 + 0x150) = puStack_8;
  *puStack_8 = &LAB_10041db0;
  if (param_2 != '\0') {
    _param_2 = 0;
    if (0 < *(int *)(param_1 + 0x44)) {
      piVar5 = (int *)(*(int *)(param_1 + 0x4c) + 8);
      puStack_8 = puStack_8 + 0x10;
      do {
        iVar2 = piVar5[1];
        iVar4 = piVar5[5] + -1 + *piVar5;
        iVar1 = piVar5[6] + -1 + iVar2;
        uVar3 = (**(void **)(*(int *)(param_1 + 4) + 0x14))
                          (param_1,1,0,iVar4 - iVar4 % *piVar5,iVar1 - iVar1 % iVar2,iVar2);
        *puStack_8 = uVar3;
        puStack_8 = puStack_8 + 1;
        _param_2 = _param_2 + 1;
        piVar5 = piVar5 + 0x15;
      } while (_param_2 < *(int *)(param_1 + 0x44));
    }
    return;
  }
  iVar4 = (**(void **)(*(int *)(param_1 + 4) + 4))(param_1,1,0x500);
  puStack_8[7] = iVar4 + 0x80;
  puStack_8[8] = iVar4 + 0x100;
  puStack_8[9] = iVar4 + 0x180;
  puStack_8[10] = iVar4 + 0x200;
  puStack_8[0xb] = iVar4 + 0x280;
  puStack_8[0xc] = iVar4 + 0x300;
  puStack_8[6] = iVar4;
  puStack_8[0xd] = iVar4 + 0x380;
  puStack_8[0xe] = iVar4 + 0x400;
  puStack_8[0xf] = iVar4 + 0x480;
  puStack_8[0x10] = 0;
  return;
}


