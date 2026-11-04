.686
.MODEL FLAT, C
EXTRN sub_100FC2C8:PROC
EXTRN fp_1010C13C:DWORD
.CODE
___mbtowc_mt PROC
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 16]
    xor ebx, ebx
    cmp edi, ebx
    je L0
    cmp dword ptr [ebp + 20], ebx
    je L0
    mov al, byte ptr [edi]
    cmp al, bl
    jne L2
    mov eax, dword ptr [ebp + 12]
    cmp eax, ebx
    je L0
    mov word ptr [eax], bx
L0:
    xor eax, eax
L1:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
L2:
    mov esi, dword ptr [ebp + 8]
    cmp dword ptr [esi + 20], ebx
    jne L4
    mov ecx, dword ptr [ebp + 12]
    cmp ecx, ebx
    je L3
    movzx ax, al
    mov word ptr [ecx], ax
L3:
    xor eax, eax
    inc eax
    jmp L1
L4:
    mov ecx, dword ptr [esi + 72]
    movzx eax, al
    test byte ptr [ecx + eax*2 + 1], 000000080h
    je L7
    mov eax, dword ptr [esi + 40]
    cmp eax, 1
    jle L5
    cmp dword ptr [ebp + 20], eax
    jl L5
    xor ecx, ecx
    cmp dword ptr [ebp + 12], ebx
    setne cl
    push ecx
    push dword ptr [ebp + 12]
    push eax
    push edi
    push 9
    push dword ptr [esi + 4]
    call dword ptr [fp_1010C13C]
    test eax, eax
    jne L6
L5:
    mov eax, dword ptr [ebp + 20]
    cmp eax, dword ptr [esi + 40]
    jb L8
    cmp byte ptr [edi + 1], bl
    je L8
L6:
    mov eax, dword ptr [esi + 40]
    jmp L1
L7:
    xor eax, eax
    cmp dword ptr [ebp + 12], ebx
    setne al
    push eax
    push dword ptr [ebp + 12]
    push 1
    push edi
    push 9
    push dword ptr [esi + 4]
    call dword ptr [fp_1010C13C]
    test eax, eax
    jne L3
L8:
    call sub_100FC2C8
    mov dword ptr [eax], 42
    or eax, 0FFFFFFFFh
    jmp L1
___mbtowc_mt ENDP
END
