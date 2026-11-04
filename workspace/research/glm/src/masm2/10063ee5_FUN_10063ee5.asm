.686
.MODEL FLAT, C
EXTRN sub_10063FBC:PROC
EXTRN sub_10064000:PROC
EXTRN sub_10064016:PROC
EXTRN sub_10067C9D:PROC
EXTRN sub_10067CF2:PROC
EXTRN sub_10067EDA:PROC
EXTRN sub_100F624B:PROC
.CODE
FUN_10063ee5 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0100h
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    cmp cmp dword ptr [ebx + 80], 0
    mov mov dword ptr [ebx + 68], 1
    je sub_10063FBC
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    push push edi
    push push 13
    pop pop ecx
    mov mov edi, 01010C5E8h
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    pop pop edi
    pop pop esi
    jne L2
    cmp cmp dword ptr [ebx + 76], eax
    je L0
    lea lea eax, [ebx + 0278h]
    cmp cmp dword ptr [eax], 9
    jne L1
    push push dword ptr [ebx + 0280h]
    add add ebx, 24
    push push 01010C5C4h
    push push 05E0h
    push push eax
    push push ebx
    call sub_10067C9D
    add add esp, 20
    jmp sub_10064000
    lea lea eax, [ebx + 0278h]
    push push eax
    push push 05DCh
    lea lea ecx, [ebx + 24]
    call sub_10067EDA
    jmp sub_10064016
    lea lea eax, [ebp + 16]
    push push eax
    push push dword ptr [ebp + 12]
    lea lea eax, [ebp - 0100h]
    push push 0100h
    push push eax
    call sub_100F624B
    lea lea eax, [ebp - 0100h]
    push push eax
    push push 010193358h
L0:
    lea lea eax, [ebx + 0278h]
    push push 0
    push push eax
    add add ebx, 24
    push push ebx
    mov mov byte ptr [ebp - 1], 0
L2:
    call sub_10067CF2
    add add esp, 36
    pop pop ebx
    leave leave
    ret ret
FUN_10063ee5 ENDP
END
