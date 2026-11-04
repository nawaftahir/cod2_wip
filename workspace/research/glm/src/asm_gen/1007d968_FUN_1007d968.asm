; FUN_1007d968 @ 0x1007d968 — auto-synthesized
.CODE
FUN_1007d968 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x18]
    push edi
    mov edi, dword ptr [ebp + 8]
    and dword ptr [ebp + 8], 0
    mov dword ptr [esi + 0x20], edi
    cmp word ptr [eax + 0xa], 0
    jbe L0
    mov ecx, dword ptr [esi + 0x38]
    push ebx
    mov ebx, dword ptr [ebp + 8]
    shl ebx, 2
    mov ecx, dword ptr [ecx + ebx]
    push edi
    call L1
    mov ecx, dword ptr [esi + 0x38]
    mov eax, dword ptr [ecx + ebx]
    mov dx, word ptr [eax + 8]
    mov ebx, dword ptr [eax + 0x18]
    movzx ebx, word ptr [ebx + 8]
    neg dx
    sbb edx, edx
    and edx, 3
    inc edx
    imul edx, ebx
    imul edx, dword ptr [eax + 0x2c]
    mov eax, dword ptr [esi + 0x18]
    movzx eax, word ptr [eax + 0xa]
    inc dword ptr [ebp + 8]
    cmp dword ptr [ebp + 8], eax
    lea edi, [edi + edx*4]
    jb L2
    pop ebx
    pop edi
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_1007d968 ENDP
END