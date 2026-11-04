; FUN_100062a0 @ 0x100062a0 — auto-synthesized
    EXTRN g_101ce5b0:DWORD
    EXTRN g_101ce5b4:DWORD
.CODE
FUN_100062a0 PROC
    mov ecx, dword ptr [g_101ce5b0]
    test ecx, ecx
    push esi
    je L0
    push edi
    mov edi, dword ptr [ecx]
    lea esi, [eax + eax*4]
    lea esi, [edx + esi*4]
    mov dword ptr [esi], edi
    mov edi, dword ptr [ecx + 4]
    mov dword ptr [esi + 4], edi
    mov edi, dword ptr [ecx + 8]
    mov dword ptr [esi + 8], edi
    mov edi, dword ptr [ecx + 0xc]
    mov dword ptr [esi + 0xc], edi
    mov ecx, dword ptr [ecx + 0x10]
    mov dword ptr [esi + 0x10], ecx
    inc eax
    pop edi
    mov ecx, dword ptr [g_101ce5b4]
    test ecx, ecx
    je L1
    lea esi, [eax + eax*4]
    lea edx, [edx + esi*4]
    mov esi, dword ptr [ecx]
    mov dword ptr [edx], esi
    mov esi, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], esi
    mov esi, dword ptr [ecx + 8]
    mov dword ptr [edx + 8], esi
    mov esi, dword ptr [ecx + 0xc]
    mov dword ptr [edx + 0xc], esi
    mov ecx, dword ptr [ecx + 0x10]
    mov dword ptr [edx + 0x10], ecx
    inc eax
    pop esi
    ret
FUN_100062a0 ENDP
END