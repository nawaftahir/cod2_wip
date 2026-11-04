.686
.MODEL FLAT, C
EXTRN sub_10009267:PROC
EXTRN sub_10009308:PROC
EXTRN sub_10009368:PROC
EXTRN sub_10009701:PROC
EXTRN sub_1000975D:PROC
EXTRN sub_1000A0A4:PROC
EXTRN sub_1000A79C:PROC
EXTRN sub_1000A7D8:PROC
EXTRN sub_1000A810:PROC
EXTRN sub_1000A811:PROC
EXTRN sub_1000A814:PROC
EXTRN EXTRN g_101CE5B4:DWORD:DWORD
EXTRN EXTRN g_101CE5EC:DWORD:DWORD
EXTRN EXTRN g_101CE664:DWORD:DWORD
EXTRN EXTRN g_101CE78C:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_1000a680 PROC
    sub sub esp, 8
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    push push esi
    push push edi
    mov mov edi, eax
    push push ebp
    mov mov ebx, edi
    mov mov esi, ecx
    call sub_10009267
    mov mov eax, dword ptr [g_101CE78C]
    mov mov cl, byte ptr [eax + 8]
    xor xor ebx, ebx
    add add esp, 4
    cmp cmp cl, bl
    jne sub_1000A79C
    cmp cmp esi, ebx
    jl L0
    mov mov ecx, dword ptr [g_101D1B9C]
    imul imul esi, esi, 60
    add add esi, dword ptr [ecx + 0100h]
    mov mov edx, dword ptr [g_101CE664]
    cmp cmp byte ptr [edx + 8], bl
    push push edi
    push push ebp
    je L1
    push push esi
    mov mov dword ptr [g_101CE5B4], ebx
    call sub_10009308
    mov mov al, byte ptr [g_101CE5EC]
    add add esp, 12
    cmp cmp al, bl
    je sub_1000A7D8
    mov mov ebx, ebp
    mov mov ecx, esi
    call sub_10009701
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
    push push 0101CE588h
    push push esi
    call sub_1000A0A4
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
    mov mov eax, dword ptr [g_101D1B9C]
    cmp cmp dword ptr [eax + 0FCh], ebx
    mov mov dword ptr [esp + 20], ebx
    jle sub_1000A810
    mov mov dword ptr [esp + 16], ebx
    mov mov esi, dword ptr [eax + 0100h]
    mov mov ecx, dword ptr [esp + 16]
    push push edi
    add add esi, ecx
    push push ebp
    push push esi
    call sub_10009368
    mov mov al, byte ptr [g_101CE5EC]
    add add esp, 12
    test test al, al
    je sub_1000A811
    mov mov ebx, ebp
    mov mov ecx, esi
    call sub_1000975D
    mov mov ecx, dword ptr [esp + 20]
    mov mov esi, dword ptr [esp + 16]
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov edx, dword ptr [eax + 0FCh]
    inc inc ecx
    add add esi, 60
    cmp cmp ecx, edx
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [esp + 16], esi
    jl sub_1000A814
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_1000a680 ENDP
END
