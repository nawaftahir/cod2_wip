.686
.MODEL FLAT, C
EXTRN sub_1001D0AF:PROC
.CODE
FUN_1001cbc0 PROC
    sub esp, 88
    push ebx
    mov ebx, dword ptr [esp + 104]
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 112]
    mov ebp, dword ptr [esp + 120]
    mov ecx, ebx
    sub ecx, edi
    mov eax, 02AAAAAABh
    imul ecx
    sar edx, 1
    mov eax, edx
    shr eax, 31
    add eax, edx
    cdq
    sub eax, edx
    sar eax, 1
    lea eax, [eax + eax*2]
    push ebp
    lea esi, [edi + eax*4]
    add ebx, -12
    push ebx
    push esi
    mov eax, edi
    call sub_1001D0AF
    add esp, 12
    cmp edi, esi
    lea ebx, [esi + 12]
    jae L1
    lea esp, [esp]
L0:
    lea eax, [esi - 12]
    push esi
    push eax
    mov dword ptr [esp + 24], eax
    call ebp
    add esp, 8
    test al, al
    jne L1
    mov ecx, dword ptr [esp + 16]
    push ecx
    push esi
    call ebp
    add esp, 8
    test al, al
    jne L1
    mov esi, dword ptr [esp + 16]
    cmp edi, esi
    jb L0
L1:
    mov edi, dword ptr [esp + 116]
    cmp ebx, edi
    jae L3
L2:
    push esi
    push ebx
    call ebp
    add esp, 8
    test al, al
    jne L3
    push ebx
    push esi
    call ebp
    add esp, 8
    test al, al
    jne L3
    add ebx, 12
    cmp ebx, edi
    jb L2
L3:
    mov ebp, esi
    mov edi, ebx
    mov dword ptr [esp + 16], ebp
L4:
    cmp edi, dword ptr [esp + 116]
    jae L7
    lea esp, [esp]
L5:
    push edi
    push esi
    call dword ptr [esp + 0x80]
    add esp, 8
    test al, al
    jne L6
    push esi
    push edi
    call dword ptr [esp + 0x80]
    add esp, 8
    test al, al
    jne L7
    mov eax, ebx
    mov edx, eax
    mov ecx, dword ptr [edx]
    mov ebp, dword ptr [edx + 4]
    mov edx, dword ptr [edx + 8]
    mov dword ptr [esp + 88], edx
    mov dword ptr [esp + 84], ebp
    mov edx, edi
    mov ebp, dword ptr [edx]
    mov dword ptr [eax], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [eax + 4], ebp
    mov edx, dword ptr [edx + 8]
    mov ebp, dword ptr [esp + 16]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [esp + 88]
    mov eax, edi
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 84]
    mov dword ptr [eax + 4], ecx
    add ebx, 12
    mov dword ptr [eax + 8], edx
L6:
    mov eax, dword ptr [esp + 116]
    add edi, 12
    cmp edi, eax
    jb L5
L7:
    cmp ebp, dword ptr [esp + 112]
    jbe L11
    add ebp, -12
L8:
    push esi
    push ebp
    call dword ptr [esp + 0x80]
    add esp, 8
    test al, al
    jne L9
    push ebp
    push esi
    call dword ptr [esp + 0x80]
    add esp, 8
    test al, al
    jne L10
    sub esi, 12
    mov eax, esi
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 28], eax
    mov ecx, ebp
    mov eax, dword ptr [ecx]
    mov edx, esi
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], eax
    mov ecx, dword ptr [ecx + 8]
    mov eax, dword ptr [esp + 20]
    mov dword ptr [edx + 8], ecx
    mov ecx, dword ptr [esp + 24]
    mov edx, ebp
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 28]
    mov dword ptr [edx + 4], ecx
    mov dword ptr [edx + 8], eax
L9:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 112]
    sub eax, 12
    sub ebp, 12
    cmp ecx, eax
    mov dword ptr [esp + 16], eax
    jb L8
L10:
    mov ebp, dword ptr [esp + 16]
    cmp ebp, dword ptr [esp + 112]
L11:
    mov eax, dword ptr [esp + 116]
    jne L13
    cmp edi, eax
    je L16
    cmp ebx, edi
    je L12
    mov ecx, esi
    mov eax, dword ptr [ecx]
    mov edx, dword ptr [ecx + 4]
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [esp + 96], edx
    mov dword ptr [esp + 100], ecx
    mov edx, ebx
    mov ebp, dword ptr [edx]
    mov ecx, esi
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], ebp
    mov edx, dword ptr [edx + 8]
    mov dword ptr [ecx + 8], edx
    mov edx, dword ptr [esp + 96]
    mov ecx, ebx
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 100]
    mov dword ptr [ecx + 4], edx
    mov dword ptr [ecx + 8], eax
L12:
    mov ecx, esi
    mov edx, ecx
    mov ebp, dword ptr [edx]
    mov dword ptr [esp + 32], ebp
    mov ebp, dword ptr [edx + 4]
    mov edx, dword ptr [edx + 8]
    mov eax, edi
    mov dword ptr [esp + 40], edx
    mov dword ptr [esp + 36], ebp
    mov edx, eax
    mov ebp, dword ptr [edx]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], ebp
    mov edx, dword ptr [edx + 8]
    mov ebp, dword ptr [esp + 16]
    mov dword ptr [ecx + 8], edx
    mov ecx, dword ptr [esp + 32]
    mov edx, dword ptr [esp + 36]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 40]
    add ebx, 12
    add esi, 12
    mov dword ptr [eax + 4], edx
    add edi, 12
    mov dword ptr [eax + 8], ecx
    jmp L4
L13:
    sub ebp, 12
    cmp edi, eax
    mov dword ptr [esp + 16], ebp
    jne L15
    sub esi, 12
    cmp ebp, esi
    je L14
    mov edx, ebp
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [edx + 4]
    mov edx, dword ptr [edx + 8]
    mov dword ptr [esp + 44], eax
    mov dword ptr [esp + 48], ecx
    mov dword ptr [esp + 52], edx
    mov eax, esi
    mov edx, dword ptr [eax]
    mov ecx, ebp
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], edx
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [esp + 44]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [esp + 48]
    mov ecx, esi
    mov dword ptr [ecx], edx
    mov edx, dword ptr [esp + 52]
    mov dword ptr [ecx + 4], eax
    mov dword ptr [ecx + 8], edx
L14:
    mov eax, esi
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp + 56], ecx
    mov dword ptr [esp + 60], edx
    sub ebx, 12
    mov dword ptr [esp + 64], eax
    mov ecx, ebx
    mov eax, dword ptr [ecx]
    mov edx, esi
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], eax
    mov ecx, dword ptr [ecx + 8]
    mov eax, dword ptr [esp + 56]
    mov dword ptr [edx + 8], ecx
    mov ecx, dword ptr [esp + 60]
    mov edx, ebx
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 64]
    mov dword ptr [edx + 4], ecx
    mov dword ptr [edx + 8], eax
    jmp L4
L15:
    mov ecx, edi
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [ecx + 4]
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [esp + 68], edx
    mov dword ptr [esp + 72], eax
    mov dword ptr [esp + 76], ecx
    mov edx, ebp
    mov ecx, dword ptr [edx]
    mov eax, edi
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [eax + 4], ecx
    mov edx, dword ptr [edx + 8]
    mov ecx, dword ptr [esp + 68]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [esp + 72]
    mov eax, ebp
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 76]
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax + 8], ecx
    add edi, 12
    jmp L4
L16:
    mov eax, dword ptr [esp + 108]
    pop edi
    mov dword ptr [eax], esi
    pop esi
    pop ebp
    mov dword ptr [eax + 4], ebx
    pop ebx
    add esp, 88
    ret
FUN_1001cbc0 ENDP
END
