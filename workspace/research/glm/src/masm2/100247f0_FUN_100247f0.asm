.686
.MODEL FLAT, C
EXTRN sub_1002181F:PROC
EXTRN sub_1002491F:PROC
EXTRN sub_10024930:PROC
EXTRN sub_1002499A:PROC
EXTRN sub_100249D7:PROC
EXTRN EXTRN g_101D1B48:DWORD:DWORD
EXTRN EXTRN g_1042E778:DWORD:DWORD
EXTRN EXTRN g_10678ABC:DWORD:DWORD
.CODE
FUN_100247f0 PROC
    sub sub esp, 12
    test test eax, eax
    jle sub_1002491F
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [g_1042E778]
    push push edi
    mov mov edi, ecx
    add add edi, 8
    mov mov dword ptr [esp + 16], eax
    mov mov edi, edi
    mov mov edx, dword ptr [g_10678ABC]
    mov mov eax, dword ptr [edi - 4]
    mov mov ebx, dword ptr [esi + 030004h]
    mov mov ecx, dword ptr [edi - 8]
    mov mov ebp, dword ptr [g_101D1B48]
    lea lea eax, [edx + eax*8]
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [esp + 20], eax
    mov mov dword ptr [esp + 24], edx
    mov mov edx, dword ptr [esi + 030000h]
    mov mov eax, 030000h
    sub sub eax, edx
    lea lea eax, [eax + ebx - 02000h]
    cmp cmp eax, 28
    jge L0
    xor xor ebx, ebx
    mov mov dword ptr [esi + 030008h], ebx
    jmp L1
    lea lea eax, [edx + esi]
    mov mov dword ptr [esi + 030008h], eax
    add add edx, 28
    mov mov dword ptr [esi + 030000h], edx
    mov mov word ptr [eax], 20
    mov mov word ptr [eax + 2], 28
    mov mov edx, 03F800000h
    mov mov dword ptr [eax + 16], edx
    mov mov dword ptr [eax + 20], edx
    mov mov dl, 0FFh
    mov mov dword ptr [eax + 4], ebp
    xor xor ebx, ebx
    mov mov dword ptr [eax + 8], ebx
    mov mov dword ptr [eax + 12], ebx
    mov mov byte ptr [eax + 24], dl
    mov mov byte ptr [eax + 25], dl
    mov mov byte ptr [eax + 26], dl
    mov mov byte ptr [eax + 27], dl
    push push ebx
    call sub_1002181F
    mov mov ecx, dword ptr [esi + 030000h]
    mov mov edx, dword ptr [esi + 030004h]
    mov mov eax, 030000h
    sub sub eax, ecx
    lea lea eax, [eax + edx - 02000h]
    add add esp, 4
    cmp cmp eax, 20
    jge sub_1002499A
    mov mov dword ptr [esi + 030008h], ebx
    jmp sub_100249D7
    mov mov edx, dword ptr [esp + 24]
    lea lea eax, [ecx + esi]
    mov mov dword ptr [esi + 030008h], eax
    add add ecx, 20
    mov mov dword ptr [esi + 030000h], ecx
    mov mov ecx, dword ptr [esp + 20]
    mov mov word ptr [eax], 23
    mov mov word ptr [eax + 2], 20
    mov mov dword ptr [eax + 4], ebx
    mov mov dword ptr [eax + 8], ecx
    mov mov dword ptr [eax + 12], edx
    mov mov dword ptr [eax + 16], 18
    mov mov eax, dword ptr [esp + 16]
    add add edi, 12
    dec dec eax
    mov mov dword ptr [esp + 16], eax
    jne sub_10024930
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
FUN_100247f0 ENDP
END
