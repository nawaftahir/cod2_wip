; FUN_1000bc70 @ 0x1000bc70 — auto-synthesized
.CODE
FUN_1000bc70 PROC
    cmp edi, 0x20
    push ebp
    mov ebp, dword ptr [esp + 8]
    jb L0
    cmp edi, 0x7f
    ja L0
    mov ecx, dword ptr [ebp + 0x10]
    lea eax, [edi + edi*2 - 0x60]
    lea eax, [ecx + eax*8]
    pop ebp
    ret
    mov ecx, dword ptr [ebp + 8]
    push ebx
    push esi
    dec ecx
    mov esi, 0x60
    cmp ecx, esi
    jl L1
    mov ebx, dword ptr [ebp + 0x10]
    lea ecx, [ecx]
    lea eax, [esi + ecx]
    cdq
    sub eax, edx
    sar eax, 1
    lea edx, [eax + eax*2]
    movzx edx, word ptr [ebx + edx*8]
    cmp edx, edi
    je L2
    jae L3
    lea esi, [eax + 1]
    jmp L4
    lea ecx, [eax - 1]
    cmp esi, ecx
    jle L5
    mov eax, dword ptr [ebp + 0x10]
    pop esi
    pop ebx
    add eax, 0x150
    pop ebp
    ret
    lea eax, [eax + eax*2]
    pop esi
    lea eax, [ebx + eax*8]
    pop ebx
    pop ebp
    ret
FUN_1000bc70 ENDP
END