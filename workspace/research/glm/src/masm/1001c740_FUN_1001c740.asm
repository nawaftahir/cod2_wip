.686
.MODEL FLAT, C
EXTRN sub_1001C57C:PROC
EXTRN sub_10060C29:PROC
EXTRN sub_10061CC2:PROC
EXTRN sub_10061CE5:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4B04:DWORD
EXTRN fp_101D4B1C:DWORD
EXTRN fp_101D4B20:DWORD
.CODE
FUN_1001c740 PROC
    sub esp, 68
    push esi
    push edi
    push ebx
    push 0101942C0h
    mov esi, 64
    lea edi, [esp + 20]
    call sub_10060C29
    push 1
    lea eax, [esp + 20]
    push eax
    mov ecx, edi
    push ecx
    call dword ptr [fp_101D4B04]
    mov esi, eax
    add esp, 20
    test esi, esi
    jge L1
    cmp byte ptr [ebx], 36
    je L0
    push ebx
    push 010194978h
    call sub_10061CC2
    add esp, 8
L0:
    pop edi
    xor eax, eax
    pop esi
    add esp, 68
    ret
L1:
    jne L2
    mov edx, dword ptr [esp + 8]
    push edx
    call dword ptr [fp_101D4B1C]
    push ebx
    push 010194950h
    call sub_10061CE5
    add esp, 12
    pop edi
    xor eax, eax
    pop esi
    add esp, 68
    ret
L2:
    push esi
    call dword ptr [fp_101D49D4]
    mov edi, eax
    mov eax, dword ptr [esp + 12]
    push eax
    push esi
    push edi
    call dword ptr [fp_101D4B20]
    mov ecx, dword ptr [esp + 24]
    push ecx
    call dword ptr [fp_101D4B1C]
    mov edx, dword ptr [esp + 100]
    push edx
    push edi
    call sub_1001C57C
    add esp, 28
    neg al
    sbb eax, eax
    and eax, edi
    pop edi
    pop esi
    add esp, 68
    ret
FUN_1001c740 ENDP
END
