; __lock @ 0x100fc07d — auto-synthesized
    EXTRN fp_1010c030:DWORD
    sub_100f7857 PROTO C
    sub_100fbff6 PROTO C
.CODE
__lock PROC
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push esi
    lea esi, [eax*8 + 0x101a4b28]
    cmp dword ptr [esi], 0
    jne L0
    push eax
    call sub_100fbff6
    test eax, eax
    pop ecx
    jne L0
    push 0x11
    call sub_100f7857
    pop ecx
    push dword ptr [esi]
    call dword ptr [fp_1010c030]
    pop esi
    pop ebp
    ret
__lock ENDP
END