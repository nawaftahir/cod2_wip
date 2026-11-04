.686
.MODEL FLAT, C
EXTRN sub_100F7857:PROC
EXTRN sub_100FBFF6:PROC
EXTRN sub_100FC0B6:PROC
EXTRN sub_100FC0C1:PROC
EXTRN EXTRN fp_1010C030:DWORD:DWORD
.CODE
__lock PROC
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 8]
    push push esi
    lea lea esi, [eax*8 + 0101A4B28h]
    cmp cmp dword ptr [esi], 0
    jne sub_100FC0B6
    push push eax
    call sub_100FBFF6
    test test eax, eax
    pop pop ecx
    jne sub_100FC0C1
    push push 17
    call sub_100F7857
    pop pop ecx
    push push dword ptr [esi]
    call dword ptr [fp_1010C030]
    pop pop esi
    pop pop ebp
    ret ret
__lock ENDP
END
