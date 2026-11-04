.686
.MODEL FLAT, C
EXTRN sub_1005EB39:PROC
.CODE
FUN_1005ea60 PROC
    push ebp
    mov ebp, esp
    push ebx
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + 16]
    and ecx, 0FFFFFFF8h
    je L1
    sub ecx, 8
    jmp L0
    jmp L0
    lea esp, [esp]
L0:
    test dword ptr [edx + ecx*4 + 28], ebx
    mov dword ptr [edx + ecx*4], eax
    mov dword ptr [edx + ecx*4 + 4], eax
    mov dword ptr [edx + ecx*4 + 8], eax
    mov dword ptr [edx + ecx*4 + 12], eax
    mov dword ptr [edx + ecx*4 + 16], eax
    mov dword ptr [edx + ecx*4 + 20], eax
    mov dword ptr [edx + ecx*4 + 24], eax
    mov dword ptr [edx + ecx*4 + 28], eax
    sub ecx, 8
    jge L0
L1:
    mov ecx, dword ptr [ebp + 16]
    mov ebx, ecx
    and ecx, 7
    je sub_1005EB39
    and ebx, 0FFFFFFF8h
    lea edx, [edx + ebx*4]
    test dword ptr [edx], eax
    cmp ecx, 4
    jl L2
    mov dword ptr [edx], eax
    mov dword ptr [edx + 4], eax
    mov dword ptr [edx + 8], eax
    mov dword ptr [edx + 12], eax
    add edx, 16
    sub ecx, 4
L2:
    cmp ecx, 2
    jl L3
    mov dword ptr [edx], eax
    mov dword ptr [edx + 4], eax
    add edx, 8
    sub ecx, 2
FUN_1005ea60 ENDP
END
