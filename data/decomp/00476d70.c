
undefined4 FUN_00476d70(HWND param_1,int param_2,short param_3)

{
  if ((param_2 != 0x110) && (param_2 == 0x111)) {
    if (param_3 == 1) {
      EndDialog(param_1,1);
    }
    else if (param_3 == 2) {
      EndDialog(param_1,0);
      return 0;
    }
  }
  return 0;
}

