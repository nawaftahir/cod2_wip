.686
.MODEL FLAT, C
EXTRN sub_10067C8B:PROC
EXTRN sub_1006843E:PROC
EXTRN sub_10068442:PROC
EXTRN sub_10068448:PROC
EXTRN sub_1006845A:PROC
EXTRN sub_1006845D:PROC
EXTRN sub_10068460:PROC
EXTRN sub_10068462:PROC
EXTRN sub_10068464:PROC
EXTRN sub_10068466:PROC
EXTRN sub_1006846B:PROC
EXTRN sub_10068493:PROC
EXTRN sub_10068498:PROC
EXTRN sub_1006849D:PROC
EXTRN sub_100684A2:PROC
EXTRN sub_100684A6:PROC
EXTRN sub_100684B0:PROC
EXTRN sub_100684BC:PROC
EXTRN sub_100684BF:PROC
EXTRN sub_100684C9:PROC
EXTRN sub_100684ED:PROC
EXTRN sub_1006854A:PROC
EXTRN sub_1006854F:PROC
EXTRN sub_10068553:PROC
EXTRN sub_10068555:PROC
EXTRN sub_10068560:PROC
EXTRN sub_1006856B:PROC
EXTRN sub_10068576:PROC
EXTRN sub_1006858D:PROC
EXTRN sub_1006859B:PROC
EXTRN sub_100F870E:PROC
EXTRN sub_100F8722:PROC
.CODE
FUN_10068295 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 4]
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    cmp cmp edi, eax
    jb L0
    xor xor eax, eax
    jmp sub_10068442
    mov mov cl, byte ptr [edi]
    cmp cmp cl, 92
    push push esi
    jne sub_1006843E
    test test byte ptr [ebx + 40], 4
    jne sub_10068448
    lea lea esi, [edi + 1]
    cmp cmp esi, eax
    jb L1
    push push 01010CB7Ch
    push push 03EFh
    lea lea eax, [ebx + 8]
    push push eax
    push push dword ptr [ebx + 48]
    call sub_10067C8B
    add add esp, 16
    mov mov cl, byte ptr [esi]
    movsx movsx eax, cl
    sub sub eax, 97
    je sub_1006846B
    dec dec eax
    je sub_10068466
    sub sub eax, 4
    je sub_10068464
    sub sub eax, 8
    je sub_10068462
    sub sub eax, 4
    je sub_10068460
    dec dec eax
    dec dec eax
    je sub_1006845D
    dec dec eax
    dec dec eax
    je sub_1006845A
    cmp cmp cl, 48
    jl L3
    cmp cmp cl, 55
    jg L4
    mov mov ebx, dword ptr [ebx + 4]
    lea lea eax, [esi + 3]
    cmp cmp eax, ebx
    jae L2
    mov mov ebx, eax
    xor xor ecx, ecx
    jmp L5
    mov mov al, byte ptr [esi]
    cmp cmp al, 48
    jl L7
    cmp cmp al, 55
    jg L8
    movsx movsx eax, al
    lea lea ecx, [eax + ecx*8 - 48]
    inc inc esi
    cmp cmp esi, ebx
    jb L6
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], ecx
    jmp sub_100684ED
    cmp cmp cl, 120
    jne sub_10068493
    lea lea edi, [esi + 1]
    cmp cmp edi, dword ptr [ebx + 4]
    jae sub_10068498
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F870E
    test test eax, eax
    pop pop ecx
    je sub_100684A6
    mov mov esi, edi
    xor xor edi, edi
    jmp sub_1006849D
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F8722
    test test eax, eax
    pop pop ecx
    je sub_100684B0
    mov mov al, byte ptr [esi]
    shl shl edi, 4
    cmp cmp al, 97
    jl sub_100684A2
    movsx movsx eax, al
    lea lea edi, [edi + eax - 87]
    jmp sub_100684BC
    cmp cmp al, 65
    movsx movsx eax, al
    jl sub_100684BF
    lea lea edi, [edi + eax - 55]
    jmp sub_100684C9
    lea lea edi, [edi + eax - 48]
    inc inc esi
    cmp cmp esi, dword ptr [ebx + 4]
    jb sub_100684A2
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], edi
    mov mov edi, dword ptr [ebp + 8]
    jmp sub_1006854F
    mov mov edi, dword ptr [ebp + 8]
    movsx movsx eax, byte ptr [esi]
    inc inc esi
    jmp sub_10068553
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], 11
    jmp sub_1006854A
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], 9
    jmp sub_10068555
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], 13
    jmp sub_10068560
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], 10
L3:
    jmp sub_1006856B
    mov mov eax, dword ptr [ebp + 12]
L4:
    mov mov dword ptr [eax], 12
L6:
    jmp sub_10068576
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], 8
    inc inc esi
    jmp sub_1006859B
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], 7
    jmp sub_1006858D
    movsx movsx eax, cl
    lea lea esi, [edi + 1]
    mov mov ecx, dword ptr [ebp + 12]
    mov mov dword ptr [ecx], eax
    mov mov eax, esi
    sub sub eax, edi
    pop pop esi
    pop pop edi
    pop pop ebx
    pop pop ebp
    ret ret 8
FUN_10068295 ENDP
END
