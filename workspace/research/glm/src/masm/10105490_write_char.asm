.686
.MODEL FLAT, C
EXTRN sub_10108B14:PROC
.CODE
write_char PROC
    test byte ptr [eax + 12], 64
    je L0
    cmp dword ptr [eax + 8], 0
    je L1
L0:
    push eax
    push dword ptr [esp + 8]
    call sub_10108B14
    cmp ax, 00000FFFFh
    pop ecx
    pop ecx
    jne L1
    or dword ptr [esi], 0FFFFFFFFh
    ret
L1:
    inc dword ptr [esi]
    ret
write_char ENDP
END
