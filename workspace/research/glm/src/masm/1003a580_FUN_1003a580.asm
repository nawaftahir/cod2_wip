.686
.MODEL FLAT, C
EXTRN sub_10034947:PROC
EXTRN sub_1003A06B:PROC
EXTRN sub_1003A363:PROC
EXTRN sub_1003E9BF:PROC
EXTRN g_101CE708:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072DEBC:DWORD
.CODE
FUN_1003a580 PROC
    mov al, byte ptr [g_1072DEBC]
    test al, al
    push esi
    je L0
    call sub_1003E9BF
L0:
    mov eax, dword ptr [g_1072D9C0]
    cmp eax, 6
    jl L1
    cmp eax, 17
    jg L1
    call sub_1003A363
    mov eax, dword ptr [g_1072D9C0]
L1:
    cmp eax, 3
    jl L2
    cmp eax, 26
    jg L2
    call sub_10034947
    mov eax, dword ptr [g_1072D9C0]
L2:
    mov edx, dword ptr [g_101CE708]
    mov esi, dword ptr [edx + 8]
    xor ecx, ecx
    cmp esi, 2
    jne L3
    cmp eax, 9
    jl L3
    cmp eax, 14
    jg L3
    mov ecx, 010190690h
L3:
    mov edx, dword ptr [esp + 8]
    push ecx
    mov ecx, dword ptr [esp + 16]
    push ecx
    push edx
    call sub_1003A06B
    add esp, 12
    pop esi
    ret
FUN_1003a580 ENDP
END
