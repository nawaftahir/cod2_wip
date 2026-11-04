.686
.MODEL FLAT, C
EXTRN sub_100CC795:PROC
EXTRN sub_100CC7AB:PROC
EXTRN sub_100CC7FA:PROC
EXTRN sub_100CC865:PROC
EXTRN sub_100DE407:PROC
EXTRN sub_100F589C:PROC
EXTRN sub_100F58CC:PROC
EXTRN sub_100F5B04:PROC
EXTRN sub_100F5B5C:PROC
EXTRN sub_100F5B6E:PROC
EXTRN sub_100F5C1C:PROC
EXTRN sub_100F883F:PROC
EXTRN EXTRN fp_1010C09C:DWORD:DWORD
EXTRN EXTRN fp_1010C1B8:DWORD:DWORD
EXTRN EXTRN fp_1010C1BC:DWORD:DWORD
EXTRN EXTRN g_1010C0A0:DWORD:DWORD
.CODE
FUN_100f58e0 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, 02374h
    call sub_100F883F
    push push ebx
    push push esi
    push push edi
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 0100h]
    push push 01017C2F8h
    push push 080h
    push push eax
    call sub_100F589C
    mov mov esi, dword ptr [g_1010C0A0]
    add add esp, 16
    cmp cmp dword ptr [ebp + 8], 0
    mov mov ebx, 0BB8h
    je L2
    lea lea eax, [ebp - 0100h]
    push push eax
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 02374h]
    push push 01017C2E4h
    push push ebx
    push push eax
    call sub_100F58CC
    add add esp, 20
    lea lea eax, [ebp - 02374h]
    push push eax
    call call esi
    and and dword ptr [ebp + 12], 0
    cmp cmp dword ptr [ebp + 20], 0
    mov mov edi, 0400h
    je L5
    lea lea eax, [ebp + 12]
    push push eax
    push push edi
    push push dword ptr [ebp + 20]
    call sub_100CC865
    cmp cmp dword ptr [ebp + 12], 0
    jbe L6
    push push dword ptr [ebp + 20]
    call call esi
    push push 01017C2E0h
    call call esi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 16]
    call sub_100DE407
    push push eax
    push push 01017C2C4h
L2:
    lea lea eax, [ebp - 0404h]
    push push 0100h
    push push eax
    call L0
    lea lea eax, [ebp - 0404h]
    push push eax
    push push 01017C2B8h
    lea lea eax, [ebp - 02374h]
    push push ebx
    push push eax
    call L1
    add add esp, 36
    lea lea eax, [ebp - 02374h]
    push push eax
    call call esi
    push push 01017C2B4h
    call call esi
    cmp cmp dword ptr [ebp + 24], 0
    je sub_100F5B6E
    push push 01019166Eh
    mov mov esi, 0104h
    push push esi
    lea lea eax, [ebp - 0204h]
    push push eax
    call sub_100CC795
    cmp cmp dword ptr [ebp + 8], 0
    je sub_100F5B04
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 0204h]
    push push esi
    push push eax
    call sub_100CC7AB
    push push 01017C2B0h
    push push edi
    lea lea eax, [ebp - 0C04h]
    push push eax
    call sub_100CC7FA
    cmp cmp dword ptr [ebp + 12], 0
    jbe sub_100F5B5C
    push push dword ptr [ebp + 20]
    lea lea eax, [ebp - 0C04h]
    push push 01017C294h
    push push edi
    push push eax
    call L3
    add add esp, 16
    lea lea eax, [ebp - 0C04h]
    push push eax
    lea lea eax, [ebp - 0404h]
    push push eax
    lea lea eax, [ebp - 0100h]
    push push eax
    lea lea eax, [ebp - 0204h]
    push push eax
    push push 01017C200h
    lea lea eax, [ebp - 02374h]
    push push ebx
    push push eax
    call L4
    add add esp, 28
    push push 20
    push push 01017C1C0h
    lea lea eax, [ebp - 02374h]
    push push eax
    call dword ptr [fp_1010C1B8]
    push push eax
    call dword ptr [fp_1010C1BC]
    cmp cmp eax, 6
    jne sub_100F5C1C
    call dword ptr [fp_1010C09C]
    mov mov eax, dword ptr [ebp + 16]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
FUN_100f58e0 ENDP
END
