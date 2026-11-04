.686
.MODEL FLAT, C
EXTRN fp_1010C000:DWORD
EXTRN fp_1010C004:DWORD
EXTRN fp_1010C008:DWORD
.CODE
FUN_10083ec3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    lea eax, [ebp - 4]
    push eax
    push 010110098h
    push 080000002h
    call dword ptr [fp_1010C008]
    test eax, eax
    jne L0
    push esi
    lea eax, [ebp + 20]
    push eax
    push dword ptr [ebp + 16]
    lea eax, [ebp + 16]
    push eax
    push 0
    push dword ptr [ebp + 12]
    push dword ptr [ebp - 4]
    call dword ptr [fp_1010C000]
    push dword ptr [ebp - 4]
    mov esi, eax
    call dword ptr [fp_1010C004]
    test esi, esi
    pop esi
    jne L0
    mov eax, dword ptr [ebp + 16]
    cmp eax, dword ptr [ebp + 8]
    jne L0
    xor eax, eax
    inc eax
    jmp L1
L0:
    xor eax, eax
L1:
    leave
    ret 16
FUN_10083ec3 ENDP
END
