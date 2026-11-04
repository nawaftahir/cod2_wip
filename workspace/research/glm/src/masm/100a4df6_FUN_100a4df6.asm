.686
.MODEL FLAT, C
.CODE
FUN_100a4df6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    or dword ptr [ebp - 8], 0FFFFFFFFh
    or dword ptr [ebp - 12], 0FFFFFFFFh
    push edi
    xor edi, edi
    cmp dword ptr [ecx + 8], edi
    mov dword ptr [ebp - 16], edi
    jbe L10
    push ebx
    push esi
L0:
    mov edx, dword ptr [ecx + 20]
    mov ebx, dword ptr [ecx + 16]
    mov eax, edi
    shl eax, 2
    mov edx, dword ptr [eax + edx]
    mov esi, dword ptr [edx + 4]
    mov esi, dword ptr [ebx + esi*4]
    test byte ptr [esi + 4], 16
    je L9
    mov edx, dword ptr [edx + 108]
    cmp edx, 17
    je L1
    cmp edx, 18
    jne L9
L1:
    mov edx, dword ptr [ecx + 20]
    mov edx, dword ptr [eax + edx]
    and dword ptr [edx], 040000000h
    mov edx, dword ptr [ecx + 20]
    mov edx, dword ptr [eax + edx]
    cmp dword ptr [edx], 0
    jne L9
    mov edx, dword ptr [ecx + 20]
    mov edx, dword ptr [eax + edx]
    mov esi, dword ptr [edx + 108]
    cmp esi, 17
    jne L2
    cmp dword ptr [ebp - 8], -1
    jne L9
    mov dword ptr [ebp - 8], edi
L2:
    cmp esi, 18
    jne L4
    mov esi, dword ptr [ebp - 12]
    cmp esi, -1
    je L3
    mov edx, dword ptr [ecx + 20]
    mov esi, dword ptr [edx + esi*4]
    mov eax, dword ptr [edx + eax]
    mov edx, dword ptr [esi + 12]
    jmp L8
L3:
    mov dword ptr [ebp - 12], edi
L4:
    mov edx, dword ptr [edx + 12]
    or dword ptr [ebp - 4], 0FFFFFFFFh
    xor edi, edi
    cmp dword ptr [ecx + 8], edi
    mov dword ptr [ebp - 20], edx
    jbe L9
L5:
    mov edx, dword ptr [ecx + 20]
    mov esi, dword ptr [edx + edi*4]
    mov edx, dword ptr [esi + 4]
    mov ebx, dword ptr [ecx + 16]
    mov edx, dword ptr [ebx + edx*4]
    test byte ptr [edx + 4], 16
    je L7
    mov esi, dword ptr [esi + 12]
    cmp esi, dword ptr [ebp - 20]
    jbe L7
    cmp dword ptr [ebp - 4], esi
    jg L6
    mov dword ptr [ebp - 4], esi
L6:
    mov edx, dword ptr [ecx + 20]
    mov esi, dword ptr [edx + edi*4]
    dec dword ptr [esi + 12]
L7:
    inc edi
    cmp edi, dword ptr [ecx + 8]
    jb L5
    mov edx, dword ptr [ebp - 4]
    cmp edx, -1
    je L9
    mov esi, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + esi]
L8:
    mov dword ptr [eax + 12], edx
L9:
    mov edi, dword ptr [ebp - 16]
    inc edi
    cmp edi, dword ptr [ecx + 8]
    mov dword ptr [ebp - 16], edi
    jb L0
    pop esi
    pop ebx
L10:
    xor eax, eax
    pop edi
    leave
    ret
FUN_100a4df6 ENDP
END
