.686
.MODEL FLAT, C
EXTRN fp_1010C03C:DWORD
.CODE
__unlock_fhandle PROC
    mov eax, dword ptr [esp + 4]
    mov ecx, eax
    and eax, 31
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea eax, [eax + eax*8]
    lea eax, [ecx + eax*4 + 12]
    push eax
    call dword ptr [fp_1010C03C]
    ret
__unlock_fhandle ENDP
END
