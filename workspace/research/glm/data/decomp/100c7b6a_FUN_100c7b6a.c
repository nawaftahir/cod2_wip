// 100c7b6a size=296 FUN_100c7b6a

int FUN_100c7b6a(void)

{
  int iVar1;
  undefined4 uVar2;
  uint uVar3;
  int in_ECX;
  int *piVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  int *local_8;
  
  local_8 = (int *)0x0;
  FUN_10084086(0x53455250);
  iVar1 = FUN_10093c0c();
  if (-1 < iVar1) {
    iVar1 = (**(code **)(**(int **)(in_ECX + 0xe0) + 8))(&local_8);
    if (-1 < iVar1) {
      if (iVar1 == 0) {
        uVar6 = 0;
        uVar5 = 1;
        piVar4 = local_8;
        uVar2 = (**(code **)(*local_8 + 0x10))(local_8,1,0);
        uVar2 = (**(code **)(*local_8 + 0xc))(local_8,uVar2);
        iVar1 = FUN_100840db(uVar2,piVar4,uVar5,uVar6);
        if (iVar1 < 0) goto LAB_100c7c73;
      }
      uVar3 = FUN_10084214();
      if (uVar3 < 0x8001) {
        iVar1 = FUN_100c40ff(uVar3);
        if (-1 < iVar1) {
          _memmove((void *)(*(int *)(in_ECX + 0x10c) + 4 + uVar3 * 4),
                   (void *)(*(int *)(in_ECX + 0x10c) + 4),*(int *)(in_ECX + 0x110) * 4 - 4);
          iVar1 = FUN_10084220(*(int *)(in_ECX + 0x10c) + 4,uVar3);
          if (-1 < iVar1) {
            *(int *)(in_ECX + 0x110) = *(int *)(in_ECX + 0x110) + uVar3;
            *(int *)(in_ECX + 0x120) = *(int *)(in_ECX + 0x120) + uVar3;
            *(undefined4 *)(in_ECX + 0x11c) = *(undefined4 *)(in_ECX + 0x110);
            iVar1 = 0;
          }
        }
      }
      else {
        FUN_1008b0b5();
        iVar1 = -0x7fffbffb;
      }
    }
  }
LAB_100c7c73:
  if (local_8 != (int *)0x0) {
    (**(code **)(*local_8 + 8))(local_8);
    local_8 = (int *)0x0;
  }
  FUN_100840a3();
  return iVar1;
}


