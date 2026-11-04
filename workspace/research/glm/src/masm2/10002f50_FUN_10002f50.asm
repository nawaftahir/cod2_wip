.686
.MODEL FLAT, C
EXTRN sub_10003053:PROC
EXTRN sub_1000309A:PROC
EXTRN sub_1000309F:PROC
EXTRN sub_10013946:PROC
EXTRN sub_100F5DF0:PROC
EXTRN sub_100F78FA:PROC
EXTRN EXTRN g_1019BC80:DWORD:DWORD
EXTRN EXTRN g_1019BD54:DWORD:DWORD
.CODE
FUN_10002f50 PROC
    sub sub esp, 24
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 40]
    push push esi
    mov mov esi, 1
    cmp cmp edi, esi
    mov mov ebx, eax
    mov mov byte ptr [esp + 15], 1
    jle L1
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [ebp + esi*8]
    push push ebx
    push push eax
    call sub_100F78FA
    add add esp, 8
    test test eax, eax
    je L2
    inc inc esi
    cmp cmp esi, edi
    jl L0
    mov mov esi, dword ptr [esp + 40]
    xor xor bl, bl
    jmp L3
    mov mov esi, dword ptr [ebp + esi*8 + 4]
    test test esi, esi
    jne L4
    mov mov esi, dword ptr [esp + 40]
    xor xor bl, bl
    jmp L5
    mov mov bl, byte ptr [esp + 15]
    lea lea ecx, [esp + 32]
L0:
    push push ecx
    lea lea edx, [esp + 32]
    push push edx
    lea lea eax, [esp + 32]
L1:
    push push eax
    lea lea ecx, [esp + 32]
    push push ecx
    push push 010191914h
    push push esi
    call sub_100F5DF0
    add add esp, 24
    cmp cmp eax, 4
    je sub_10003053
    push push 0101918F0h
    push push 1
    call sub_10013946
    add add esp, 8
    mov mov eax, dword ptr [esp + 48]
    lea lea ecx, [esp + 20]
    sub sub ecx, eax
    mov mov edx, 4
    mov mov esi, dword ptr [ecx + eax]
    fild fild dword ptr [ecx + eax]
    test test esi, esi
    jge sub_1000309A
L5:
    fadd fadd dword ptr [g_1019BC80]
    fmul fmul dword ptr [g_1019BD54]
    add add eax, 4
    dec dec edx
    fstp fstp dword ptr [eax - 4]
    jne sub_1000309F
    pop pop esi
    pop pop ebp
    mov mov al, bl
    pop pop ebx
    add add esp, 24
    ret ret
FUN_10002f50 ENDP
END
