.686
.MODEL FLAT, C
EXTRN EXTRN fp_1010C03C:DWORD:DWORD
.CODE
__unlock_fhandle PROC
    mov mov eax, dword ptr [esp + 4]
    mov mov ecx, eax
    and and eax, 31
    sar sar ecx, 5
    mov mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea lea eax, [eax + eax*8]
    lea lea eax, [ecx + eax*4 + 12]
    push push eax
    call dword ptr [fp_1010C03C]
    ret ret
__unlock_fhandle ENDP
END
