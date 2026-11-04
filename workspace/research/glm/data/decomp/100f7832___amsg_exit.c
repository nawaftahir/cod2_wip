// 100f7832 size=48 __amsg_exit

/* Library Function - Single Match
    __amsg_exit
   
   Library: Visual Studio 2003 Release */

void __cdecl __amsg_exit(int param_1)

{
  if ((DAT_101add88 == 1) || ((DAT_101add88 == 0 && (DAT_101add8c == 1)))) {
    __FF_MSGBANNER();
  }
  __NMSG_WRITE(param_1);
  (*(code *)PTR___exit_101a4610)(0xff);
  return;
}


