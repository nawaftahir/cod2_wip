// 100fe4bf size=62 __fassign

/* Library Function - Single Match
    __fassign
   
   Library: Visual Studio 2003 Release */

void __cdecl __fassign(int flag,char *argument,char *number)

{
  _CRT_FLOAT local_c;
  undefined4 local_8;
  
  if (flag != 0) {
    FID_conflict___atodbl(&local_c,number);
    *(float *)argument = local_c.f;
    *(undefined4 *)(argument + 4) = local_8;
    return;
  }
  FID_conflict___atodbl((_CRT_FLOAT *)&flag,number);
  *(int *)argument = flag;
  return;
}


