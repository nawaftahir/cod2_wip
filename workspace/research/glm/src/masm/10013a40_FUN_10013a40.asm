.686
.MODEL FLAT, C
EXTRN sub_10013F69:PROC
.CODE
FUN_10013a40 PROC
    mov ecx, dword ptr [esp + 12]
    sub esp, 116
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 00000008Ch]
    push esi
    push edi
    mov edi, dword ptr [esp + 00000008Ch]
    mov eax, ecx
    sub eax, edi
    sar eax, 4
    cdq
    sub eax, edx
    mov esi, eax
    sar esi, 1
    push ebp
    add ecx, -16
    shl esi, 4
    push ecx
    add esi, edi
    push esi
    mov eax, edi
    call sub_10013F69
    add esp, 12
    cmp edi, esi
    lea ebx, [esi + 16]
    jae L1
L0:
    lea edi, [esi - 16]
    push esi
    push edi
    call ebp
    add esp, 8
    test al, al
    jne L1
    push edi
    push esi
    call ebp
    add esp, 8
    test al, al
    jne L1
    mov eax, dword ptr [esp + 00000008Ch]
    mov esi, edi
    cmp eax, esi
    jb L0
L1:
    mov edi, dword ptr [esp + 000000090h]
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
    add ebx, 16
    cmp ebx, edi
    jb L2
L3:
    mov ebp, esi
    mov edi, ebx
    mov dword ptr [esp + 16], ebp
    lea esp, [esp]
L4:
    cmp edi, dword ptr [esp + 000000090h]
    jae L7
    lea ecx, [ecx]
L5:
    push edi
    push esi
    call dword ptr [esp + 0x9c]
    add esp, 8
    test al, al
    jne L6
    push esi
    push edi
    call dword ptr [esp + 0x9c]
    add esp, 8
    test al, al
    jne L7
    mov eax, ebx
    mov edx, eax
    mov ecx, dword ptr [edx]
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [esp + 104], ebp
    mov ebp, dword ptr [edx + 8]
    mov edx, dword ptr [edx + 12]
    mov dword ptr [esp + 112], edx
    mov dword ptr [esp + 108], ebp
    mov edx, edi
    mov ebp, dword ptr [edx]
    mov dword ptr [eax], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [eax + 4], ebp
    mov ebp, dword ptr [edx + 8]
    mov dword ptr [eax + 8], ebp
    mov edx, dword ptr [edx + 12]
    mov ebp, dword ptr [esp + 16]
    mov dword ptr [eax + 12], edx
    mov edx, dword ptr [esp + 108]
    mov eax, edi
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 104]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + 112]
    mov dword ptr [eax + 8], edx
    add ebx, 16
    mov dword ptr [eax + 12], ecx
L6:
    mov eax, dword ptr [esp + 000000090h]
    add edi, 16
    cmp edi, eax
    jb L5
L7:
    cmp ebp, dword ptr [esp + 00000008Ch]
    jbe L11
    add ebp, -16
L8:
    push esi
    push ebp
    call dword ptr [esp + 0x9c]
    add esp, 8
    test al, al
    jne L9
    push ebp
    push esi
    call dword ptr [esp + 0x9c]
    add esp, 8
    test al, al
    jne L10
    sub esi, 16
    mov edx, esi
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [esp + 20], eax
    mov eax, dword ptr [edx + 8]
    mov dword ptr [esp + 24], ecx
    mov ecx, dword ptr [edx + 12]
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 32], ecx
    mov edx, ebp
    mov ecx, dword ptr [edx]
    mov eax, esi
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [edx + 8]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [edx + 12]
    mov ecx, dword ptr [esp + 20]
    mov dword ptr [eax + 12], edx
    mov edx, dword ptr [esp + 24]
    mov eax, ebp
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [esp + 32]
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 12], edx
L9:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 00000008Ch]
    sub eax, 16
    sub ebp, 16
    cmp ecx, eax
    mov dword ptr [esp + 16], eax
    jb L8
L10:
    mov ebp, dword ptr [esp + 16]
    cmp ebp, dword ptr [esp + 00000008Ch]
L11:
    mov eax, dword ptr [esp + 000000090h]
    jne L13
    cmp edi, eax
    je L16
    cmp ebx, edi
    je L12
    mov ecx, esi
    mov eax, dword ptr [ecx]
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [esp + 120], edx
    mov edx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx + 12]
    mov dword ptr [esp + 124], edx
    mov dword ptr [esp + 000000080h], ecx
    mov edx, ebx
    mov ebp, dword ptr [edx]
    mov ecx, esi
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], ebp
    mov ebp, dword ptr [edx + 8]
    mov dword ptr [ecx + 8], ebp
    mov edx, dword ptr [edx + 12]
    mov dword ptr [ecx + 12], edx
    mov edx, dword ptr [esp + 120]
    mov ecx, ebx
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 124]
    mov dword ptr [ecx + 4], edx
    mov edx, dword ptr [esp + 000000080h]
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 12], edx
L12:
    mov ecx, esi
    mov edx, ecx
    mov ebp, dword ptr [edx]
    mov dword ptr [esp + 36], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [esp + 40], ebp
    mov ebp, dword ptr [edx + 8]
    mov edx, dword ptr [edx + 12]
    mov eax, edi
    mov dword ptr [esp + 48], edx
    mov dword ptr [esp + 44], ebp
    mov edx, eax
    mov ebp, dword ptr [edx]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [ecx + 4], ebp
    mov ebp, dword ptr [edx + 8]
    mov dword ptr [ecx + 8], ebp
    mov edx, dword ptr [edx + 12]
    mov ebp, dword ptr [esp + 16]
    mov dword ptr [ecx + 12], edx
    mov ecx, dword ptr [esp + 36]
    mov edx, dword ptr [esp + 40]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 44]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [esp + 48]
    add ebx, 16
    add esi, 16
    mov dword ptr [eax + 8], ecx
    add edi, 16
    mov dword ptr [eax + 12], edx
    jmp L4
L13:
    sub ebp, 16
    cmp edi, eax
    mov dword ptr [esp + 16], ebp
    jne L15
    sub esi, 16
    cmp ebp, esi
    je L14
    mov eax, ebp
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    mov dword ptr [esp + 52], ecx
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esp + 56], edx
    mov edx, dword ptr [eax + 12]
    mov dword ptr [esp + 60], ecx
    mov dword ptr [esp + 64], edx
    mov eax, esi
    mov edx, dword ptr [eax]
    mov ecx, ebp
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx + 8], edx
    mov eax, dword ptr [eax + 12]
    mov edx, dword ptr [esp + 52]
    mov dword ptr [ecx + 12], eax
    mov eax, dword ptr [esp + 56]
    mov ecx, esi
    mov dword ptr [ecx], edx
    mov edx, dword ptr [esp + 60]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 64]
    mov dword ptr [ecx + 8], edx
    mov dword ptr [ecx + 12], eax
L14:
    mov ecx, esi
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [esp + 68], edx
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [esp + 72], eax
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [esp + 76], edx
    mov dword ptr [esp + 80], eax
    sub ebx, 16
    mov ecx, ebx
    mov eax, dword ptr [ecx]
    mov edx, esi
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [edx + 8], eax
    mov ecx, dword ptr [ecx + 12]
    mov eax, dword ptr [esp + 68]
    mov dword ptr [edx + 12], ecx
    mov ecx, dword ptr [esp + 72]
    mov edx, ebx
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 76]
    mov dword ptr [edx + 4], ecx
    mov ecx, dword ptr [esp + 80]
    mov dword ptr [edx + 8], eax
    mov dword ptr [edx + 12], ecx
    jmp L4
L15:
    mov edx, edi
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [esp + 84], eax
    mov eax, dword ptr [edx + 8]
    mov dword ptr [esp + 88], ecx
    mov ecx, dword ptr [edx + 12]
    mov dword ptr [esp + 92], eax
    mov dword ptr [esp + 96], ecx
    mov edx, ebp
    mov ecx, dword ptr [edx]
    mov eax, edi
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [edx + 8]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [edx + 12]
    mov ecx, dword ptr [esp + 84]
    mov dword ptr [eax + 12], edx
    mov edx, dword ptr [esp + 88]
    mov eax, ebp
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 92]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [esp + 96]
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 12], edx
    add edi, 16
    jmp L4
L16:
    mov eax, dword ptr [esp + 000000088h]
    pop edi
    mov dword ptr [eax], esi
    pop esi
    pop ebp
    mov dword ptr [eax + 4], ebx
    pop ebx
    add esp, 116
    ret
FUN_10013a40 ENDP
END
