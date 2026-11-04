// 1000f2a0 size=67 FUN_1000f2a0

undefined4 FUN_1000f2a0(void)

{
  char *in_EAX;
  
  if (((*in_EAX == 'I') && (in_EAX[1] == 'W')) && (in_EAX[2] == 'i')) {
    if (in_EAX[3] != '\x05') {
      FUN_10061c80("^1ERROR: image \'%s\' is version %i but should be version %i\n");
      return 0;
    }
    return 1;
  }
  FUN_10061c80("^1ERROR: image \'%s\' is not an IW image\n");
  return 0;
}


