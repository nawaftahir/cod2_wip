// 1000e840 size=135 FUN_1000e840

int FUN_1000e840(void)

{
  int in_EAX;
  int in_ECX;
  int in_EDX;
  
  if (in_ECX < 0x48) {
    if (in_ECX != 0x47) {
      switch(in_ECX) {
      case 0x15:
        break;
      case 0x16:
        return in_EAX * in_EDX * 3;
      case 0x17:
      case 0x33:
switchD_1000e856_caseD_17:
        return in_EAX * in_EDX * 2;
      default:
        goto switchD_1000e856_caseD_18;
      case 0x1c:
      case 0x32:
        return in_EAX * in_EDX;
      }
    }
  }
  else {
    if (0x31545844 < in_ECX) {
      if ((in_ECX == 0x33545844) || (in_ECX == 0x35545844)) {
        return (in_EAX + 3 >> 2) * (in_EDX + 3 >> 2) * 0x10;
      }
switchD_1000e856_caseD_18:
      return 0;
    }
    if (in_ECX == 0x31545844) {
      return (in_EAX + 3 >> 2) * (in_EDX + 3 >> 2) * 8;
    }
    if (in_ECX != 0x4b) {
      if (in_ECX == 0x50) goto switchD_1000e856_caseD_17;
      if (in_ECX != 0x72) {
        return 0;
      }
    }
  }
  return in_EAX * in_EDX * 4;
}


