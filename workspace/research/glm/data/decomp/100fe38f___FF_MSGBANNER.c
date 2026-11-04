// 100fe38f size=57 __FF_MSGBANNER

/* Library Function - Single Match
    __FF_MSGBANNER
   
   Library: Visual Studio 2003 Release */

void __cdecl __FF_MSGBANNER(void)

{
  if ((DAT_101add88 == 1) || ((DAT_101add88 == 0 && (DAT_101add8c == 1)))) {
    __NMSG_WRITE(0xfc);
    if (DAT_101ae15c != (code *)0x0) {
      (*DAT_101ae15c)();
    }
    __NMSG_WRITE(0xff);
  }
  return;
}


