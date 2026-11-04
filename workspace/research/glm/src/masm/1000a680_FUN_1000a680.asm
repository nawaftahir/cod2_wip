.686
.MODEL FLAT, C
EXTRN sub_10009267:PROC
EXTRN sub_10009308:PROC
EXTRN sub_10009368:PROC
EXTRN sub_10009701:PROC
EXTRN sub_1000975D:PROC
EXTRN sub_1000A0A4:PROC
EXTRN g_101CE5B4:DWORD
EXTRN g_101CE5EC:DWORD
EXTRN g_101CE664:DWORD
EXTRN g_101CE78C:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_1000a680 PROC
    sub esp, 8
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 20]
    push esi
    push edi
    mov edi, eax
    push ebp
    mov ebx, edi
    mov esi, ecx
    call sub_10009267
    mov eax, dword ptr [g_101CE78C]
    mov cl, byte ptr [eax + 8]
    xor ebx, ebx
    add esp, 4
    cmp cl, bl
    jne L4
    cmp esi, ebx
    jl L1
    mov ecx, dword ptr [g_101D1B9C]
    imul esi, esi, 60
    add esi, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [g_101CE664]
    cmp byte ptr [edx + 8], bl
    push edi
    push ebp
    je L0
    push esi
    mov dword ptr [g_101CE5B4], ebx
    call sub_10009308
    mov al, byte ptr [g_101CE5EC]
    add esp, 12
    cmp al, bl
    je L4
    mov ebx, ebp
    mov ecx, esi
    call sub_10009701
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
L0:
    push 0101CE588h
    push esi
    call sub_1000A0A4
    add esp, 16
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
L1:
    mov eax, dword ptr [g_101D1B9C]
    cmp dword ptr [eax + 0000000FCh], ebx
    mov dword ptr [esp + 20], ebx
    jle L4
    mov dword ptr [esp + 16], ebx
L2:
    mov esi, dword ptr [eax + 000000100h]
    mov ecx, dword ptr [esp + 16]
    push edi
    add esi, ecx
    push ebp
    push esi
    call sub_10009368
    mov al, byte ptr [g_101CE5EC]
    add esp, 12
    test al, al
    je L3
    mov ebx, ebp
    mov ecx, esi
    call sub_1000975D
L3:
    mov ecx, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 16]
    mov eax, dword ptr [g_101D1B9C]
    mov edx, dword ptr [eax + 0000000FCh]
    inc ecx
    add esi, 60
    cmp ecx, edx
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 16], esi
    jl L2
L4:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_1000a680 ENDP
END
