
void __fastcall FUN_004b5d70(undefined4 *param_1)

{
  undefined4 *puVar1;
  
  puVar1 = (undefined4 *)param_1[0x2c];
  if (((puVar1 != param_1) && (puVar1 != (undefined4 *)param_1[0x2b])) &&
     (puVar1 != (undefined4 *)0x0)) {
    (**(code **)*puVar1)(1);
  }
  puVar1 = (undefined4 *)param_1[0x2b];
  if ((puVar1 != param_1) && (puVar1 != (undefined4 *)0x0)) {
    (**(code **)*puVar1)(1);
  }
  puVar1 = (undefined4 *)param_1[0x29];
  if ((puVar1 != (undefined4 *)param_1[0x27]) && (puVar1 != (undefined4 *)0x0)) {
    (**(code **)*puVar1)(1);
  }
  puVar1 = (undefined4 *)param_1[0x2a];
  if ((puVar1 != (undefined4 *)param_1[0x28]) && (puVar1 != (undefined4 *)0x0)) {
    (**(code **)*puVar1)(1);
  }
  if ((undefined4 *)param_1[0x27] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[0x27])(1);
  }
  if ((undefined4 *)param_1[0x28] != (undefined4 *)0x0) {
    (*(code *)**(undefined4 **)param_1[0x28])(1);
  }
  param_1[0x28] = 0;
  param_1[0x27] = 0;
  param_1[0x2a] = 0;
  param_1[0x29] = 0;
  param_1[0x2b] = param_1;
  param_1[0x2c] = param_1;
  param_1[0x5b] = 0;
  FUN_004c0860(0);
  return;
}

