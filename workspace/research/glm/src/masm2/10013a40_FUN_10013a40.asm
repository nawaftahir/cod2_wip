.686
.MODEL FLAT, C
EXTRN sub_10013E5B:PROC
EXTRN sub_10013E8C:PROC
EXTRN sub_10013EB7:PROC
EXTRN sub_10013EE6:PROC
EXTRN sub_10013F69:PROC
EXTRN sub_10014010:PROC
EXTRN sub_1001402A:PROC
EXTRN sub_1001407F:PROC
.CODE
FUN_10013a40 PROC
    mov mov ecx, dword ptr [esp + 12]
    sub sub esp, 116
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 08Ch]
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 08Ch]
    mov mov eax, ecx
    sub sub eax, edi
    sar sar eax, 4
    cdq cdq
    sub sub eax, edx
    mov mov esi, eax
    sar sar esi, 1
    push push ebp
    add add ecx, -16
    shl shl esi, 4
    push push ecx
    add add esi, edi
    push push esi
    mov mov eax, edi
    call sub_10013F69
    add add esp, 12
    cmp cmp edi, esi
    lea lea ebx, [esi + 16]
    jae L0
    lea lea edi, [esi - 16]
    push push esi
    push push edi
    call call ebp
    add add esp, 8
    test test al, al
    jne L1
    push push edi
    push push esi
    call call ebp
    add add esp, 8
    test test al, al
    jne L2
    mov mov eax, dword ptr [esp + 08Ch]
    mov mov esi, edi
    cmp cmp eax, esi
    jb L0
    mov mov edi, dword ptr [esp + 090h]
    cmp cmp ebx, edi
    jae L3
    push push esi
    push push ebx
    call call ebp
    add add esp, 8
    test test al, al
    jne L4
    push push ebx
    push push esi
    call call ebp
    add add esp, 8
    test test al, al
    jne L5
    add add ebx, 16
    cmp cmp ebx, edi
    jb L3
    mov mov ebp, esi
    mov mov edi, ebx
    mov mov dword ptr [esp + 16], ebp
    lea lea esp, [esp]
    cmp cmp edi, dword ptr [esp + 090h]
    jae L6
    lea lea ecx, [ecx]
    push push edi
    push push esi
    call call dword ptr [esp + 09Ch]
    add add esp, 8
    test test al, al
    jne L7
    push push esi
    push push edi
    call call dword ptr [esp + 09Ch]
    add add esp, 8
    test test al, al
    jne L9
    mov mov eax, ebx
    mov mov edx, eax
    mov mov ecx, dword ptr [edx]
    mov mov ebp, dword ptr [edx + 4]
    mov mov dword ptr [esp + 104], ebp
    mov mov ebp, dword ptr [edx + 8]
    mov mov edx, dword ptr [edx + 12]
    mov mov dword ptr [esp + 112], edx
    mov mov dword ptr [esp + 108], ebp
    mov mov edx, edi
    mov mov ebp, dword ptr [edx]
    mov mov dword ptr [eax], ebp
    mov mov ebp, dword ptr [edx + 4]
    mov mov dword ptr [eax + 4], ebp
    mov mov ebp, dword ptr [edx + 8]
    mov mov dword ptr [eax + 8], ebp
    mov mov edx, dword ptr [edx + 12]
    mov mov ebp, dword ptr [esp + 16]
    mov mov dword ptr [eax + 12], edx
    mov mov edx, dword ptr [esp + 108]
    mov mov eax, edi
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + 104]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [esp + 112]
    mov mov dword ptr [eax + 8], edx
    add add ebx, 16
    mov mov dword ptr [eax + 12], ecx
    mov mov eax, dword ptr [esp + 090h]
    add add edi, 16
    cmp cmp edi, eax
    jb L8
    cmp cmp ebp, dword ptr [esp + 08Ch]
    jbe L12
    add add ebp, -16
    push push esi
    push push ebp
    call call dword ptr [esp + 09Ch]
    add add esp, 8
    test test al, al
    jne L10
    push push ebp
    push push esi
    call call dword ptr [esp + 09Ch]
    add add esp, 8
    test test al, al
    jne L13
    sub sub esi, 16
    mov mov edx, esi
    mov mov eax, dword ptr [edx]
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [esp + 20], eax
    mov mov eax, dword ptr [edx + 8]
    mov mov dword ptr [esp + 24], ecx
    mov mov ecx, dword ptr [edx + 12]
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [esp + 32], ecx
    mov mov edx, ebp
    mov mov ecx, dword ptr [edx]
    mov mov eax, esi
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [edx + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov edx, dword ptr [edx + 12]
    mov mov ecx, dword ptr [esp + 20]
    mov mov dword ptr [eax + 12], edx
    mov mov edx, dword ptr [esp + 24]
    mov mov eax, ebp
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [eax + 4], edx
    mov mov edx, dword ptr [esp + 32]
    mov mov dword ptr [eax + 8], ecx
    mov mov dword ptr [eax + 12], edx
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 08Ch]
    sub sub eax, 16
    sub sub ebp, 16
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 16], eax
    jb L11
    mov mov ebp, dword ptr [esp + 16]
    cmp cmp ebp, dword ptr [esp + 08Ch]
    mov mov eax, dword ptr [esp + 090h]
    jne sub_10013EE6
    cmp cmp edi, eax
    je sub_10014010
    cmp cmp ebx, edi
    je sub_10013E8C
    mov mov ecx, esi
    mov mov eax, dword ptr [ecx]
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [esp + 120], edx
    mov mov edx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ecx + 12]
    mov mov dword ptr [esp + 124], edx
    mov mov dword ptr [esp + 080h], ecx
    mov mov edx, ebx
    mov mov ebp, dword ptr [edx]
    mov mov ecx, esi
    mov mov dword ptr [ecx], ebp
    mov mov ebp, dword ptr [edx + 4]
    mov mov dword ptr [ecx + 4], ebp
    mov mov ebp, dword ptr [edx + 8]
    mov mov dword ptr [ecx + 8], ebp
    mov mov edx, dword ptr [edx + 12]
    mov mov dword ptr [ecx + 12], edx
    mov mov edx, dword ptr [esp + 120]
    mov mov ecx, ebx
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 124]
    mov mov dword ptr [ecx + 4], edx
    mov mov edx, dword ptr [esp + 080h]
    mov mov dword ptr [ecx + 8], eax
    mov mov dword ptr [ecx + 12], edx
    mov mov ecx, esi
    mov mov edx, ecx
    mov mov ebp, dword ptr [edx]
    mov mov dword ptr [esp + 36], ebp
    mov mov ebp, dword ptr [edx + 4]
    mov mov dword ptr [esp + 40], ebp
    mov mov ebp, dword ptr [edx + 8]
    mov mov edx, dword ptr [edx + 12]
    mov mov eax, edi
    mov mov dword ptr [esp + 48], edx
    mov mov dword ptr [esp + 44], ebp
    mov mov edx, eax
    mov mov ebp, dword ptr [edx]
    mov mov dword ptr [ecx], ebp
    mov mov ebp, dword ptr [edx + 4]
    mov mov dword ptr [ecx + 4], ebp
    mov mov ebp, dword ptr [edx + 8]
    mov mov dword ptr [ecx + 8], ebp
    mov mov edx, dword ptr [edx + 12]
    mov mov ebp, dword ptr [esp + 16]
    mov mov dword ptr [ecx + 12], edx
    mov mov ecx, dword ptr [esp + 36]
    mov mov edx, dword ptr [esp + 40]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + 44]
    mov mov dword ptr [eax + 4], edx
    mov mov edx, dword ptr [esp + 48]
    add add ebx, 16
    add add esi, 16
    mov mov dword ptr [eax + 8], ecx
    add add edi, 16
    mov mov dword ptr [eax + 12], edx
    jmp L14
    sub sub ebp, 16
    cmp cmp edi, eax
    mov mov dword ptr [esp + 16], ebp
    jne sub_1001407F
    sub sub esi, 16
    cmp cmp ebp, esi
    je sub_1001402A
    mov mov eax, ebp
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [esp + 52], ecx
    mov mov ecx, dword ptr [eax + 8]
    mov mov dword ptr [esp + 56], edx
    mov mov edx, dword ptr [eax + 12]
    mov mov dword ptr [esp + 60], ecx
    mov mov dword ptr [esp + 64], edx
    mov mov eax, esi
    mov mov edx, dword ptr [eax]
    mov mov ecx, ebp
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [ecx + 4], edx
    mov mov edx, dword ptr [eax + 8]
    mov mov dword ptr [ecx + 8], edx
    mov mov eax, dword ptr [eax + 12]
    mov mov edx, dword ptr [esp + 52]
    mov mov dword ptr [ecx + 12], eax
    mov mov eax, dword ptr [esp + 56]
    mov mov ecx, esi
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [esp + 60]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [esp + 64]
    mov mov dword ptr [ecx + 8], edx
    mov mov dword ptr [ecx + 12], eax
    mov mov ecx, esi
    mov mov edx, dword ptr [ecx]
    mov mov eax, dword ptr [ecx + 4]
L12:
    mov mov dword ptr [esp + 68], edx
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [esp + 72], eax
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [esp + 76], edx
    mov mov dword ptr [esp + 80], eax
    sub sub ebx, 16
    mov mov ecx, ebx
    mov mov eax, dword ptr [ecx]
    mov mov edx, esi
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [edx + 4], eax
    mov mov eax, dword ptr [ecx + 8]
    mov mov dword ptr [edx + 8], eax
    mov mov ecx, dword ptr [ecx + 12]
    mov mov eax, dword ptr [esp + 68]
    mov mov dword ptr [edx + 12], ecx
    mov mov ecx, dword ptr [esp + 72]
    mov mov edx, ebx
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [esp + 76]
    mov mov dword ptr [edx + 4], ecx
    mov mov ecx, dword ptr [esp + 80]
    mov mov dword ptr [edx + 8], eax
    mov mov dword ptr [edx + 12], ecx
    jmp sub_10013E5B
    mov mov edx, edi
    mov mov eax, dword ptr [edx]
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [esp + 84], eax
    mov mov eax, dword ptr [edx + 8]
    mov mov dword ptr [esp + 88], ecx
    mov mov ecx, dword ptr [edx + 12]
    mov mov dword ptr [esp + 92], eax
    mov mov dword ptr [esp + 96], ecx
    mov mov edx, ebp
    mov mov ecx, dword ptr [edx]
    mov mov eax, edi
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [edx + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov edx, dword ptr [edx + 12]
    mov mov ecx, dword ptr [esp + 84]
    mov mov dword ptr [eax + 12], edx
    mov mov edx, dword ptr [esp + 88]
    mov mov eax, ebp
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esp + 92]
    mov mov dword ptr [eax + 4], edx
    mov mov edx, dword ptr [esp + 96]
    mov mov dword ptr [eax + 8], ecx
    mov mov dword ptr [eax + 12], edx
    add add edi, 16
    jmp sub_10013EB7
    mov mov eax, dword ptr [esp + 088h]
    pop pop edi
    mov mov dword ptr [eax], esi
    pop pop esi
    pop pop ebp
    mov mov dword ptr [eax + 4], ebx
    pop pop ebx
    add add esp, 116
    ret ret
FUN_10013a40 ENDP
END
