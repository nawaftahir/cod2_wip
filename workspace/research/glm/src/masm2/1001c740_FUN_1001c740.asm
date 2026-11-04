.686
.MODEL FLAT, C
EXTRN sub_1001C57C:PROC
EXTRN sub_1001C7FF:PROC
EXTRN sub_10060C29:PROC
EXTRN sub_10061CC2:PROC
EXTRN sub_10061CE5:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4B04:DWORD:DWORD
EXTRN EXTRN fp_101D4B1C:DWORD:DWORD
EXTRN EXTRN fp_101D4B20:DWORD:DWORD
.CODE
FUN_1001c740 PROC
    sub sub esp, 68
    push push esi
    push push edi
    push push ebx
    push push 0101942C0h
    mov mov esi, 64
    lea lea edi, [esp + 20]
    call sub_10060C29
    push push 1
    lea lea eax, [esp + 20]
    push push eax
    mov mov ecx, edi
    push push ecx
    call dword ptr [fp_101D4B04]
    mov mov esi, eax
    add add esp, 20
    test test esi, esi
    jge L1
    cmp cmp byte ptr [ebx], 36
    je L0
    push push ebx
    push push 010194978h
    call sub_10061CC2
    add add esp, 8
    pop pop edi
    xor xor eax, eax
    pop pop esi
    add add esp, 68
    ret ret
    jne sub_1001C7FF
    mov mov edx, dword ptr [esp + 8]
    push push edx
    call dword ptr [fp_101D4B1C]
    push push ebx
    push push 010194950h
    call sub_10061CE5
    add add esp, 12
    pop pop edi
    xor xor eax, eax
    pop pop esi
    add add esp, 68
    ret ret
    push push esi
    call dword ptr [fp_101D49D4]
    mov mov edi, eax
    mov mov eax, dword ptr [esp + 12]
    push push eax
    push push esi
L1:
    push push edi
    call dword ptr [fp_101D4B20]
    mov mov ecx, dword ptr [esp + 24]
    push push ecx
    call dword ptr [fp_101D4B1C]
    mov mov edx, dword ptr [esp + 100]
    push push edx
    push push edi
    call sub_1001C57C
    add add esp, 28
    neg neg al
    sbb sbb eax, eax
    and and eax, edi
    pop pop edi
    pop pop esi
    add add esp, 68
    ret ret
FUN_1001c740 ENDP
END
