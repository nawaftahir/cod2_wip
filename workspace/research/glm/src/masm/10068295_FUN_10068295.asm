.686
.MODEL FLAT, C
EXTRN sub_10067C8B:PROC
EXTRN sub_100F870E:PROC
EXTRN sub_100F8722:PROC
.CODE
FUN_10068295 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 4]
    push edi
    mov edi, dword ptr [ebp + 8]
    cmp edi, eax
    jb L0
    xor eax, eax
    jmp L26
L0:
    mov cl, byte ptr [edi]
    cmp cl, 92
    push esi
    jne L23
    test byte ptr [ebx + 40], 4
    jne L23
    lea esi, [edi + 1]
    cmp esi, eax
    jb L1
    push 01010CB7Ch
    push 0000003EFh
    lea eax, [ebx + 8]
    push eax
    push dword ptr [ebx + 48]
    call sub_10067C8B
    add esp, 16
L1:
    mov cl, byte ptr [esi]
    movsx eax, cl
    sub eax, 97
    je L22
    dec eax
    je L20
    sub eax, 4
    je L19
    sub eax, 8
    je L18
    sub eax, 4
    je L17
    dec eax
    dec eax
    je L16
    dec eax
    dec eax
    je L15
    cmp cl, 48
    jl L6
    cmp cl, 55
    jg L6
    mov ebx, dword ptr [ebx + 4]
    lea eax, [esi + 3]
    cmp eax, ebx
    jae L2
    mov ebx, eax
L2:
    xor ecx, ecx
    jmp L4
L3:
    mov al, byte ptr [esi]
    cmp al, 48
    jl L5
    cmp al, 55
    jg L5
    movsx eax, al
    lea ecx, [eax + ecx*8 - 48]
    inc esi
L4:
    cmp esi, ebx
    jb L3
L5:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], ecx
    jmp L25
L6:
    cmp cl, 120
    jne L14
    lea edi, [esi + 1]
    cmp edi, dword ptr [ebx + 4]
    jae L13
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F870E
    test eax, eax
    pop ecx
    je L13
    mov esi, edi
    xor edi, edi
    jmp L11
L7:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F8722
    test eax, eax
    pop ecx
    je L12
    mov al, byte ptr [esi]
    shl edi, 4
    cmp al, 97
    jl L8
    movsx eax, al
    lea edi, [edi + eax - 87]
    jmp L10
L8:
    cmp al, 65
    movsx eax, al
    jl L9
    lea edi, [edi + eax - 55]
    jmp L10
L9:
    lea edi, [edi + eax - 48]
L10:
    inc esi
L11:
    cmp esi, dword ptr [ebx + 4]
    jb L7
L12:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], edi
    mov edi, dword ptr [ebp + 8]
    jmp L25
L13:
    mov edi, dword ptr [ebp + 8]
L14:
    movsx eax, byte ptr [esi]
    inc esi
    jmp L24
L15:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], 11
    jmp L21
L16:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], 9
    jmp L21
L17:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], 13
    jmp L21
L18:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], 10
    jmp L21
L19:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], 12
    jmp L21
L20:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], 8
L21:
    inc esi
    jmp L25
L22:
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], 7
    jmp L21
L23:
    movsx eax, cl
    lea esi, [edi + 1]
L24:
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
L25:
    mov eax, esi
    sub eax, edi
    pop esi
L26:
    pop edi
    pop ebx
    pop ebp
    ret 8
FUN_10068295 ENDP
END
