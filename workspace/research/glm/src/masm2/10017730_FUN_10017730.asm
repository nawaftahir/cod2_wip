.686
.MODEL FLAT, C
EXTRN sub_1000D68C:PROC
EXTRN sub_1000FB5E:PROC
EXTRN sub_100139F2:PROC
EXTRN sub_100178A9:PROC
EXTRN sub_100178B5:PROC
EXTRN sub_100178B7:PROC
EXTRN sub_100178BE:PROC
EXTRN sub_100178C2:PROC
EXTRN sub_100178E3:PROC
EXTRN sub_100178E8:PROC
EXTRN sub_1001791F:PROC
EXTRN sub_1001792D:PROC
EXTRN sub_10017987:PROC
EXTRN EXTRN g_101D0A68:DWORD:DWORD
EXTRN EXTRN g_101D0A6C:DWORD:DWORD
EXTRN EXTRN g_101D0A70:DWORD:DWORD
EXTRN EXTRN g_101D0A74:DWORD:DWORD
EXTRN EXTRN g_101D0A78:DWORD:DWORD
.CODE
FUN_10017730 PROC
    sub sub esp, 8
    push push ebx
    push push ebp
    push push esi
    push push edi
    call sub_1000D68C
    xor xor ecx, ecx
    xor xor eax, eax
    mov mov dword ptr [esp + 20], eax
    jmp L0
    lea lea esp, [esp]
    lea lea ecx, [ecx]
    mov mov esi, dword ptr [eax + 0101D4D28h]
    cmp cmp esi, ecx
    je sub_100178A9
    xor xor ebp, ebp
    cmp cmp word ptr [esi + 52], cx
    jbe sub_100178B5
    xor xor edi, edi
    lea lea esp, [esp]
    mov mov eax, dword ptr [esi + 60]
    mov mov dl, byte ptr [eax + edi + 5]
    add add eax, edi
    cmp cmp dl, 5
    je sub_100178B7
    mov mov ebx, dword ptr [eax + 8]
    cmp cmp ebx, ecx
    je sub_100178C2
    mov mov al, byte ptr [ebx + 11]
    test test al, al
    jne L3
    movzx movzx eax, byte ptr [ebx + 10]
    cmp cmp eax, 5
    ja L4
    jmp jmp dword ptr [eax*4 + 010017898h]
    mov mov eax, dword ptr [g_101D0A68]
    jmp L1
    mov mov eax, dword ptr [g_101D0A6C]
    jmp L2
    mov mov eax, dword ptr [g_101D0A70]
    cmp cmp eax, ecx
    mov mov byte ptr [esp + 17], 2
    jge L5
    xor xor eax, eax
    mov mov byte ptr [esp + 16], al
    jmp L7
    cmp cmp eax, 3
    jle L6
    mov mov eax, 3
    mov mov byte ptr [esp + 16], al
    jmp L8
    mov mov word ptr [esp + 16], cx
    mov mov al, byte ptr [esp + 16]
    cmp cmp byte ptr [ebx + 8], al
    je sub_1001791F
    movzx movzx eax, byte ptr [ebx + 12]
    cmp cmp eax, ecx
    jl sub_100178BE
    cmp cmp eax, 1
    jle sub_100178E3
    cmp cmp eax, 4
    je sub_100178E8
    mov mov edx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [g_101D0A74]
    sub sub eax, edx
    mov mov edx, dword ptr [g_101D0A78]
    mov mov dword ptr [g_101D0A74], eax
    mov mov eax, dword ptr [ebx + 20]
    sub sub edx, eax
    mov mov dword ptr [g_101D0A78], edx
    mov mov eax, dword ptr [ebx + 4]
    cmp cmp eax, ecx
    je sub_1001792D
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    lea lea eax, [ebx + 16]
    mov mov dword ptr [ebx + 4], 0
    xor xor edx, edx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], edx
    mov mov cx, word ptr [esp + 16]
    mov mov dword ptr [ebx], 0
L4:
    mov mov word ptr [ebx + 8], cx
    call sub_1000FB5E
    test test al, al
    jne sub_10017987
    mov mov edx, dword ptr [ebx + 32]
    push push edx
    push push 010193544h
    push push 1
    call sub_100139F2
    add add esp, 12
    movzx movzx eax, word ptr [esi + 52]
    inc inc ebp
    add add edi, 12
    xor xor ecx, ecx
L6:
    cmp cmp ebp, eax
    jl sub_100178B7
    mov mov eax, dword ptr [esp + 20]
    add add eax, 4
    cmp cmp eax, 01000h
    mov mov dword ptr [esp + 20], eax
FUN_10017730 ENDP
END
