extern int FUN_1006dca1();


unsigned int FUN_1006e1ef(int param_1)

{
  int iVar1;
  
  do {
    while( true ) {
      while( true ) {
        while( true ) {
          if (param_1 == 0) {
            return 1;
          }
          iVar1 = *(int *)(param_1 + 4);
          if (iVar1 != 1) break;
          iVar1 = FUN_1006e1ef(*(unsigned int *)(param_1 + 8));
          if (iVar1 == 0) {
            return 0;
          }
          param_1 = *(int *)(param_1 + 0xc);
        }
        if (iVar1 != 6) break;
        param_1 = *(int *)(param_1 + 0x18);
      }
      if (iVar1 != 8) break;
LAB_1006e22e:
      param_1 = *(int *)(param_1 + 0x10);
    }
    if (iVar1 == 9) {
      if ((-1 < *(int *)(param_1 + 0x10)) && (*(int *)(param_1 + 0x10) < 3)) {
        return 1;
      }
      return 0;
    }
    if (iVar1 != 0xb) {
      if (iVar1 != 0xd) {
        FUN_1006dca1();
        return 0;
      }
      goto LAB_1006e22e;
    }
    param_1 = *(int *)(param_1 + 0x20);
  } while( true );
}


