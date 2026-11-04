.686
.MODEL FLAT, C
EXTRN sub_100C5D24:PROC
EXTRN g_1010F7A8:DWORD
.CODE
FUN_100c7166 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    and dword ptr [ecx + 00000015Ch], 0
    mov edx, dword ptr [ecx + 000000100h]
    mov eax, dword ptr [edx]
    push ebx
    push esi
    mov esi, eax
    and esi, 0FFF00000h
    cmp esi, 020500000h
    push edi
    jne L5
    and eax, 0000FFFFFh
    mov esi, eax
    mov eax, dword ptr [edx + 8]
    mov edi, dword ptr [eax]
    lea edx, [eax + esi*4]
    mov dword ptr [ebp - 8], esi
    mov esi, dword ptr [ecx + 20]
    mov edi, dword ptr [esi + edi*4]
    mov edi, dword ptr [edi + 4]
    mov dword ptr [ebp - 4], edx
    mov edx, dword ptr [ecx + 16]
    mov ebx, dword ptr [edx + edi*4]
    mov edi, 000000100h
    test dword ptr [ebx + 4], edi
    je L0
    mov edx, eax
    mov eax, dword ptr [ebp - 4]
    jmp L1
L0:
    mov ebx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebx]
    mov ebx, dword ptr [esi + ebx*4]
    mov ebx, dword ptr [ebx + 4]
    mov edx, dword ptr [edx + ebx*4]
    test dword ptr [edx + 4], edi
    je L10
    mov edx, dword ptr [ebp - 4]
L1:
    and dword ptr [ebp - 16], 0
    cmp dword ptr [ebp - 8], 0
    mov dword ptr [ebp - 12], edx
    mov edi, 000020000h
    jbe L4
    mov ebx, dword ptr [ebp - 16]
    mov dword ptr [ebp - 4], eax
    sub dword ptr [ebp - 4], edx
L2:
    mov eax, dword ptr [ebp - 4]
    fld qword ptr [g_1010F7A8]
    mov eax, dword ptr [eax + edx]
    mov eax, dword ptr [esi + eax*4]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L10
    mov eax, dword ptr [edx]
    mov eax, dword ptr [esi + eax*4]
    mov eax, dword ptr [eax + 60]
    and eax, 0001F0000h
    cmp eax, edi
    je L3
    test byte ptr [ecx + 110], 8
    jne L10
L3:
    inc ebx
    add edx, 4
    cmp ebx, dword ptr [ebp - 8]
    jb L2
L4:
    push 0
    push 0
    mov eax, 000040000h
    push eax
    push dword ptr [ebp - 12]
    jmp L9
L5:
    cmp esi, 020400000h
    jne L10
    mov edx, dword ptr [edx + 8]
    and eax, 0000FFFFFh
    mov dword ptr [ebp - 16], eax
    lea eax, [edx + eax*4]
    mov dword ptr [ebp - 8], 0
    mov edi, 000020000h
    jbe L8
    mov dword ptr [ebp - 4], eax
    sub dword ptr [ebp - 4], edx
    mov esi, edx
L6:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebx + esi]
    jne L10
    mov ebx, dword ptr [ecx + 20]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 60]
    and eax, 0001F0000h
    cmp eax, edi
    je L7
    test byte ptr [ecx + 110], 8
    jne L10
L7:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add esi, 4
    cmp eax, dword ptr [ebp - 16]
    jb L6
L8:
    push 0
    push 0
    mov eax, 000040000h
    push eax
    push edx
L9:
    push edi
    push eax
    call sub_100C5D24
    jmp L11
L10:
    xor eax, eax
    inc eax
L11:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100c7166 ENDP
END
