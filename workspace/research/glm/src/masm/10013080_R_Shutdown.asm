.686
.MODEL FLAT, C
EXTRN sub_10005469:PROC
EXTRN sub_1000586D:PROC
EXTRN sub_10005877:PROC
EXTRN sub_1000CDE6:PROC
EXTRN sub_10012EA6:PROC
EXTRN sub_10013097:PROC
EXTRN sub_100175F1:PROC
EXTRN sub_1001E621:PROC
EXTRN sub_1002BBD6:PROC
EXTRN sub_100377EC:PROC
EXTRN sub_1003ED60:PROC
EXTRN fp_101D4A50:DWORD
EXTRN fp_101D4B80:DWORD
EXTRN g_101D0B04:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D492C:DWORD
EXTRN g_101D4D00:DWORD
EXTRN g_101D7EB0:DWORD
EXTRN g_1042E778:DWORD
EXTRN g_10766750:DWORD
EXTRN g_10766754:DWORD
EXTRN g_10766758:DWORD
EXTRN g_1076A82C:DWORD
EXTRN g_1076A830:DWORD
.CODE
R_Shutdown PROC
    mov eax, dword ptr [g_101D1BF8]
    push ebx
    xor ebx, ebx
    cmp eax, ebx
    push esi
    push edi
    mov byte ptr [g_101D4D00], bl
    je L1
    cmp byte ptr [g_101D492C], bl
    jne L1
    cmp dword ptr [g_10766750], ebx
    jne L0
    cmp dword ptr [g_10766754], ebx
    jne L0
    cmp dword ptr [g_10766758], ebx
    je L1
L0:
    push ebx
    xor edi, edi
    xor ebx, ebx
    xor esi, esi
    call sub_1003ED60
    add esp, 4
L1:
    mov esi, 010678498h
    call sub_1000586D
    mov esi, 0101AE4B8h
    call sub_10005877
    call sub_100377EC
    mov eax, dword ptr [g_101D1B9C]
    cmp eax, ebx
    mov dword ptr [g_101D7EB0], ebx
    je L4
    mov eax, dword ptr [eax + 48]
    cmp eax, ebx
    je L3
L2:
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    cmp ecx, ebx
    jne L2
    mov edx, dword ptr [g_101D1B9C]
    mov dword ptr [edx + 48], ebx
L3:
    mov dword ptr [g_101D1B9C], ebx
L4:
    push 1
    push ebx
    push 010020330h
    push 1
    mov dword ptr [g_1076A82C], ebx
    call dword ptr [fp_101D4B80]
    add esp, 16
    call sub_100175F1
    xor eax, eax
    mov ecx, 000000A67h
    mov edi, 0101D7FC8h
    rep stosd dword ptr es:[edi], eax
    mov ecx, 000000400h
    mov edi, 0101D4D28h
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [g_101D0B04], ebx
    call sub_1000CDE6
    mov dword ptr [g_101D1B9C], ebx
    call sub_1001E621
    call sub_1002BBD6
    mov eax, dword ptr [esp + 16]
    pop edi
    pop esi
    cmp eax, ebx
    pop ebx
    je L5
    call sub_10012EA6
    push 000002000h
    call dword ptr [fp_101D4A50]
    add esp, 4
L5:
    jmp sub_10005469
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    push esi
    push edi
    call sub_10013097
    mov edi, dword ptr [esp + 12]
    mov ecx, 11
    mov esi, 0101D4C6Ch
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    pop esi
    ret
    int3
    int3
    int3
    int3
    int3
    int3
    mov eax, dword ptr [g_1042E778]
    mov edx, dword ptr [eax + 000030000h]
    push esi
    mov esi, dword ptr [eax + 000030004h]
    mov ecx, 000030000h
    sub ecx, edx
    lea ecx, [ecx + esi - 000002000h]
    cmp ecx, 4
    pop esi
    jge L6
    mov dword ptr [eax + 000030008h], 0
    ret
L6:
    lea ecx, [edx + eax]
    add edx, 4
    mov dword ptr [eax + 000030000h], edx
    mov dword ptr [eax + 000030008h], ecx
    mov word ptr [ecx], 33
R_Shutdown ENDP
END
