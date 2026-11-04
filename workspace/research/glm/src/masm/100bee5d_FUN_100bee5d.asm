.686
.MODEL FLAT, C
EXTRN sub_10085E20:PROC
EXTRN sub_100862DB:PROC
EXTRN sub_100B9A15:PROC
EXTRN sub_100B9A40:PROC
EXTRN sub_100B9A6B:PROC
EXTRN sub_100B9A96:PROC
EXTRN g_1019BE20:DWORD
EXTRN g_1019BEB8:DWORD
.CODE
FUN_100bee5d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000FCh
    push ebx
    push esi
    mov esi, ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov eax, dword ptr [ecx]
    push edi
    xor edi, edi
    xor ebx, ebx
    inc edi
    and eax, 0000FFFFFh
    cmp eax, edi
    mov dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 28], ebx
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 20], 2
    mov dword ptr [ebp - 16], 3
    je L0
    mov eax, edi
    jmp L7
L0:
    push edi
    push edi
    lea eax, [ebp - 28]
    push eax
    lea eax, [ebp - 0000000FCh]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 92]
    push eax
    push 010118B38h
    push ecx
    mov ecx, esi
    call sub_100B9A15
    cmp eax, edi
    jne L1
    push edi
    push edi
    lea eax, [ebp - 28]
    push eax
    lea eax, [ebp - 0000000FCh]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 92]
    push eax
    push 010118B98h
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_100B9A40
    cmp eax, edi
    jne L1
    push edi
    push edi
    lea eax, [ebp - 28]
    push eax
    lea eax, [ebp - 0000000FCh]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 92]
    push eax
    push 010118BF8h
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_100B9A6B
    cmp eax, edi
    jne L1
    push edi
    push edi
    lea eax, [ebp - 28]
    push eax
    lea eax, [ebp - 0000000FCh]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 92]
    push eax
    push 010118C58h
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_100B9A96
L1:
    cmp eax, ebx
    jne L7
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 8]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ebp - 4], ebx
    mov ebx, dword ptr [esi + 16]
    add ecx, 4
L2:
    mov eax, dword ptr [ecx]
    mov edi, dword ptr [edx + eax*4]
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [ebx + eax*4]
    test byte ptr [eax + 5], 1
    je L8
    fld qword ptr [g_1019BE20]
    fld qword ptr [edi + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L8
    cmp dword ptr [edi + 8], -1
    jne L8
    inc dword ptr [ebp - 4]
    xor eax, eax
    inc eax
    add ecx, 4
    cmp dword ptr [ebp - 4], eax
    jb L2
    mov ecx, dword ptr [ebp - 0000000DCh]
    mov edx, dword ptr [edx + ecx*4]
    and dword ptr [ebp - 4], 0
    cmp dword ptr [edx + 8], -1
    jne L3
    mov ecx, dword ptr [edx + 4]
    mov ecx, dword ptr [ebx + ecx*4]
    test byte ptr [ecx + 5], al
    je L3
    mov dword ptr [ebp - 4], eax
L3:
    xor ebx, ebx
L4:
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp + ebx - 0000000ECh]
    mov dword ptr [ebx + eax], ecx
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ebp + ebx - 0000000DCh]
    mov edi, dword ptr [ecx + eax*4]
    fld qword ptr [edi + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [edi + 16]
    mov ecx, esi
    push dword ptr [edi + 12]
    push dword ptr [edi + 4]
    call sub_100862DB
    cmp eax, -1
    mov dword ptr [ebp - 12], eax
    je L10
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    push edi
    mov ecx, eax
    mov dword ptr [ebp - 8], eax
    call sub_10085E20
    cmp dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp - 8]
    jne L9
    cmp dword ptr [eax + 56], -1
    jne L5
    mov ecx, dword ptr [ebp + ebx - 0000000DCh]
    mov dword ptr [eax + 56], ecx
L5:
    xor dword ptr [eax + 60], 000080000h
L6:
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [eax + ebx + 4], ecx
    add ebx, 4
    cmp ebx, 4
    jb L4
    xor eax, eax
L7:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L8:
    xor eax, eax
    inc eax
    jmp L7
L9:
    fld qword ptr [eax + 32]
    fmul qword ptr [g_1019BEB8]
    fstp qword ptr [eax + 32]
    jmp L6
L10:
    mov eax, 08007000Eh
    jmp L7
FUN_100bee5d ENDP
END
