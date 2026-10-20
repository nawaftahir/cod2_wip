
CDialog * __thiscall FUN_00479990(CDialog *param_1,byte param_2)

{
  CDialog::~CDialog(param_1);
  if ((param_2 & 1) != 0) {
    _free(param_1);
  }
  return param_1;
}

