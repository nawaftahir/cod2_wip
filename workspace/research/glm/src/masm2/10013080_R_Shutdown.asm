.686
.MODEL FLAT, C
EXTRN sub_10005469:PROC
EXTRN sub_1000586D:PROC
EXTRN sub_10005877:PROC
EXTRN sub_1000CDE6:PROC
EXTRN sub_10012EA6:PROC
EXTRN sub_10013275:PROC
EXTRN sub_10013337:PROC
EXTRN sub_100175F1:PROC
EXTRN sub_1001E621:PROC
EXTRN sub_1002BBD6:PROC
EXTRN sub_100377EC:PROC
EXTRN sub_1003ED60:PROC
EXTRN EXTRN fp_101D4A50:DWORD:DWORD
EXTRN EXTRN fp_101D4B80:DWORD:DWORD
EXTRN EXTRN g_101D0B04:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D492C:DWORD:DWORD
EXTRN EXTRN g_101D4D00:DWORD:DWORD
EXTRN EXTRN g_101D7EB0:DWORD:DWORD
EXTRN EXTRN g_1042E778:DWORD:DWORD
EXTRN EXTRN g_10766750:DWORD:DWORD
EXTRN EXTRN g_10766754:DWORD:DWORD
EXTRN EXTRN g_10766758:DWORD:DWORD
EXTRN EXTRN g_1076A82C:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
R_Shutdown PROC
    mov mov eax, dword ptr [g_101D1BF8]
    push push ebx
    xor xor ebx, ebx
    cmp cmp eax, ebx
    push push esi
    push push edi
    mov mov byte ptr [g_101D4D00], bl
    je L1
    cmp cmp byte ptr [g_101D492C], bl
    jne L3
    cmp cmp dword ptr [g_10766750], ebx
    jne L2
    cmp cmp dword ptr [g_10766754], ebx
    jne L4
    cmp cmp dword ptr [g_10766758], ebx
    je L5
    push push ebx
    xor xor edi, edi
    xor xor ebx, ebx
    xor xor esi, esi
    call sub_1003ED60
    add add esp, 4
    mov mov esi, 010678498h
    call sub_1000586D
    mov mov esi, 0101AE4B8h
    call sub_10005877
L1:
    call sub_100377EC
    mov mov eax, dword ptr [g_101D1B9C]
    cmp cmp eax, ebx
    mov mov dword ptr [g_101D7EB0], ebx
    je L7
    mov mov eax, dword ptr [eax + 48]
    cmp cmp eax, ebx
    je L8
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    cmp cmp ecx, ebx
    jne L6
    mov mov edx, dword ptr [g_101D1B9C]
    mov mov dword ptr [edx + 48], ebx
    mov mov dword ptr [g_101D1B9C], ebx
    push push 1
    push push ebx
    push push 010020330h
    push push 1
    mov mov dword ptr [g_1076A82C], ebx
    call dword ptr [fp_101D4B80]
    add add esp, 16
    call sub_100175F1
    xor xor eax, eax
    mov mov ecx, 0A67h
    mov mov edi, 0101D7FC8h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, 0400h
    mov mov edi, 0101D4D28h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [g_101D0B04], ebx
    call sub_1000CDE6
    mov mov dword ptr [g_101D1B9C], ebx
    call sub_1001E621
    call sub_1002BBD6
    mov mov eax, dword ptr [esp + 16]
    pop pop edi
    pop pop esi
    cmp cmp eax, ebx
    pop pop ebx
    je sub_10013275
    call sub_10012EA6
L6:
    push push 02000h
    call dword ptr [fp_101D4A50]
    add add esp, 4
    jmp sub_10005469
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    push push esi
    push push edi
    call L0
    mov mov edi, dword ptr [esp + 12]
    mov mov ecx, 11
    mov mov esi, 0101D4C6Ch
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    pop pop edi
    pop pop esi
    ret ret
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    mov mov eax, dword ptr [g_1042E778]
    mov mov edx, dword ptr [eax + 030000h]
    push push esi
    mov mov esi, dword ptr [eax + 030004h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    lea lea ecx, [ecx + esi - 02000h]
    cmp cmp ecx, 4
    pop pop esi
    jge sub_10013337
    mov mov dword ptr [eax + 030008h], 0
    ret ret
    lea lea ecx, [edx + eax]
    add add edx, 4
    mov mov dword ptr [eax + 030000h], edx
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 33
R_Shutdown ENDP
END
