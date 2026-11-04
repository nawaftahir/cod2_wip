.686
.MODEL FLAT, C
EXTRN sub_100F852D:PROC
EXTRN sub_100F8554:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB6E1:PROC
EXTRN sub_100FC0BB:PROC
EXTRN sub_100FC102:PROC
EXTRN sub_100FC245:PROC
EXTRN sub_100FC278:PROC
EXTRN sub_100FC487:PROC
EXTRN sub_10101115:PROC
EXTRN sub_10107AB7:PROC
.CODE
__mtinitlocknum PROC
    push 8
    push 01017C8B0h
    call sub_100FB61C
    mov esi, dword ptr [ebp + 8]
    lea esi, [esi*8 + 0101A4B28h]
    xor ebx, ebx
    cmp dword ptr [esi], ebx
    jne L5
    push 24
    call sub_100FC487
    pop ecx
    mov edi, eax
    cmp edi, ebx
    jne L0
    call sub_100FC245
    mov dword ptr [eax], 12
    jmp L1
L0:
    push 10
    call sub_100FC0BB
    pop ecx
    mov dword ptr [ebp - 4], ebx
    cmp dword ptr [esi], ebx
    jne L3
    push 000000FA0h
    push edi
    call sub_10107AB7
    pop ecx
    pop ecx
    test eax, eax
    jne L2
    push edi
    call sub_100F852D
    call sub_100FC278
    mov dword ptr [eax], 12
    push -1
    lea eax, [ebp - 16]
    push eax
    call sub_10101115
    add esp, 12
L1:
    xor eax, eax
    jmp L6
L2:
    mov dword ptr [esi], edi
    jmp L4
L3:
    push edi
    call sub_100F8554
    pop ecx
L4:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_100FC102
L5:
    xor eax, eax
    inc eax
L6:
    call sub_100FB6E1
    ret
__mtinitlocknum ENDP
END
