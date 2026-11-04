// 1000ef40 size=149 FUN_1000ef40

int FUN_1000ef40(int param_1)

{
  int in_EAX;
  int in_ECX;
  int in_EDX;
  
  if (0x4b < in_ECX) {
    if (in_ECX < 0x31545845) {
      if (in_ECX == 0x31545844) {
        return (in_EAX + 3 >> 2) * (param_1 + 3 >> 2) * in_EDX * 8;
      }
      if (in_ECX == 0x50) goto switchD_1000ef5b_caseD_17;
      if (in_ECX == 0x72) goto switchD_1000ef5b_caseD_15;
    }
    else if ((in_ECX == 0x33545844) || (in_ECX == 0x35545844)) {
      return (in_EAX + 3 >> 2) * (param_1 + 3 >> 2) * in_EDX * 0x10;
    }
switchD_1000ef5b_caseD_18:
    return 0;
  }
  if (in_ECX != 0x4b) {
    switch(in_ECX) {
    case 0x15:
    case 0x16:
    case 0x47:
      break;
    case 0x17:
    case 0x33:
switchD_1000ef5b_caseD_17:
      return in_EAX * param_1 * in_EDX * 2;
    default:
      goto switchD_1000ef5b_caseD_18;
    case 0x1c:
    case 0x32:
      return in_EAX * param_1 * in_EDX;
    }
  }
switchD_1000ef5b_caseD_15:
  return in_EAX * param_1 * in_EDX * 4;
}


