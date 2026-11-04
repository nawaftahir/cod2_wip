extern int c_1072dec0;
extern int c_1072dec4;
extern void sub_10032490(void);

__declspec(naked) void R_ShutdownDebug(void)
{
    __asm {
    mov ecx, dword ptr [esp + 4]
    mov eax, offset c_1072dec4
    call sub_10032490
    mov ecx, dword ptr [esp + 8]
    mov eax, offset c_1072dec0
    /* tail jmp back into sub_10032490: emitted raw */
    _emit 0xe9
    _emit 0x34
    _emit 0xff
    _emit 0xff
    _emit 0xff
    }
}
