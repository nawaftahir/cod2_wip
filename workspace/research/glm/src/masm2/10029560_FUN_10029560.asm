.686
.MODEL FLAT, C
EXTRN sub_100296A6:PROC
EXTRN sub_100296A7:PROC
EXTRN sub_100296B1:PROC
EXTRN sub_100296B5:PROC
EXTRN sub_10029740:PROC
EXTRN sub_1002975E:PROC
EXTRN sub_1002976B:PROC
EXTRN EXTRN g_1042E778:DWORD:DWORD
.CODE
FUN_10029560 PROC
    push push ecx
    mov mov eax, dword ptr [g_1042E778]
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, 010696C44h
    mov mov dword ptr [esp + 16], edi
    mov mov ebx, 8
    jmp L0
    mov mov edi, dword ptr [esp + 16]
    mov mov edi, edi
    mov mov esi, dword ptr [edi]
    cmp cmp esi, -1
    je L2
    mov mov edx, dword ptr [eax + 030000h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    cmp cmp ecx, ebx
    jge L1
    xor xor ecx, ecx
L0:
    mov mov dword ptr [eax + 030008h], ecx
    jmp L3
    lea lea ecx, [edx + eax]
    add add edx, 8
    mov mov dword ptr [eax + 030000h], edx
    add add dword ptr [eax + 030004h], ebx
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 2
    mov mov word ptr [ecx + 2], bx
    lea lea edx, [eax + esi + 8]
    mov mov dword ptr [ecx + 4], edx
    mov mov dword ptr [edi], -1
    lea lea esi, [edi + 4]
    mov mov ebp, 4
    mov mov edi, dword ptr [esi]
L1:
    cmp cmp edi, -1
    je sub_100296A7
    mov mov edx, dword ptr [eax + 030000h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    cmp cmp ecx, ebx
    jge L4
    xor xor ecx, ecx
    mov mov dword ptr [eax + 030008h], ecx
    jmp sub_100296B5
    lea lea ecx, [edx + eax]
    add add edx, 8
    mov mov dword ptr [eax + 030000h], edx
    add add dword ptr [eax + 030004h], ebx
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 2
    mov mov word ptr [ecx + 2], bx
    lea lea edx, [eax + edi + 8]
    mov mov dword ptr [ecx + 4], edx
    mov mov dword ptr [esi], -1
    add add esi, 4
    dec dec ebp
    jne sub_100296A6
    mov mov edi, dword ptr [esp + 16]
    mov mov esi, dword ptr [edi + 20]
    cmp cmp esi, -1
    je sub_1002975E
    mov mov edx, dword ptr [eax + 030000h]
    mov mov ecx, 030000h
    sub sub ecx, edx
    cmp cmp ecx, ebx
    jge sub_10029740
    xor xor ecx, ecx
    mov mov dword ptr [eax + 030008h], ecx
    jmp sub_1002976B
    lea lea ecx, [edx + eax]
    add add edx, 8
    mov mov dword ptr [eax + 030000h], edx
    add add dword ptr [eax + 030004h], ebx
    mov mov dword ptr [eax + 030008h], ecx
    mov mov word ptr [ecx], 2
    mov mov word ptr [ecx + 2], bx
    lea lea edx, [eax + esi + 8]
    mov mov dword ptr [ecx + 4], edx
    mov mov dword ptr [edi + 20], -1
    add add edi, 28
    cmp cmp edi, 010696CD0h
    mov mov dword ptr [esp + 16], edi
    jne sub_100296B1
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10029560 ENDP
END
