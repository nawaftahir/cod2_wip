
HGDIOBJ FUN_0043ef30(int *param_1,int param_2)

{
  HGDIOBJ pvVar1;
  
  if (param_2 == 1) {
    (**(code **)(*param_1 + 0x2c))(&DAT_00c0c0c0);
    pvVar1 = GetStockObject(1);
    return pvVar1;
  }
  return (HGDIOBJ)0x0;
}

