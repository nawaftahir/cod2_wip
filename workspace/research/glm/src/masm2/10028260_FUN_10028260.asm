.686
.MODEL FLAT, C
EXTRN sub_1002847F:PROC
EXTRN sub_10028488:PROC
EXTRN sub_1002848C:PROC
EXTRN sub_10028493:PROC
EXTRN sub_100284A2:PROC
EXTRN sub_100284D7:PROC
EXTRN sub_100284F3:PROC
EXTRN sub_1002851A:PROC
EXTRN sub_10028544:PROC
EXTRN sub_100285AC:PROC
EXTRN sub_100285AF:PROC
EXTRN sub_100285D4:PROC
EXTRN sub_100285EB:PROC
.CODE
FUN_10028260 PROC
    mov mov ecx, dword ptr [esp + 12]
    sub sub esp, 20
    push push ebx
    mov mov ebx, dword ptr [esp + 40]
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 44]
    mov mov eax, ecx
    sub sub eax, edi
    sar sar eax, 3
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    push push ebx
    add add ecx, -8
    lea lea esi, [edi + eax*8]
    push push ecx
    push push esi
    mov mov eax, edi
    call sub_100285AF
    add add esp, 12
    cmp cmp edi, esi
    lea lea ebp, [esi + 8]
    jae L0
    lea lea esp, [esp]
    lea lea edi, [esi - 8]
    push push esi
    push push edi
    call call ebx
    add add esp, 8
    test test al, al
    jne L2
    push push edi
    push push esi
    call call ebx
    add add esp, 8
    test test al, al
    jne L3
    mov mov eax, dword ptr [esp + 44]
    mov mov esi, edi
    cmp cmp eax, esi
    jb L1
    mov mov edi, dword ptr [esp + 48]
    cmp cmp ebp, edi
    jae L5
    jmp L4
    lea lea ecx, [ecx]
    push push esi
    push push ebp
    call call ebx
    add add esp, 8
    test test al, al
    jne L7
    push push ebp
    push push esi
    call call ebx
    add add esp, 8
    test test al, al
    jne L8
    add add ebp, 8
    cmp cmp ebp, edi
    jb L6
    mov mov ebx, esi
    mov mov edi, ebp
    mov mov dword ptr [esp + 16], ebx
    cmp cmp edi, dword ptr [esp + 48]
    jae L10
    jmp L9
    lea lea ecx, [ecx]
    push push edi
    push push esi
    call call dword ptr [esp + 60]
    add add esp, 8
    test test al, al
    jne L12
    push push esi
    push push edi
    call call dword ptr [esp + 60]
    add add esp, 8
    test test al, al
    jne L13
    mov mov eax, ebp
L3:
    mov mov edx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [esp + 32], edx
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [eax], edx
    mov mov edx, dword ptr [edi + 4]
    mov mov dword ptr [eax + 4], edx
    mov mov eax, dword ptr [esp + 32]
    add add ebp, 8
    mov mov dword ptr [edi], ecx
    mov mov dword ptr [edi + 4], eax
    mov mov eax, dword ptr [esp + 48]
    add add edi, 8
    cmp cmp edi, eax
    jb L11
    cmp cmp ebx, dword ptr [esp + 44]
    jbe sub_1002848C
    add add ebx, -8
    nop nop
    push push esi
    push push ebx
    call call dword ptr [esp + 60]
    add add esp, 8
    test test al, al
    jne sub_1002847F
L6:
    push push ebx
    push push esi
    call call dword ptr [esp + 60]
    add add esp, 8
    test test al, al
L7:
    jne sub_100284A2
    mov mov edx, dword ptr [ebx]
    mov mov eax, dword ptr [esi - 8]
    mov mov ecx, dword ptr [esi - 4]
    sub sub esi, 8
    mov mov dword ptr [esi], edx
    mov mov edx, dword ptr [ebx + 4]
    mov mov dword ptr [esi + 4], edx
    mov mov dword ptr [ebx], eax
    mov mov dword ptr [ebx + 4], ecx
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 44]
    sub sub eax, 8
    sub sub ebx, 8
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 16], eax
    jb sub_10028488
    mov mov ebx, dword ptr [esp + 16]
    cmp cmp ebx, dword ptr [esp + 44]
    mov mov eax, dword ptr [esp + 48]
    jne sub_10028544
    cmp cmp edi, eax
    je sub_100285AC
    cmp cmp ebp, edi
    je sub_1002851A
    mov mov edx, dword ptr [ebp]
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [esi + 4]
    mov mov dword ptr [esi], edx
    mov mov edx, dword ptr [ebp + 4]
    mov mov dword ptr [esi + 4], edx
    mov mov dword ptr [ebp], eax
    mov mov dword ptr [ebp + 4], ecx
    mov mov ecx, esi
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [esp + 20], edx
    mov mov edx, dword ptr [ecx + 4]
    mov mov eax, edi
    mov mov dword ptr [esp + 24], edx
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [ecx + 4], edx
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 24]
    add add ebp, 8
    add add esi, 8
    add add edi, 8
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [eax + 4], edx
    jmp sub_10028493
    sub sub ebx, 8
    cmp cmp edi, eax
    mov mov dword ptr [esp + 16], ebx
    jne sub_100285EB
    sub sub esi, 8
    cmp cmp ebx, esi
    je sub_100285D4
    mov mov edx, dword ptr [esi]
    mov mov eax, dword ptr [ebx]
    mov mov ecx, dword ptr [ebx + 4]
    mov mov dword ptr [ebx], edx
    mov mov edx, dword ptr [esi + 4]
    mov mov dword ptr [ebx + 4], edx
    mov mov dword ptr [esi], eax
    mov mov dword ptr [esi + 4], ecx
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [esi + 4]
    sub sub ebp, 8
    mov mov dword ptr [esi], edx
    mov mov edx, dword ptr [ebp + 4]
    mov mov dword ptr [esi + 4], edx
    mov mov dword ptr [ebp], eax
    mov mov dword ptr [ebp + 4], ecx
    jmp sub_100284D7
    mov mov edx, dword ptr [ebx]
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [edi + 4]
    mov mov dword ptr [edi], edx
    mov mov edx, dword ptr [ebx + 4]
    mov mov dword ptr [edi + 4], edx
    mov mov dword ptr [ebx], eax
    mov mov dword ptr [ebx + 4], ecx
    add add edi, 8
    jmp sub_100284F3
    mov mov eax, dword ptr [esp + 40]
    pop pop edi
    mov mov dword ptr [eax], esi
    pop pop esi
    mov mov dword ptr [eax + 4], ebp
FUN_10028260 ENDP
END
