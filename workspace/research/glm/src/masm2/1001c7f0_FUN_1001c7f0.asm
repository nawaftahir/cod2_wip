.686
.MODEL FLAT, C
EXTRN sub_10060C33:PROC
EXTRN sub_100F5F91:PROC
EXTRN EXTRN fp_101D49E4:DWORD:DWORD
EXTRN EXTRN fp_101D4B04:DWORD:DWORD
EXTRN EXTRN fp_101D4B1C:DWORD:DWORD
EXTRN EXTRN fp_101D4B20:DWORD:DWORD
.CODE
FUN_1001c7f0 PROC
    mov mov eax, dword ptr [esp + 8]
    sub sub esp, 68
    push push ebp
    mov mov ebp, dword ptr [esp + 76]
    push push esi
    push push edi
    push push ebp
    push push eax
    push push 010194938h
    mov mov esi, 64
    lea lea edi, [esp + 28]
    call sub_10060C33
    push push 1
    lea lea ecx, [esp + 28]
    push push ecx
    mov mov edx, edi
    push push edx
    call dword ptr [fp_101D4B04]
    mov mov edi, eax
    mov mov eax, dword ptr [esp + 112]
    add add esp, 24
    lea lea edx, [eax + 1]
    nop nop
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    sub sub eax, edx
    mov mov esi, eax
    mov mov eax, ebp
    lea lea ecx, [eax + 1]
    mov mov dl, byte ptr [eax]
    inc inc eax
    test test dl, dl
    jne L1
    sub sub eax, ecx
    add add eax, esi
    lea lea eax, [eax + edi + 2]
    push push 1
    push push eax
    call dword ptr [fp_101D49E4]
    mov mov ecx, dword ptr [esp + 96]
    push push ebp
    push push ecx
    mov mov esi, eax
    push push 010194930h
    push push esi
    mov mov dword ptr [ebx], esi
    call sub_100F5F91
    mov mov edx, dword ptr [esp + 36]
    push push edx
    lea lea esi, [esi + eax + 1]
    push push edi
L0:
    push push esi
    mov mov dword ptr [ebx + 4], esi
    call dword ptr [fp_101D4B20]
    mov mov eax, dword ptr [esp + 48]
    push push eax
    call dword ptr [fp_101D4B1C]
    add add esp, 40
    mov mov byte ptr [esi + edi], 0
    mov mov dword ptr [ebx + 8], edi
    pop pop edi
L1:
    pop pop esi
    pop pop ebp
    add add esp, 68
    ret ret
FUN_1001c7f0 ENDP
END
