/* __security_check_cookie (0x10100d4d): CRT /GS cookie check.
 * Binary: cmp ecx,[cookie]; jne +1; ret; jmp __report_gsfailure */
extern unsigned int __security_cookie;
extern void __cdecl __report_gsfailure(void);

void __fastcall __security_check_cookie(unsigned int stkchk)
{
    if (stkchk != __security_cookie)
    {
        goto fail;
    }
    return;
fail:
    __report_gsfailure();
}
