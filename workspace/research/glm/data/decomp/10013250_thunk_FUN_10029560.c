// 10013250 size=5 thunk_FUN_10029560

void thunk_FUN_10029560(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  int iVar5;
  int *piVar6;
  int *piStack_4;
  
  iVar3 = DAT_1042e778;
  piStack_4 = &DAT_10696c44;
  do {
    iVar5 = *piStack_4;
    if (iVar5 != -1) {
      iVar1 = *(int *)(iVar3 + 0x30000);
      if (0x30000 - iVar1 < 8) {
        puVar4 = (undefined2 *)0x0;
        *(undefined4 *)(iVar3 + 0x30008) = 0;
      }
      else {
        puVar4 = (undefined2 *)(iVar1 + iVar3);
        *(int *)(iVar3 + 0x30000) = iVar1 + 8;
        *(int *)(iVar3 + 0x30004) = *(int *)(iVar3 + 0x30004) + 8;
        *(undefined2 **)(iVar3 + 0x30008) = puVar4;
        *puVar4 = 2;
        puVar4[1] = 8;
      }
      *(int *)(puVar4 + 2) = iVar3 + 8 + iVar5;
      *piStack_4 = -1;
    }
    iVar5 = 4;
    piVar6 = piStack_4;
    do {
      piVar6 = piVar6 + 1;
      iVar1 = *piVar6;
      if (iVar1 != -1) {
        iVar2 = *(int *)(iVar3 + 0x30000);
        if (0x30000 - iVar2 < 8) {
          puVar4 = (undefined2 *)0x0;
          *(undefined4 *)(iVar3 + 0x30008) = 0;
        }
        else {
          puVar4 = (undefined2 *)(iVar2 + iVar3);
          *(int *)(iVar3 + 0x30000) = iVar2 + 8;
          *(int *)(iVar3 + 0x30004) = *(int *)(iVar3 + 0x30004) + 8;
          *(undefined2 **)(iVar3 + 0x30008) = puVar4;
          *puVar4 = 2;
          puVar4[1] = 8;
        }
        *(int *)(puVar4 + 2) = iVar3 + 8 + iVar1;
        *piVar6 = -1;
      }
      iVar5 = iVar5 + -1;
    } while (iVar5 != 0);
    iVar5 = piStack_4[5];
    if (iVar5 != -1) {
      iVar1 = *(int *)(iVar3 + 0x30000);
      if (0x30000 - iVar1 < 8) {
        puVar4 = (undefined2 *)0x0;
        *(undefined4 *)(iVar3 + 0x30008) = 0;
      }
      else {
        puVar4 = (undefined2 *)(iVar1 + iVar3);
        *(int *)(iVar3 + 0x30000) = iVar1 + 8;
        *(int *)(iVar3 + 0x30004) = *(int *)(iVar3 + 0x30004) + 8;
        *(undefined2 **)(iVar3 + 0x30008) = puVar4;
        *puVar4 = 2;
        puVar4[1] = 8;
      }
      *(int *)(puVar4 + 2) = iVar3 + 8 + iVar5;
      piStack_4[5] = -1;
    }
    piStack_4 = piStack_4 + 7;
  } while (piStack_4 != &DAT_10696cd0);
  return;
}


