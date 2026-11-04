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
EXTRN sub_100F5CA5:PROC
EXTRN sub_100F5CF5:PROC
EXTRN sub_100F5D0B:PROC
EXTRN sub_100F5DB7:PROC
EXTRN sub_100F883F:PROC
EXTRN EXTRN fp_1010C09C:DWORD:DWORD
EXTRN EXTRN fp_1010C1B4:DWORD:DWORD
EXTRN EXTRN fp_1010C1B8:DWORD:DWORD
EXTRN EXTRN g_1010C098:DWORD:DWORD
.CODE
FUN_100f5a8b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, 0123Ch
    call sub_100F883F
    push push ebx
    push push esi
    push push edi
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 080h]
    push push 01017C3A0h
    push push 080h
    push push eax
    call sub_100F5870
    mov mov esi, dword ptr [g_1010C098]
    xor xor ebx, ebx
    add add esp, 16
    cmp cmp dword ptr [ebp + 8], ebx
    je L0
    lea lea eax, [ebp - 080h]
    push push eax
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 0123Ch]
    push push 01017C394h
    push push 0BB8h
    push push eax
    call sub_100F589D
    add add esp, 20
    lea lea eax, [ebp - 0123Ch]
    push push eax
    call call esi
    cmp cmp dword ptr [ebp + 20], ebx
    mov mov dword ptr [ebp + 12], ebx
    mov mov edi, 0400h
    je L1
    lea lea eax, [ebp + 12]
    push push eax
    push push edi
    push push dword ptr [ebp + 20]
    call sub_100CC826
    cmp cmp dword ptr [ebp + 12], ebx
    jbe L2
    push push dword ptr [ebp + 20]
    call call esi
    push push 01019B8F0h
    call call esi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 16]
    call sub_100CC8B2
    push push eax
    push push 01017C384h
    lea lea eax, [ebp - 0284h]
    push push 0100h
    push push eax
    call sub_100F58F6
    lea lea eax, [ebp - 0284h]
    push push eax
    push push 01017C37Ch
    lea lea eax, [ebp - 0123Ch]
    push push 0BB8h
    push push eax
    call sub_100F5913
    add add esp, 36
    lea lea eax, [ebp - 0123Ch]
    push push eax
    call call esi
    push push 010193290h
    call call esi
    cmp cmp dword ptr [ebp + 24], ebx
    je sub_100F5D0B
    mov mov esi, 01019166Eh
    push push esi
    mov mov ebx, 0104h
    push push ebx
    lea lea eax, [ebp - 0184h]
    push push eax
L1:
    call sub_100CC790
    cmp cmp dword ptr [ebp + 8], 0
    je sub_100F5CA5
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 0184h]
    push push ebx
    push push eax
    call sub_100CC7A6
    push push esi
    push push edi
    lea lea eax, [ebp - 0684h]
    push push eax
    call sub_100CC7B4
    cmp cmp dword ptr [ebp + 12], 0
    jbe sub_100F5CF5
    push push dword ptr [ebp + 20]
    lea lea eax, [ebp - 0684h]
    push push 01017C36Ch
    push push edi
    push push eax
    call sub_100F5986
    add add esp, 16
    lea lea eax, [ebp - 0684h]
    push push eax
    lea lea eax, [ebp - 0284h]
    push push eax
    lea lea eax, [ebp - 080h]
    push push eax
    lea lea eax, [ebp - 0184h]
    push push eax
    push push 01017C320h
    lea lea eax, [ebp - 0123Ch]
    push push 0BB8h
    push push eax
    call sub_100F59B8
    add add esp, 28
    push push 20
    push push 01017C300h
    lea lea eax, [ebp - 0123Ch]
    push push eax
    call dword ptr [fp_1010C1B8]
    push push eax
    call dword ptr [fp_1010C1B4]
    cmp cmp eax, 6
    jne sub_100F5DB7
    call dword ptr [fp_1010C09C]
    mov mov eax, dword ptr [ebp + 16]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_100f5a8b ENDP
END
