.686
.MODEL FLAT, C
EXTRN sub_10013946:PROC
EXTRN sub_100F5DF0:PROC
EXTRN sub_100F78FA:PROC
EXTRN g_1019BC80:DWORD
EXTRN g_1019BD54:DWORD
.CODE
FUN_10002f50 PROC
    sub esp, 24
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 40]
    push esi
    mov esi, 1
    cmp edi, esi
    mov ebx, eax
    mov byte ptr [esp + 15], 1
    jle L2
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [ebp + esi*8]
    push ebx
    push eax
    call sub_100F78FA
    add esp, 8
    test eax, eax
    je L1
    inc esi
    cmp esi, edi
    jl L0
    mov esi, dword ptr [esp + 40]
    xor bl, bl
    jmp L4
L1:
    mov esi, dword ptr [ebp + esi*8 + 4]
    test esi, esi
    jne L3
L2:
    mov esi, dword ptr [esp + 40]
    xor bl, bl
    jmp L4
L3:
    mov bl, byte ptr [esp + 15]
L4:
    lea ecx, [esp + 32]
    push ecx
    lea edx, [esp + 32]
    push edx
    lea eax, [esp + 32]
    push eax
    lea ecx, [esp + 32]
    push ecx
    push 010191914h
    push esi
    call sub_100F5DF0
    add esp, 24
    cmp eax, 4
    je L5
    push 0101918F0h
    push 1
    call sub_10013946
    add esp, 8
L5:
    mov eax, dword ptr [esp + 48]
    lea ecx, [esp + 20]
    sub ecx, eax
    mov edx, 4
L6:
    mov esi, dword ptr [ecx + eax]
    fild dword ptr [ecx + eax]
    test esi, esi
    jge L7
    fadd dword ptr [g_1019BC80]
L7:
    fmul dword ptr [g_1019BD54]
    add eax, 4
    dec edx
    fstp dword ptr [eax - 4]
    jne L6
    pop esi
    pop ebp
    mov al, bl
    pop ebx
    add esp, 24
    ret
FUN_10002f50 ENDP
END
