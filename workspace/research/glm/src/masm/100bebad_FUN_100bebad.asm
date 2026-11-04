.686
.MODEL FLAT, C
EXTRN sub_100B9A0E:PROC
EXTRN sub_100B9A3C:PROC
EXTRN g_1019BE20:DWORD
.CODE
FUN_100bebad PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000FCh
    push ebx
    push esi
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 000000100h]
    mov esi, dword ptr [eax]
    xor ecx, ecx
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 28], ecx
    xor ebx, ebx
    mov dword ptr [ebp - 12], ecx
    inc ebx
    push ebx
    and esi, 0000FFFFFh
    push esi
    lea ecx, [ebp - 28]
    push ecx
    lea ecx, [ebp - 0000000FCh]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 92]
    push ecx
    push 010118CB8h
    push eax
    mov ecx, edi
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 20], 2
    mov dword ptr [ebp - 16], 3
    call sub_100B9A0E
    cmp eax, ebx
    jne L0
    push ebx
    push esi
    lea eax, [ebp - 28]
    push eax
    lea eax, [ebp - 0000000FCh]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 92]
    push eax
    push 010118D18h
    push dword ptr [edi + 000000100h]
    mov ecx, edi
    mov dword ptr [ebp - 12], ebx
    call sub_100B9A3C
L0:
    test eax, eax
    jne L8
    and dword ptr [ebp - 8], eax
    test esi, esi
    jbe L2
    mov eax, esi
    shl eax, 2
    mov dword ptr [ebp - 4], eax
L1:
    mov eax, dword ptr [ebp - 8]
    shl eax, 2
    mov ecx, dword ptr [ebp + eax - 0000000ECh]
    cmp ecx, dword ptr [ebp + eax - 0000000DCh]
    jne L3
    mov eax, dword ptr [edi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ecx + 4]
    mov edx, dword ptr [edi + 16]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 1
    je L3
    fld qword ptr [g_1019BE20]
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L3
    cmp dword ptr [ecx + 8], -1
    jne L3
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 4], 4
    cmp dword ptr [ebp - 8], esi
    jb L1
L2:
    mov edx, dword ptr [edi + 000000100h]
    mov ecx, esi
    xor eax, eax
    and ecx, 0000FFFFFh
    cmp dword ptr [ebp - 12], eax
    je L4
    or ecx, 073700000h
    jmp L5
L3:
    mov eax, ebx
    jmp L8
L4:
    or ecx, 073800000h
L5:
    cmp esi, eax
    mov dword ptr [edx], ecx
    jbe L7
L6:
    mov ecx, dword ptr [edi + 000000100h]
    mov edx, dword ptr [ebp + eax*4 - 0000000ECh]
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [ecx + eax*4], edx
    inc eax
    cmp eax, esi
    jb L6
L7:
    xor eax, eax
L8:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100bebad ENDP
END
