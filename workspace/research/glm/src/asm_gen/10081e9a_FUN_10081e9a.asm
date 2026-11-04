; FUN_10081e9a @ 0x10081e9a — auto-synthesized
.CODE
FUN_10081e9a PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    test eax, eax
    mov dword ptr [esi], 0x1010ff58
    je L0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [esi + 8], 0
    mov eax, dword ptr [esi + 0xc]
    test eax, eax
    je L1
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [esi + 0xc], 0
    mov eax, dword ptr [esi + 0x10]
    test eax, eax
    je L2
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [esi + 0x10], 0
    pop esi
    ret
FUN_10081e9a ENDP
END