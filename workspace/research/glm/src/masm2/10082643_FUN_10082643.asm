.686
.MODEL FLAT, C
EXTRN sub_100826C8:PROC
EXTRN EXTRN fp_1010C08C:DWORD:DWORD
.CODE
FUN_10082643 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    push push esi
    lea lea eax, [ebp - 36]
    mov mov esi, ecx
    and and dword ptr [esi], 0
    push push eax
    call dword ptr [fp_1010C08C]
    mov mov ecx, dword ptr [ebp - 32]
    mov mov eax, dword ptr [ebp + 12]
    and and dword ptr [esi + 8], 0
    and and dword ptr [esi + 12], 0
    and and dword ptr [esi + 16], 0
    mov mov dword ptr [esi + 4], ecx
    lea lea eax, [ecx + eax - 1]
    dec dec ecx
    not not ecx
    and and eax, ecx
    mov mov ecx, dword ptr [ebp + 8]
    test test ecx, ecx
    mov mov dword ptr [esi + 4], eax
    jne sub_100826C8
    mov mov ecx, 0100000h
    lea lea ecx, [eax + ecx - 1]
    dec dec eax
    not not eax
    and and ecx, eax
    mov mov dword ptr [esi + 20], ecx
    mov mov eax, esi
    pop pop esi
    leave leave
    ret ret 8
FUN_10082643 ENDP
END
