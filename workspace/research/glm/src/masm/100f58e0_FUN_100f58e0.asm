.686
.MODEL FLAT, C
EXTRN sub_100CC795:PROC
EXTRN sub_100CC7AB:PROC
EXTRN sub_100CC7FA:PROC
EXTRN sub_100CC865:PROC
EXTRN sub_100DE407:PROC
EXTRN sub_100F589C:PROC
EXTRN sub_100F58CC:PROC
EXTRN sub_100F5928:PROC
EXTRN sub_100F5941:PROC
EXTRN sub_100F59B8:PROC
EXTRN sub_100F59E9:PROC
EXTRN sub_100F883F:PROC
EXTRN fp_1010C09C:DWORD
EXTRN fp_1010C1B8:DWORD
EXTRN fp_1010C1BC:DWORD
EXTRN g_1010C0A0:DWORD
.CODE
FUN_100f58e0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, 000002374h
    call sub_100F883F
    push ebx
    push esi
    push edi
    push dword ptr [ebp + 12]
    lea eax, [ebp - 000000100h]
    push 01017C2F8h
    push 000000080h
    push eax
    call sub_100F589C
    mov esi, dword ptr [g_1010C0A0]
    add esp, 16
    cmp dword ptr [ebp + 8], 0
    mov ebx, 000000BB8h
    je L0
    lea eax, [ebp - 000000100h]
    push eax
    push dword ptr [ebp + 8]
    lea eax, [ebp - 000002374h]
    push 01017C2E4h
    push ebx
    push eax
    call sub_100F58CC
    add esp, 20
    lea eax, [ebp - 000002374h]
    push eax
    call esi
L0:
    and dword ptr [ebp + 12], 0
    cmp dword ptr [ebp + 20], 0
    mov edi, 000000400h
    je L1
    lea eax, [ebp + 12]
    push eax
    push edi
    push dword ptr [ebp + 20]
    call sub_100CC865
    cmp dword ptr [ebp + 12], 0
    jbe L1
    push dword ptr [ebp + 20]
    call esi
    push 01017C2E0h
    call esi
L1:
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 16]
    call sub_100DE407
    push eax
    push 01017C2C4h
    lea eax, [ebp - 000000404h]
    push 000000100h
    push eax
    call sub_100F5928
    lea eax, [ebp - 000000404h]
    push eax
    push 01017C2B8h
    lea eax, [ebp - 000002374h]
    push ebx
    push eax
    call sub_100F5941
    add esp, 36
    lea eax, [ebp - 000002374h]
    push eax
    call esi
    push 01017C2B4h
    call esi
    cmp dword ptr [ebp + 24], 0
    je L4
    push 01019166Eh
    mov esi, 000000104h
    push esi
    lea eax, [ebp - 000000204h]
    push eax
    call sub_100CC795
    cmp dword ptr [ebp + 8], 0
    je L2
    push dword ptr [ebp + 8]
    lea eax, [ebp - 000000204h]
    push esi
    push eax
    call sub_100CC7AB
L2:
    push 01017C2B0h
    push edi
    lea eax, [ebp - 000000C04h]
    push eax
    call sub_100CC7FA
    cmp dword ptr [ebp + 12], 0
    jbe L3
    push dword ptr [ebp + 20]
    lea eax, [ebp - 000000C04h]
    push 01017C294h
    push edi
    push eax
    call sub_100F59B8
    add esp, 16
L3:
    lea eax, [ebp - 000000C04h]
    push eax
    lea eax, [ebp - 000000404h]
    push eax
    lea eax, [ebp - 000000100h]
    push eax
    lea eax, [ebp - 000000204h]
    push eax
    push 01017C200h
    lea eax, [ebp - 000002374h]
    push ebx
    push eax
    call sub_100F59E9
    add esp, 28
    push 20
    push 01017C1C0h
    lea eax, [ebp - 000002374h]
    push eax
    call dword ptr [fp_1010C1B8]
    push eax
    call dword ptr [fp_1010C1BC]
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
FUN_100f58e0 ENDP
END
