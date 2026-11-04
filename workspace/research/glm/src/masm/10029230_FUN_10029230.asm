.686
.MODEL FLAT, C
EXTRN sub_10028D8C:PROC
EXTRN sub_1005EC33:PROC
EXTRN sub_10060CE5:PROC
EXTRN sub_10061D15:PROC
EXTRN sub_100F5E30:PROC
EXTRN sub_100F6604:PROC
EXTRN fp_101D4AE4:DWORD
EXTRN fp_101D4AFC:DWORD
EXTRN fp_101D4B00:DWORD
.CODE
FUN_10029230 PROC
    sub esp, 76
    push esi
    push edi
    push 96
    mov esi, eax
    push 0
    push esi
    mov edi, ecx
    call sub_1005EC33
    mov al, byte ptr [edi]
    add esp, 12
    test al, al
    mov edx, edi
    mov ecx, edi
    je L3
L0:
    cmp al, 47
    je L1
    cmp al, 92
    jne L2
L1:
    lea edx, [ecx + 1]
L2:
    mov al, byte ptr [ecx + 1]
    inc ecx
    test al, al
    jne L0
L3:
    push 63
    push edx
    lea eax, [esp + 24]
    push eax
    call sub_100F5E30
    add esp, 12
    lea ecx, [esp + 16]
    push 46
    push ecx
    mov byte ptr [esp + 87], 0
    call sub_100F6604
    add esp, 8
    test eax, eax
    je L4
    mov byte ptr [eax], 0
L4:
    mov al, byte ptr [esp + 16]
    test al, al
    je L7
    lea edx, [esp + 16]
    push edx
    push 0101970CCh
    call sub_10060CE5
    mov edi, eax
    lea eax, [esp + 20]
    push eax
    push edi
    call dword ptr [fp_101D4AFC]
    add esp, 16
    test eax, eax
    push edi
    jge L5
    push 010197350h
    call sub_10061D15
    add esp, 8
    pop edi
    pop esi
    add esp, 76
    ret
L5:
    mov ecx, dword ptr [esp + 16]
    push ecx
    push 21
    push 0101A5A38h
    call dword ptr [fp_101D4AE4]
    add esp, 16
    test eax, eax
    je L6
    call sub_10028D8C
L6:
    mov edx, dword ptr [esp + 12]
    push edx
    call dword ptr [fp_101D4B00]
    add esp, 4
L7:
    pop edi
    pop esi
    add esp, 76
    ret
FUN_10029230 ENDP
END
