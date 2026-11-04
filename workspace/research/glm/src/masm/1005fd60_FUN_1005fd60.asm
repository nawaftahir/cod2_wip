.686
.MODEL FLAT, C
EXTRN sub_1005F6EA:PROC
EXTRN sub_10061D66:PROC
EXTRN sub_10061DB2:PROC
EXTRN sub_100F5EA5:PROC
EXTRN sub_100F5EED:PROC
EXTRN g_101AAC70:DWORD
EXTRN g_101AAC7C:DWORD
.CODE
FUN_1005fd60 PROC
    push ebx
    push ebp
    push esi
    xor ebx, ebx
    push edi
    mov byte ptr [g_101AAC7C], bl
    lea esp, [esp]
L0:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    cmp byte ptr [eax + 000000404h], bl
    je L1
    cmp byte ptr [eax + 000000405h], bl
    mov byte ptr [eax + 000000404h], bl
    je L2
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [esp + 20]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], ecx
L1:
    mov edx, dword ptr [esp + 20]
    push edx
    xor eax, eax
    call sub_1005F6EA
    add esp, 4
L2:
    mov ebp, eax
    cmp byte ptr [ebp], bl
    je L8
    cmp byte ptr [g_101AAC7C], bl
    je L5
    mov eax, 0101AAC7Ch
    lea edx, [eax + 1]
L3:
    mov cl, byte ptr [eax]
    inc eax
    cmp cl, bl
    jne L3
    sub eax, edx
    mov edi, eax
    cmp edi, 000000400h
    jl L4
    push 01019BC28h
    push ebx
    call sub_10061D66
    add esp, 8
L4:
    mov esi, 000000400h
    sub esi, edi
    lea eax, [esi - 1]
    push eax
    lea edi, [edi + 0101AAC7Ch]
    push 01019B8F0h
    push edi
    call sub_100F5EA5
    add esp, 12
    mov byte ptr [edi + esi - 1], bl
L5:
    mov eax, 0101AAC7Ch
    lea edx, [eax + 1]
L6:
    mov cl, byte ptr [eax]
    inc eax
    cmp cl, bl
    jne L6
    sub eax, edx
    mov edi, eax
    cmp edi, 000000400h
    jl L7
    push 01019BC28h
    push ebx
    call sub_10061DB2
    add esp, 8
L7:
    mov esi, 000000400h
    sub esi, edi
    lea ecx, [esi - 1]
    push ecx
    lea edi, [edi + 0101AAC7Ch]
    push ebp
    push edi
    call sub_100F5EED
    add esp, 12
    mov byte ptr [edi + esi - 1], bl
    jmp L0
L8:
    pop edi
    pop esi
    pop ebp
    mov eax, 0101AAC7Ch
    pop ebx
    ret
FUN_1005fd60 ENDP
END
