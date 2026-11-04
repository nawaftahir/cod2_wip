.686
.MODEL FLAT, C
EXTRN sub_100F7857:PROC
EXTRN sub_100FBFF6:PROC
EXTRN fp_1010C030:DWORD
.CODE
__lock PROC
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push esi
    lea esi, [eax*8 + 0101A4B28h]
    cmp dword ptr [esi], 0
    jne L0
    push eax
    call sub_100FBFF6
    test eax, eax
    pop ecx
    jne L0
    push 17
    call sub_100F7857
    pop ecx
L0:
    push dword ptr [esi]
    call dword ptr [fp_1010C030]
    pop esi
    pop ebp
    ret
__lock ENDP
END
