.686
.MODEL FLAT, C
EXTRN sub_1006DBFA:PROC
EXTRN sub_1008A98E:PROC
EXTRN sub_1008AFC9:PROC
.CODE
FUN_1008d525 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    xor ebx, ebx
    push edi
    mov esi, ecx
    mov dword ptr [ebp - 4], ebx
    call sub_1008A98E
    xor edx, edx
    cmp dword ptr [esi + 4], ebx
    jbe L2
L0:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + edx*4]
    mov eax, dword ptr [ecx + 4]
    test ah, 4
    je L1
    cmp dword ptr [ecx + 40], -1
    jne L1
    and eax, 0FFFFFBFFh
    mov dword ptr [ecx + 4], eax
    mov dword ptr [ebp - 4], 1
L1:
    inc edx
    cmp edx, dword ptr [esi + 4]
    jb L0
L2:
    xor edi, edi
    xor edx, edx
    cmp dword ptr [esi + 8], ebx
    jbe L7
L3:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + 4]
    mov ebx, dword ptr [esi + 16]
    mov ecx, dword ptr [ebx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 1
    je L4
    test ch, 8
    je L4
    mov dword ptr [eax + 84], 1
L4:
    cmp dword ptr [eax + 84], -1
    jne L5
    cmp dword ptr [eax + 72], -1
    jne L5
    or dword ptr [eax + 48], 0FFFFFFFFh
    jmp L6
L5:
    mov dword ptr [eax + 48], edi
    inc edi
L6:
    inc edx
    cmp edx, dword ptr [esi + 8]
    jb L3
    xor ebx, ebx
L7:
    cmp edi, dword ptr [esi + 8]
    jne L8
    xor eax, eax
    cmp dword ptr [ebp - 4], ebx
    sete al
    jmp L13
L8:
    mov ecx, esi
    call sub_1008AFC9
    xor edi, edi
    cmp dword ptr [esi + 8], ebx
    jbe L12
L9:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + edi*4]
    cmp dword ptr [ecx + 84], -1
    jne L10
    cmp dword ptr [ecx + 72], -1
    jne L10
    push 1
    call sub_1006DBFA
    jmp L11
L10:
    mov dword ptr [eax + ebx*4], ecx
    inc ebx
L11:
    inc edi
    cmp edi, dword ptr [esi + 8]
    jb L9
L12:
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [esi + 20]
    sub ecx, ebx
    shl ecx, 2
    lea edi, [edx + ebx*4]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov dword ptr [esi + 8], ebx
    xor eax, eax
L13:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_1008d525 ENDP
END
