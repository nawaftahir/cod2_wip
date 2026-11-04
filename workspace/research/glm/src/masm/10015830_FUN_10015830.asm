.686
.MODEL FLAT, C
EXTRN sub_1001529A:PROC
.CODE
FUN_10015830 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    xor esi, esi
    mov eax, 3
    xor edi, edi
L0:
    mov ecx, dword ptr [esp + 24]
    mov edx, dword ptr [ecx + edi*4]
    xor ecx, ecx
    test esi, esi
    sete cl
    push edx
    lea edx, [esi + esi*8]
    shl edx, 5
    add edx, ebx
    lea ecx, [ecx + ecx*8]
    shl ecx, 5
    add ecx, ebx
    push ecx
    push edx
    push eax
    mov eax, ebp
    call sub_1001529A
    add esp, 16
    xor esi, 1
    test eax, eax
    je L1
    inc edi
    add ebp, 12
    cmp edi, 6
    jl L0
    cmp eax, dword ptr [esp + 28]
    jle L2
L1:
    pop edi
    pop esi
    or eax, 0FFFFFFFFh
    pop ebp
    pop ecx
    ret
L2:
    mov ecx, dword ptr [esp + 36]
    xor edi, edi
    cmp eax, 4
    mov byte ptr [ecx + 6], al
    jl L4
    mov edx, dword ptr [esp + 32]
    lea edi, [eax - 4]
    lea ecx, [esi + esi*8]
    shl ecx, 5
    shr edi, 2
    add edx, 16
    inc edi
    lea ebp, [edi*4]
    lea ecx, [ecx + ebx + 24]
    mov dword ptr [esp + 12], ebp
L3:
    mov ebp, dword ptr [ecx - 24]
    mov dword ptr [edx - 16], ebp
    mov ebp, dword ptr [ecx - 20]
    mov dword ptr [edx - 12], ebp
    mov ebp, dword ptr [ecx - 16]
    mov dword ptr [edx - 8], ebp
    mov ebp, dword ptr [ecx - 12]
    mov dword ptr [edx + 20], ebp
    mov ebp, dword ptr [ecx - 8]
    mov dword ptr [edx + 24], ebp
    mov ebp, dword ptr [ecx - 4]
    mov dword ptr [edx - 4], ebp
    mov ebp, dword ptr [ecx]
    mov dword ptr [edx], ebp
    mov ebp, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], ebp
    mov ebp, dword ptr [ecx + 8]
    mov dword ptr [edx + 52], ebp
    mov ebp, dword ptr [ecx + 12]
    mov dword ptr [edx + 56], ebp
    mov ebp, dword ptr [ecx + 16]
    mov dword ptr [edx + 60], ebp
    mov ebp, dword ptr [ecx + 20]
    mov dword ptr [edx + 88], ebp
    mov ebp, dword ptr [ecx + 24]
    mov dword ptr [edx + 92], ebp
    mov ebp, dword ptr [ecx + 28]
    mov dword ptr [edx + 64], ebp
    mov ebp, dword ptr [ecx + 32]
    mov dword ptr [edx + 68], ebp
    mov ebp, dword ptr [ecx + 36]
    mov dword ptr [edx + 72], ebp
    mov ebp, dword ptr [ecx + 40]
    mov dword ptr [edx + 120], ebp
    mov ebp, dword ptr [ecx + 44]
    mov dword ptr [edx + 124], ebp
    mov ebp, dword ptr [ecx + 48]
    mov dword ptr [edx + 000000080h], ebp
    mov ebp, dword ptr [ecx + 52]
    mov dword ptr [edx + 00000009Ch], ebp
    mov ebp, dword ptr [ecx + 56]
    mov dword ptr [edx + 0000000A0h], ebp
    mov ebp, dword ptr [ecx + 60]
    mov dword ptr [edx + 000000084h], ebp
    mov ebp, dword ptr [ecx + 64]
    mov dword ptr [edx + 000000088h], ebp
    mov ebp, dword ptr [ecx + 68]
    mov dword ptr [edx + 00000008Ch], ebp
    mov ebp, dword ptr [ecx + 72]
    mov dword ptr [edx + 0000000BCh], ebp
    mov ebp, dword ptr [ecx + 76]
    mov dword ptr [edx + 0000000C0h], ebp
    mov ebp, dword ptr [ecx + 80]
    mov dword ptr [edx + 0000000C4h], ebp
    mov ebp, dword ptr [ecx + 84]
    mov dword ptr [edx + 0000000E0h], ebp
    mov ebp, dword ptr [ecx + 88]
    mov dword ptr [edx + 0000000E4h], ebp
    mov ebp, dword ptr [ecx + 92]
    mov dword ptr [edx + 0000000C8h], ebp
    mov ebp, dword ptr [ecx + 96]
    mov dword ptr [edx + 0000000CCh], ebp
    mov ebp, dword ptr [ecx + 100]
    mov dword ptr [edx + 0000000D0h], ebp
    add ecx, 000000080h
    add edx, 000000110h
    dec edi
    jne L3
    mov edi, dword ptr [esp + 12]
L4:
    cmp edi, eax
    jge L6
    mov ecx, dword ptr [esp + 32]
    mov edx, edi
    imul edx, edx, 68
    lea edx, [edx + ecx + 16]
    lea ecx, [edi + esi*8]
    add ecx, esi
    shl ecx, 5
    lea ecx, [ecx + ebx + 24]
    sub eax, edi
    mov edi, edi
L5:
    mov edi, dword ptr [ecx - 24]
    mov dword ptr [edx - 16], edi
    mov edi, dword ptr [ecx - 20]
    mov dword ptr [edx - 12], edi
    mov edi, dword ptr [ecx - 16]
    mov dword ptr [edx - 8], edi
    mov edi, dword ptr [ecx - 12]
    mov dword ptr [edx + 20], edi
    mov edi, dword ptr [ecx - 8]
    mov dword ptr [edx + 24], edi
    mov edi, dword ptr [ecx - 4]
    mov dword ptr [edx - 4], edi
    mov edi, dword ptr [ecx]
    mov dword ptr [edx], edi
    mov edi, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], edi
    add ecx, 32
    add edx, 68
    dec eax
    jne L5
L6:
    pop edi
    mov eax, esi
    pop esi
    pop ebp
    pop ecx
    ret
FUN_10015830 ENDP
END
