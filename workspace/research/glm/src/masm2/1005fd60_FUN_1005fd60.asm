.686
.MODEL FLAT, C
EXTRN sub_1005F6EA:PROC
EXTRN sub_1005FE79:PROC
EXTRN sub_1005FE84:PROC
EXTRN sub_1005FE8C:PROC
EXTRN sub_1005FED1:PROC
EXTRN sub_1005FEEF:PROC
EXTRN sub_1005FF1C:PROC
EXTRN sub_10061D66:PROC
EXTRN sub_10061DB2:PROC
EXTRN sub_100F5EA5:PROC
EXTRN sub_100F5EED:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101AAC7C:DWORD:DWORD
.CODE
FUN_1005fd60 PROC
    push push ebx
    push push ebp
    push push esi
    xor xor ebx, ebx
    push push edi
    mov mov byte ptr [g_101AAC7C], bl
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    cmp cmp byte ptr [eax + 0404h], bl
    je L0
    cmp cmp byte ptr [eax + 0405h], bl
    mov mov byte ptr [eax + 0404h], bl
    je L1
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], ecx
    mov mov edx, dword ptr [esp + 20]
    push push edx
    xor xor eax, eax
    call sub_1005F6EA
    add add esp, 4
    mov mov ebp, eax
    cmp cmp byte ptr [ebp], bl
    je sub_1005FED1
    cmp cmp byte ptr [g_101AAC7C], bl
    je sub_1005FE8C
    mov mov eax, 0101AAC7Ch
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    cmp cmp cl, bl
    jne L2
    sub sub eax, edx
    mov mov edi, eax
    cmp cmp edi, 0400h
    jl sub_1005FE84
    push push 01019BC28h
    push push ebx
    call sub_10061D66
    add add esp, 8
    mov mov esi, 0400h
    sub sub esi, edi
    lea lea eax, [esi - 1]
    push push eax
    lea lea edi, [edi + 0101AAC7Ch]
    push push 01019B8F0h
    push push edi
    call sub_100F5EA5
    add add esp, 12
    mov mov byte ptr [edi + esi - 1], bl
    mov mov eax, 0101AAC7Ch
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    cmp cmp cl, bl
    jne sub_1005FEEF
    sub sub eax, edx
    mov mov edi, eax
    cmp cmp edi, 0400h
    jl sub_1005FF1C
    push push 01019BC28h
    push push ebx
    call sub_10061DB2
    add add esp, 8
    mov mov esi, 0400h
    sub sub esi, edi
    lea lea ecx, [esi - 1]
    push push ecx
    lea lea edi, [edi + 0101AAC7Ch]
    push push ebp
L2:
    push push edi
    call sub_100F5EED
    add add esp, 12
    mov mov byte ptr [edi + esi - 1], bl
    jmp sub_1005FE79
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov eax, 0101AAC7Ch
    pop pop ebx
    ret ret
FUN_1005fd60 ENDP
END
