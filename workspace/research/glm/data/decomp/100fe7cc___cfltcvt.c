// 100fe7cc size=81 __cfltcvt

/* Library Function - Single Match
    __cfltcvt
   
   Library: Visual Studio 2003 Release */

errno_t __cdecl
__cfltcvt(double *arg,char *buffer,size_t sizeInBytes,int format,int precision,int caps)

{
  errno_t eVar1;
  int unaff_EBP;
  
  if ((sizeInBytes == 0x65) || (sizeInBytes == 0x45)) {
    eVar1 = __cftoe(arg,buffer,format,precision,unaff_EBP);
  }
  else {
    if (sizeInBytes == 0x66) {
      eVar1 = __cftof(arg,buffer,format,unaff_EBP);
      return eVar1;
    }
    eVar1 = __cftog(arg,buffer,format,precision);
  }
  return eVar1;
}


