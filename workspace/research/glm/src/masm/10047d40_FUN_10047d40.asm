.686
.MODEL FLAT, C
EXTRN sub_10047A9D:PROC
EXTRN sub_10047AB0:PROC
EXTRN sub_10047C73:PROC
.CODE
FUN_10047d40 PROC
    sub esp, 12
    push ebp
    mov ebp, dword ptr [esp + 20]
    mov eax, dword ptr [ebp + 32]
    mov ecx, dword ptr [eax]
    push esi
    mov esi, dword ptr [ebp + 000000164h]
    push edi
    mov edi, dword ptr [ebp + 000000140h]
    mov dword ptr [esi + 16], ecx
    mov edx, dword ptr [ebp + 32]
    mov eax, dword ptr [edx + 4]
    mov dword ptr [esi + 20], eax
    mov eax, dword ptr [ebp + 0000000C4h]
    test eax, eax
    je L0
    mov eax, dword ptr [esi + 68]
    test eax, eax
    jne L0
    mov ecx, dword ptr [esi + 72]
    push ecx
    mov eax, esi
    call sub_10047C73
    add esp, 4
L0:
    mov eax, dword ptr [ebp + 000000108h]
    test eax, eax
    mov dword ptr [esp + 12], 0
    jle L8
    movsx edx, di
    lea eax, [ebp + 00000010Ch]
    mov dword ptr [esp + 20], edx
    mov dword ptr [esp + 16], eax
    push ebx
    mov edi, edi
L1:
    mov ecx, dword ptr [esp + 20]
    mov edi, dword ptr [ecx]
    mov edx, dword ptr [esp + 36]
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [edx + eax*4]
    movsx edx, word ptr [ecx]
    mov cl, byte ptr [esp + 24]
    mov ebx, dword ptr [ebp + edi*4 + 0000000F0h]
    sar edx, cl
    mov ecx, dword ptr [esi + edi*4 + 36]
    mov eax, edx
    sub eax, ecx
    mov dword ptr [esi + edi*4 + 36], edx
    mov dword ptr [esp + 32], eax
    jns L2
    mov ecx, dword ptr [esp + 32]
    neg eax
    dec ecx
    mov dword ptr [esp + 32], ecx
L2:
    xor edi, edi
    test eax, eax
    je L4
L3:
    sar eax, 1
    inc edi
    test eax, eax
    jne L3
    cmp edi, 11
    jle L4
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 20], 6
    mov eax, dword ptr [ebp]
    push ebp
    call dword ptr [eax]
    add esp, 4
L4:
    mov cl, byte ptr [esi + 12]
    test cl, cl
    mov eax, dword ptr [ebx + 20]
    je L5
    mov ecx, dword ptr [esi + eax*4 + 92]
    lea eax, [ecx + edi*4]
    inc dword ptr [eax]
    jmp L6
L5:
    mov ecx, dword ptr [esi + eax*4 + 76]
    mov edx, dword ptr [ecx + edi*4]
    movsx eax, byte ptr [ecx + edi + 000000400h]
    push edx
    call sub_10047A9D
    add esp, 4
L6:
    test edi, edi
    je L7
    mov eax, dword ptr [esp + 32]
    push eax
    mov eax, edi
    call sub_10047AB0
    add esp, 4
L7:
    mov eax, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 20]
    mov ecx, dword ptr [ebp + 000000108h]
    inc eax
    add edx, 4
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], edx
    jl L1
    pop ebx
L8:
    mov ecx, dword ptr [ebp + 32]
    mov edx, dword ptr [esi + 16]
    mov dword ptr [ecx], edx
    mov eax, dword ptr [ebp + 32]
    mov ecx, dword ptr [esi + 20]
    mov dword ptr [eax + 4], ecx
    mov ebp, dword ptr [ebp + 0000000C4h]
    test ebp, ebp
    je L10
    mov eax, dword ptr [esi + 68]
    test eax, eax
    jne L9
    mov edx, dword ptr [esi + 72]
    inc edx
    and edx, 7
    mov dword ptr [esi + 68], ebp
    mov dword ptr [esi + 72], edx
L9:
    dec dword ptr [esi + 68]
L10:
    pop edi
    pop esi
    mov al, 1
    pop ebp
    add esp, 12
    ret
FUN_10047d40 ENDP
END
