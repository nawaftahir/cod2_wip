.686
.MODEL FLAT, C
EXTRN sub_10060C33:PROC
EXTRN sub_100F5F91:PROC
EXTRN fp_101D49E4:DWORD
EXTRN fp_101D4B04:DWORD
EXTRN fp_101D4B1C:DWORD
EXTRN fp_101D4B20:DWORD
.CODE
FUN_1001c7f0 PROC
    mov eax, dword ptr [esp + 8]
    sub esp, 68
    push ebp
    mov ebp, dword ptr [esp + 76]
    push esi
    push edi
    push ebp
    push eax
    push 010194938h
    mov esi, 64
    lea edi, [esp + 28]
    call sub_10060C33
    push 1
    lea ecx, [esp + 28]
    push ecx
    mov edx, edi
    push edx
    call dword ptr [fp_101D4B04]
    mov edi, eax
    mov eax, dword ptr [esp + 112]
    add esp, 24
    lea edx, [eax + 1]
    nop
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    mov esi, eax
    mov eax, ebp
    lea ecx, [eax + 1]
L1:
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L1
    sub eax, ecx
    add eax, esi
    lea eax, [eax + edi + 2]
    push 1
    push eax
    call dword ptr [fp_101D49E4]
    mov ecx, dword ptr [esp + 96]
    push ebp
    push ecx
    mov esi, eax
    push 010194930h
    push esi
    mov dword ptr [ebx], esi
    call sub_100F5F91
    mov edx, dword ptr [esp + 36]
    push edx
    lea esi, [esi + eax + 1]
    push edi
    push esi
    mov dword ptr [ebx + 4], esi
    call dword ptr [fp_101D4B20]
    mov eax, dword ptr [esp + 48]
    push eax
    call dword ptr [fp_101D4B1C]
    add esp, 40
    mov byte ptr [esi + edi], 0
    mov dword ptr [ebx + 8], edi
    pop edi
    pop esi
    pop ebp
    add esp, 68
    ret
FUN_1001c7f0 ENDP
END
