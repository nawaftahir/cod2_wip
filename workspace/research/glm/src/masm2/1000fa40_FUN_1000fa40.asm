.686
.MODEL FLAT, C
EXTRN sub_1000F357:PROC
EXTRN sub_1000F9DA:PROC
EXTRN sub_1000FB55:PROC
EXTRN sub_1000FB98:PROC
EXTRN sub_1000FBD0:PROC
EXTRN sub_10060C36:PROC
EXTRN sub_10061CBA:PROC
EXTRN sub_10061CEB:PROC
EXTRN sub_10061D07:PROC
EXTRN EXTRN fp_101D4AFC:DWORD:DWORD
EXTRN EXTRN fp_101D4B00:DWORD:DWORD
.CODE
FUN_1000fa40 PROC
    mov mov eax, dword ptr [ebx + 32]
    sub sub esp, 68
    push push esi
    push push edi
    push push 01019396Ch
    push push eax
    push push 010193964h
    push push 01019395Ch
    mov mov esi, 64
    lea lea edi, [esp + 28]
    call sub_10060C36
    add add esp, 16
    test test eax, eax
    jge L0
    mov mov ecx, edi
    push push ecx
    push push 010193938h
    call sub_10061CBA
    add add esp, 8
    pop pop edi
    xor xor al, al
    pop pop esi
    add add esp, 68
    ret ret
    lea lea edx, [esp + 8]
    push push edx
    lea lea eax, [esp + 16]
    push push eax
    call dword ptr [fp_101D4AFC]
    add add esp, 8
    test test eax, eax
    jge L1
    lea lea ecx, [esp + 12]
    push push ecx
    push push 010193918h
    call sub_10061CEB
    add add esp, 8
    pop pop edi
    xor xor al, al
    pop pop esi
L0:
    add add esp, 68
    ret ret
    jne sub_1000FB55
    lea lea edx, [esp + 12]
    push push edx
    push push 0101938F4h
    call sub_10061D07
    mov mov eax, dword ptr [esp + 16]
    push push eax
    call dword ptr [fp_101D4B00]
    add add esp, 12
    pop pop edi
    xor xor al, al
    pop pop esi
    add add esp, 68
    ret ret
    mov mov eax, dword ptr [esp + 8]
    test test byte ptr [eax + 5], 3
    lea lea esi, [eax + 28]
    je sub_1000FB98
    mov mov byte ptr [ebx + 11], 1
    lea lea ecx, [esp + 12]
    call sub_1000F357
    test test al, al
    mov mov ecx, dword ptr [esp + 8]
    jne sub_1000FBD0
    push push ecx
    call dword ptr [fp_101D4B00]
    add add esp, 4
    pop pop edi
    xor xor al, al
    pop pop esi
    add add esp, 68
    ret ret
    mov mov edx, esi
    mov mov eax, ebx
    call sub_1000F9DA
    mov mov edx, dword ptr [esp + 8]
    push push edx
    call dword ptr [fp_101D4B00]
    add add esp, 4
    pop pop edi
    mov mov al, 1
    pop pop esi
    add add esp, 68
    ret ret
FUN_1000fa40 ENDP
END
