.686
.MODEL FLAT, C
EXTRN sub_100F852D:PROC
EXTRN sub_100F8554:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6E1:PROC
EXTRN sub_100FC087:PROC
EXTRN sub_100FC08A:PROC
EXTRN sub_100FC0A1:PROC
EXTRN sub_100FC0AE:PROC
EXTRN sub_100FC0BB:PROC
EXTRN sub_100FC0E0:PROC
EXTRN sub_100FC0E8:PROC
EXTRN sub_100FC102:PROC
EXTRN sub_100FC245:PROC
EXTRN sub_100FC278:PROC
EXTRN sub_100FC487:PROC
EXTRN sub_10101115:PROC
EXTRN sub_10107AB7:PROC
.CODE
__mtinitlocknum PROC
    push push 8
    push push 01017C8B0h
    call sub_100FB61C
    mov mov esi, dword ptr [ebp + 8]
    lea lea esi, [esi*8 + 0101A4B28h]
    xor xor ebx, ebx
    cmp cmp dword ptr [esi], ebx
    jne sub_100FC087
    push push 24
    call sub_100FC487
    pop pop ecx
    mov mov edi, eax
    cmp cmp edi, ebx
    jne L0
    call sub_100FC245
    mov mov dword ptr [eax], 12
    jmp sub_100FC08A
    push push 10
    call sub_100FC0BB
    pop pop ecx
    mov mov dword ptr [ebp - 4], ebx
    cmp cmp dword ptr [esi], ebx
    jne sub_100FC0A1
    push push 0FA0h
    push push edi
    call sub_10107AB7
    pop pop ecx
    pop pop ecx
    test test eax, eax
    jne sub_100FC0AE
    push push edi
    call sub_100F852D
    call sub_100FC278
    mov mov dword ptr [eax], 12
    push push -1
    lea lea eax, [ebp - 16]
    push push eax
    call sub_10101115
    add add esp, 12
    xor xor eax, eax
    jmp sub_100FC0E8
    mov mov dword ptr [esi], edi
    jmp sub_100FC0E0
    push push edi
    call sub_100F8554
    pop pop ecx
    or or dword ptr [ebp - 4], -1
    call sub_100FC102
    xor xor eax, eax
    inc inc eax
    call sub_100FB6E1
    ret ret
__mtinitlocknum ENDP
END
