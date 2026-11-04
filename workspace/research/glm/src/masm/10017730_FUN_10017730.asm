.686
.MODEL FLAT, C
EXTRN sub_1000D68C:PROC
EXTRN sub_1000FB5E:PROC
EXTRN sub_100139F2:PROC
EXTRN g_101D0A68:DWORD
EXTRN g_101D0A6C:DWORD
EXTRN g_101D0A70:DWORD
EXTRN g_101D0A74:DWORD
EXTRN g_101D0A78:DWORD
.CODE
FUN_10017730 PROC
    sub esp, 8
    push ebx
    push ebp
    push esi
    push edi
    call sub_1000D68C
    xor ecx, ecx
    xor eax, eax
    mov dword ptr [esp + 20], eax
    jmp L0
    lea esp, [esp]
    lea ecx, [ecx]
L0:
    mov esi, dword ptr [eax + 0101D4D28h]
    cmp esi, ecx
    je L11
    xor ebp, ebp
    cmp word ptr [esi + 52], cx
    jbe L11
    xor edi, edi
    lea esp, [esp]
L1:
    mov eax, dword ptr [esi + 60]
    mov dl, byte ptr [eax + edi + 5]
    add eax, edi
    cmp dl, 5
    je L10
    mov ebx, dword ptr [eax + 8]
    cmp ebx, ecx
    je L10
    mov al, byte ptr [ebx + 11]
    test al, al
    jne L5
    movzx eax, byte ptr [ebx + 10]
    cmp eax, 5
    ja L5
    jmp dword ptr [eax*4 + 0x10017898]
    mov eax, dword ptr [g_101D0A68]
    jmp L2
    mov eax, dword ptr [g_101D0A6C]
    jmp L2
    mov eax, dword ptr [g_101D0A70]
L2:
    cmp eax, ecx
    mov byte ptr [esp + 17], 2
    jge L3
    xor eax, eax
    mov byte ptr [esp + 16], al
    jmp L6
L3:
    cmp eax, 3
    jle L4
    mov eax, 3
L4:
    mov byte ptr [esp + 16], al
    jmp L6
L5:
    mov word ptr [esp + 16], cx
L6:
    mov al, byte ptr [esp + 16]
    cmp byte ptr [ebx + 8], al
    je L10
    movzx eax, byte ptr [ebx + 12]
    cmp eax, ecx
    jl L7
    cmp eax, 1
    jle L8
    cmp eax, 4
    je L8
L7:
    mov edx, dword ptr [ebx + 16]
    mov eax, dword ptr [g_101D0A74]
    sub eax, edx
    mov edx, dword ptr [g_101D0A78]
    mov dword ptr [g_101D0A74], eax
    mov eax, dword ptr [ebx + 20]
    sub edx, eax
    mov dword ptr [g_101D0A78], edx
L8:
    mov eax, dword ptr [ebx + 4]
    cmp eax, ecx
    je L9
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    lea eax, [ebx + 16]
    mov dword ptr [ebx + 4], 0
    xor edx, edx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], edx
L9:
    mov cx, word ptr [esp + 16]
    mov dword ptr [ebx], 0
    mov word ptr [ebx + 8], cx
    call sub_1000FB5E
    test al, al
    jne L10
    mov edx, dword ptr [ebx + 32]
    push edx
    push 010193544h
    push 1
    call sub_100139F2
    add esp, 12
L10:
    movzx eax, word ptr [esi + 52]
    inc ebp
    add edi, 12
    xor ecx, ecx
    cmp ebp, eax
    jl L1
    mov eax, dword ptr [esp + 20]
L11:
    add eax, 4
    cmp eax, 000001000h
    mov dword ptr [esp + 20], eax
FUN_10017730 ENDP
END
