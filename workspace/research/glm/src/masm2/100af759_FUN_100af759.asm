.686
.MODEL FLAT, C
EXTRN sub_1008620E:PROC
EXTRN sub_1008B12C:PROC
EXTRN sub_100AF8DE:PROC
EXTRN sub_100AF909:PROC
EXTRN sub_100AF916:PROC
EXTRN sub_100AF925:PROC
EXTRN sub_100AF9C9:PROC
EXTRN sub_100C9BA3:PROC
EXTRN sub_100C9BC7:PROC
.CODE
FUN_100af759 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 68
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ebx + 0100h]
    push push esi
    push push edi
    mov mov edi, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + 12]
    mov mov dword ptr [ebp - 4], eax
    xor xor esi, esi
    mov mov dword ptr [ebp - 20], edi
    xor xor eax, eax
    mov mov edx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [edx + 12]
    mov mov dword ptr [ebp + eax - 68], edx
    mov mov edx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [edx + 28]
    mov mov dword ptr [ebp + eax - 52], edx
    add add eax, 4
    cmp cmp eax, 16
    jb L0
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edi]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    cmp cmp ecx, dword ptr [ebx + 084h]
    jne L2
    cmp cmp dword ptr [eax + 108], 1
    je L1
    mov mov eax, dword ptr [ebx + 0100h]
    push push 010117718h
    push push 012CDh
L0:
    push push dword ptr [eax + 60]
    push push ebx
    call sub_1008B12C
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100AF925
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, esi
    jbe L3
    dec dec eax
    mov mov edx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [edi]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov dword ptr [ecx + 12], esi
    mov mov edx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [edi]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [ebx + 088h]
    mov mov dword ptr [ecx + 4], edx
    jne L3
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, esi
    jbe sub_100AF909
    lea lea eax, [ebp - 36]
    sub sub eax, edi
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 12], ecx
    jmp sub_100AF8DE
    mov mov edi, dword ptr [ebp - 8]
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push esi
    push push esi
    push push esi
    mov mov ecx, ebx
    call sub_1008620E
    mov mov ecx, dword ptr [ebp - 16]
    add add dword ptr [ebp - 8], 4
    mov mov dword ptr [ecx + edi], eax
    mov mov ecx, dword ptr [ebx + 20]
L1:
    mov mov edx, dword ptr [edi]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov esi, dword ptr [ecx + edx*4]
    push push 32
    pop pop ecx
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    and and dword ptr [eax + 60], 0
    xor xor esi, esi
    dec dec dword ptr [ebp - 12]
    jne sub_100AF916
    mov mov edi, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 8]
    push push esi
    push push esi
    push push esi
    push push esi
    push push 2
    push push esi
    lea lea ecx, [eax + 16]
    push push ecx
    push push eax
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 36]
    push push eax
    push push 8
    mov mov ecx, ebx
    call sub_100C9BA3
    cmp cmp eax, esi
    jl sub_100AF9C9
    push push esi
    push push esi
    push push esi
    push push esi
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 36]
    push push eax
    lea lea eax, [ebp - 52]
    push push eax
    lea lea eax, [ebp - 68]
    push push eax
    push push dword ptr [ebp - 4]
    mov mov ecx, ebx
    push push edi
    push push 4
    call sub_100C9BC7
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100af759 ENDP
END
