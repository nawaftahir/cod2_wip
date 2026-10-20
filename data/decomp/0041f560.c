
/* Library Function - Single Match
    class CWnd * __stdcall AfxGetMainWnd(void)
   
   Library: Visual Studio 2003 Release */

CWnd * AfxGetMainWnd(void)

{
  int *piVar1;
  CWnd *pCVar2;
  
  piVar1 = (int *)FUN_00501d8d();
  if (piVar1 != (int *)0x0) {
                    /* WARNING: Could not recover jumptable at 0x0041f56d. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    pCVar2 = (CWnd *)(**(code **)(*piVar1 + 0x74))();
    return pCVar2;
  }
  return (CWnd *)0x0;
}

