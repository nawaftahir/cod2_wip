.686
.MODEL FLAT, C
EXTRN sub_1006C63B:PROC
EXTRN sub_1006C65A:PROC
EXTRN sub_1008547C:PROC
EXTRN sub_10085509:PROC
EXTRN sub_1008590C:PROC
EXTRN sub_100859A0:PROC
EXTRN sub_100B9A0F:PROC
EXTRN sub_100B9A3A:PROC
.CODE
FUN_100a9583 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000108h
    push ebx
    push esi
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 000000100h]
    xor ebx, ebx
    push ebx
    mov dword ptr [ebp - 16], ebx
    mov dword ptr [ebp - 40], ebx
    mov dword ptr [ebp - 36], 1
    mov dword ptr [ebp - 32], 2
    mov dword ptr [ebp - 28], 3
    mov esi, dword ptr [eax]
    and esi, 0000FFFFFh
    push esi
    lea ecx, [ebp - 40]
    push ecx
    lea ecx, [ebp - 000000108h]
    push ecx
    lea ecx, [ebp - 16]
    push ecx
    lea ecx, [ebp - 104]
    push ecx
    push 010115DB0h
    push eax
    mov ecx, edi
    mov dword ptr [ebp - 8], ebx
    call sub_100B9A0F
    test eax, eax
    je L0
    push ebx
    push esi
    lea eax, [ebp - 40]
    push eax
    lea eax, [ebp - 000000108h]
    push eax
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 104]
    push eax
    push 010115E10h
    push dword ptr [edi + 000000100h]
    mov ecx, edi
    call sub_100B9A3A
    test eax, eax
    mov dword ptr [ebp - 8], 1
    jne L16
L0:
    and dword ptr [ebp - 24], 0
    cmp dword ptr [ebp - 8], 0
    je L2
    mov eax, dword ptr [edi + 20]
    mov edx, dword ptr [ebp - 000000108h]
    mov edx, dword ptr [eax + edx*4]
    mov ebx, dword ptr [ebp - 0000000F8h]
    mov ecx, dword ptr [edi + 16]
    mov eax, dword ptr [eax + ebx*4]
    mov edx, dword ptr [edx + 4]
    mov edx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 2
    je L1
    mov dword ptr [ebp - 24], 1
L1:
    mov eax, 000000300h
    test dword ptr [edx + 4], eax
    je L2
    test eax, ecx
    je L2
    mov dword ptr [ebp - 4], 1
    jmp L18
L2:
    push 116
    call sub_1008590C
    test eax, eax
    je L3
    mov ecx, eax
    call sub_1008547C
    mov ebx, eax
    jmp L4
L3:
    xor ebx, ebx
L4:
    test ebx, ebx
    jne L5
    mov dword ptr [ebp - 4], 08007000Eh
    jmp L18
L5:
    mov eax, esi
    and eax, 0000FFFFFh
    cmp dword ptr [ebp - 8], 0
    je L6
    or eax, 070400000h
    jmp L7
L6:
    or eax, 070300000h
L7:
    push 0
    push esi
    lea ecx, [esi + esi*2]
    push ecx
    push eax
    mov ecx, ebx
    call sub_100859A0
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L17
    push dword ptr [edi + 000000100h]
    mov ecx, ebx
    call sub_10085509
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L17
    and dword ptr [ebp - 8], 0
    test esi, esi
    jbe L11
    mov eax, esi
    shl eax, 3
    mov dword ptr [ebp - 20], eax
    mov eax, esi
    shl eax, 2
    mov dword ptr [ebp - 12], eax
L8:
    mov ecx, dword ptr [edi + 000000100h]
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx + 16]
    mov edx, dword ptr [ebx + 16]
    shl eax, 2
    cmp dword ptr [ebp - 24], 0
    mov ecx, dword ptr [eax + ecx]
    mov dword ptr [eax + edx], ecx
    mov edx, dword ptr [ebx + 8]
    lea ecx, [ebp + eax - 0000000F8h]
    mov dword ptr [ebp - 4], ecx
    je L9
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax + edx], ecx
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx - 16]
    jmp L10
L9:
    mov ecx, dword ptr [ecx - 16]
    mov dword ptr [eax + edx], ecx
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx]
L10:
    mov edx, dword ptr [ebp - 12]
    mov eax, dword ptr [ebx + 8]
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 12], 4
    mov dword ptr [edx + eax], ecx
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 20]
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ecx + 16]
    add dword ptr [ebp - 20], 4
    cmp dword ptr [ebp - 8], esi
    mov dword ptr [edx + eax], ecx
    jb L8
L11:
    mov eax, dword ptr [edi]
    push 0
    push ebx
    mov ecx, edi
    call dword ptr [eax + 0x20]
    test eax, eax
    je L12
    mov dword ptr [ebp - 4], 1
    jmp L17
L12:
    xor eax, eax
    cmp dword ptr [ebp - 16], eax
    jbe L14
L13:
    mov ecx, dword ptr [ebp + eax*4 - 104]
    and dword ptr [ecx], 0
    inc eax
    cmp eax, dword ptr [ebp - 16]
    jb L13
L14:
    mov ecx, dword ptr [edi + 000000100h]
    test ecx, ecx
    je L15
    push 1
    call sub_1006C63B
L15:
    mov eax, dword ptr [edi + 0000000FCh]
    mov ecx, dword ptr [edi + 24]
    mov dword ptr [ecx + eax*4], ebx
    xor ebx, ebx
L16:
    and dword ptr [ebp - 4], 0
L17:
    test ebx, ebx
    je L18
    push 1
    mov ecx, ebx
    call sub_1006C65A
L18:
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100a9583 ENDP
END
