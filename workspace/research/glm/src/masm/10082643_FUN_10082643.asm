.686
.MODEL FLAT, C
EXTRN fp_1010C08C:DWORD
.CODE
FUN_10082643 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    push esi
    lea eax, [ebp - 36]
    mov esi, ecx
    and dword ptr [esi], 0
    push eax
    call dword ptr [fp_1010C08C]
    mov ecx, dword ptr [ebp - 32]
    mov eax, dword ptr [ebp + 12]
    and dword ptr [esi + 8], 0
    and dword ptr [esi + 12], 0
    and dword ptr [esi + 16], 0
    mov dword ptr [esi + 4], ecx
    lea eax, [ecx + eax - 1]
    dec ecx
    not ecx
    and eax, ecx
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    mov dword ptr [esi + 4], eax
    jne L0
    mov ecx, 000100000h
L0:
    lea ecx, [eax + ecx - 1]
    dec eax
    not eax
    and ecx, eax
    mov dword ptr [esi + 20], ecx
    mov eax, esi
    pop esi
    leave
    ret 8
FUN_10082643 ENDP
END
