.686
.MODEL FLAT, C
EXTRN sub_10043F16:PROC
.CODE
FUN_100477e0 PROC
    sub esp, 8
    push ebx
    mov bl, byte ptr [esp + 20]
    push ebp
    push esi
    mov esi, dword ptr [esp + 24]
    mov ebp, dword ptr [esi + 000000164h]
    mov dword ptr [ebp + 32], esi
    mov byte ptr [ebp + 12], bl
    mov edx, dword ptr [esi + 000000134h]
    mov ecx, dword ptr [esi + 00000013Ch]
    push edi
    xor edi, edi
    cmp edx, edi
    sete al
    cmp ecx, edi
    mov byte ptr [esp + 16], al
    jne L1
    test al, al
    je L0
    mov dword ptr [ebp + 4], 010047D40h
    jmp L3
L0:
    mov dword ptr [ebp + 4], 010047EC0h
    jmp L3
L1:
    test al, al
    je L2
    mov dword ptr [ebp + 4], 0100480C0h
    jmp L3
L2:
    cmp dword ptr [ebp + 64], edi
    mov dword ptr [ebp + 4], 010048190h
    jne L3
    mov eax, dword ptr [esi + 4]
    push 0000003E8h
    push 1
    push esi
    call dword ptr [eax]
    add esp, 12
    mov dword ptr [ebp + 64], eax
L3:
    test bl, bl
    je L4
    mov dword ptr [ebp + 8], 010048470h
    jmp L5
L4:
    mov dword ptr [ebp + 8], 010048420h
L5:
    cmp dword ptr [esi + 0000000ECh], edi
    mov dword ptr [esp + 20], edi
    jle L15
    lea ecx, [ebp + 36]
    mov dword ptr [esp + 28], ecx
    lea ebx, [esi + 0000000F0h]
    lea esp, [esp]
L6:
    mov cl, byte ptr [esp + 16]
    test cl, cl
    mov edx, dword ptr [esp + 28]
    mov eax, dword ptr [ebx]
    mov dword ptr [edx], edi
    je L7
    cmp dword ptr [esi + 00000013Ch], edi
    jne L14
    mov edi, dword ptr [eax + 20]
    jmp L8
L7:
    mov edi, dword ptr [eax + 24]
    mov dword ptr [ebp + 52], edi
L8:
    mov al, byte ptr [esp + 32]
    test al, al
    je L12
    test edi, edi
    jl L9
    cmp edi, 4
    jl L10
L9:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 50
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], edi
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L10:
    mov eax, dword ptr [ebp + edi*4 + 92]
    test eax, eax
    jne L11
    mov eax, dword ptr [esi + 4]
    push 000000404h
    push 1
    push esi
    call dword ptr [eax]
    add esp, 12
    mov dword ptr [ebp + edi*4 + 92], eax
L11:
    mov edi, dword ptr [ebp + edi*4 + 92]
    mov ecx, 000000101h
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    jmp L13
L12:
    mov ecx, dword ptr [esp + 16]
    push ecx
    lea eax, [ebp + edi*4 + 76]
    push esi
    mov ecx, edi
    call sub_10043F16
    add esp, 8
L13:
    xor edi, edi
L14:
    mov eax, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 28]
    mov ecx, dword ptr [esi + 0000000ECh]
    inc eax
    add edx, 4
    add ebx, 4
    cmp eax, ecx
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 28], edx
    jl L6
L15:
    mov dword ptr [ebp + 56], edi
    mov dword ptr [ebp + 60], edi
    mov dword ptr [ebp + 24], edi
    mov dword ptr [ebp + 28], edi
    mov edx, dword ptr [esi + 0000000C4h]
    mov dword ptr [ebp + 72], edi
    pop edi
    pop esi
    mov dword ptr [ebp + 68], edx
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_100477e0 ENDP
END
