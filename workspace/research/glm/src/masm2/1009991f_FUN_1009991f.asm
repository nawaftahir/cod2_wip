.686
.MODEL FLAT, C
EXTRN sub_100995B5:PROC
EXTRN sub_100999B5:PROC
EXTRN sub_100999BC:PROC
EXTRN sub_100999E6:PROC
EXTRN sub_100999E7:PROC
EXTRN sub_100999FA:PROC
EXTRN sub_10099A00:PROC
EXTRN sub_10099A01:PROC
EXTRN sub_10099A07:PROC
EXTRN sub_10099A09:PROC
EXTRN sub_10099A2E:PROC
.CODE
FUN_1009991f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    test test esi, esi
    push push edi
    mov mov edi, ecx
    je sub_100999BC
    mov mov eax, dword ptr [esi + 4]
    dec dec eax
    je L4
    sub sub eax, 5
    je L3
    dec dec eax
    dec dec eax
    je L2
    dec dec eax
    je L1
    dec dec eax
    dec dec eax
    je L0
    push push 01010F7B0h
    push push 0
    push push 0
    push push edi
    call sub_100995B5
    add add esp, 16
    jmp sub_100999E6
    push push dword ptr [ebp + 12]
    push push dword ptr [esi + 32]
    jmp sub_100999E7
    cmp cmp dword ptr [ebp + 12], 0
    je sub_100999B5
    or or byte ptr [esi + 33], 2
    jmp sub_100999FA
    and and byte ptr [esi + 33], 0FDh
    jmp sub_10099A00
    push push dword ptr [ebp + 12]
    push push dword ptr [esi + 16]
    jmp sub_10099A01
    push push dword ptr [ebp + 12]
    push push dword ptr [esi + 24]
    jmp sub_10099A09
L1:
    cmp cmp dword ptr [esi + 4], 1
    jne sub_10099A07
    push push dword ptr [ebp + 12]
    mov mov ecx, edi
    push push dword ptr [esi + 8]
    call L3
L3:
    mov mov esi, dword ptr [esi + 12]
L4:
    test test esi, esi
    jne sub_10099A01
    test test esi, esi
    je sub_10099A2E
    push push dword ptr [ebp + 12]
    push push esi
    mov mov ecx, edi
    call L5
L5:
    pop pop edi
    xor xor eax, eax
    pop pop esi
    pop pop ebp
    ret ret 8
FUN_1009991f ENDP
END
