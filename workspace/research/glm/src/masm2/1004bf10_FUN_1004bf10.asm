.686
.MODEL FLAT, C
EXTRN sub_1004BB73:PROC
EXTRN sub_1004BBBC:PROC
EXTRN sub_1004C0D3:PROC
EXTRN sub_1004C0F8:PROC
EXTRN sub_1004C11F:PROC
EXTRN sub_1004C145:PROC
EXTRN sub_1004C14C:PROC
EXTRN sub_1004C161:PROC
EXTRN sub_1004C16E:PROC
EXTRN sub_1004C17F:PROC
EXTRN sub_1004C195:PROC
EXTRN sub_1004C1B7:PROC
EXTRN sub_1004C1C5:PROC
EXTRN sub_1004C1C6:PROC
EXTRN sub_1004C1CB:PROC
EXTRN sub_1004C1D3:PROC
EXTRN sub_1004C1E6:PROC
EXTRN sub_1004C20D:PROC
EXTRN sub_1004C21B:PROC
EXTRN sub_1004C226:PROC
EXTRN sub_1004C254:PROC
.CODE
FUN_1004bf10 PROC
    mov mov eax, dword ptr [esi + 4]
    push push edi
    push push 24
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov edi, eax
    mov mov dword ptr [esi + 01ACh], edi
    mov mov dword ptr [edi], 01004BF00h
    mov mov eax, dword ptr [esi + 48]
    add add esp, 12
    dec dec eax
    cmp cmp eax, 4
    ja L0
    jmp jmp dword ptr [eax*4 + 01004C0C0h]
    cmp cmp dword ptr [esi + 44], 1
    je L2
    jmp L1
    cmp cmp dword ptr [esi + 44], 3
    je L3
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 10
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    jmp L4
    cmp cmp dword ptr [esi + 44], 4
    je L5
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 10
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    jmp L6
    cmp cmp dword ptr [esi + 44], 1
    jge L7
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 10
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov ecx, dword ptr [esi + 52]
    mov mov eax, ecx
    dec dec eax
    je sub_1004C0D3
    dec dec eax
    je L9
    sub sub eax, 2
    je L8
    cmp cmp ecx, dword ptr [esi + 48]
    jne sub_1004C0F8
    mov mov eax, dword ptr [esi + 44]
    mov mov dword ptr [esi + 108], eax
L1:
    mov mov dword ptr [edi + 4], 01004BCA0h
    jmp sub_1004C14C
    mov mov eax, dword ptr [esi + 48]
L2:
    cmp cmp eax, 5
    mov mov dword ptr [esi + 108], 4
    jne L10
    mov mov eax, esi
    mov mov dword ptr [edi + 4], 01004BDB0h
L4:
    call sub_1004BB73
    jmp sub_1004C16E
    cmp cmp eax, 4
    jne L11
    mov mov dword ptr [edi + 4], 01004BCA0h
L6:
    jmp sub_1004C17F
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 27
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    jmp sub_1004C195
    mov mov eax, dword ptr [esi + 48]
    cmp cmp eax, 3
    mov mov dword ptr [esi + 108], 3
    jne sub_1004C11F
    mov mov eax, esi
    mov mov dword ptr [edi + 4], 01004BB80h
    call sub_1004BBBC
    jmp sub_1004C1B7
    cmp cmp eax, 1
    jne sub_1004C145
    mov mov dword ptr [edi + 4], 01004BD50h
    jmp sub_1004C1C5
    cmp cmp eax, 2
    jne sub_1004C161
    mov mov dword ptr [edi + 4], 01004BCA0h
    jmp sub_1004C1D3
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 27
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    jmp sub_1004C1E6
    mov mov eax, dword ptr [esi + 48]
    mov mov ecx, 1
    cmp cmp eax, ecx
    mov mov dword ptr [esi + 108], ecx
    je sub_1004C1C6
    cmp cmp eax, 3
    je sub_1004C1CB
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 27
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    jmp sub_1004C20D
    mov mov dword ptr [edi + 4], 01004BD20h
    cmp cmp dword ptr [esi + 44], ecx
    mov mov eax, ecx
    jle sub_1004C21B
L9:
    mov mov ecx, 84
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [esi + 0CCh]
    mov mov byte ptr [edx + ecx + 48], 0
    mov mov edx, dword ptr [esi + 44]
    inc inc eax
    add add ecx, 84
    cmp cmp eax, edx
    jl sub_1004C226
    mov mov al, byte ptr [esi + 82]
    test test al, al
    pop pop edi
    je sub_1004C254
    mov mov dword ptr [esi + 112], 1
    ret ret
L11:
    mov mov eax, dword ptr [esi + 108]
    mov mov dword ptr [esi + 112], eax
    ret ret
FUN_1004bf10 ENDP
END
