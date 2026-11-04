
void __thiscall FUN_004bf370(undefined4 *param_1,char *param_2)

{
  char *pcVar1;
  char cVar2;
  
  *param_1 = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  if (param_2 != (char *)0x0) {
    cVar2 = *param_2;
    while (cVar2 != '\0') {
      switch((int)cVar2) {
      case 0x30:
      case 0x31:
      case 0x32:
      case 0x33:
      case 0x34:
      case 0x35:
      case 0x36:
      case 0x37:
      case 0x38:
      case 0x39:
        param_1[2] = cVar2 + -0x30 + param_1[2] * 10;
        break;
      case 0x43:
      case 99:
        *param_1 = 1;
        break;
      case 0x48:
      case 0x68:
        *param_1 = 4;
        param_1[1] = 1;
        break;
      case 0x55:
      case 0x75:
        *param_1 = 2;
        break;
      case 0x62:
        param_1[1] = 3;
        break;
      case 0x6c:
        param_1[1] = 2;
        break;
      case 0x6e:
        *param_1 = 3;
        break;
      case 0x73:
        *param_1 = 5;
        break;
      case 0x77:
        param_1[1] = 4;
      }
      pcVar1 = param_2 + 1;
      param_2 = param_2 + 1;
      cVar2 = *pcVar1;
    }
  }
  return;
}

