.686
.MODEL FLAT, C
.CODE
FUN_100cb9d7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 12]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
L0:
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [eax + edx*4]
    mov edi, dword ptr [eax + 56]
    cmp edi, -1
    je L1
    mov edx, edi
    jmp L0
L1:
    or dword ptr [eax + 48], 0FFFFFFFFh
    mov edi, dword ptr [eax + 4]
    mov dword ptr [eax + 116], esi
    mov ebx, dword ptr [ecx + 4]
    mov ebx, dword ptr [ebx + 16]
    mov edi, dword ptr [ebx + edi*4]
    test byte ptr [edi + 4], 16
    jne L3
    cmp dword ptr [ecx + 16], 0
    je L2
    mov edi, dword ptr [ecx + 12]
    mov ebx, dword ptr [ecx + 8]
    shl esi, 2
    mov edi, dword ptr [edi + esi]
    add edi, dword ptr [ebx + esi]
    mov esi, dword ptr [ecx + 16]
    mov dword ptr [esi + edi*4], edx
    mov esi, dword ptr [ebp + 8]
L2:
    mov edx, dword ptr [ecx + 8]
    lea edx, [edx + esi*4]
    inc dword ptr [edx]
L3:
    mov eax, dword ptr [eax + 8]
    cmp eax, -1
    je L4
    mov edx, eax
    jmp L0
L4:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_100cb9d7 ENDP
END
