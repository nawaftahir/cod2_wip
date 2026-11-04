.686
.MODEL FLAT, C
EXTRN sub_1004C973:PROC
EXTRN sub_1004C9FC:PROC
EXTRN sub_1004CA93:PROC
EXTRN sub_1004CAE6:PROC
EXTRN sub_10050930:PROC
EXTRN sub_10050E37:PROC
EXTRN sub_10050E53:PROC
EXTRN sub_10050E57:PROC
EXTRN sub_10050E6A:PROC
EXTRN sub_10050E8E:PROC
EXTRN sub_10050EA7:PROC
EXTRN sub_10050EAC:PROC
EXTRN sub_10050ECF:PROC
EXTRN sub_10050EDC:PROC
EXTRN sub_10050F1C:PROC
EXTRN sub_10050F3A:PROC
EXTRN sub_10050F73:PROC
EXTRN sub_10050F8D:PROC
EXTRN sub_10050F98:PROC
EXTRN sub_10050FA1:PROC
.CODE
FUN_10050bd0 PROC
    sub sub esp, 44
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 60]
    mov mov eax, dword ptr [edi + 0178h]
    mov mov ebx, dword ptr [edi + 01A0h]
    mov mov ecx, dword ptr [edi + 0180h]
    mov mov dword ptr [esp + 16], eax
    mov mov eax, dword ptr [edi + 0104h]
    test test eax, eax
    mov mov dword ptr [esp + 20], ebx
    mov mov dword ptr [esp + 24], ecx
    je L0
    mov mov eax, dword ptr [ebx + 40]
    test test eax, eax
    jne L1
    mov mov esi, edi
    call sub_10050930
    test test al, al
    jne L2
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 44
    ret ret
    mov mov al, byte ptr [ebx + 8]
    test test al, al
    push push ebp
    jne sub_10050E53
    mov mov ecx, dword ptr [ebx + 20]
    test test ecx, ecx
    mov mov dword ptr [esp + 16], ecx
    jbe L3
    mov mov eax, dword ptr [ebx + 40]
    pop pop ebp
    dec dec ecx
    pop pop edi
    dec dec eax
    mov mov dword ptr [ebx + 40], eax
    pop pop esi
    mov mov dword ptr [ebx + 20], ecx
    mov mov al, 1
    pop pop ebx
    add add esp, 44
    ret ret
    mov mov eax, dword ptr [edi + 32]
    mov mov edx, dword ptr [eax]
    mov mov esi, dword ptr [esp + 68]
    mov mov eax, dword ptr [eax + 4]
    mov mov esi, dword ptr [esi]
    mov mov ebp, dword ptr [edi + 0174h]
    cmp cmp ebp, dword ptr [esp + 20]
L2:
    mov mov dword ptr [esp + 40], edx
    mov mov edx, dword ptr [ebx + 12]
    mov mov dword ptr [esp + 44], eax
    mov mov eax, dword ptr [ebx + 16]
    mov mov dword ptr [esp + 36], esi
    mov mov esi, dword ptr [ebx + 60]
    mov mov dword ptr [esp + 56], edi
    jg sub_10050E8E
    mov mov edi, edi
    cmp cmp eax, 8
    jge L4
    push push 0
    push push eax
    push push edx
    lea lea ecx, [esp + 52]
    push push ecx
    call sub_1004C973
    add add esp, 16
    test test al, al
    je sub_10050E57
    mov mov eax, dword ptr [esp + 52]
    cmp cmp eax, 8
    mov mov edx, dword ptr [esp + 48]
L3:
    jge L5
    mov mov ecx, 1
    jmp L6
    lea lea ecx, [eax - 8]
    mov mov edi, edx
    sar sar edi, cl
    and and edi, 0FFh
    mov mov ecx, dword ptr [esi + edi*4 + 090h]
    test test ecx, ecx
    je L7
    movzx movzx edi, byte ptr [edi + esi + 0490h]
    sub sub eax, ecx
    jmp L8
    mov mov ecx, 9
    push push esi
    lea lea edi, [esp + 44]
    push push edi
    call sub_1004CAE6
    mov mov edi, eax
    add add esp, 8
    test test edi, edi
    jl sub_10050EAC
    mov mov edx, dword ptr [esp + 48]
    mov mov eax, dword ptr [esp + 52]
    mov mov ebx, edi
    sar sar ebx, 4
    and and edi, 15
    je sub_10050EA7
    add add ebp, ebx
    cmp cmp eax, edi
    mov mov dword ptr [esp + 32], ebp
    jge sub_10050E6A
    push push edi
    push push eax
    push push edx
    lea lea edx, [esp + 52]
    push push edx
    call sub_1004C9FC
    add add esp, 16
    test test al, al
    je sub_10050EDC
    mov mov edx, dword ptr [esp + 48]
    mov mov eax, dword ptr [esp + 52]
    sub sub eax, edi
    mov mov ecx, edi
    mov mov ebx, 1
    shl shl ebx, cl
    mov mov ecx, eax
    mov mov ebp, edx
    sar sar ebp, cl
    mov mov ecx, dword ptr [edi*4 + 010190E68h]
    dec dec ebx
    and and ebx, ebp
    cmp cmp ebx, ecx
    jge sub_10050ECF
    mov mov edi, dword ptr [edi*4 + 010190EA8h]
    add add edi, ebx
    jmp sub_10050EDC
    mov mov edi, ebx
    mov mov ecx, dword ptr [esp + 28]
    mov mov ebp, dword ptr [esp + 32]
    mov mov ebx, dword ptr [esp + 36]
    shl shl edi, cl
    mov mov ecx, dword ptr [ebp*4 + 010191200h]
    mov mov word ptr [ebx + ecx*2], di
    jmp sub_10050F1C
    cmp cmp ebx, 15
    jne sub_10050F3A
    add add ebp, 15
    mov mov ecx, dword ptr [esp + 20]
    inc inc ebp
    cmp cmp ebp, ecx
    jle sub_10050E37
    jmp sub_10050F8D
    pop pop ebp
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebx
    add add esp, 44
    ret ret
    mov mov edi, 1
    mov mov ecx, ebx
    shl shl edi, cl
    test test ebx, ebx
    mov mov esi, edi
    je sub_10050FA1
    cmp cmp eax, ebx
    jge sub_10050F98
    push push ebx
    push push eax
    push push edx
    lea lea edx, [esp + 52]
    push push edx
    call sub_1004CA93
    add add esp, 16
    test test al, al
    je sub_10050F73
    mov mov edx, dword ptr [esp + 48]
    mov mov eax, dword ptr [esp + 52]
    sub sub eax, ebx
    mov mov ebx, edx
    mov mov ecx, eax
    sar sar ebx, cl
    dec dec edi
    and and ebx, edi
    add add esi, ebx
    dec dec esi
L7:
    mov mov dword ptr [esp + 16], esi
    mov mov edi, dword ptr [esp + 64]
    mov mov ebx, dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 16]
    mov mov esi, dword ptr [edi + 32]
    mov mov ebp, dword ptr [esp + 40]
    mov mov dword ptr [esi], ebp
    mov mov esi, dword ptr [edi + 32]
    mov mov edi, dword ptr [esp + 44]
    mov mov dword ptr [esi + 4], edi
    mov mov dword ptr [ebx + 12], edx
    mov mov dword ptr [ebx + 16], eax
    mov mov dword ptr [ebx + 20], ecx
    mov mov eax, dword ptr [ebx + 40]
    pop pop ebp
    pop pop edi
L8:
    dec dec eax
    mov mov dword ptr [ebx + 40], eax
    pop pop esi
    mov mov al, 1
    pop pop ebx
    add add esp, 44
    ret ret
FUN_10050bd0 ENDP
END
