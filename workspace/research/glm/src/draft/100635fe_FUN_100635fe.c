extern int FUN_10062db3();


int FUN_100635fe(unsigned int *param_1,int param_2,int *param_3)

{
  unsigned int uVar1;
  int iVar2;
  unsigned int *puVar3;
  int *piVar4;
  int local_8;
  
  piVar4 = param_3;
  if (param_3 != (int *)0x0) {
    *param_3 = 0;
  }
  uVar1 = *param_1 & 0xffff0000;
  if ((uVar1 == 0x46580000) || (uVar1 == 0xfffe0000)) {
LAB_100636b3:
    iVar2 = 0;
  }
  else {
    if (uVar1 == 0xffff0000) {
      local_8 = 0;
      iVar2 = FUN_10062db3(param_1,0x42415443,&local_8,&param_1);
      if (iVar2 < 0) {
        return iVar2;
      }
      if (local_8 == 0) goto LAB_100636b3;
      if ((unsigned int *)0x1b < param_1) {
        puVar3 = (unsigned int *)(*(int *)(local_8 + 0x10) + local_8);
        if ((unsigned int *)(*(int *)(local_8 + 0xc) * 0x14 + 0x1cU) <= param_1) {
          iVar2 = 0;
          uVar1 = 0;
          if (*(int *)(local_8 + 0xc) != 0) {
            do {
              if (*(short *)(puVar3 + 1) == 3) {
                if ((param_1 <= (unsigned int *)*puVar3) || (iVar2 == 0x10)) goto LAB_10063637;
                *(int *)(param_2 + iVar2 * 4) = (int)*puVar3 + local_8;
                iVar2 = iVar2 + 1;
                piVar4 = param_3;
              }
              uVar1 = uVar1 + 1;
              puVar3 = puVar3 + 5;
            } while (uVar1 < *(unsigned int *)(local_8 + 0xc));
          }
          if (piVar4 != (int *)0x0) {
            *piVar4 = iVar2;
          }
          goto LAB_100636b3;
        }
      }
    }
LAB_10063637:
    iVar2 = -0x7789f4a7;
  }
  return iVar2;
}


