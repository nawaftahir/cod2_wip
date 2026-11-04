// 100feccf size=32 __store_str

/* Library Function - Single Match
    __store_str
   
   Library: Visual Studio 2003 Release */

void __store_str(void)

{
  int iVar1;
  int *in_EAX;
  int *in_ECX;
  char *in_EDX;
  
  iVar1 = *in_EAX;
  for (; (iVar1 != 0 && (*in_EDX != '\0')); in_EDX = in_EDX + 1) {
    *(char *)*in_ECX = *in_EDX;
    *in_ECX = *in_ECX + 1;
    *in_EAX = *in_EAX + -1;
    iVar1 = *in_EAX;
  }
  return;
}


