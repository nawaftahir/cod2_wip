; FUN_1006b285 @ 0x1006b285 — auto-synthesized
    sub_1006ac63 PROTO C
    sub_100f7883 PROTO C
.CODE
FUN_1006b285 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [esi + 8], 0
    push dword ptr [esi + 0x58]
    call sub_100f7883
    pop ecx
    mov ecx, dword ptr [esi + 0x78]
    test ecx, ecx
    pop esi
    je L1
    push 1
    call sub_1006ac63
    ret
FUN_1006b285 ENDP
END