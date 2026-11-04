.686
.MODEL FLAT, C
EXTRN sub_1006513F:PROC
EXTRN sub_10068C49:PROC
EXTRN sub_1006B320:PROC
EXTRN sub_1006B380:PROC
EXTRN sub_1006B3B5:PROC
EXTRN sub_1006BEB1:PROC
EXTRN sub_10082744:PROC
EXTRN sub_100836A4:PROC
EXTRN sub_1008434C:PROC
EXTRN sub_100F7899:PROC
EXTRN sub_100F796F:PROC
EXTRN sub_100F7989:PROC
EXTRN g_101AC95C:DWORD
.CODE
FUN_1009a7cb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 00000008Ch
    push ebx
    push esi
    mov ebx, ecx
    xor esi, esi
    push edi
    lea ecx, [ebp - 00000008Ch]
    mov dword ptr [ebp - 8], esi
    mov dword ptr [ebp - 4], esi
    call sub_10068C49
    cmp dword ptr [ebp + 8], esi
    je L2
    push 8
    call sub_100F7899
    cmp eax, esi
    pop ecx
    je L0
    push dword ptr [ebx + 16]
    mov ecx, eax
    push ebx
    call sub_1008434C
    mov dword ptr [ebp - 4], eax
    jmp L1
L0:
    mov dword ptr [ebp - 4], esi
L1:
    cmp dword ptr [ebp - 4], esi
    je L3
L2:
    lea eax, [ebp - 8]
    push eax
    push dword ptr [ebp - 4]
    mov eax, dword ptr [ebx]
    and eax, 0000000C3h
    push eax
    push dword ptr [ebx + 4]
    lea ecx, [ebp - 00000008Ch]
    call sub_1006BEB1
    test eax, eax
    jl L3
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x10]
    mov ecx, dword ptr [g_101AC95C]
    push 1
    push eax
    mov dword ptr [ebp + 8], eax
    call sub_10082744
    mov edi, eax
    cmp edi, esi
    mov dword ptr [ebp - 12], edi
    jne L4
L3:
    lea ecx, [ebp - 00000008Ch]
    call sub_1006B320
    jmp L8
L4:
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    mov ecx, dword ptr [ebp + 8]
    mov esi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebp - 8]
    test eax, eax
    je L5
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [ebp - 8], 0
L5:
    push 56
    call sub_1006513F
    test eax, eax
    je L6
    push dword ptr [ebp + 8]
    lea ecx, [ebx + 32]
    push dword ptr [ebp - 12]
    push ecx
    mov ecx, eax
    call sub_100836A4
    mov esi, eax
    jmp L7
L6:
    xor esi, esi
L7:
    test esi, esi
    jne L10
    lea ecx, [ebp - 00000008Ch]
    call sub_1006B380
L8:
    push dword ptr [ebp - 4]
    mov dword ptr [ebx + 64], 1
    call sub_100F796F
    mov eax, dword ptr [ebp - 8]
    cmp eax, esi
    pop ecx
    je L9
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
L9:
    xor eax, eax
    jmp L11
L10:
    push dword ptr [ebp - 4]
    call sub_100F7989
    pop ecx
    lea ecx, [ebp - 00000008Ch]
    call sub_1006B3B5
    mov eax, esi
L11:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_1009a7cb ENDP
END
