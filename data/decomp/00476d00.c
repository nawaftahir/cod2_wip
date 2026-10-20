
undefined4 FUN_00476d00(HWND param_1,int param_2,short param_3)

{
  if (param_2 == 0x10) {
    EndDialog(param_1,1);
  }
  else if (param_2 != 0x110) {
    if (param_2 != 0x111) {
      return 0;
    }
    if (param_3 == 1) {
      EndDialog(param_1,1);
      return 1;
    }
  }
  return 1;
}

