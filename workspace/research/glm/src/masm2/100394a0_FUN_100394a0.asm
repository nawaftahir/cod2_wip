.686
.MODEL FLAT, C
EXTRN sub_10038AA7:PROC
EXTRN sub_10038D1E:PROC
EXTRN sub_10038D74:PROC
EXTRN sub_100392B4:PROC
EXTRN sub_10039313:PROC
EXTRN sub_10039362:PROC
EXTRN sub_100395F8:PROC
EXTRN sub_10039600:PROC
EXTRN sub_10039605:PROC
EXTRN sub_1003961F:PROC
EXTRN sub_1003962E:PROC
EXTRN sub_10039634:PROC
EXTRN sub_1003963C:PROC
EXTRN sub_1003964D:PROC
EXTRN sub_1003967E:PROC
EXTRN sub_100396CA:PROC
EXTRN sub_100396D1:PROC
EXTRN sub_1003DA80:PROC
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
.CODE
FUN_100394a0 PROC
    sub sub esp, 24
    test test eax, eax
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 36]
    push push esi
    push push edi
    jle sub_100395F8
    mov mov dword ptr [esp + 36], eax
    jmp L0
    lea lea esp, [esp]
    movzx movzx eax, word ptr [ebp]
    cmp cmp eax, 4
    ja sub_10039600
    jmp jmp dword ptr [eax*4 + 0100395F0h]
    mov mov eax, dword ptr [ebp + 4]
    movzx movzx ecx, word ptr [ebp + 2]
    push push 1
    push push eax
    push push ecx
    call sub_100392B4
    add add esp, 12
    jmp sub_1003961F
    mov mov ax, word ptr [ebp + 4]
    cmp cmp ax, 0BBh
    movzx movzx eax, ax
    jae L1
    movzx movzx edx, byte ptr [ebp + 7]
    sub sub eax, 080h
    shl shl eax, 4
    add add eax, 01072DA00h
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 20], edx
    jmp L2
    movzx movzx ecx, byte ptr [ebp + 7]
    movzx movzx edx, byte ptr [ebp + 6]
    push push ecx
    push push edx
    push push eax
    call sub_10038D74
    movzx movzx ecx, byte ptr [ebp + 7]
    add add esp, 12
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 20], ecx
    mov mov edx, dword ptr [esp + 20]
    push push edx
    push push eax
    movzx movzx eax, word ptr [ebp + 2]
    push push eax
    call sub_10039313
    add add esp, 12
    jmp sub_1003967E
    mov mov ecx, dword ptr [g_1072D9BC]
    movzx movzx edx, word ptr [ecx + 54]
    mov mov esi, dword ptr [ebp + 4]
    xor xor eax, eax
    test test edx, edx
    jle sub_1003963C
    mov mov ecx, dword ptr [ecx + 64]
    cmp cmp esi, dword ptr [ecx]
    je sub_10039634
    inc inc eax
    add add ecx, 20
    cmp cmp eax, edx
    jl sub_1003962E
L1:
    jmp sub_1003964D
    add add ecx, 4
    mov mov dword ptr [esp + 24], ecx
    mov mov dword ptr [esp + 20], 1
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 24]
    movzx movzx eax, word ptr [ebp + 2]
    push push ecx
    push push edx
    push push eax
    call sub_10039362
    add add esp, 12
    jmp sub_100396CA
    mov mov ebx, dword ptr [ebp + 4]
    lea lea edi, [esp + 28]
    lea lea esi, [esp + 32]
    call sub_10038AA7
L2:
    mov mov ecx, dword ptr [esp + 28]
    push push ecx
    jmp sub_100396D1
    mov mov ebx, dword ptr [ebp + 4]
    lea lea eax, [esp + 28]
    lea lea edx, [esp + 32]
    call sub_10038D1E
    mov mov edx, dword ptr [esp + 28]
    push push edx
    movzx movzx edi, word ptr [ebp + 2]
    mov mov eax, dword ptr [esp + 36]
    call sub_1003DA80
    add add esp, 4
    mov mov eax, dword ptr [esp + 36]
    add add ebp, 8
    dec dec eax
    mov mov dword ptr [esp + 36], eax
    jne sub_10039605
    pop pop edi
FUN_100394a0 ENDP
END
