.686
.MODEL FLAT, C
EXTRN sub_10034947:PROC
EXTRN sub_1003A06B:PROC
EXTRN sub_1003A363:PROC
EXTRN sub_1003A627:PROC
EXTRN sub_1003A62C:PROC
EXTRN sub_1003A631:PROC
EXTRN sub_1003E9BF:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072DEBC:DWORD:DWORD
.CODE
FUN_1003a580 PROC
    mov mov al, byte ptr [g_1072DEBC]
    test test al, al
    push push esi
    je L0
    call sub_1003E9BF
    mov mov eax, dword ptr [g_1072D9C0]
    cmp cmp eax, 6
    jl L1
L0:
    cmp cmp eax, 17
    jg L2
    call sub_1003A363
    mov mov eax, dword ptr [g_1072D9C0]
    cmp cmp eax, 3
    jl L3
    cmp cmp eax, 26
    jg L4
    call sub_10034947
    mov mov eax, dword ptr [g_1072D9C0]
    mov mov edx, dword ptr [g_101CE708]
    mov mov esi, dword ptr [edx + 8]
    xor xor ecx, ecx
    cmp cmp esi, 2
    jne sub_1003A627
    cmp cmp eax, 9
    jl sub_1003A62C
    cmp cmp eax, 14
    jg sub_1003A631
    mov mov ecx, 010190690h
    mov mov edx, dword ptr [esp + 8]
    push push ecx
    mov mov ecx, dword ptr [esp + 16]
    push push ecx
    push push edx
    call sub_1003A06B
    add add esp, 12
L4:
    pop pop esi
    ret ret
FUN_1003a580 ENDP
END
