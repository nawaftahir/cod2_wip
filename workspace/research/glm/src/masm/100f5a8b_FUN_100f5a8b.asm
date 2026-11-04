.686
.MODEL FLAT, C
EXTRN sub_100CC790:PROC
EXTRN sub_100CC7A6:PROC
EXTRN sub_100CC7B4:PROC
EXTRN sub_100CC826:PROC
EXTRN sub_100CC8B2:PROC
EXTRN sub_100F5870:PROC
EXTRN sub_100F589D:PROC
EXTRN sub_100F58F6:PROC
EXTRN sub_100F5913:PROC
EXTRN sub_100F5986:PROC
EXTRN sub_100F59B8:PROC
EXTRN sub_100F883F:PROC
EXTRN fp_1010C09C:DWORD
EXTRN fp_1010C1B4:DWORD
EXTRN fp_1010C1B8:DWORD
EXTRN g_1010C098:DWORD
.CODE
FUN_100f5a8b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, 00000123Ch
    call sub_100F883F
    push ebx
    push esi
    push edi
    push dword ptr [ebp + 12]
    lea eax, [ebp - 000000080h]
    push 01017C3A0h
    push 000000080h
    push eax
    call sub_100F5870
    mov esi, dword ptr [g_1010C098]
    xor ebx, ebx
    add esp, 16
    cmp dword ptr [ebp + 8], ebx
    je L0
    lea eax, [ebp - 000000080h]
    push eax
    push dword ptr [ebp + 8]
    lea eax, [ebp - 00000123Ch]
    push 01017C394h
    push 000000BB8h
    push eax
    call sub_100F589D
    add esp, 20
    lea eax, [ebp - 00000123Ch]
    push eax
    call esi
L0:
    cmp dword ptr [ebp + 20], ebx
    mov dword ptr [ebp + 12], ebx
    mov edi, 000000400h
    je L1
    lea eax, [ebp + 12]
    push eax
    push edi
    push dword ptr [ebp + 20]
    call sub_100CC826
    cmp dword ptr [ebp + 12], ebx
    jbe L1
    push dword ptr [ebp + 20]
    call esi
    push 01019B8F0h
    call esi
L1:
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 16]
    call sub_100CC8B2
    push eax
    push 01017C384h
    lea eax, [ebp - 000000284h]
    push 000000100h
    push eax
    call sub_100F58F6
    lea eax, [ebp - 000000284h]
    push eax
    push 01017C37Ch
    lea eax, [ebp - 00000123Ch]
    push 000000BB8h
    push eax
    call sub_100F5913
    add esp, 36
    lea eax, [ebp - 00000123Ch]
    push eax
    call esi
    push 010193290h
    call esi
    cmp dword ptr [ebp + 24], ebx
    je L4
    mov esi, 01019166Eh
    push esi
    mov ebx, 000000104h
    push ebx
    lea eax, [ebp - 000000184h]
    push eax
    call sub_100CC790
    cmp dword ptr [ebp + 8], 0
    je L2
    push dword ptr [ebp + 8]
    lea eax, [ebp - 000000184h]
    push ebx
    push eax
    call sub_100CC7A6
L2:
    push esi
    push edi
    lea eax, [ebp - 000000684h]
    push eax
    call sub_100CC7B4
    cmp dword ptr [ebp + 12], 0
    jbe L3
    push dword ptr [ebp + 20]
    lea eax, [ebp - 000000684h]
    push 01017C36Ch
    push edi
    push eax
    call sub_100F5986
    add esp, 16
L3:
    lea eax, [ebp - 000000684h]
    push eax
    lea eax, [ebp - 000000284h]
    push eax
    lea eax, [ebp - 000000080h]
    push eax
    lea eax, [ebp - 000000184h]
    push eax
    push 01017C320h
    lea eax, [ebp - 00000123Ch]
    push 000000BB8h
    push eax
    call sub_100F59B8
    add esp, 28
    push 20
    push 01017C300h
    lea eax, [ebp - 00000123Ch]
    push eax
    call dword ptr [fp_1010C1B8]
    push eax
    call dword ptr [fp_1010C1B4]
    cmp eax, 6
    jne L4
    call dword ptr [fp_1010C09C]
L4:
    mov eax, dword ptr [ebp + 16]
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_100f5a8b ENDP
END
