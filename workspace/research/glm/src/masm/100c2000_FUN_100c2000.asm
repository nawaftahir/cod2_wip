.686
.MODEL FLAT, C
EXTRN sub_10085603:PROC
EXTRN sub_10085DAD:PROC
EXTRN sub_10085E1F:PROC
EXTRN sub_10086125:PROC
EXTRN sub_100861A5:PROC
EXTRN sub_1008621A:PROC
EXTRN sub_100862E4:PROC
EXTRN sub_100863D1:PROC
.CODE
FUN_100c2000 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    mov ebx, dword ptr [ebp + 16]
    cmp dword ptr [ebx + 48], -1
    push esi
    push edi
    mov esi, ecx
    jne L17
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [esi + 16]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edi + 4]
    test ah, 8
    je L0
    mov ecx, dword ptr [edi]
    jmp L1
L0:
    mov ecx, dword ptr [ebp + 8]
L1:
    or eax, dword ptr [ebp + 12]
    push 4
    push -1
    or eax, 64
    push eax
    push ecx
    mov ecx, esi
    call sub_10086125
    cmp eax, -1
    mov dword ptr [ebp - 12], eax
    je L20
    test byte ptr [edi + 5], 1
    je L2
    fld qword ptr [ebx + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push dword ptr [ebx + 100]
    mov ecx, esi
    push eax
    call sub_100861A5
    cmp eax, -1
    mov dword ptr [ebx + 48], eax
    je L20
    mov ecx, dword ptr [ebp + 20]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx + 48]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    push ebx
    call sub_10085DAD
    jmp L18
L2:
    mov eax, dword ptr [esi + 8]
    and dword ptr [ebp - 8], 0
    and dword ptr [ebp + 8], 0
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jbe L7
L3:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp + 8]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 4]
    cmp eax, dword ptr [ebx + 4]
    jne L4
    mov eax, dword ptr [edi + 96]
    cmp eax, dword ptr [ebx + 96]
    jne L4
    test eax, eax
    je L4
    cmp dword ptr [edi + 8], -1
    je L5
L4:
    cmp ebx, edi
    jne L6
L5:
    fld qword ptr [edi + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push dword ptr [edi + 100]
    mov ecx, esi
    push dword ptr [ebp - 12]
    call sub_1008621A
    cmp eax, -1
    mov dword ptr [edi + 48], eax
    je L20
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    push edi
    mov ecx, eax
    mov dword ptr [ebp - 16], eax
    call sub_10085E1F
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [eax + 100]
    shl ecx, 2
    mov dword ptr [eax + 112], ecx
    cmp dword ptr [edi + 68], -1
    je L6
    mov dword ptr [ebp - 8], 1
L6:
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebp - 4]
    jb L3
L7:
    mov eax, dword ptr [esi + 0000000E0h]
    test eax, eax
    je L17
    cmp dword ptr [ebp - 8], 0
    je L17
    test byte ptr [ebp + 13], 32
    je L8
    mov eax, dword ptr [eax + 0000000B4h]
    jmp L9
L8:
    mov eax, dword ptr [eax + 0000000B8h]
L9:
    cmp eax, -1
    mov dword ptr [ebp + 8], eax
    je L20
    xor eax, eax
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 8], eax
    jbe L17
L10:
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edi + 4]
    cmp eax, dword ptr [ebx + 4]
    jne L11
    mov eax, dword ptr [edi + 96]
    cmp eax, dword ptr [ebx + 96]
    jne L11
    test eax, eax
    je L11
    cmp dword ptr [edi + 8], -1
    je L12
L11:
    cmp ebx, edi
    jne L16
L12:
    fld qword ptr [edi + 32]
    push ecx
    push ecx
    mov ecx, dword ptr [esi + 0000000E0h]
    fstp qword ptr [esp]
    push 0
    push dword ptr [edi + 100]
    push dword ptr [ebp + 8]
    call sub_100862E4
    cmp eax, -1
    mov dword ptr [ebp - 20], eax
    je L20
    mov eax, dword ptr [edi + 68]
    cmp eax, -1
    je L16
    mov ecx, dword ptr [esi + 0000000E0h]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 72]
    cmp eax, -1
    je L16
    mov edx, dword ptr [ecx + 24]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [eax]
    and edx, 0FFF00000h
    cmp edx, 010000000h
    mov dword ptr [ebp - 12], eax
    jne L16
    and dword ptr [ebp + 12], 0
    cmp dword ptr [eax + 12], 0
    jbe L15
    mov edx, dword ptr [eax + 16]
    jmp L14
L13:
    mov edx, dword ptr [ebp - 16]
L14:
    mov ebx, dword ptr [edi + 68]
    cmp dword ptr [edx], ebx
    je L15
    inc dword ptr [ebp + 12]
    add edx, 4
    mov dword ptr [ebp - 16], edx
    mov edx, dword ptr [ebp + 12]
    cmp edx, dword ptr [eax + 12]
    jb L13
L15:
    mov edx, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + edx*4]
    push 1
    push 1
    push 010000001h
    mov dword ptr [ebp + 12], eax
    call sub_100863D1
    cmp eax, -1
    je L20
    mov ecx, dword ptr [esi + 0000000E0h]
    mov ecx, dword ptr [ecx + 24]
    mov ebx, dword ptr [ecx + eax*4]
    push dword ptr [ebp - 12]
    mov ecx, ebx
    call sub_10085603
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [ebp - 20]
    mov edx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
    mov ecx, dword ptr [ebx + 8]
    mov ebx, dword ptr [ebp + 16]
    mov dword ptr [ecx], edx
    mov ecx, dword ptr [edi + 48]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ecx + 68], eax
L16:
    mov eax, dword ptr [ebp - 8]
    inc eax
    cmp eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 8], eax
    jb L10
L17:
    mov eax, dword ptr [ebx + 48]
    mov ecx, dword ptr [ebp + 20]
    mov dword ptr [ecx], eax
L18:
    xor eax, eax
L19:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
L20:
    mov eax, 08007000Eh
    jmp L19
FUN_100c2000 ENDP
END
