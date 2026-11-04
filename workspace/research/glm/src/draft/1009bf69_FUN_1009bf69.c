extern int FUN_1006506e();
extern int FUN_10082872();
extern int FUN_10082e36();
extern int FUN_10083255();
extern int FUN_10083442();
extern int FUN_1009a568();


int FUN_1009bf69(int param_1)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  char *pcVar5;
  
  if (param_1 != 0) {
    iVar3 = FUN_1006506e(0x50);
    if (iVar3 == 0) {
      iVar3 = 0;
    }
    else {
      iVar3 = FUN_10083255(0,0,0,0,1,param_1 + 0x10);
    }
    if (iVar3 != 0) {
      iVar4 = FUN_1006506e(0x24);
      if (iVar4 == 0) {
        iVar4 = 0;
      }
      else {
        iVar4 = FUN_10082e36(3,0xe,1,1,0x200);
      }
      *(int *)(iVar3 + 0x10) = iVar4;
      if (iVar4 != 0) {
        iVar4 = FUN_1006506e(0x40);
        if (iVar4 == 0) {
          iVar4 = 0;
        }
        else {
          pcVar2 = *(char **)(param_1 + 0x18);
          pcVar5 = pcVar2;
          do {
            cVar1 = *pcVar5;
            pcVar5 = pcVar5 + 1;
          } while (cVar1 != '\0');
          iVar4 = FUN_10083442(5,pcVar2,pcVar5 + (1 - (int)(pcVar2 + 1)),param_1 + 0x10);
        }
        *(int *)(iVar3 + 0x20) = iVar4;
        if (iVar4 != 0) {
          iVar4 = FUN_1006506e(0x14);
          if (iVar4 == 0) {
            iVar4 = 0;
          }
          else {
            iVar4 = FUN_10082872(*(unsigned int *)(iVar3 + 0x20),0,"Value");
          }
          if (iVar4 != 0) {
            *(int *)(iVar3 + 0x20) = iVar4;
            FUN_1009a568(iVar3);
            return iVar3;
          }
        }
      }
    }
  }
  return 0;
}


