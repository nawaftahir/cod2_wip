.686
.MODEL FLAT, C
EXTRN sub_1004C973:PROC
EXTRN sub_1004C9FC:PROC
EXTRN sub_1004CA93:PROC
EXTRN sub_1004CAE6:PROC
EXTRN sub_10050930:PROC
.CODE
FUN_10050bd0 PROC
    sub esp, 44
    push ebx
    push esi
    push edi
    mov edi, dword ptr [esp + 60]
    mov eax, dword ptr [edi + 000000178h]
    mov ebx, dword ptr [edi + 0000001A0h]
    mov ecx, dword ptr [edi + 000000180h]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [edi + 000000104h]
    test eax, eax
    mov dword ptr [esp + 20], ebx
    mov dword ptr [esp + 24], ecx
    je L0
    mov eax, dword ptr [ebx + 40]
    test eax, eax
    jne L0
    mov esi, edi
    call sub_10050930
    test al, al
    jne L0
    pop edi
    pop esi
    pop ebx
    add esp, 44
    ret
L0:
    mov al, byte ptr [ebx + 8]
    test al, al
    push ebp
    jne L18
    mov ecx, dword ptr [ebx + 20]
    test ecx, ecx
    mov dword ptr [esp + 16], ecx
    jbe L1
    mov eax, dword ptr [ebx + 40]
    pop ebp
    dec ecx
    pop edi
    dec eax
    mov dword ptr [ebx + 40], eax
    pop esi
    mov dword ptr [ebx + 20], ecx
    mov al, 1
    pop ebx
    add esp, 44
    ret
L1:
    mov eax, dword ptr [edi + 32]
    mov edx, dword ptr [eax]
    mov esi, dword ptr [esp + 68]
    mov eax, dword ptr [eax + 4]
    mov esi, dword ptr [esi]
    mov ebp, dword ptr [edi + 000000174h]
    cmp ebp, dword ptr [esp + 20]
    mov dword ptr [esp + 40], edx
    mov edx, dword ptr [ebx + 12]
    mov dword ptr [esp + 44], eax
    mov eax, dword ptr [ebx + 16]
    mov dword ptr [esp + 36], esi
    mov esi, dword ptr [ebx + 60]
    mov dword ptr [esp + 56], edi
    jg L17
    mov edi, edi
L2:
    cmp eax, 8
    jge L3
    push 0
    push eax
    push edx
    lea ecx, [esp + 52]
    push ecx
    call sub_1004C973
    add esp, 16
    test al, al
    je L12
    mov eax, dword ptr [esp + 52]
    cmp eax, 8
    mov edx, dword ptr [esp + 48]
    jge L3
    mov ecx, 1
    jmp L5
L3:
    lea ecx, [eax - 8]
    mov edi, edx
    sar edi, cl
    and edi, 0000000FFh
    mov ecx, dword ptr [esi + edi*4 + 000000090h]
    test ecx, ecx
    je L4
    movzx edi, byte ptr [edi + esi + 000000490h]
    sub eax, ecx
    jmp L6
L4:
    mov ecx, 9
L5:
    push esi
    lea edi, [esp + 44]
    push edi
    call sub_1004CAE6
    mov edi, eax
    add esp, 8
    test edi, edi
    jl L12
    mov edx, dword ptr [esp + 48]
    mov eax, dword ptr [esp + 52]
L6:
    mov ebx, edi
    sar ebx, 4
    and edi, 15
    je L10
    add ebp, ebx
    cmp eax, edi
    mov dword ptr [esp + 32], ebp
    jge L7
    push edi
    push eax
    push edx
    lea edx, [esp + 52]
    push edx
    call sub_1004C9FC
    add esp, 16
    test al, al
    je L12
    mov edx, dword ptr [esp + 48]
    mov eax, dword ptr [esp + 52]
L7:
    sub eax, edi
    mov ecx, edi
    mov ebx, 1
    shl ebx, cl
    mov ecx, eax
    mov ebp, edx
    sar ebp, cl
    mov ecx, dword ptr [edi*4 + 010190E68h]
    dec ebx
    and ebx, ebp
    cmp ebx, ecx
    jge L8
    mov edi, dword ptr [edi*4 + 010190EA8h]
    add edi, ebx
    jmp L9
L8:
    mov edi, ebx
L9:
    mov ecx, dword ptr [esp + 28]
    mov ebp, dword ptr [esp + 32]
    mov ebx, dword ptr [esp + 36]
    shl edi, cl
    mov ecx, dword ptr [ebp*4 + 010191200h]
    mov word ptr [ebx + ecx*2], di
    jmp L11
L10:
    cmp ebx, 15
    jne L13
    add ebp, 15
L11:
    mov ecx, dword ptr [esp + 20]
    inc ebp
    cmp ebp, ecx
    jle L2
    jmp L16
L12:
    pop ebp
    pop edi
    pop esi
    xor al, al
    pop ebx
    add esp, 44
    ret
L13:
    mov edi, 1
    mov ecx, ebx
    shl edi, cl
    test ebx, ebx
    mov esi, edi
    je L15
    cmp eax, ebx
    jge L14
    push ebx
    push eax
    push edx
    lea edx, [esp + 52]
    push edx
    call sub_1004CA93
    add esp, 16
    test al, al
    je L12
    mov edx, dword ptr [esp + 48]
    mov eax, dword ptr [esp + 52]
L14:
    sub eax, ebx
    mov ebx, edx
    mov ecx, eax
    sar ebx, cl
    dec edi
    and ebx, edi
    add esi, ebx
L15:
    dec esi
    mov dword ptr [esp + 16], esi
L16:
    mov edi, dword ptr [esp + 64]
    mov ebx, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 16]
L17:
    mov esi, dword ptr [edi + 32]
    mov ebp, dword ptr [esp + 40]
    mov dword ptr [esi], ebp
    mov esi, dword ptr [edi + 32]
    mov edi, dword ptr [esp + 44]
    mov dword ptr [esi + 4], edi
    mov dword ptr [ebx + 12], edx
    mov dword ptr [ebx + 16], eax
    mov dword ptr [ebx + 20], ecx
L18:
    mov eax, dword ptr [ebx + 40]
    pop ebp
    pop edi
    dec eax
    mov dword ptr [ebx + 40], eax
    pop esi
    mov al, 1
    pop ebx
    add esp, 44
    ret
FUN_10050bd0 ENDP
END
