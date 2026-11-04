.686
.MODEL FLAT, C
EXTRN sub_1000F357:PROC
EXTRN sub_1000F9DA:PROC
EXTRN sub_10060C36:PROC
EXTRN sub_10061CBA:PROC
EXTRN sub_10061CEB:PROC
EXTRN sub_10061D07:PROC
EXTRN fp_101D4AFC:DWORD
EXTRN fp_101D4B00:DWORD
.CODE
FUN_1000fa40 PROC
    mov eax, dword ptr [ebx + 32]
    sub esp, 68
    push esi
    push edi
    push 01019396Ch
    push eax
    push 010193964h
    push 01019395Ch
    mov esi, 64
    lea edi, [esp + 28]
    call sub_10060C36
    add esp, 16
    test eax, eax
    jge L0
    mov ecx, edi
    push ecx
    push 010193938h
    call sub_10061CBA
    add esp, 8
    pop edi
    xor al, al
    pop esi
    add esp, 68
    ret
L0:
    lea edx, [esp + 8]
    push edx
    lea eax, [esp + 16]
    push eax
    call dword ptr [fp_101D4AFC]
    add esp, 8
    test eax, eax
    jge L1
    lea ecx, [esp + 12]
    push ecx
    push 010193918h
    call sub_10061CEB
    add esp, 8
    pop edi
    xor al, al
    pop esi
    add esp, 68
    ret
L1:
    jne L2
    lea edx, [esp + 12]
    push edx
    push 0101938F4h
    call sub_10061D07
    mov eax, dword ptr [esp + 16]
    push eax
    call dword ptr [fp_101D4B00]
    add esp, 12
    pop edi
    xor al, al
    pop esi
    add esp, 68
    ret
L2:
    mov eax, dword ptr [esp + 8]
    test byte ptr [eax + 5], 3
    lea esi, [eax + 28]
    je L3
    mov byte ptr [ebx + 11], 1
L3:
    lea ecx, [esp + 12]
    call sub_1000F357
    test al, al
    mov ecx, dword ptr [esp + 8]
    jne L4
    push ecx
    call dword ptr [fp_101D4B00]
    add esp, 4
    pop edi
    xor al, al
    pop esi
    add esp, 68
    ret
L4:
    mov edx, esi
    mov eax, ebx
    call sub_1000F9DA
    mov edx, dword ptr [esp + 8]
    push edx
    call dword ptr [fp_101D4B00]
    add esp, 4
    pop edi
    mov al, 1
    pop esi
    add esp, 68
    ret
FUN_1000fa40 ENDP
END
