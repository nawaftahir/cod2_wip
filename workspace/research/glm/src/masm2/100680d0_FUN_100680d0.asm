.686
.MODEL FLAT, C
EXTRN sub_10067CD3:PROC
EXTRN sub_10068181:PROC
EXTRN sub_10068184:PROC
EXTRN sub_10068189:PROC
EXTRN sub_1006818D:PROC
EXTRN sub_1006818F:PROC
EXTRN sub_10068190:PROC
EXTRN sub_1006819A:PROC
EXTRN sub_1006819D:PROC
EXTRN sub_100681BA:PROC
EXTRN sub_100681E7:PROC
EXTRN sub_1006820A:PROC
EXTRN sub_100F865A:PROC
EXTRN sub_100F866D:PROC
.CODE
FUN_100680d0 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    push push edi
    mov mov ebx, ecx
    lea lea edi, [eax + 2]
    cmp cmp edi, dword ptr [ebx + 4]
    jae sub_10068184
    cmp cmp byte ptr [eax], 48
    jne sub_10068189
    cmp cmp byte ptr [eax + 1], 120
    jne sub_1006818F
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F865A
    test test eax, eax
    pop pop ecx
    je sub_1006819D
    push push esi
    xor xor esi, esi
    jmp L0
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F866D
    test test eax, eax
    pop pop ecx
    je sub_10068181
    mov mov al, byte ptr [edi]
    shl shl esi, 4
    cmp cmp al, 97
    jl L1
    movsx movsx eax, al
    lea lea esi, [esi + eax - 87]
    jmp sub_1006818D
    cmp cmp al, 65
    movsx movsx eax, al
    jl sub_10068190
    lea lea esi, [esi + eax - 55]
    jmp sub_1006819A
    lea lea esi, [esi + eax - 48]
    inc inc edi
    cmp cmp edi, dword ptr [ebx + 4]
    jb L1
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_100681BA
    mov mov dword ptr [eax], esi
    sub sub edi, dword ptr [ebp + 8]
    pop pop esi
    cmp cmp edi, 10
    jle sub_100681E7
    push push 01010CB18h
    push push 03EAh
    lea lea eax, [ebx + 8]
    push push eax
    push push dword ptr [ebx + 48]
    call sub_10067CD3
    add add esp, 16
    mov mov eax, edi
    jmp sub_1006820A
    xor xor eax, eax
L0:
    pop pop edi
    pop pop ebx
    pop pop ebp
    ret ret 8
FUN_100680d0 ENDP
END
