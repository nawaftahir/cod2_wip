.686
.MODEL FLAT, C
EXTRN sub_1008B2B1:PROC
EXTRN sub_100C5D1F:PROC
EXTRN g_1019BC88:DWORD
.CODE
FUN_100c72c8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    and dword ptr [ebp - 4], 0
    push esi
    xor edx, edx
    mov esi, ecx
    mov ecx, dword ptr [ebp + 8]
    inc edx
    test ecx, ecx
    push edi
    je L0
    mov dword ptr [ebp - 4], edx
    jmp L1
L0:
    mov ecx, dword ptr [esi + 000000100h]
    mov dword ptr [ebp + 8], ecx
L1:
    mov eax, dword ptr [ecx]
    mov edi, eax
    and edi, 0FFF00000h
    cmp edi, 020400000h
    je L2
    mov eax, edx
    jmp L15
L2:
    and eax, 0000FFFFFh
    mov edx, eax
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [esi + 16]
    push ebx
    lea edi, [eax + edx*4]
    mov ebx, dword ptr [edi]
    mov dword ptr [ebp - 20], edx
    mov edx, dword ptr [esi + 20]
    mov ebx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [ebx + 4]
    mov ebx, dword ptr [ecx + ebx*4]
    test byte ptr [ebx + 5], 1
    je L3
    mov dword ptr [ebp - 16], eax
    mov eax, edi
    jmp L4
L3:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [ebx + 4]
    mov ecx, dword ptr [ecx + ebx*4]
    test byte ptr [ecx + 5], 1
    je L13
    mov dword ptr [ebp - 16], edi
L4:
    mov ebx, dword ptr [esi + 000000100h]
    cmp ebx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 16]
    je L5
    mov ecx, dword ptr [ebx + 8]
L5:
    xor edi, edi
    cmp dword ptr [ebp - 20], edi
    mov dword ptr [esi + 00000015Ch], edi
    mov dword ptr [ebp - 12], edi
    jbe L9
    mov dword ptr [ebp - 8], eax
    sub dword ptr [ebp - 8], ecx
L6:
    mov eax, dword ptr [ebp - 8]
    fld qword ptr [g_1019BC88]
    mov eax, dword ptr [eax + ecx]
    mov eax, dword ptr [edx + eax*4]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L13
    cmp dword ptr [ebp - 4], edi
    jne L7
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 60]
    and eax, 0001F0000h
    cmp eax, 000080000h
    jne L13
L7:
    mov eax, dword ptr [ecx]
    mov edi, dword ptr [edx + eax*4]
    test byte ptr [edi + 61], 2
    jne L8
    xor eax, eax
    cmp dword ptr [ebp - 4], eax
    sete al
    lea eax, [eax*4 + 20]
    test dword ptr [edi], eax
    jne L8
    mov dword ptr [esi + 00000015Ch], 1
L8:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add ecx, 4
    xor edi, edi
    cmp eax, dword ptr [ebp - 20]
    jb L6
L9:
    cmp dword ptr [ebp - 4], edi
    mov ecx, esi
    push edi
    je L10
    push dword ptr [ebp + 8]
    mov eax, 000010000h
    push eax
    push dword ptr [ebx + 8]
    push edi
    push eax
    jmp L11
L10:
    push edi
    push 000090000h
    push dword ptr [ebp - 16]
    push 000080000h
    push 000010000h
L11:
    call sub_100C5D1F
    cmp dword ptr [esi + 00000015Ch], 2
    mov edi, eax
    jne L12
    mov eax, dword ptr [esi + 000000100h]
    push 01011A588h
    push 00000125Eh
    push dword ptr [eax + 60]
    push esi
    call sub_1008B2B1
    add esp, 16
L12:
    mov eax, edi
    jmp L14
L13:
    xor eax, eax
    inc eax
L14:
    pop ebx
L15:
    pop edi
    pop esi
    leave
    ret 4
FUN_100c72c8 ENDP
END
