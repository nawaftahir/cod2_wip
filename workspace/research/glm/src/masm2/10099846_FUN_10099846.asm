.686
.MODEL FLAT, C
EXTRN sub_100998D2:PROC
EXTRN sub_100998D5:PROC
EXTRN sub_100998DA:PROC
EXTRN sub_100998DC:PROC
EXTRN sub_100998DF:PROC
EXTRN sub_100998F0:PROC
EXTRN sub_100998F7:PROC
EXTRN sub_10099900:PROC
EXTRN sub_10099909:PROC
EXTRN sub_1009990D:PROC
EXTRN sub_10099911:PROC
EXTRN sub_10099915:PROC
EXTRN sub_10099917:PROC
EXTRN sub_1009991E:PROC
EXTRN sub_10099928:PROC
EXTRN sub_1009992B:PROC
EXTRN sub_1009994B:PROC
.CODE
FUN_10099846 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp ecx, eax
    je sub_100998DA
    dec dec ecx
    cmp cmp ecx, 11
    ja L0
    jmp jmp dword ptr [ecx*4 + 0100998CFh]
    test test eax, eax
    jle L1
    cmp cmp eax, 8
    jle sub_100998F0
    xor xor eax, eax
    inc inc eax
    pop pop ebp
    ret ret 8
    test test eax, eax
    jle L2
    cmp cmp eax, 2
    jle sub_10099900
    cmp cmp eax, 4
    jle L3
L0:
    cmp cmp eax, 6
    jmp L4
    dec dec eax
    je sub_1009990D
    dec dec eax
    dec dec eax
    je sub_10099911
    dec dec eax
    dec dec eax
    je sub_10099915
    dec dec eax
    dec dec eax
    jmp sub_10099917
    cmp cmp eax, 1
    je sub_1009991E
    cmp cmp eax, 3
    jle L5
    cmp cmp eax, 5
    jle sub_10099928
    cmp cmp eax, 8
    jmp sub_1009992B
L4:
    cmp cmp eax, 9
    jl sub_100998D2
    cmp cmp eax, 12
    jmp sub_100998D5
    cmp cmp eax, 9
    jl sub_100998DC
    cmp cmp eax, 10
    jmp sub_100998DF
    sub sub eax, 9
    jmp sub_10099909
    cmp cmp eax, 9
    je sub_1009994B
    cmp cmp eax, 12
    jne sub_100998F0
    xor xor eax, eax
    jmp sub_100998F7
FUN_10099846 ENDP
END
