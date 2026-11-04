.686
.MODEL FLAT, C
EXTRN sub_10083F3E:PROC
EXTRN sub_10083F68:PROC
EXTRN sub_10083F70:PROC
EXTRN sub_10083F77:PROC
EXTRN EXTRN fp_1010C000:DWORD:DWORD
EXTRN EXTRN fp_1010C004:DWORD:DWORD
EXTRN EXTRN fp_1010C008:DWORD:DWORD
.CODE
FUN_10083ec3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    and and dword ptr [ebp - 4], 0
    lea lea eax, [ebp - 4]
    push push eax
    push push 010110098h
    push push 080000002h
    call dword ptr [fp_1010C008]
    test test eax, eax
    jne sub_10083F3E
    push push esi
    lea lea eax, [ebp + 20]
    push push eax
    push push dword ptr [ebp + 16]
    lea lea eax, [ebp + 16]
    push push eax
    push push 0
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp - 4]
    call dword ptr [fp_1010C000]
    push push dword ptr [ebp - 4]
    mov mov esi, eax
    call dword ptr [fp_1010C004]
    test test esi, esi
    pop pop esi
    jne sub_10083F68
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp eax, dword ptr [ebp + 8]
    jne sub_10083F70
    xor xor eax, eax
    inc inc eax
    jmp sub_10083F77
    xor xor eax, eax
    leave leave
    ret ret 16
FUN_10083ec3 ENDP
END
