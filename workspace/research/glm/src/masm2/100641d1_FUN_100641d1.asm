.686
.MODEL FLAT, C
EXTRN sub_100642B6:PROC
EXTRN sub_100642C1:PROC
EXTRN sub_100642CC:PROC
EXTRN sub_100642CD:PROC
EXTRN sub_100642D0:PROC
EXTRN sub_100642D5:PROC
EXTRN sub_100642DA:PROC
EXTRN sub_100642DC:PROC
EXTRN sub_100642FA:PROC
EXTRN sub_100642FC:PROC
EXTRN sub_100677A5:PROC
EXTRN sub_10067D0F:PROC
.CODE
FUN_100641d1 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0104h
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov ecx, dword ptr [edi + 026Ch]
    mov mov esi, dword ptr [ecx]
    call sub_100677A5
    cmp cmp dword ptr [edi + 80], 0
    je sub_100642D5
    jmp L0
    mov mov al, byte ptr [esi]
    cmp cmp al, 32
    je L1
    cmp cmp al, 9
    jne L3
    inc inc esi
    mov mov eax, dword ptr [edi + 026Ch]
    cmp cmp esi, dword ptr [eax]
    jb L2
    and and dword ptr [ebp - 4], 0
    lea lea edx, [esi + 2]
    lea lea eax, [esi + 1]
    push push ebx
    mov mov ecx, dword ptr [edi + 026Ch]
    mov mov ebx, dword ptr [ecx]
    cmp cmp esi, ebx
    jae sub_100642CD
    mov mov cl, byte ptr [esi]
    cmp cmp cl, 92
    jne sub_100642B6
L0:
    cmp cmp eax, ebx
    jae L4
    cmp cmp byte ptr [eax], 10
    jne L5
    inc inc esi
L2:
    inc inc esi
    inc inc eax
    inc inc eax
    inc inc edx
    inc inc edx
    jmp sub_100642DC
    cmp cmp cl, 92
L3:
    jne sub_100642CC
    cmp cmp edx, ebx
    jae sub_100642D0
    cmp cmp byte ptr [eax], 13
    jne sub_100642D5
    cmp cmp byte ptr [edx], 10
    jne sub_100642DA
    add add esi, 3
    add add eax, 3
    add add edx, 3
    jmp sub_100642FA
    cmp cmp cl, 13
    je sub_100642FC
    mov mov ebx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov byte ptr [ebp + ebx - 0104h], cl
    inc inc esi
    inc inc eax
    inc inc edx
    cmp cmp dword ptr [ebp - 4], 0FFh
    jb sub_100642C1
    mov mov eax, dword ptr [ebp - 4]
    mov mov byte ptr [ebp + eax - 0104h], 0
    lea lea eax, [ebp - 0104h]
    push push eax
    push push 01010C660h
    push push 0
    lea lea eax, [edi + 0278h]
    push push eax
    lea lea eax, [edi + 24]
L4:
    push push eax
    call sub_10067D0F
    add add esp, 20
    xor xor eax, eax
    inc inc eax
    mov mov dword ptr [edi + 72], eax
    mov mov dword ptr [edi + 68], eax
    pop pop ebx
    pop pop edi
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret
FUN_100641d1 ENDP
END
