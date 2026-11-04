.686
.MODEL FLAT, C
EXTRN sub_10067CD3:PROC
EXTRN sub_100F865A:PROC
EXTRN sub_100F866D:PROC
.CODE
FUN_100680d0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push ebx
    push edi
    mov ebx, ecx
    lea edi, [eax + 2]
    cmp edi, dword ptr [ebx + 4]
    jae L8
    cmp byte ptr [eax], 48
    jne L8
    cmp byte ptr [eax + 1], 120
    jne L8
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F865A
    test eax, eax
    pop ecx
    je L8
    push esi
    xor esi, esi
    jmp L4
L0:
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F866D
    test eax, eax
    pop ecx
    je L5
    mov al, byte ptr [edi]
    shl esi, 4
    cmp al, 97
    jl L1
    movsx eax, al
    lea esi, [esi + eax - 87]
    jmp L3
L1:
    cmp al, 65
    movsx eax, al
    jl L2
    lea esi, [esi + eax - 55]
    jmp L3
L2:
    lea esi, [esi + eax - 48]
L3:
    inc edi
L4:
    cmp edi, dword ptr [ebx + 4]
    jb L0
L5:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L6
    mov dword ptr [eax], esi
L6:
    sub edi, dword ptr [ebp + 8]
    pop esi
    cmp edi, 10
    jle L7
    push 01010CB18h
    push 0000003EAh
    lea eax, [ebx + 8]
    push eax
    push dword ptr [ebx + 48]
    call sub_10067CD3
    add esp, 16
L7:
    mov eax, edi
    jmp L9
L8:
    xor eax, eax
L9:
    pop edi
    pop ebx
    pop ebp
    ret 8
FUN_100680d0 ENDP
END
