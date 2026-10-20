
void FUN_0047a6e0(HDC param_1)

{
  int iVar1;
  byte *pbVar2;
  int iPixelFormat;
  byte local_9c1 [2493];
  
  _printf("### flags color layer\n");
  iPixelFormat = 1;
  pbVar2 = local_9c1;
  do {
    iVar1 = DescribePixelFormat(param_1,iPixelFormat,0x28,(LPPIXELFORMATDESCRIPTOR)(pbVar2 + -0x1b))
    ;
    if (iVar1 == 0) break;
    _printf("%3i %5i %5i %5i\n",iPixelFormat,*(undefined4 *)(pbVar2 + -0x17),(uint)pbVar2[-0x12],
            (uint)*pbVar2);
    iPixelFormat = iPixelFormat + 1;
    pbVar2 = pbVar2 + 0x28;
  } while (iPixelFormat < 0x40);
  _printf("%i modes\n",iPixelFormat + -1);
  return;
}

