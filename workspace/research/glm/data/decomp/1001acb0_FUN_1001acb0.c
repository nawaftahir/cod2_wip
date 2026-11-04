// 1001acb0 size=91 FUN_1001acb0

/* WARNING: Removing unreachable block (ram,0x1001ad03) */

void FUN_1001acb0(void)

{
  int *piVar1;
  int iVar2;
  int unaff_ESI;
  
  iVar2 = 0;
  do {
    piVar1 = (int *)((int)&DAT_10190254 + iVar2);
    iVar2 = iVar2 + 8;
    *(undefined1 *)(unaff_ESI + *piVar1) = 0;
  } while (iVar2 != 0x28);
  do {
    FUN_1001ab70();
  } while( true );
}


