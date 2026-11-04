// 100822f6 size=14 FUN_100822f6

void FUN_100822f6(void)

{
  undefined4 *in_ECX;
  
  if ((HGDIOBJ)*in_ECX != (HGDIOBJ)0x0) {
    DeleteObject((HGDIOBJ)*in_ECX);
  }
  return;
}


