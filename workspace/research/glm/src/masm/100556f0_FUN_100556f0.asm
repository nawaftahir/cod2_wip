.686
.MODEL FLAT, C
.CODE
FUN_100556f0 PROC
    push ebx
    mov ebx, dword ptr [esp + 8]
    push ebp
    mov ebp, dword ptr [esp + 16]
    test ebp, ebp
    push esi
    mov esi, dword ptr [ebx + 4]
    push edi
    jl L0
    cmp ebp, 2
    jl L1
L0:
    mov eax, dword ptr [ebx]
    mov dword ptr [eax + 20], 14
    mov ecx, dword ptr [ebx]
    mov dword ptr [ecx + 24], ebp
    mov edx, dword ptr [ebx]
    push ebx
    call dword ptr [edx]
    add esp, 4
L1:
    cmp ebp, 1
    jne L8
    mov edi, dword ptr [esi + 68]
    test edi, edi
    je L4
    lea ebx, [ebx]
L2:
    mov al, byte ptr [edi + 34]
    test al, al
    je L3
    lea eax, [edi + 40]
    push eax
    push ebx
    mov byte ptr [edi + 34], 0
    call dword ptr [edi + 0x30]
    add esp, 8
L3:
    mov edi, dword ptr [edi + 36]
    test edi, edi
    jne L2
L4:
    mov edi, dword ptr [esi + 72]
    test edi, edi
    mov dword ptr [esi + 68], 0
    je L7
    jmp L5
    lea ecx, [ecx]
L5:
    mov al, byte ptr [edi + 34]
    test al, al
    je L6
    lea ecx, [edi + 40]
    push ecx
    push ebx
    mov byte ptr [edi + 34], 0
    call dword ptr [edi + 0x30]
    add esp, 8
L6:
    mov edi, dword ptr [edi + 36]
    test edi, edi
    jne L5
L7:
    mov dword ptr [esi + 72], 0
L8:
    mov eax, dword ptr [esi + ebp*4 + 60]
    test eax, eax
    mov dword ptr [esi + ebp*4 + 60], 0
    je L10
L9:
    mov edx, dword ptr [eax + 8]
    mov ecx, dword ptr [eax + 4]
    mov edi, dword ptr [eax]
    lea ebp, [edx + ecx + 16]
    push ebp
    push eax
    call dword ptr [ebx + 0x1c]
    mov edx, dword ptr [esi + 76]
    sub edx, ebp
    add esp, 8
    test edi, edi
    mov dword ptr [esi + 76], edx
    mov eax, edi
    jne L9
    mov ebp, dword ptr [esp + 24]
L10:
    mov eax, dword ptr [esi + ebp*4 + 52]
    test eax, eax
    mov dword ptr [esi + ebp*4 + 52], 0
    je L12
    lea ebx, [ebx]
L11:
    mov edx, dword ptr [eax + 8]
    mov ecx, dword ptr [eax + 4]
    mov edi, dword ptr [eax]
    lea ebp, [edx + ecx + 16]
    push ebp
    push eax
    call dword ptr [ebx + 0x1c]
    mov edx, dword ptr [esi + 76]
    sub edx, ebp
    add esp, 8
    test edi, edi
    mov dword ptr [esi + 76], edx
    mov eax, edi
    jne L11
L12:
    pop edi
    pop esi
FUN_100556f0 ENDP
END
