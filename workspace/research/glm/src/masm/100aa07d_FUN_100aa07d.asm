.686
.MODEL FLAT, C
EXTRN sub_100861EE:PROC
EXTRN sub_1008B1DA:PROC
.CODE
FUN_100aa07d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    mov ebx, ecx
    xor ecx, ecx
    xor eax, eax
    cmp dword ptr [ebp + 12], ecx
    push esi
    push edi
    mov dword ptr [ebp - 12], eax
    jbe L8
L0:
    mov edx, dword ptr [ebp + 8]
    mov edi, dword ptr [edx + eax*4]
    cmp edi, ecx
    je L7
    cmp dword ptr [edi + 4], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L7
L1:
    mov esi, dword ptr [ebp - 8]
    mov edx, dword ptr [edi + 8]
    mov edx, dword ptr [edx + esi*4]
    mov eax, dword ptr [ebx + 20]
    mov esi, dword ptr [eax + edx*4]
    mov edx, dword ptr [esi + 4]
    cmp edx, dword ptr [ebx + 000000080h]
    jne L6
    cmp dword ptr [esi + 60], ecx
    je L6
    mov edx, dword ptr [esi + 108]
    and edx, 0000000FFh
    cmp edx, dword ptr [ebp + 16]
    jne L6
    movzx edx, byte ptr [esi + 109]
    cmp dword ptr [ebp + 20], edx
    jne L6
    cmp dword ptr [ebp + 24], ecx
    mov dword ptr [ebp - 4], ecx
    jbe L5
L2:
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp + 28]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi + 16]
    cmp ecx, dword ptr [edx + 16]
    je L3
    inc dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [ebp + 24]
    jb L2
    jmp L4
L3:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ecx
    push 0
    push dword ptr [ebx + 000000088h]
    mov ecx, ebx
    call sub_100861EE
    cmp eax, -1
    je L10
    mov ecx, dword ptr [ebx + 20]
    mov edx, dword ptr [esi + 60]
    mov ecx, dword ptr [ecx + eax*4]
    mov esi, dword ptr [ebp - 4]
    mov dword ptr [ecx + 60], edx
    mov edx, dword ptr [ebp + 28]
    mov edx, dword ptr [edx + esi*4]
    mov dword ptr [ecx + 56], edx
    mov ecx, dword ptr [edi + 8]
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [ecx + edx*4], eax
L4:
    xor ecx, ecx
L5:
    mov eax, dword ptr [ebp + 24]
    cmp dword ptr [ebp - 4], eax
    je L11
L6:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 4]
    jb L1
L7:
    mov eax, dword ptr [ebp - 12]
    inc eax
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp - 12], eax
    jb L0
L8:
    xor eax, eax
L9:
    pop edi
    pop esi
    pop ebx
    leave
    ret 24
L10:
    mov eax, 08007000Eh
    jmp L9
L11:
    push 010116D20h
    push 0000012C2h
    push ecx
    push ebx
    call sub_1008B1DA
    add esp, 16
    mov eax, 080004005h
    jmp L9
FUN_100aa07d ENDP
END
