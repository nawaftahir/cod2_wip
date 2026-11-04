.686
.MODEL FLAT, C
EXTRN sub_1004A4F7:PROC
EXTRN sub_1004A501:PROC
EXTRN sub_1004A50F:PROC
EXTRN sub_1004A51A:PROC
EXTRN sub_1004A51E:PROC
EXTRN sub_1004A524:PROC
EXTRN sub_1004A52F:PROC
EXTRN sub_1004A537:PROC
EXTRN sub_1004A540:PROC
EXTRN sub_1004A5BB:PROC
EXTRN sub_1004A5C8:PROC
EXTRN sub_1004A5EF:PROC
EXTRN sub_1004FCC7:PROC
.CODE
FUN_1004a400 PROC
    push push esi
    mov mov esi, eax
    cmp cmp dword ptr [esi + 20], 0CAh
    jne L0
    mov mov eax, dword ptr [esi + 4]
    push push 28
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 0188h], eax
    mov mov dword ptr [eax], 01004FE50h
    mov mov dword ptr [eax + 4], 01004FFB0h
    mov mov byte ptr [eax + 8], 0
    add add esp, 12
    mov mov eax, esi
    call sub_1004FCC7
    mov mov al, byte ptr [esi + 72]
    test test al, al
    je L1
    mov mov dword ptr [esi + 20], 0CFh
    mov mov al, 1
    pop pop esi
    ret ret
    mov mov dword ptr [esi + 20], 0CBh
    mov mov eax, dword ptr [esi + 20]
    cmp cmp eax, 0CBh
    jne sub_1004A524
    mov mov ecx, dword ptr [esi + 0198h]
    mov mov al, byte ptr [ecx + 16]
    test test al, al
    je sub_1004A51E
    mov mov eax, dword ptr [esi + 8]
    test test eax, eax
    je L2
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov edx, dword ptr [esi + 0198h]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    test test eax, eax
    je sub_1004A537
    cmp cmp eax, 2
L1:
    je sub_1004A540
    mov mov ecx, dword ptr [esi + 8]
    test test ecx, ecx
    je sub_1004A4F7
    cmp cmp eax, 3
    je sub_1004A52F
    cmp cmp eax, 1
    jne sub_1004A501
    inc inc dword ptr [ecx + 4]
    mov mov eax, dword ptr [esi + 8]
    mov mov ecx, dword ptr [eax + 4]
    cmp cmp ecx, dword ptr [eax + 8]
    jl sub_1004A50F
    mov mov edx, dword ptr [esi + 0124h]
    add add dword ptr [eax + 8], edx
    jmp sub_1004A51A
    xor xor al, al
    pop pop esi
    ret ret
    mov mov eax, dword ptr [esi + 084h]
    mov mov dword ptr [esi + 08Ch], eax
    call sub_1004A5C8
    pop pop esi
    ret ret
    cmp cmp eax, 0CCh
    je sub_1004A5BB
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 20
    mov mov edx, dword ptr [esi]
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [edx + 24], eax
L2:
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    call sub_1004A5EF
    pop pop esi
    ret ret
FUN_1004a400 ENDP
END
