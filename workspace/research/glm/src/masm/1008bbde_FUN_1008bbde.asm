.686
.MODEL FLAT, C
EXTRN sub_10085580:PROC
EXTRN sub_10086189:PROC
EXTRN sub_1008631B:PROC
EXTRN sub_10086A0E:PROC
EXTRN sub_1008A990:PROC
EXTRN sub_1008AFB6:PROC
EXTRN sub_100F7908:PROC
EXTRN sub_100F7969:PROC
.CODE
FUN_1008bbde PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    push ebx
    push esi
    xor ebx, ebx
    push edi
    mov esi, ecx
    mov dword ptr [ebp - 12], ebx
    call sub_1008A990
    cmp dword ptr [esi + 8], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L6
L0:
    mov eax, dword ptr [esi + 20]
    mov edi, dword ptr [eax + ebx*4]
    mov eax, dword ptr [edi + 4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 32
    je L1
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_10086189
    cmp eax, -1
    mov dword ptr [edi + 48], eax
    je L22
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [edi + 20]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [edi + 48]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [edi + 24]
    mov dword ptr [eax + 24], ecx
    jmp L2
L1:
    mov dword ptr [edi + 48], ebx
L2:
    inc ebx
    cmp ebx, dword ptr [esi + 8]
    jb L0
    cmp dword ptr [ebp - 4], 0
    je L6
    mov ecx, esi
    call sub_1008AFB6
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    push eax
    call sub_100F7908
    xor edi, edi
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 12], eax
    je L22
    xor eax, eax
    cmp dword ptr [esi + 8], edi
    mov dword ptr [ebp - 4], edi
    jbe L5
L3:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 4]
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 4], 32
    je L4
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 12]
    inc dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
L4:
    inc eax
    cmp eax, dword ptr [esi + 8]
    jb L3
L5:
    push esi
    push dword ptr [ebp - 4]
    push dword ptr [ebp - 12]
    push 010086538h
    call sub_10086A0E
    xor edx, edx
    cmp dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 20], edx
    ja L9
L6:
    and dword ptr [ebp - 24], 0
L7:
    push dword ptr [ebp - 12]
    call sub_100F7969
    mov eax, dword ptr [ebp - 24]
    pop ecx
    pop edi
    pop esi
    pop ebx
    leave
    ret
L8:
    mov edx, dword ptr [ebp - 20]
L9:
    mov eax, dword ptr [ebp - 12]
    lea edi, [eax + edx*4]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [edi]
    mov ecx, dword ptr [eax + ecx*4]
    inc edx
    cmp edx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 36], edi
    mov dword ptr [ebp - 8], 1
    jae L11
    mov dword ptr [ebp - 16], edx
    lea edx, [edi + 4]
    mov dword ptr [ebp - 24], edx
L10:
    mov edx, dword ptr [ebp - 24]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [eax + edx*4]
    mov ebx, dword ptr [ecx + 4]
    cmp ebx, dword ptr [edx + 4]
    jne L11
    mov ebx, dword ptr [ecx + 8]
    cmp ebx, dword ptr [edx + 8]
    jne L11
    mov ebx, dword ptr [ecx + 12]
    cmp ebx, dword ptr [edx + 12]
    jne L11
    inc dword ptr [ebp - 8]
    inc dword ptr [ebp - 16]
    mov edx, dword ptr [ebp - 16]
    add dword ptr [ebp - 24], 4
    cmp edx, dword ptr [ebp - 4]
    jb L10
L11:
    mov eax, dword ptr [ebp - 8]
    push -1
    and eax, 0000FFFFFh
    push -1
    or eax, 010000000h
    push eax
    mov ecx, esi
    call sub_1008631B
    cmp eax, -1
    je L22
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ecx + eax*4]
    and dword ptr [ebp - 32], 0
    cmp dword ptr [ebp - 8], 0
    mov dword ptr [ebp - 16], eax
    jbe L19
    mov dword ptr [ebp - 28], edi
L12:
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ebx, dword ptr [eax + 48]
    mov eax, dword ptr [eax + 72]
    cmp eax, -1
    je L18
L13:
    mov ecx, dword ptr [esi + 24]
    mov edi, dword ptr [ecx + eax*4]
    cmp dword ptr [edi + 60], 0
    je L14
    mov ecx, dword ptr [ebp - 16]
    push edi
    call sub_10085580
    test eax, eax
    mov dword ptr [ebp - 24], eax
    jl L7
L14:
    mov eax, dword ptr [edi]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    jne L17
    mov ecx, dword ptr [edi + 12]
    xor eax, eax
    test ecx, ecx
    jbe L16
    mov edx, dword ptr [edi + 16]
L15:
    cmp ebx, dword ptr [edx]
    je L16
    inc eax
    add edx, 4
    cmp eax, ecx
    jb L15
L16:
    mov ecx, dword ptr [edi + 8]
    mov ebx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ebx*4]
    mov eax, dword ptr [eax + 72]
    cmp eax, -1
    jne L13
L17:
    mov edi, dword ptr [ebp - 36]
L18:
    mov eax, dword ptr [ebp - 16]
    cmp dword ptr [eax + 60], 0
    jne L19
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [ebp - 32]
    add dword ptr [ebp - 28], 4
    cmp eax, dword ptr [ebp - 8]
    jb L12
L19:
    xor edx, edx
    cmp dword ptr [ebp - 8], edx
    jbe L21
    mov eax, edi
L20:
    mov ecx, dword ptr [eax]
    mov edi, dword ptr [esi + 20]
    mov ecx, dword ptr [edi + ecx*4]
    mov ecx, dword ptr [ecx + 48]
    mov edi, dword ptr [ebp - 16]
    mov edi, dword ptr [edi + 8]
    mov dword ptr [edi + edx*4], ecx
    mov ecx, dword ptr [ebp - 16]
    mov edi, dword ptr [eax]
    mov ecx, dword ptr [ecx + 16]
    mov dword ptr [ecx + edx*4], edi
    inc edx
    add eax, 4
    cmp edx, dword ptr [ebp - 8]
    jb L20
L21:
    mov eax, dword ptr [ebp - 8]
    add dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 4]
    jb L8
    jmp L6
L22:
    mov dword ptr [ebp - 24], 08007000Eh
    jmp L7
FUN_1008bbde ENDP
END
