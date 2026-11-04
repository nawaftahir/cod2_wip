.686
.MODEL FLAT, C
EXTRN sub_1008620E:PROC
EXTRN sub_1008B12C:PROC
EXTRN sub_100C9BA3:PROC
EXTRN sub_100C9BC7:PROC
.CODE
FUN_100af759 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 68
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ebx + 000000100h]
    push esi
    push edi
    mov edi, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 12]
    mov dword ptr [ebp - 4], eax
    xor esi, esi
    mov dword ptr [ebp - 20], edi
    xor eax, eax
L0:
    mov edx, dword ptr [ecx + 8]
    mov edx, dword ptr [edx + 12]
    mov dword ptr [ebp + eax - 68], edx
    mov edx, dword ptr [ecx + 8]
    mov edx, dword ptr [edx + 28]
    mov dword ptr [ebp + eax - 52], edx
    add eax, 4
    cmp eax, 16
    jb L0
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    cmp ecx, dword ptr [ebx + 000000084h]
    jne L3
    cmp dword ptr [eax + 108], 1
    je L1
    mov eax, dword ptr [ebx + 000000100h]
    push 010117718h
    push 0000012CDh
    push dword ptr [eax + 60]
    push ebx
    call sub_1008B12C
    add esp, 16
    mov eax, 080004005h
    jmp L7
L1:
    mov eax, dword ptr [ebp - 4]
    cmp eax, esi
    jbe L3
L2:
    dec eax
    mov edx, dword ptr [ebx + 20]
    mov ecx, dword ptr [edi]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ecx + 12], esi
    mov edx, dword ptr [ebx + 20]
    mov ecx, dword ptr [edi]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ebx + 000000088h]
    mov dword ptr [ecx + 4], edx
    jne L2
L3:
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, esi
    jbe L6
    lea eax, [ebp - 36]
    sub eax, edi
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 12], ecx
    jmp L5
L4:
    mov edi, dword ptr [ebp - 8]
L5:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push esi
    push esi
    push esi
    mov ecx, ebx
    call sub_1008620E
    mov ecx, dword ptr [ebp - 16]
    add dword ptr [ebp - 8], 4
    mov dword ptr [ecx + edi], eax
    mov ecx, dword ptr [ebx + 20]
    mov edx, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    mov esi, dword ptr [ecx + edx*4]
    push 32
    pop ecx
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    and dword ptr [eax + 60], 0
    xor esi, esi
    dec dword ptr [ebp - 12]
    jne L4
    mov edi, dword ptr [ebp - 20]
L6:
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    push esi
    push esi
    push esi
    push esi
    push 2
    push esi
    lea ecx, [eax + 16]
    push ecx
    push eax
    push dword ptr [ebp - 4]
    lea eax, [ebp - 36]
    push eax
    push 8
    mov ecx, ebx
    call sub_100C9BA3
    cmp eax, esi
    jl L7
    push esi
    push esi
    push esi
    push esi
    push dword ptr [ebp - 4]
    lea eax, [ebp - 36]
    push eax
    lea eax, [ebp - 52]
    push eax
    lea eax, [ebp - 68]
    push eax
    push dword ptr [ebp - 4]
    mov ecx, ebx
    push edi
    push 4
    call sub_100C9BC7
L7:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100af759 ENDP
END
