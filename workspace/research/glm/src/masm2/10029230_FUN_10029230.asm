.686
.MODEL FLAT, C
EXTRN sub_10028D8C:PROC
EXTRN sub_10029359:PROC
EXTRN sub_10029360:PROC
EXTRN sub_100293A3:PROC
EXTRN sub_1005EC33:PROC
EXTRN sub_10060CE5:PROC
EXTRN sub_10061D15:PROC
EXTRN sub_100F5E30:PROC
EXTRN sub_100F6604:PROC
EXTRN EXTRN fp_101D4AE4:DWORD:DWORD
EXTRN EXTRN fp_101D4AFC:DWORD:DWORD
EXTRN EXTRN fp_101D4B00:DWORD:DWORD
.CODE
FUN_10029230 PROC
    sub sub esp, 76
    push push esi
    push push edi
    push push 96
    mov mov esi, eax
    push push 0
    push push esi
    mov mov edi, ecx
    call sub_1005EC33
    mov mov al, byte ptr [edi]
    add add esp, 12
    test test al, al
    mov mov edx, edi
    mov mov ecx, edi
    je L1
    cmp cmp al, 47
    je L0
    cmp cmp al, 92
    jne L1
    lea lea edx, [ecx + 1]
    mov mov al, byte ptr [ecx + 1]
    inc inc ecx
    test test al, al
    jne L1
    push push 63
    push push edx
    lea lea eax, [esp + 24]
    push push eax
    call sub_100F5E30
    add add esp, 12
    lea lea ecx, [esp + 16]
    push push 46
    push push ecx
    mov mov byte ptr [esp + 87], 0
    call sub_100F6604
    add add esp, 8
    test test eax, eax
    je L2
    mov mov byte ptr [eax], 0
    mov mov al, byte ptr [esp + 16]
    test test al, al
    je sub_10029360
    lea lea edx, [esp + 16]
    push push edx
    push push 0101970CCh
    call sub_10060CE5
    mov mov edi, eax
    lea lea eax, [esp + 20]
    push push eax
    push push edi
    call dword ptr [fp_101D4AFC]
    add add esp, 16
    test test eax, eax
    push push edi
    jge sub_10029359
    push push 010197350h
    call sub_10061D15
    add add esp, 8
    pop pop edi
    pop pop esi
    add add esp, 76
    ret ret
    mov mov ecx, dword ptr [esp + 16]
    push push ecx
    push push 21
    push push 0101A5A38h
    call dword ptr [fp_101D4AE4]
    add add esp, 16
    test test eax, eax
    je sub_100293A3
    call sub_10028D8C
    mov mov edx, dword ptr [esp + 12]
    push push edx
    call dword ptr [fp_101D4B00]
    add add esp, 4
    pop pop edi
    pop pop esi
    add add esp, 76
    ret ret
FUN_10029230 ENDP
END
