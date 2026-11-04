.686
.MODEL FLAT, C
EXTRN sub_1001CF4C:PROC
EXTRN sub_1001CF74:PROC
EXTRN sub_1001CF94:PROC
EXTRN sub_1001CFBA:PROC
EXTRN sub_1001D0A8:PROC
EXTRN sub_1001D0AF:PROC
EXTRN sub_1001D0BC:PROC
EXTRN sub_1001D0FD:PROC
.CODE
FUN_1001cbc0 PROC
    sub sub esp, 88
    push push ebx
    mov mov ebx, dword ptr [esp + 104]
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 112]
    mov mov ebp, dword ptr [esp + 120]
    mov mov ecx, ebx
    sub sub ecx, edi
    mov mov eax, 02AAAAAABh
    imul imul ecx
    sar sar edx, 1
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    lea lea eax, [eax + eax*2]
    push push ebp
    lea lea esi, [edi + eax*4]
    add add ebx, -12
    push push ebx
    push push esi
    mov mov eax, edi
    call sub_1001D0AF
    add add esp, 12
    cmp cmp edi, esi
    lea lea ebx, [esi + 12]
    jae L0
    lea lea esp, [esp]
    lea lea eax, [esi - 12]
    push push esi
    push push eax
    mov mov dword ptr [esp + 24], eax
    call call ebp
    add add esp, 8
    test test al, al
    jne L2
    mov mov ecx, dword ptr [esp + 16]
    push push ecx
    push push esi
    call call ebp
    add add esp, 8
    test test al, al
    jne L3
    mov mov esi, dword ptr [esp + 16]
    cmp cmp edi, esi
    jb L1
    mov mov edi, dword ptr [esp + 116]
    cmp cmp ebx, edi
    jae L4
    push push esi
    push push ebx
    call call ebp
    add add esp, 8
    test test al, al
    jne L5
    push push ebx
    push push esi
    call call ebp
    add add esp, 8
    test test al, al
    jne L6
    add add ebx, 12
    cmp cmp ebx, edi
    jb L4
    mov mov ebp, esi
    mov mov edi, ebx
    mov mov dword ptr [esp + 16], ebp
    cmp cmp edi, dword ptr [esp + 116]
    jae L7
    lea lea esp, [esp]
    push push edi
    push push esi
    call call dword ptr [esp + 080h]
    add add esp, 8
    test test al, al
    jne L9
    push push esi
    push push edi
L0:
    call call dword ptr [esp + 080h]
L1:
    add add esp, 8
    test test al, al
    jne L10
    mov mov eax, ebx
    mov mov edx, eax
    mov mov ecx, dword ptr [edx]
    mov mov ebp, dword ptr [edx + 4]
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [esp + 88], edx
    mov mov dword ptr [esp + 84], ebp
    mov mov edx, edi
    mov mov ebp, dword ptr [edx]
    mov mov dword ptr [eax], ebp
L3:
    mov mov ebp, dword ptr [edx + 4]
    mov mov dword ptr [eax + 4], ebp
    mov mov edx, dword ptr [edx + 8]
    mov mov ebp, dword ptr [esp + 16]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [esp + 88]
    mov mov eax, edi
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + 84]
    mov mov dword ptr [eax + 4], ecx
    add add ebx, 12
    mov mov dword ptr [eax + 8], edx
    mov mov eax, dword ptr [esp + 116]
    add add edi, 12
    cmp cmp edi, eax
    jb L8
    cmp cmp ebp, dword ptr [esp + 112]
    jbe L13
    add add ebp, -12
    push push esi
    push push ebp
    call call dword ptr [esp + 080h]
    add add esp, 8
    test test al, al
L6:
    jne L11
    push push ebp
    push push esi
    call call dword ptr [esp + 080h]
    add add esp, 8
    test test al, al
    jne L14
    sub sub esi, 12
    mov mov eax, esi
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [esp + 24], edx
    mov mov dword ptr [esp + 28], eax
    mov mov ecx, ebp
    mov mov eax, dword ptr [ecx]
    mov mov edx, esi
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [edx + 4], eax
    mov mov ecx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [esp + 20]
    mov mov dword ptr [edx + 8], ecx
    mov mov ecx, dword ptr [esp + 24]
    mov mov edx, ebp
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [esp + 28]
    mov mov dword ptr [edx + 4], ecx
    mov mov dword ptr [edx + 8], eax
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 112]
    sub sub eax, 12
    sub sub ebp, 12
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 16], eax
    jb L12
    mov mov ebp, dword ptr [esp + 16]
    cmp cmp ebp, dword ptr [esp + 112]
    mov mov eax, dword ptr [esp + 116]
    jne sub_1001CFBA
    cmp cmp edi, eax
    je sub_1001D0A8
    cmp cmp ebx, edi
    je sub_1001CF74
    mov mov ecx, esi
    mov mov eax, dword ptr [ecx]
    mov mov edx, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov dword ptr [esp + 96], edx
    mov mov dword ptr [esp + 100], ecx
    mov mov edx, ebx
    mov mov ebp, dword ptr [edx]
    mov mov ecx, esi
    mov mov dword ptr [ecx], ebp
    mov mov ebp, dword ptr [edx + 4]
    mov mov dword ptr [ecx + 4], ebp
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [ecx + 8], edx
    mov mov edx, dword ptr [esp + 96]
    mov mov ecx, ebx
L10:
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 100]
    mov mov dword ptr [ecx + 4], edx
    mov mov dword ptr [ecx + 8], eax
    mov mov ecx, esi
    mov mov edx, ecx
    mov mov ebp, dword ptr [edx]
    mov mov dword ptr [esp + 32], ebp
    mov mov ebp, dword ptr [edx + 4]
    mov mov edx, dword ptr [edx + 8]
    mov mov eax, edi
    mov mov dword ptr [esp + 40], edx
    mov mov dword ptr [esp + 36], ebp
    mov mov edx, eax
    mov mov ebp, dword ptr [edx]
    mov mov dword ptr [ecx], ebp
    mov mov ebp, dword ptr [edx + 4]
    mov mov dword ptr [ecx + 4], ebp
    mov mov edx, dword ptr [edx + 8]
    mov mov ebp, dword ptr [esp + 16]
    mov mov dword ptr [ecx + 8], edx
    mov mov ecx, dword ptr [esp + 32]
    mov mov edx, dword ptr [esp + 36]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + 40]
    add add ebx, 12
    add add esi, 12
    mov mov dword ptr [eax + 4], edx
    add add edi, 12
    mov mov dword ptr [eax + 8], ecx
    jmp L15
    sub sub ebp, 12
    cmp cmp edi, eax
    mov mov dword ptr [esp + 16], ebp
    jne sub_1001D0FD
    sub sub esi, 12
    cmp cmp ebp, esi
    je sub_1001D0BC
    mov mov edx, ebp
    mov mov eax, dword ptr [edx]
    mov mov ecx, dword ptr [edx + 4]
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [esp + 44], eax
    mov mov dword ptr [esp + 48], ecx
    mov mov dword ptr [esp + 52], edx
    mov mov eax, esi
    mov mov edx, dword ptr [eax]
    mov mov ecx, ebp
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [ecx + 4], edx
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [esp + 44]
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [esp + 48]
    mov mov ecx, esi
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [esp + 52]
    mov mov dword ptr [ecx + 4], eax
    mov mov dword ptr [ecx + 8], edx
    mov mov eax, esi
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [esp + 56], ecx
    mov mov dword ptr [esp + 60], edx
    sub sub ebx, 12
    mov mov dword ptr [esp + 64], eax
    mov mov ecx, ebx
    mov mov eax, dword ptr [ecx]
    mov mov edx, esi
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [edx + 4], eax
    mov mov ecx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [esp + 56]
L13:
    mov mov dword ptr [edx + 8], ecx
    mov mov ecx, dword ptr [esp + 60]
    mov mov edx, ebx
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [esp + 64]
    mov mov dword ptr [edx + 4], ecx
    mov mov dword ptr [edx + 8], eax
    jmp sub_1001CF4C
    mov mov ecx, edi
    mov mov edx, dword ptr [ecx]
    mov mov eax, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov dword ptr [esp + 68], edx
    mov mov dword ptr [esp + 72], eax
    mov mov dword ptr [esp + 76], ecx
    mov mov edx, ebp
    mov mov ecx, dword ptr [edx]
    mov mov eax, edi
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [eax + 4], ecx
    mov mov edx, dword ptr [edx + 8]
    mov mov ecx, dword ptr [esp + 68]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [esp + 72]
    mov mov eax, ebp
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + 76]
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [eax + 8], ecx
    add add edi, 12
    jmp sub_1001CF94
    mov mov eax, dword ptr [esp + 108]
    pop pop edi
    mov mov dword ptr [eax], esi
    pop pop esi
    pop pop ebp
    mov mov dword ptr [eax + 4], ebx
    pop pop ebx
    add add esp, 88
    ret ret
FUN_1001cbc0 ENDP
END
