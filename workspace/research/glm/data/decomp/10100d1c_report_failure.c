// 10100d1c size=41 report_failure

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* Library Function - Single Match
    _report_failure
   
   Library: Visual Studio 2003 Release */

void __cdecl report_failure(void)

{
  ___security_error_handler(1,0);
                    /* WARNING: Subroutine does not return */
  ExitProcess(3);
}


