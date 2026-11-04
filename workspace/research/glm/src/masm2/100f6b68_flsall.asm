.686
.MODEL FLAT, C
EXTRN sub_100F6C24:PROC
EXTRN sub_100F6C3C:PROC
EXTRN sub_100F6C42:PROC
EXTRN sub_100F6C45:PROC
EXTRN sub_100F6C49:PROC
EXTRN sub_100F6C59:PROC
EXTRN sub_100F6C6A:PROC
EXTRN sub_100F6C6F:PROC
EXTRN sub_100F6C74:PROC
EXTRN sub_100F6C79:PROC
EXTRN sub_100F6C85:PROC
EXTRN sub_100F6CA0:PROC
EXTRN sub_100FB531:PROC
EXTRN sub_100FB5E8:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC098:PROC
EXTRN EXTRN g_1076ADB8:DWORD:DWORD
EXTRN EXTRN g_1076BDC0:DWORD:DWORD
.CODE
flsall PROC
    push push 20
    push push 01017C440h
    call sub_100FB61C
    xor xor edi, edi
    mov mov dword ptr [ebp - 28], edi
    mov mov dword ptr [ebp - 36], edi
    push push 1
    call sub_100FC098
    pop pop ecx
    mov mov dword ptr [ebp - 4], edi
    xor xor esi, esi
    mov mov dword ptr [ebp - 32], esi
    cmp cmp esi, dword ptr [g_1076BDC0]
    jge sub_100F6C49
    mov mov eax, dword ptr [g_1076ADB8]
    mov mov eax, dword ptr [eax + esi*4]
    cmp cmp eax, edi
    je sub_100F6C3C
    test test byte ptr [eax + 12], 083h
    je sub_100F6C42
    push push eax
    push push esi
    call sub_100FB531
    pop pop ecx
    pop pop ecx
    xor xor edx, edx
    inc inc edx
    mov mov dword ptr [ebp - 4], edx
    mov mov eax, dword ptr [g_1076ADB8]
    mov mov eax, dword ptr [eax + esi*4]
L1:
    mov mov ecx, dword ptr [eax + 12]
    test test cl, 083h
    je sub_100F6C59
    cmp cmp dword ptr [ebp + 8], edx
    jne sub_100F6C45
    push push eax
    call L0
    pop pop ecx
    cmp cmp eax, -1
    je sub_100F6C6A
    inc inc dword ptr [ebp - 28]
    jmp sub_100F6C6F
    cmp cmp dword ptr [ebp + 8], edi
    jne sub_100F6C74
    test test cl, 2
    je sub_100F6C79
    push push eax
    call L1
    pop pop ecx
    cmp cmp eax, -1
    jne sub_100F6C85
    or or dword ptr [ebp - 36], eax
    mov mov dword ptr [ebp - 4], edi
    call sub_100F6CA0
    inc inc esi
    jmp sub_100F6C24
    xor xor edi, edi
    mov mov esi, dword ptr [ebp - 32]
    mov mov eax, dword ptr [g_1076ADB8]
    push push dword ptr [eax + esi*4]
    push push esi
    call sub_100FB5E8
    pop pop ecx
    pop pop ecx
    ret ret
    or or dword ptr [ebp - 4], -1
flsall ENDP
END
